import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:her_work/pages/home/profile_card.dart';
import 'package:her_work/services/api_firestore.dart';
import 'package:her_work/widgets/background_gradient.dart';

//@todo add other functionality to profile
class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  final ApiService api = Get.find<ApiService>();

  final String title = "My Profile";

  @override
  Widget build(BuildContext context) {
    return BackgroundGradient2(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title, style: const TextStyle(letterSpacing: 3)),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 20),
              const ProfileCard(),
              ElevatedButton(
                  child: const Text("Verify Profile"),
                  style: ElevatedButton.styleFrom(primary: Colors.purpleAccent),
                  onPressed: () {
                    Get.toNamed("/verify");
                  }),
              // const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
