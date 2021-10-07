import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:her_work/services/api_firestore.dart';
import 'package:her_work/widgets/background_wave.dart';

import 'package:reactive_forms/reactive_forms.dart';
import 'form_pages.dart';
import 'service_forms.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SignupController extends GetxController {
  final PageController pageController = PageController(initialPage: 0);
  final detailsForm = fb.group({
    "name": "Syeda Raheela Khan",
    "contactNum": "03213210123",
    "cnic": "4210191111111",
  });
}

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignupController());
    Get.lazyPut(() => ServiceFormController());
  }
}

class SignupPage extends GetView<SignupController> {
  SignupPage({Key? key}) : super(key: key);

  final String title = "Sign Up";
  final ApiService api = Get.find<ApiService>();
  // creates a group
  // final form = fb.group({
  //   'name': 'John Doe',
  //   'email': ['', Validators.required, Validators.email],
  //   'password': Validators.required,
  // });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: const Icon(Icons.person),
        title: Text(title, style: const TextStyle(letterSpacing: 3)),
      ),
      body: Stack(
        children: [
          const Opacity(
            opacity: 0.6,
            child: BackgroundWave(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              controller: controller.pageController,
              children: const <Widget>[
                Center(
                  child: DetailsPage(),
                ),
                Center(
                  child: ServiceDetailsPage(),
                ),
                Center(
                  child: ServiceOffersPage(),
                )
              ],
            ),
          ),
          // Container(
          //   alignment: Alignment.topCenter,
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: SmoothPageIndicator(
          //       controller: pageController,
          //       count: 3,
          //       axisDirection: Axis.horizontal,
          //       effect: WormEffect(),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
