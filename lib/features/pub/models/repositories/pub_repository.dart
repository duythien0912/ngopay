import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:ngopay/features/pub/pub.dart';

const userToken =
    'Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6ImVkMzZjMjU3YzQ3ZWJhYmI0N2I0NTY4MjhhODU4YWE1ZmNkYTEyZGQiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJhY2NvdW50cy5nb29nbGUuY29tIiwiYXpwIjoiODE4MzY4ODU1MTA4LWU4c2thb3BtNWloNW5iYjgydmhoNjZrN2Z0NW83ZG4zLmFwcHMuZ29vZ2xldXNlcmNvbnRlbnQuY29tIiwiYXVkIjoiODE4MzY4ODU1MTA4LWU4c2thb3BtNWloNW5iYjgydmhoNjZrN2Z0NW83ZG4zLmFwcHMuZ29vZ2xldXNlcmNvbnRlbnQuY29tIiwic3ViIjoiMTExNDcxNzg2MzE5NzUyNDU5ODEwIiwiZW1haWwiOiJkdXl0aGllbjA5MTJAZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOnRydWUsImF0X2hhc2giOiJvRm5sZTdUYkV1d2pqQ0FNYWplTW5nIiwibmFtZSI6IlRoacOqbiBEdXkiLCJwaWN0dXJlIjoiaHR0cHM6Ly9saDMuZ29vZ2xldXNlcmNvbnRlbnQuY29tL2EvQUxtNXd1M0ZjMDRiVFR4aTFjdnVIcUczRklHbkl4blBDSFJnaTNmb0M0Zzc9czk2LWMiLCJnaXZlbl9uYW1lIjoiVGhpw6puIiwiZmFtaWx5X25hbWUiOiJEdXkiLCJsb2NhbGUiOiJ2aSIsImlhdCI6MTY2NDgxNDg0MSwiZXhwIjoxNjY0ODE4NDQxLCJqdGkiOiI2ZThhYjFjYjM2MGQ3Y2I1ZjFjOWVjMGNkMGRjMDA3Y2Y0YmUyZjQ1In0.HGoyDNPcPHlgISEj_8w1ZuQ472BfidMEAkPLOxs7hJtNI9XO-THci9PMwI-fAJM0FVbx2wwI690BZOF7TgWsildTJoM3NiTxXZSo5DiqKx_p0aFNCOMvutU7Sn4b3z2dxl3bsxG8J7xnxMz575YBEmoEW-uxkJMEmNm8A4P7_Rdrkjfipa811M1JVWwNyGRj5TlYgXsortzSN2QMam-OAB8CMGGEYBqiWbqpE-k4vsVppym7U2X_KCWjSMYdML2J_T_jxzWPMxbbfLOkEnuvVsK3qEzUwJttljyYwqAbWYg1KhxHeP4s2ZT5i-U0VR9ItNIx_KYv_8GVc8vkFf1uOw';

class PubRepository {
  final dio = Dio();

  Future<List<Package>> getPackages({
    required int page,
    CancelToken? cancelToken,
  }) async {
    final uri = Uri(
      scheme: 'https',
      host: 'pub.dartlang.org',
      path: 'api/packages',
      queryParameters: <String, String>{'page': '$page'},
    );

    final response = await dio.getUri<Map<String, Object?>>(
      uri,
      cancelToken: cancelToken,
    );

    final packagesResponse = PubPackagesResponse.fromJson(response.data!);
    return packagesResponse.packages;
  }

  Future<List<SearchPackage>> searchPackages({
    required int page,
    required String search,
    CancelToken? cancelToken,
  }) async {
    final uri = Uri(
      scheme: 'https',
      host: 'pub.dartlang.org',
      path: 'api/search',
      queryParameters: <String, String>{'page': '$page', 'q': search},
    );
    // Returns {packages: [{ package: string }]}
    final response = await dio.getUri<Map<String, Object?>>(
      uri,
      cancelToken: cancelToken,
    );

    final packagesResponse = PubSearchResponse.fromJson(response.data!);
    return packagesResponse.packages;
  }

  Future<Package> getPackageDetails({
    required String packageName,
    CancelToken? cancelToken,
  }) async {
    final dio = Dio();
    final uri = Uri(
      scheme: 'https',
      host: 'pub.dartlang.org',
      path: 'api/packages/$packageName',
    );

    final response = await dio.getUri<Map<String, Object?>>(
      uri,
      cancelToken: cancelToken,
    );

    final packageResponse = Package.fromJson(response.data!);
    return packageResponse;
  }

  Future<PackageMetricsScore> getPackageMetrics({
    required String packageName,
    CancelToken? cancelToken,
  }) async {
    final uri = Uri(
      scheme: 'https',
      host: 'pub.dartlang.org',
      path: 'api/packages/$packageName/metrics',
    );

    final responseFuture = dio.getUri<Map<String, Object?>>(
      uri,
      cancelToken: cancelToken,
    );

    final likesUri = Uri(
      scheme: 'https',
      host: 'pub.dartlang.org',
      path: 'api/packages/$packageName/likes',
    );

    /// Although the metrics request does include the likes count, it seems that
    /// the server caches the response for a long period of time.
    /// For the same of "http polling" showcase, we're separately fetching the
    /// likes count
    final likesResponsFuture = dio.getUri<Map<String, Object?>>(
      likesUri,
      cancelToken: cancelToken,
    );

    final metricsResponse =
        PackageMetricsResponse.fromJson((await responseFuture).data!);
    return metricsResponse.score.copyWith(
      likeCount: (await likesResponsFuture).data!['likes']! as int,
    );
  }

  Future<void> like({
    required String packageName,
    CancelToken? cancelToken,
  }) async {
    final uri = Uri(
      scheme: 'https',
      host: 'pub.dartlang.org',
      path: 'api/account/likes/$packageName',
    );

    await dio.putUri<void>(
      uri,
      cancelToken: cancelToken,
      options: Options(
        headers: <String, String>{'authorization': userToken},
      ),
    );
  }

  Future<void> unlike({
    required String packageName,
    CancelToken? cancelToken,
  }) async {
    final uri = Uri(
      scheme: 'https',
      host: 'pub.dartlang.org',
      path: 'api/account/likes/$packageName',
    );

    await dio.deleteUri<void>(
      uri,
      cancelToken: cancelToken,
      options: Options(headers: <String, String>{'authorization': userToken}),
    );
  }

  Future<List<String>> getLikedPackages({CancelToken? cancelToken}) async {
    final uri = Uri(
      scheme: 'https',
      host: 'pub.dartlang.org',
      path: 'api/account/likes',
    );

    final response = await dio.getUri<Map<String, Object?>>(
      uri,
      cancelToken: cancelToken,
      options: Options(
        headers: <String, String>{'authorization': userToken},
      ),
    );

    final packageResponse = LikedPackagesResponse.fromJson(response.data!);
    return packageResponse.likedPackages.map((e) => e.package).toList();
  }
}
