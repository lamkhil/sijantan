import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import 'interceptor/LoggingInterceptors.dart';
import 'interceptor/NetworkInterceptor.dart';

final Dio dioSijantan = Dio(BaseOptions(
    baseUrl: 'https://sleman.wastuanopama.com/sijantan/',
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    headers: {
      //"Content-Type": ContentType.parse("application/x-www-form-urlencoded"),
      "Accept": "application/json",
      HttpHeaders.authorizationHeader:
          'Basic ${base64.encode(utf8.encode("sijantanapi:FJAyWABn"))}'
    },
    followRedirects: false,
    queryParameters: {'API-KEY': 'FhdcbXTqdmtBK7HE'},
    validateStatus: (status) {
      return status! < 500;
    }))
  ..interceptors.add(LoggingInterceptors())
  ..interceptors.add(NetworkInterceptor());

final Dio dioSijantanApi = Dio(BaseOptions(
    baseUrl: 'https://sleman.wastuanopama.com/api/',
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    headers: {"Content-Type": "application/json", "Accept": "application/json"},
    followRedirects: false,
    validateStatus: (status) {
      return status! < 500;
    }))
  ..interceptors.add(LoggingInterceptors())
  ..interceptors.add(NetworkInterceptor());

final Dio dioSpreadSheet = Dio(BaseOptions(
    baseUrl:
        'https://script.google.com/macros/s/AKfycbzOCynvXNGzncUhXxOkMszJUomfTRgpDTsZc29lFLKNiKPrcKrIkgbfJNzL1nhuPNYK/exec',
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    headers: {"Content-Type": "application/json", "Accept": "application/json"},
    followRedirects: true,
    validateStatus: (status) {
      return status! < 500;
    }))
  ..interceptors.add(LoggingInterceptors())
  ..interceptors.add(NetworkInterceptor());
