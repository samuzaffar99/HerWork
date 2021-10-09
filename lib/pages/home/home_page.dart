import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:her_work/widgets/background_gradient.dart';

import 'home_grid.dart';
import 'profile_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  final String title = "Home";

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundGradient(),
        Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(title, style: const TextStyle(letterSpacing: 3)),
            centerTitle: true,
            elevation: 0,
          ),
          drawer: Drawer(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  child: const Text("Logout"),
                  onPressed: () {
                    Get.toNamed("/");
                  },
                ),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  label: const Text("Explore Services"),
                  icon: const Icon(Icons.search),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pinkAccent,
                  ),
                  onPressed: () {
                    Get.toNamed("/search");
                  },
                ),
                const SizedBox(height: 24),
                const ProfileCard(),
                const Divider(),
                const HomeGrid(),
                ElevatedButton(
                  child: const Text("Manage Services"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purpleAccent,
                  ),
                  onPressed: () {
                    Get.toNamed("/profile");
                  },
                ),
                ElevatedButton.icon(
                  label: const Text("Settings"),
                  icon: const Icon(Icons.settings),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                  ),
                  onPressed: () {
                    Get.toNamed("/settings");
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
