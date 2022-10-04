import 'dart:async';

import 'package:ngopay/features/pub/pub.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pub_detail_controller.g.dart';

// TODO hot-reload handle provider type change
// TODO hot-reload handle provider response type change
// TODO hot-reload handle provider -> family
// TODO hot-reload handle family adding parameters
// TODO found "Future already completed error" after adding family parameter

@Riverpod(keepAlive: true)
Future<Package> fetchPackageDetails(
  FetchPackageDetailsRef ref, {
  required String packageName,
}) async {
  final cancelToken = ref.cancelToken();

  return ref
      .watch(pubRepositoryProvider)
      .getPackageDetails(packageName: packageName, cancelToken: cancelToken);
}

@Riverpod(keepAlive: true)
Future<List<String>> likedPackages(LikedPackagesRef ref) async {
  final cancelToken = ref.cancelToken();

  return ref
      .watch(pubRepositoryProvider)
      .getLikedPackages(cancelToken: cancelToken);
}

@Riverpod(keepAlive: true)
PubRepository pubRepository(PubRepositoryRef ref) => PubRepository();

/// A provider that fetches the likes count, popularity score and pub points
/// for a given package.
///
/// It also exposes utilities to like/unlike a package, assuming the user
/// is logged-in.
@Riverpod(keepAlive: true)
class PackageMetrics extends _$PackageMetrics {
  @override
  Future<PackageMetricsScore> build({required String packageName}) async {
    final metrics = await ref
        .watch(pubRepositoryProvider)
        .getPackageMetrics(packageName: packageName);

    // Automatically refresh the package metrics page every 5 seconds
    final timer = Timer(const Duration(seconds: 5), () => ref.invalidateSelf());
    // If the request was refreshed before the 5 second timer completes,
    // cancel the timer.
    ref.onDispose(timer.cancel);

    return metrics;
  }

  Future<void> like() async {
    await ref.read(pubRepositoryProvider).like(packageName: packageName);

    /// Since the like count as change, we refresh the package metrics.
    /// We could alternatively do something like:
    // state = AsyncData(
    //   state.value!.copyWith(likeCount: state.value!.likeCount + 1),
    // );
    ref.invalidateSelf();

    // Since we liked a package, the list of liked packages should also be updated.
    // An alternative could be:
    // - convert likedPackages to a class
    // - add a like/unlike methods that updates the list of liked packages
    // - call ref.read(likedPackagesProvider).like(packageName);
    ref.invalidate(likedPackagesProvider);
  }

  Future<void> unlike() async {
    await ref.read(pubRepositoryProvider).unlike(packageName: packageName);

    ref.invalidateSelf();
    ref.invalidate(likedPackagesProvider);
  }
}
