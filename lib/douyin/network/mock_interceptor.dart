import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:path/path.dart' as path;

import 'package:ngopay/douyin/utils/asset_bundle_utils.dart';

/// @author jd

class NetworkMockInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.extra['mock'] == true) {
      final jsonPath =
          'assets/jsons/${path.basenameWithoutExtension(options.path)}.json';
      final jsonString = await AssetBundleUtils.loadString(jsonPath);
      final dynamic json = jsonDecode(jsonString);
      await Future<dynamic>.delayed(const Duration(milliseconds: 1000));
      handler.resolve(
        Response<dynamic>(
          requestOptions: options,
          data: json,
          headers: Headers(),
          extra: options.extra,
          statusCode: 200,
        ),
      );
      return;
    }
    handler.next(options);
  }
}
