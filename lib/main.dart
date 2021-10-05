import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/home/home.dart';
import 'pages/signup/signup.dart';
import 'welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      title: 'HerWork',
      initialRoute: '/',
      getPages: [
        // GetPage(
        //   name: '/main',
        //   page: () => const DashboardPage(),
        //   binding: NavBinding(),
        // ),
        GetPage(name: '/', page: () => WelcomePage()),
        GetPage(name: '/signup', page: () => SignupPage()),
        GetPage(name: '/home', page: () => HomePage()),
        // GetPage(name: '/settings', page: () => SettingsPage()),
        // GetPage(name: '/profile', page: () => ProfilePage()),
        // GetPage(name: '/admin', page: () => AdminPage()),
        // GetPage(name: '/search', page: () => SearchPage(), transition: Transition.zoom),
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // textTheme: GoogleFonts.robotoTextTheme(
        //   Theme.of(context).textTheme,
        // ),
      ),
    );
  }
}
