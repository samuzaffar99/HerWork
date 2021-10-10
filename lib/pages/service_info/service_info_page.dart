import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:her_work/pages/shared_components/service_title_card.dart';
import 'package:her_work/services/api_firestore.dart';
import 'package:her_work/widgets/buttons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

import 'review_dialog.dart';

class ServiceInfoController extends GetxController {
  final DocumentSnapshot service = Get.arguments[0];
}

class ServiceInfoBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ServiceInfoController());
  }
}

class ServiceInfoPage extends GetView<ServiceInfoController> {
  ServiceInfoPage({Key? key}) : super(key: key);

  final ApiService api = Get.find<ApiService>();

  final String title = "Service Details";

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
            const Divider(),
            const ServiceTabs(),
            const CallButton(),
            const MessageButton(),
          ],
        ),
      ),
    );
  }
}

//@todo add logs
class MessageButton extends GetView<ServiceInfoController> {
  const MessageButton({Key? key}) : super(key: key);

  Future<void> message() async {
    final link = WhatsAppUnilink(
      phoneNumber: controller.service["contactNum"],
      text: "Hey! ${controller.service["serviceName"]}, I would like to know",
    );
    await launch('$link');
  }

  @override
  Widget build(BuildContext context) {
    return StyledElevatedButtonIcon(
        Colors.pink, "Message", Icons.message, () => message);
  }
}

class CallButton extends GetView<ServiceInfoController> {
  const CallButton({Key? key}) : super(key: key);

  Future<void> call() async {
    final Uri link = Uri(
      scheme: 'tel',
      path: controller.service["contactNum"],
    );
    await launch(link.toString());
  }

  @override
  Widget build(BuildContext context) {
    return StyledElevatedButtonIcon(
        Colors.pink, "Call Now", Icons.call, () => call);
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
        ),
      ),
    );
  }
}

class OffersList extends GetView<ServiceInfoController> {
  const OffersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(controller.service);
    // @todo filter where available
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
              ],
            ),
          ),
        );
      },
    );
  }
}

//@todo update state on review
class ReviewsList extends GetView<ServiceInfoController> {
  const ReviewsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: (controller.service.data() as Map).containsKey("reviews")
              ? ListView.separated(
                  shrinkWrap: true,
                  itemCount: controller.service["reviews"].length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    final review = controller.service["reviews"][index];
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Text(review["reviewer"] ?? ""),
                            Text(review["message"] ?? ""),
                          ],
                        ),
                      ),
                    );
                  },
                )
              : const Center(child: Text("No Reviews Yet")),
        ),
        ElevatedButton(
            child: const Text("Leave a Review"),
            style: ElevatedButton.styleFrom(primary: Colors.purpleAccent),
            onPressed: () {
              reviewDialog();
            }),
      ],
    );
  }
}
