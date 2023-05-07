import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sijantan2/app/data/models/detail_spreadsheet_response.dart';
import 'package:sijantan2/app/global/controller/core_controller.dart';
import 'package:sijantan2/app/routes/app_pages.dart';

class AdminController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final obscure = true.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  Future<void> onLogin() async {
    List<User> users = Get.find<CoreController>().detailData.value!.user!;
    User? user = users
        .where((element) => element.email == emailController.text)
        .firstOrNull;

    if (user == null) {
      Get.snackbar("Oops!", "Email tidak ditemukan",
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }
    if (user.password != base64.encode(utf8.encode(passwordController.text))) {
      Get.snackbar("Oops!", "Password salah",
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }

    Get.offNamed(Routes.DASHBOARD, arguments: user);
  }
}
