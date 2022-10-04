import 'package:flutter/material.dart';
import 'package:ngopay/features/pub/pub.dart';

/// The detail page of a package, typically reached by clicking on a package from [PubSearchPage].
class PackageDetailPage extends ConsumerWidget {
  const PackageDetailPage({super.key, required this.packageName});

  /// The name of the package that is inspected.
  final String packageName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final package =
        ref.watch(fetchPackageDetailsProvider(packageName: packageName));

    final likedPackages = ref.watch(likedPackagesProvider);
    final isLiked = likedPackages.valueOrNull?.contains(packageName) ?? false;

    final metrics = ref.watch(packageMetricsProvider(packageName: packageName));

    return Scaffold(
      appBar: const PubAppbar(),
      body: package.when(
        error: (err, stack) => Text('Error2 $err'),
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (package) {
          return RefreshIndicator(
            onRefresh: () {
              return Future.wait([
                ref.refresh(
                  packageMetricsProvider(packageName: packageName).future,
                ),
                ref.refresh(
                  fetchPackageDetailsProvider(packageName: packageName).future,
                ),
              ]);
            },
            child: metrics.when(
              error: (err, stack) => Text('Error $err'),
              loading: () => const Center(child: CircularProgressIndicator()),
              data: (metrics) {
                return PubPackageDetailBodyScrollView(
                  packageName: packageName,
                  packageVersion: package.latest.version,
                  packageDescription: package.latest.pubspec.description,
                  grantedPoints: metrics.grantedPoints,
                  likeCount: metrics.likeCount,
                  maxPoints: metrics.maxPoints,
                  popularityScore: metrics.popularityScore * 100,
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final packageLikes = ref.read(
            packageMetricsProvider(packageName: packageName).notifier,
          );

          if (isLiked) {
            await packageLikes.unlike();
          } else {
            await packageLikes.like();
          }
        },
        child: isLiked
            ? const Icon(Icons.favorite)
            : const Icon(Icons.favorite_border),
      ),
    );
  }
}
