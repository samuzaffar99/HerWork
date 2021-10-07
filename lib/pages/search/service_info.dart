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
            Expanded(child: OffersList()),
            Spacer(),
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
      phoneNumber: '+001-(555)1234567',
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

class ServiceCard extends GetView<ServiceInfoController> {
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

class OffersList extends GetView<ServiceInfoController> {
  const OffersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(controller.service);
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
