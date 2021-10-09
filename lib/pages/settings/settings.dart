import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({Key? key}) : super(key: key);
  final String title = "Settings";
  final List<bool> isSelected = [false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(title, style: const TextStyle(letterSpacing: 3)),
        centerTitle: true,
        // elevation: 3,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 24),
            Row(
              children: [
                const Expanded(child: Text("Dark Mode")),
                Switch(
                  value: isSelected[0],
                  onChanged: (bool value) {
                    isSelected[0] = !isSelected[0];
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text("Account Settings"),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      //@todo call signout functionality
                      Get.offAllNamed("/");
                    },
                    child: const Text("Logout"),
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                  onPressed: () {
                    //@todo remove from production unless role is admin
                    // Get.toNamed("/admin");
                  },
                  child: const Text("Admin")),
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                      onPressed: () {
                        //@todo call signout functionality
                        Get.offAllNamed("/");
                      },
                      label: const Text("Play Store"),
                      icon: const Icon(Icons.play_arrow_outlined)
                      // style: ElevatedButton.styleFrom(primary: Colors.red),
                      ),
                ),
              ],
            ),
            Column(
              children: const [
                Text(
                  "Developed By",
                  textScaleFactor: 1.2,
                ),
                SizedBox(
                  height: 12,
                ),
                Text("The Black Sphere",
                    textScaleFactor: 2,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 12,
                ),
                Text("Syed Abdullah Muzaffar"),
                Text("Mustafa Ali Usmani"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
