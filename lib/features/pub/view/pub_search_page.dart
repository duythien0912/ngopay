import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ngopay/features/pub/pub.dart';

const packagesPackageSize = 100;
const searchPageSize = 10;

class PubSearchPage extends HookConsumerWidget {
  const PubSearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();
    useListenable(searchController);

    return Scaffold(
      appBar: const PubAppbar(
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          PubSearchBar(controller: searchController),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () {
                // disposes the pages previously fetched. Next read will refresh them
                ref.invalidate(fetchPackagesProvider);
                // keep showing the progress indicator until the first page is fetched
                return ref.read(
                  fetchPackagesProvider(page: 1, search: searchController.text)
                      .future,
                );
              },
              child: ListView.custom(
                padding: const EdgeInsets.only(top: 30),
                childrenDelegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final pageSize = searchController.text.isEmpty
                        ? packagesPackageSize
                        : searchPageSize;

                    final page = index ~/ pageSize + 1;
                    final indexInPage = index % pageSize;
                    final packageList = ref.watch(
                      fetchPackagesProvider(
                        page: page,
                        search: searchController.text,
                      ),
                    );

                    return packageList.when(
                      error: (err, stack) => Text('Error $err'),
                      loading: () => const PubPackageItemShimmer(),
                      data: (packages) {
                        if (indexInPage >= packages.length) return null;

                        final package = packages[indexInPage];

                        return PubPackageItem(
                          key: ValueKey('pub_package_item_${package.hashCode}'),
                          name: package.name,
                          description: package.latest.pubspec.description,
                          version: package.latest.version,
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute<void>(
                            //     builder: (context) {
                            //       return PackageDetailPage(
                            //         packageName: package.name,
                            //       );
                            //     },
                            //   ),
                            // );
                            context.beamToNamed('/pub_app/${package.name}');
                          },
                        );
                      },
                    );
                  },
                  findChildIndexCallback: (Key key) {
                    final valueKey = key as ValueKey<String>;
                    final data = valueKey.value;
                    final index =
                        (ref.read(localPackagesClassProvider)).indexWhere(
                      (package) =>
                          'pub_package_item_${package.hashCode}' == data,
                    );
                    print(data);
                    print(ref.read(localPackagesClassProvider));
                    print(index);

                    //important here:
                    if (index > 0) {
                      return index;
                    } else {
                      return null;
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
