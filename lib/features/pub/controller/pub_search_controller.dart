import 'dart:async';

import 'package:ngopay/features/pub/pub.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pub_search_controller.g.dart';

@Riverpod(keepAlive: true)
Future<List<Package>> fetchPackages(
  FetchPackagesRef ref, {
  required int page,
  String search = '',
}) async {
  assert(page > 0, 'page offset starts at 1');
  final cancelToken = ref.cancelToken();

  if (search.isEmpty) {
    return ref
        .watch(pubRepositoryProvider)
        .getPackages(page: page, cancelToken: cancelToken);
  }

  // Debouncing searches by delaying the request.
  // If the search was cancelled during this delay, the network request will
  // not be performed.
  await Future<void>.delayed(const Duration(milliseconds: 250));
  if (cancelToken.isCancelled) {
    throw Exception('cancelled');
  }

  final searchedPackages = await ref
      .watch(pubRepositoryProvider)
      .searchPackages(page: page, search: search, cancelToken: cancelToken);

  final res = await Future.wait([
    for (final package in searchedPackages)
      ref.watch(
        FetchPackageDetailsProvider(packageName: package.package).future,
      ),
  ]);
  ref.read(localPackagesClassProvider.notifier).state = <Package>{
    ...ref.read(localPackagesClassProvider.notifier).state,
    ...res
  }.toList();

  return res;
}

@Riverpod(keepAlive: true)
class LocalPackagesClass extends _$LocalPackagesClass {
  @override
  List<Package> build() {
    return <Package>[];
  }
}
