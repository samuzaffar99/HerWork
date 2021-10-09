import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'manage_service.dart';

class ReviewsList extends GetView<ManageServiceController> {
  const ReviewsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
    );
  }
}
