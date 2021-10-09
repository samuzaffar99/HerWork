import 'package:flutter/material.dart';

class HomeGrid extends StatelessWidget {
  const HomeGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(shrinkWrap: true, crossAxisCount: 3,
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
        ]);
  }
}
