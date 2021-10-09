import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:her_work/services/api_firestore.dart';
import 'package:her_work/widgets/buttons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class ServiceInfoController extends GetxController {
  final service = Get.arguments[0];
}

class ServiceInfoBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ServiceInfoController());
  }
}

class ServiceInfoPage extends StatelessWidget {
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
          children: const <Widget>[
            SizedBox(height: 20),
            ServiceCard(),
            Divider(),
            ServiceTabs(),
            CallButton(),
            MessageButton(),
          ],
        ),
      ),
    );
  }
}

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

class ServiceCard extends GetView<ServiceInfoController> {
  const ServiceCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              controller.service["serviceName"],
              textScaleFactor: 2.0,
            ),
            Text(controller.service["serviceType"]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.star),
                Text("Rating ${controller.service["serviceName"]}"),
              ],
            )
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

class ReviewsList extends GetView<ServiceInfoController> {
  const ReviewsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: controller.service["offers"].length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              final review = controller.service["offers"][index];
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Text(review["offerName"] ?? ""),
                      Text(review["offerName"] ?? ""),
                      // Row(
                      //   children: [
                      //     const SizedBox(width: 12),
                      //     Expanded(
                      //       child: ElevatedButton(
                      //           child: const Text("Remove"),
                      //           style: ElevatedButton.styleFrom(
                      //               primary: Colors.redAccent),
                      //           onPressed: () {
                      //             controller.service["offers"].removeAt(index);
                      //             // controller.update();
                      //           }),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              );
            },
          ),
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

  void reviewDialog() {
    final reviewController = TextEditingController();
    Get.defaultDialog(
        textConfirm: "Submit Review",
        onConfirm: () {
          Get.back();
        },
        title: "Your Review",
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              border: OutlineInputBorder(),
            ),
            controller: reviewController,
            maxLines: 3,
          ),
        ));
  }
}
