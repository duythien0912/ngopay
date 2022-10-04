// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pub_search_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String $LocalPackagesClassHash() => r'c06698f01456b0b07219f5bfdaab633b84ed2d57';

/// See also [LocalPackagesClass].
final localPackagesClassProvider =
    NotifierProvider<LocalPackagesClass, List<Package>>(
  LocalPackagesClass.new,
  name: r'localPackagesClassProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $LocalPackagesClassHash,
);
typedef LocalPackagesClassRef = NotifierProviderRef<List<Package>>;

abstract class _$LocalPackagesClass extends Notifier<List<Package>> {
  @override
  List<Package> build();
}

String $fetchPackagesHash() => r'a6af02ada8dd9dfbfe57e03e2586b529ca030096';

/// See also [fetchPackages].
class FetchPackagesProvider extends FutureProvider<List<Package>> {
  FetchPackagesProvider({
    required this.page,
    this.search = '',
  }) : super(
          (ref) => fetchPackages(
            ref,
            page: page,
            search: search,
          ),
          from: fetchPackagesProvider,
          name: r'fetchPackagesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $fetchPackagesHash,
        );

  final int page;
  final String search;

  @override
  bool operator ==(Object other) {
    return other is FetchPackagesProvider &&
        other.page == page &&
        other.search == search;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);
    hash = _SystemHash.combine(hash, search.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef FetchPackagesRef = FutureProviderRef<List<Package>>;

/// See also [fetchPackages].
final fetchPackagesProvider = FetchPackagesFamily();

class FetchPackagesFamily extends Family<AsyncValue<List<Package>>> {
  FetchPackagesFamily();

  FetchPackagesProvider call({
    required int page,
    String search = '',
  }) {
    return FetchPackagesProvider(
      page: page,
      search: search,
    );
  }

  @override
  FutureProvider<List<Package>> getProviderOverride(
    covariant FetchPackagesProvider provider,
  ) {
    return call(
      page: provider.page,
      search: provider.search,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'fetchPackagesProvider';
}
