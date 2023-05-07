import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingDialog {
  LoadingDialog._();

  static void basic() {
    Get.dialog(Center(
      child: Container(
        height: 80,
        width: 80,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: const CircularProgressIndicator(),
      ),
    ));
  }
}
