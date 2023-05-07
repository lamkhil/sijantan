import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_jembatan_controller.dart';

class EditJembatanView extends GetView<EditJembatanController> {
  const EditJembatanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EditJembatanView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'EditJembatanView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
