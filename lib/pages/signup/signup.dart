import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:her_work/services/api_firestore.dart';
import 'package:her_work/widgets/background_wave.dart';

import 'package:reactive_forms/reactive_forms.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:wave/config.dart';
// import 'package:wave/wave.dart';
//
// import '../../api.dart';
// import '../dashboard.dart';

class SignupController extends GetxController {
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
  final PageController pageController = PageController(initialPage: 0);
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
              controller: pageController,
              children: <Widget>[
                Center(
                  child: form1(),
                ),
                Center(
                  child: form2(),
                ),
                Center(
                  child: form3(),
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

  Widget nextButton() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
              onPressed: () {
                pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn);
              },
              label: const Text("Next"),
              icon: const Icon(Icons.navigate_next)),
        ),
      ],
    );
  }

  Widget finishButton() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
              onPressed: () {
                // api.callRegistration();
                Get.snackbar("Account Registration Successful!", "Yay!");
                Get.offAllNamed("/home");
              },
              label: const Text("Create an Account"),
              icon: const Icon(Icons.check_circle)),
        ),
      ],
    );
  }

  Widget proceedButton() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
              onPressed: () {
                pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn);
              },
              label: const Text("Proceed"),
              icon: const Icon(Icons.arrow_forward)),
        ),
      ],
    );
  }

  Widget form1() {
    return ReactiveForm(
      formGroup: controller.detailsForm,
      child: Column(
        // mainAxisSize: MainAxisSize.max,
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const SizedBox(height: 24),
          const SizedBox(height: 12),
          ReactiveTextField(
            formControlName: 'name',
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              border: OutlineInputBorder(),
            ),
          ),
          ReactiveTextField(
            formControlName: 'contactNum',
            decoration: const InputDecoration(
              icon: Icon(Icons.phone),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          ReactiveTextField(
            formControlName: 'cnic',
            decoration: const InputDecoration(
              icon: Icon(Icons.credit_card),
              border: OutlineInputBorder(),
            ),
          ),
          const Spacer(),
          proceedButton(),
        ],
      ),
    );
  }

  Widget form2() {
    return ReactiveForm(
      formGroup: controller.serviceForm,
      child: Column(
        children: <Widget>[
          const SizedBox(height: 24),
          ReactiveTextField(
            formControlName: 'serviceName',
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          ReactiveTextField(
            formControlName: 'contactNum',
            decoration: const InputDecoration(
              icon: Icon(Icons.person_outline),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          ReactiveTextField(
            formControlName: 'address',
            decoration: const InputDecoration(
              icon: Icon(Icons.calendar_today),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          ReactiveTextField(
            formControlName: 'email',
            decoration: const InputDecoration(
              icon: Icon(Icons.calendar_today),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          ReactiveTextField(
            formControlName: 'time',
            decoration: const InputDecoration(
              icon: Icon(Icons.calendar_today),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          ReactiveTextField(
            formControlName: 'serviceType',
            decoration: const InputDecoration(
              icon: Icon(Icons.credit_card_outlined),
              border: OutlineInputBorder(),
            ),
          ),
          const Spacer(),
          nextButton(),
        ],
      ),
    );
  }

  Widget form3() {
    return ReactiveForm(
      formGroup: controller.offerForm,
      child: Column(
        children: <Widget>[
          const SizedBox(height: 24),
          ReactiveTextField(
            formControlName: 'offerName',
            decoration: const InputDecoration(
              icon: Icon(Icons.work),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          ReactiveTextField(
            formControlName: 'cost',
            decoration: const InputDecoration(
              icon: Icon(Icons.phone),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          ReactiveTextField(
            formControlName: 'description',
            decoration: const InputDecoration(
              icon: Icon(Icons.credit_card_outlined),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Text("Available"),
              ReactiveCheckbox(
                formControlName: 'available',
              ),
            ],
          ),
          const Spacer(),
          finishButton(),
        ],
      ),
    );
  }
}
