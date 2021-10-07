import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'forms.dart';
import 'service_forms.dart';
import 'signup.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Form1(),
        const Spacer(),
        const ProceedButton(),
        Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                  onPressed: () {
                    // controller.pageController.nextPage(
                    //     duration: const Duration(milliseconds: 300),
                    //     curve: Curves.easeIn);
                  },
                  label: const Text("Complete"),
                  icon: const Icon(Icons.navigate_next)),
            ),
          ],
        ),
      ],
    );
  }
}

class ServiceDetailsPage extends StatelessWidget {
  const ServiceDetailsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Form2(),
        Spacer(),
        NextButton(),
      ],
    );
  }
}

class ServiceOffersPage extends StatelessWidget {
  const ServiceOffersPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Form3(),
        Spacer(),
        FinishButton(),
      ],
    );
  }
}

class NextButton extends GetView<SignupController> {
  const NextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
              onPressed: () {
                controller.pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn);
              },
              label: const Text("Next"),
              icon: const Icon(Icons.navigate_next)),
        ),
      ],
    );
  }
}

class FinishButton extends GetView<SignupController> {
  const FinishButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}

class ProceedButton extends GetView<SignupController> {
  const ProceedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
              onPressed: () {
                controller.pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn);
              },
              label: const Text("Proceed"),
              icon: const Icon(Icons.arrow_forward)),
        ),
      ],
    );
  }
}
