import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:her_work/pages/shared_components/service_title_card.dart';
import 'package:her_work/pages/signup/service_forms.dart';
import 'package:her_work/services/api_firestore.dart';

import 'offers_list.dart';
import 'reviews_list.dart';

class ManageServiceController extends GetxController {
  final service = Get.arguments[0];
}

class ManageServiceBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ManageServiceController());
  }
}

class ManageServicePage extends GetView<ManageServiceController> {
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
          children: <Widget>[
            const SizedBox(height: 20),
            ServiceTitleCard(controller.service),
            // Divider(),
            const ServiceTabs(),
            // Expanded(child: OffersList()),
          ],
        ),
      ),
      floatingActionButton: const FloatingAddButton(),
    );
  }
}

//@todo fix add offering here
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

class ServiceTabs extends StatelessWidget {
  const ServiceTabs({Key? key}) : super(key: key);
  static const tabList = [
    Tab(icon: Icon(Icons.home_repair_service), text: "Services"),
    Tab(icon: Icon(Icons.reviews), text: "Reviews")
  ];

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: DefaultTabController(
          length: tabList.length,
          child: Column(
            children: const [
              TabBar(
                labelColor: Colors.pink,
                tabs: tabList,
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    OffersList(),
                    ReviewsList(),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}