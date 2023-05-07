import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sijantan2/app/modules/admin/controllers/admin_controller.dart';
import 'package:sijantan2/app/routes/app_pages.dart';

import '../../../../global/utils/constants/stain_const.dart';
import '../../../../global/utils/constants/string_const.dart';
import '../../../../global/utils/helper.dart';
import '../../../../global/utils/pallete.dart';

class SignInScreen extends GetView<AdminController> {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 45),
        Text('SI JANTAN',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 32.sp,
            )),
        Text("Kabupaten Sleman",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 18.sp,
            )),
        SizedBox(height: height(40)),
        Column(
          children: [
            Container(
                height: height(56),
                decoration: BoxDecoration(
                    color: Palette.toDark.shade50,
                    borderRadius: BorderRadius.circular(11)),
                child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextField(
                          controller: controller.emailController,
                          keyboardAppearance: Brightness.dark,
                          keyboardType: TextInputType.multiline,
                          style: textStyle(16, weight: FontWeight.w400),
                          cursorColor: Colors.black,
                          enableSuggestions: true,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: SignString.email)),
                    ))),
            SizedBox(height: height(16)),
            Container(
                height: height(56),
                decoration: BoxDecoration(
                    color: Palette.toDark.shade50,
                    borderRadius: BorderRadius.circular(11)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: Obx(
                            () => TextField(
                                controller: controller.passwordController,
                                obscureText: controller.obscure.value,
                                keyboardAppearance: Brightness.dark,
                                keyboardType: TextInputType.multiline,
                                style: textStyle(16, weight: FontWeight.w400),
                                cursorColor: Colors.black,
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: SignString.passwd)),
                          ),
                        ),
                      ),
                      GestureDetector(
                          onTap: () => {
                                controller.obscure.value =
                                    !controller.obscure.value
                              },
                          child: Obx(() => controller.obscure.value
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off)))
                    ],
                  ),
                )),
            SizedBox(height: height(16)),
            // Align(
            //   alignment: Alignment.centerRight,
            //   child: Text(SignString.forgot,
            //       style: TextStyle(
            //         color: const Color(0XFF1A87DD),
            //         fontWeight: FontWeight.w400,
            //         fontSize: 14.sp,
            //       )),
            // ),
            SizedBox(height: height(63)),
            SizedBox(
              height: height(56),
              width: width(327),
              child: ElevatedButton(
                onPressed: () {
                  controller.onLogin();
                },
                style: buttonStyle(color: BoardingStain.button),
                child: Text(
                  "Login",
                  style: textStyle(15,
                      color: Colors.white, weight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(height: height(15)),
            // Text("Create new account",
            //     style: TextStyle(
            //       color: const Color(0XFF1A87DD),
            //       fontSize: 14.sp,
            //     )),
          ],
        ),
      ],
    );
  }
}
