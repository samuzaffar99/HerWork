import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'service_info.dart';

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
                Text(getRating()),
              ],
            )
          ],
        ),
      ),
    );
  }

  String getRating() {
    if ((controller.service.data() as Map).containsKey("reviews") &&
        controller.service["reviews"].length != 0) {
      double sum = controller.service["reviews"].fold(0, (i, el) {
            return i + el['rating'];
          }) /
          (controller.service["reviews"] as List).length;
      return sum.toStringAsFixed(1) +
          " (${controller.service["reviews"].length} Reviews)";
    } else {
      return " No Reviews Yet";
    }
  }
}
