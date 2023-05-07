import 'package:get/get.dart';
import 'package:sijantan2/app/data/models/detail_spreadsheet_response.dart';
import 'package:sijantan2/app/modules/admin/dashboard/controllers/dashboard_controller.dart';

class AccountController extends GetxController {
  final User user = Get.find<DashboardController>().user;
}
