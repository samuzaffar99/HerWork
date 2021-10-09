import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'profile_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  final String title = "Home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: Colors.transparent,
      appBar: AppBar(
        // flexibleSpace: Container(
        //   decoration: const BoxDecoration(
        //     gradient: LinearGradient(
        //       begin: Alignment.centerLeft,
        //       end: Alignment.centerRight,
        //       colors: <Color>[Colors.blueAccent, Colors.lightBlue],
        //     ),
        //   ),
        // ),
        title: Text(title, style: const TextStyle(letterSpacing: 3)),
        centerTitle: true,
        // elevation: 3,
      ),
      drawer: Drawer(
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          TextButton(
            child: const Text("Logout"),
            onPressed: () {
              Get.toNamed("/");
            },
          )
        ]),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 24),
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton.icon(
                label: const Text("Explore Services"),
                icon: const Icon(Icons.search),
                style: ElevatedButton.styleFrom(
                  primary: Colors.pinkAccent,
                ),
                onPressed: () {
                  Get.toNamed("/search");
                },
              ),
            ),
            const SizedBox(height: 24),
            const ProfileCard(),
            const Divider(),
            GridView.count(shrinkWrap: true, crossAxisCount: 3,
                // childAspectRatio:0.8,
                children: [
                  Column(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            // Get.to(() => GraphPage());
                          },
                          child: const Icon(Icons.stacked_bar_chart)),
                      const Text("Status"),
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            // dashboardController.changeTabIndex(1);
                          },
                          child: const Icon(Icons.compare_arrows)),
                      const Text("View"),
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            // dashboardController.changeTabIndex(2);
                          },
                          child: const Icon(Icons.my_library_books)),
                      const Text("Logs"),
                    ],
                  ),
                ]),
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                child: const Text("Manage Services"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.purpleAccent,
                ),
                onPressed: () {
                  Get.toNamed("/profile");
                },
              ),
            ),
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                child: const Text("Visit Website"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                ),
                onPressed: () {
                  // Get.toNamed("/profile");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
