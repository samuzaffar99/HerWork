import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:her_work/services/api_firestore.dart';

class SearchController extends GetxController {
  final RxString searchString = "".obs;
  final RxString searchStringDeb = "".obs;

  // final searchController = TextEditingController(text: "").obs;

  void updateSearch(String s) {
    searchString.value = s;
  }

  @override
  onInit() {
    super.onInit();
    debounce(searchString, (_) {
      searchStringDeb.value = searchString.value;
      // print("debounce ${searchStringDeb.value} ${searchString.value}");
    }, time: const Duration(milliseconds: 500));
  }
}

class ServicePage extends StatelessWidget {
  ServicePage({Key? key}) : super(key: key);

  final ApiService api = Get.find<ApiService>();
  final SearchController controller = Get.put(SearchController());

  final String title = "My Services";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: const TextStyle(letterSpacing: 3)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed("/addservice");
        },
        tooltip: "Add a new Service",
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),
            const Divider(),
            Expanded(child: myServicesList()),
          ],
        ),
      ),
    );
  }

  Widget myServicesList() {
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
          print(docList);
          return ListView.separated(
            itemCount: docList.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              Map service = docList[index];
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Text(service["name"] ?? ""),
                      Text(service["description"] ?? ""),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const SizedBox(width: 12),
                            Expanded(
                              child: ElevatedButton(
                                  child: const Text("Manage Service"),
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
        }
      },
    );
  }
}
