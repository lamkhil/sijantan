import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get/route_manager.dart';

class NetworkInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.queryParameters.addAll({'API-KEY': "FhdcbXTqdmtBK7HE"});
    return super.onRequest(options, handler);
  }

  @override
  Future onError(DioError dioError, ErrorInterceptorHandler handler) async {
    return super.onError(dioError, handler);
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    // if (response.data is Map) {
    //   if (response.data['message'] == "Unauthenticated.") {
    //     Get.offAllNamed(Routes.AUTH);
    //   }
    // }
    return super.onResponse(response, handler);
  }
}
