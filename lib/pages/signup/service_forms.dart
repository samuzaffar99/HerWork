import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:her_work/services/api_firestore.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ServiceFormController extends GetxController {
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
  final RxList offersList = [].obs;

  void postForm() {
    final api = Get.find<ApiService>();
    api.postService({...serviceForm.value, "offers": offersList});
  }
}

class Form2 extends GetView<ServiceFormController> {
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
        ],
      ),
    );
  }
}

class Form3 extends GetView<ServiceFormController> {
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
        ],
      ),
    );
  }
}
