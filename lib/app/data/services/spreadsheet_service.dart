import 'dart:developer';

import 'package:sijantan2/app/data/models/detail_spreadsheet_response.dart';
import 'package:sijantan2/app/network/config.dart';

class SpreadSheetService {
  SpreadSheetService._();

  static Future<DetailSpreadSheetResponse?> getAll() async {
    try {
      final result = await dioSpreadSheet.get('');
      return DetailSpreadSheetResponse.fromJson(result.data);
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      return null;
    }
  }
}
