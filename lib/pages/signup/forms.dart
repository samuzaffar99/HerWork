import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'signup.dart';

class Form1 extends GetView<SignupController> {
  const Form1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              labelText: "Name",
            ),
            keyboardType: TextInputType.name,
          ),
          const SizedBox(height: 12),
          ReactiveTextField(
            formControlName: 'contactNum',
            decoration: const InputDecoration(
              icon: Icon(Icons.phone),
              border: OutlineInputBorder(),
              labelText: "Phone Number",
            ),
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 12),
          ReactiveTextField(
            formControlName: 'cnic',
            decoration: const InputDecoration(
              icon: Icon(Icons.credit_card),
              border: OutlineInputBorder(),
              labelText: "CNIC",
            ),
            keyboardType: TextInputType.number,
          ),
          const Spacer(),
          const ProceedButton(),
          ElevatedButton(onPressed: () {  },
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                    onPressed: () {
                      controller.pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    },
                    label: const Text("Complete"),
                    icon: const Icon(Icons.navigate_next)),
              ),
            ],
          );
          )
        ],
      ),
    );
  }
}

class Form2 extends GetView<SignupController> {
  const Form2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          const NextButton(),
        ],
      ),
    );
  }
}

class Form3 extends GetView<SignupController> {
  const Form3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          const FinishButton(),
        ],
      ),
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
