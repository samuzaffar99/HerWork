import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:her_work/pages/signup/service_forms.dart';
import 'package:her_work/services/api_firestore.dart';

// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AddServiceController extends GetxController {
  final PageController pageController = PageController(initialPage: 0);
}

class AddServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddServiceController());
    Get.lazyPut(() => ServiceFormController());
  }
}

class AddServicePage extends GetView<AddServiceController> {
  AddServicePage({Key? key}) : super(key: key);

  final String title = "Add a New Service";
  final ApiService api = Get.find<ApiService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: const Icon(Icons.person),
        title: Text(title, style: const TextStyle(letterSpacing: 3)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          controller: controller.pageController,
          children: <Widget>[
            Center(
              child: Column(
                children: [
                  const Form2(),
                  const Spacer(),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                            onPressed: () {
                              // api.callRegistration();
                              Get.back();
                              Get.snackbar(
                                  "Service added successfully!", "Yay!");
                            },
                            label: const Text("Add New Service"),
                            icon: const Icon(Icons.check_circle)),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Center(
              child: Form3(),
            )
          ],
        ),
      ),
    );
  }
}
