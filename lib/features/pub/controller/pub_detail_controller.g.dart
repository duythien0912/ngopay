// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pub_detail_controller.dart';

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

String $PackageMetricsHash() => r'669deb40490198e04165f86a3f5075fe8ab190c9';

/// A provider that fetches the likes count, popularity score and pub points
/// for a given package.
///
/// It also exposes utilities to like/unlike a package, assuming the user
/// is logged-in.
///
/// Copied from [PackageMetrics].
class PackageMetricsProvider
    extends AsyncNotifierProviderImpl<PackageMetrics, PackageMetricsScore> {
  PackageMetricsProvider({
    required this.packageName,
  }) : super(
          () => PackageMetrics()..packageName = packageName,
          from: packageMetricsProvider,
          name: r'packageMetricsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $PackageMetricsHash,
        );

  final String packageName;

  @override
  bool operator ==(Object other) {
    return other is PackageMetricsProvider && other.packageName == packageName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, packageName.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<PackageMetricsScore> runNotifierBuild(
    covariant _$PackageMetrics notifier,
  ) {
    return notifier.build(
      packageName: packageName,
    );
  }
}

typedef PackageMetricsRef = AsyncNotifierProviderRef<PackageMetricsScore>;

/// A provider that fetches the likes count, popularity score and pub points
/// for a given package.
///
/// It also exposes utilities to like/unlike a package, assuming the user
/// is logged-in.
///
/// Copied from [PackageMetrics].
final packageMetricsProvider = PackageMetricsFamily();

class PackageMetricsFamily extends Family<AsyncValue<PackageMetricsScore>> {
  PackageMetricsFamily();

  PackageMetricsProvider call({
    required String packageName,
  }) {
    return PackageMetricsProvider(
      packageName: packageName,
    );
  }

  @override
  AsyncNotifierProviderImpl<PackageMetrics, PackageMetricsScore>
      getProviderOverride(
    covariant PackageMetricsProvider provider,
  ) {
    return call(
      packageName: provider.packageName,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'packageMetricsProvider';
}

abstract class _$PackageMetrics
    extends BuildlessAsyncNotifier<PackageMetricsScore> {
  late final String packageName;

  FutureOr<PackageMetricsScore> build({
    required String packageName,
  });
}

String $fetchPackageDetailsHash() =>
    r'1ae53247124654205be290001ed02a8be21b153e';

/// See also [fetchPackageDetails].
class FetchPackageDetailsProvider extends FutureProvider<Package> {
  FetchPackageDetailsProvider({
    required this.packageName,
  }) : super(
          (ref) => fetchPackageDetails(
            ref,
            packageName: packageName,
          ),
          from: fetchPackageDetailsProvider,
          name: r'fetchPackageDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $fetchPackageDetailsHash,
        );

  final String packageName;

  @override
  bool operator ==(Object other) {
    return other is FetchPackageDetailsProvider &&
        other.packageName == packageName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, packageName.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef FetchPackageDetailsRef = FutureProviderRef<Package>;

/// See also [fetchPackageDetails].
final fetchPackageDetailsProvider = FetchPackageDetailsFamily();

class FetchPackageDetailsFamily extends Family<AsyncValue<Package>> {
  FetchPackageDetailsFamily();

  FetchPackageDetailsProvider call({
    required String packageName,
  }) {
    return FetchPackageDetailsProvider(
      packageName: packageName,
    );
  }

  @override
  FutureProvider<Package> getProviderOverride(
    covariant FetchPackageDetailsProvider provider,
  ) {
    return call(
      packageName: provider.packageName,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'fetchPackageDetailsProvider';
}

String $likedPackagesHash() => r'd38f6c253fb04bb9209e171ea23b219c1d113802';

/// See also [likedPackages].
final likedPackagesProvider = FutureProvider<List<String>>(
  likedPackages,
  name: r'likedPackagesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $likedPackagesHash,
);
typedef LikedPackagesRef = FutureProviderRef<List<String>>;
String $pubRepositoryHash() => r'8eef785d18fa585f80b201a7bcaee74249010770';

/// See also [pubRepository].
final pubRepositoryProvider = Provider<PubRepository>(
  pubRepository,
  name: r'pubRepositoryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $pubRepositoryHash,
);
typedef PubRepositoryRef = ProviderRef<PubRepository>;
