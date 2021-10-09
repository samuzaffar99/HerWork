import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerificationController extends GetxController {
  Image? cnic;
  Image? person;
}

class VerificationBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VerificationController());
  }
}

class VerificationPage extends GetView<VerificationController> {
  final String title = "Verify";

  VerificationPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: const TextStyle(letterSpacing: 3)),
        centerTitle: true,
      ),
    );
  }
}