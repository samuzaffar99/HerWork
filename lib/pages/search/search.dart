import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:her_work/services/api_firestore.dart';

import '../../utils.dart';

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

class SearchPage extends StatelessWidget {
  final ApiService api = Get.find<ApiService>();

  SearchPage({Key? key}) : super(key: key);
  final SearchController controller = Get.put(SearchController());

  final String title = "Search Services";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.search),
        title: Text(title, style: const TextStyle(letterSpacing: 3)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 12),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (String newSearchString) {
                      controller.updateSearch(newSearchString);
                      // print(newSearchString);
                    },
                    decoration: InputDecoration(
                      labelText: 'Search',
                      suffixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 3, color: Colors.blue),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text("All Services"),
            const Divider(),
            Expanded(child: servicesList()),
          ],
        ),
      ),
      // bottomNavigationBar: bottomNavBar(),
    );
  }

  Widget servicesList() {
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
              List filteredList = docList
                  .where((e) =>
                      e["name"].contains(controller.searchStringDeb.value))
                  .toList();
              print(filteredList);
              return ListView.separated(
                itemCount: filteredList.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  Map service = filteredList[index];
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
