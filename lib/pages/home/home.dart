import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import '../../dashboard.dart';
// import 'package:intl/intl.dart';
// import 'utils.dart';

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
            AspectRatio(
              aspectRatio: 1.7,
              child: Card(
                elevation: 5,
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/cardbg2.png"),
                      // image: AssetImage("assets/cardbg2.jpg"),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 24.0, horizontal: 12),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        "Tuesday, 5th October",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Syeda Raheela Khan",
                        textScaleFactor: 1.5,
                        style: TextStyle(color: Colors.white),
                      ),
                      Divider(),
                      Text(
                        "Total Amount",
                        textScaleFactor: 1.2,
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "\$ 6,142.00",
                        textScaleFactor: 3,
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white),
                      ),
                      // Text("${DateTime.now().day}"),
                    ],
                  ),
                ),
              ),
            ),
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
            Column(
              children: [
                SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    child: const Text("View Profile"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.greenAccent,
                    ),
                    onPressed: () {
                      Get.toNamed("/profile");
                    },
                  ),
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    child: const Text("Explore Services"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pinkAccent,
                    ),
                    onPressed: () {
                      Get.toNamed("/search");
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
