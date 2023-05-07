import 'package:dio/dio.dart';
import 'package:sijantan2/app/data/models/detail_spreadsheet_response.dart';
import 'package:sijantan2/app/data/models/jalan_detail.dart';
import 'package:sijantan2/app/data/models/jembatan_detail.dart';
import 'package:sijantan2/app/data/models/response_api.dart';
import 'package:sijantan2/app/network/config.dart';

class _Route {
  static const kondisiJalan = "kondisi_jln";
  static const kondisiJembatan = "kondisi_jbt";
  static const jalan = "jalan";
  static const jembatan = "jembatan";
}

class SijantanService {
  SijantanService._();

  static Future<ResponseApi<KondisiJalan>> getKondisiJalan(
      String tahun, String noRuas) async {
    try {
      final result = await dioSijantan.get(_Route.kondisiJalan,
          queryParameters: {'tahun': tahun, 'no_ruas': noRuas});
      if (result.statusCode == 200) {
        return ResponseApi(
            success: true, data: KondisiJalan.fromJson(result.data['data'][0]));
      }
      return ResponseApi(
          success: false, message: result.data['message'] ?? "Server Error");
    } catch (e) {
      return ResponseApi(success: false, message: e.toString());
    }
  }

  static Future<ResponseApi<KondisiJalan>> updateKondisiJalan(
      FormData data) async {
    try {
      final result = await dioSijantan.post(_Route.kondisiJalan, data: data);
      if (result.statusCode == 200) {
        return ResponseApi(success: true, message: result.data['message']);
      }
      return ResponseApi(
          success: false, message: result.data['message'] ?? "Server Error");
    } catch (e) {
      return ResponseApi(success: false, message: e.toString());
    }
  }

  static Future<ResponseApi<KondisiJembatan>> getKondisiJembatan(
      String tahun, String iD) async {
    try {
      final result = await dioSijantan.get(_Route.kondisiJembatan,
          queryParameters: {'tahun': tahun, 'ID': iD});
      if (result.statusCode == 200) {
        return ResponseApi(
            success: true,
            data: KondisiJembatan.fromJson(result.data['data'][0]));
      }
      return ResponseApi(
          success: false, message: result.data['message'] ?? "Server Error");
    } catch (e) {
      return ResponseApi(success: false, message: e.toString());
    }
  }

  static Future<ResponseApi<KondisiJembatan>> updateKondisiJembatan(
      FormData data) async {
    try {
      final result = await dioSijantan.post(_Route.kondisiJembatan, data: data);
      if (result.statusCode == 200) {
        return ResponseApi(success: true, message: result.data['message']);
      }
      return ResponseApi(
          success: false, message: result.data['message'] ?? "Server Error");
    } catch (e) {
      return ResponseApi(success: false, message: e.toString());
    }
  }

  static Future<ResponseApi<List<Jalan>>> getDetailJalan() async {
    try {
      final result = await dioSijantan.get(_Route.jalan);
      if (result.statusCode == 200) {
        return ResponseApi(
            success: true,
            data: result.data['data'] is List
                ? (result.data['data'] as List)
                    .map((e) => Jalan.fromJson(e))
                    .toList()
                : null);
      }
      return ResponseApi(
          success: false, message: result.data['message'] ?? "Server Error");
    } catch (e) {
      return ResponseApi(success: false, message: e.toString());
    }
  }

  static Future<ResponseApi> updateDetailJalan(
      Map<String, dynamic> data) async {
    try {
      final result = await dioSijantan.put(_Route.jalan, data: data);
      if (result.statusCode == 200) {
        return ResponseApi(success: true, message: result.data['message']);
      }
      return ResponseApi(
          success: false, message: result.data['message'] ?? "Server Error");
    } catch (e) {
      return ResponseApi(success: false, message: e.toString());
    }
  }

  static Future<ResponseApi<List<Jembatan>>> getDetailJembatan() async {
    try {
      final result = await dioSijantan.get(_Route.jembatan);
      if (result.statusCode == 200) {
        return ResponseApi(
            success: true,
            data: result.data['data'] is List
                ? (result.data['data'] as List)
                    .map((e) => Jembatan.fromJson(e))
                    .toList()
                : null);
      }
      return ResponseApi(
          success: false, message: result.data['message'] ?? "Server Error");
    } catch (e) {
      return ResponseApi(success: false, message: e.toString());
    }
  }

  static Future<ResponseApi> updateDetailJembatan(
      Map<String, dynamic> data) async {
    try {
      final result = await dioSijantan.put(_Route.jembatan, data: data);
      if (result.statusCode == 200) {
        return ResponseApi(success: true, message: result.data['message']);
      }
      return ResponseApi(
          success: false, message: result.data['message'] ?? "Server Error");
    } catch (e) {
      return ResponseApi(success: false, message: e.toString());
    }
  }
}
