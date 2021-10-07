import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:her_work/services/api_firestore.dart';
import 'package:her_work/widgets/background_wave.dart';

import 'package:reactive_forms/reactive_forms.dart';

import 'forms.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:wave/config.dart';
// import 'package:wave/wave.dart';
//
// import '../../api.dart';
// import '../dashboard.dart';

class SignupController extends GetxController {
  final PageController pageController = PageController(initialPage: 0);
  final detailsForm = fb.group({
    "name": "Syeda Raheela Khan",
    "contactNum": "03213210123",
    "cnic": "4210191111111",
  });
  final serviceForm = fb.group({
    "serviceName": "Chef Raheela",
    "contactNum": "03213210123",
    "address": "A-111 G, Block G, North Nazimabad",
    "email": "raheela.khan@gmail.com",
    "time": "",
    "serviceType": "Food",
  });
  final offerForm = fb.group({
    "offerName": "Biryani",
    "cost": "120",
    "description": "Tasty Homemade Biryani",
    "available": true
  });
}

class SignupPage extends StatelessWidget {
  SignupPage({Key? key}) : super(key: key);

  final String title = "Sign Up";
  final ApiService api = Get.find<ApiService>();
  final SignupController controller = Get.put(SignupController());
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
                  child: Form1(),
                ),
                Center(
                  child: Form2(),
                ),
                Center(
                  child: Form3(),
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
