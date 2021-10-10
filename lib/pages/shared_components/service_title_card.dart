import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//@todo favorites
//@todo use shared serviceController
//@todo add images
class ServiceTitleCard extends StatelessWidget {
  final DocumentSnapshot service;

  const ServiceTitleCard(this.service, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              service["serviceName"],
              textScaleFactor: 1.5,
            ),
            Text(service["serviceType"]),
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
    if ((service.data() as Map).containsKey("reviews") &&
        service["reviews"].length != 0) {
      double sum = service["reviews"].fold(0, (i, el) {
            return i + el['rating'];
          }) /
          (service["reviews"] as List).length;
      return sum.toStringAsFixed(1) + " (${service["reviews"].length} Reviews)";
    } else {
      return " No Reviews Yet";
    }
  }
}
