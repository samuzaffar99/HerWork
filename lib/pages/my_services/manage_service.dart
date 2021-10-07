import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:her_work/pages/signup/service_forms.dart';
import 'package:her_work/services/api_firestore.dart';

class ManageServiceController extends GetxController {
  final service = Get.arguments[0];
}

class ManageServiceBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ManageServiceController());
  }
}

class ManageServicePage extends StatelessWidget {
  ManageServicePage({Key? key}) : super(key: key);

  final ApiService api = Get.find<ApiService>();

  final String title = "Manage Service";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: const TextStyle(letterSpacing: 3)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            SizedBox(height: 20),
            ServiceCard(),
            Divider(),
            Expanded(child: OffersList()),
          ],
        ),
      ),
      floatingActionButton: const FloatingAddButton(),
    );
  }
}

class FloatingAddButton extends GetView<ManageServiceController> {
  const FloatingAddButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Get.defaultDialog(
            title: "Add an Offering",
            // backgroundColor: Colors.green,
            // titleStyle: const TextStyle(color: Colors.white),
            textConfirm: "Confirm",
            textCancel: "Cancel",
            buttonColor: Colors.pinkAccent,
            radius: 50,
            content: const Form3(),
            onConfirm: () {
              controller.service["offers"].add(controller.service.value);
              Get.back();
            });
      },
      tooltip: "Add an Offering",
      child: const Icon(Icons.add),
    );
  }
}

class ServiceCard extends GetView<ManageServiceController> {
  const ServiceCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(controller.service["serviceName"]),
          Text(controller.service["serviceName"])
        ],
      ),
    );
  }
}

class OffersList extends GetView<ManageServiceController> {
  const OffersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(controller.service);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: controller.service["offers"].length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        final offer = controller.service["offers"][index];
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Text(offer["offerName"] ?? ""),
                Text(offer["cost"] ?? ""),
                Text(offer["description"] ?? ""),
                // Text(offer["available"] ?? ""),
                Row(
                  children: [
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                          child: const Text("Remove"),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.redAccent),
                          onPressed: () {
                            controller.service["offers"].removeAt(index);
                            // controller.update();
                          }),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}