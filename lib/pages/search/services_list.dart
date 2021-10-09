import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:her_work/services/api_firestore.dart';

import 'search_page.dart';

class ServicesList extends GetView<SearchController> {
  final ApiService api = Get.find<ApiService>();

  ServicesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: api.getServices(),
      builder: (buildContext, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          throw snapshot.error!;
        } else if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          print(snapshot.data);
          List docList = snapshot.data;
          return GetX<SearchController>(
            builder: (val) {
              //@todo optimize search?
              List filteredList = docList.where((e) {
                bool bool1 = e["serviceName"]
                    .toLowerCase()
                    .contains(controller.searchStringDeb.value);
                bool bool2 = false;
                if (e.data().containsKey("offers") &&
                    (e["offers"] as List).isNotEmpty) {
                  bool2 = (e["offers"] as List).any((map) {
                    return map["offerName"]
                        .toLowerCase()
                        .contains(controller.searchStringDeb.value);
                  });
                }
                return (bool1 || bool2);
              }).toList();
              print(filteredList);
              return ListView.separated(
                itemCount: filteredList.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  final service = filteredList[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Text(service["serviceName"] ?? ""),
                          Text(service["serviceType"] ?? ""),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const SizedBox(width: 12),
                                Expanded(
                                  child: ElevatedButton(
                                      child: const Text("View Service"),
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.greenAccent),
                                      onPressed: () {
                                        Get.toNamed("/serviceinfo",
                                            arguments: [service]);
                                      }),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        }
      },
    );
  }
}
