import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/home/home.dart';
import 'pages/my_services/add_service.dart';
import 'pages/my_services/manage_service.dart';
import 'pages/profile/my_services.dart';
import 'pages/search/search.dart';
import 'pages/search/service_info.dart';
import 'pages/settings/settings.dart';
import 'pages/signup/signup.dart';
import 'pages/verification.dart';
import 'services/api_firestore.dart';
import 'pages/welcome/welcome.dart';

Future<void> main() async {
  await initializeServices();
  runApp(const MyApp());
}

Future<void> initializeServices() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(ApiService());
  // await Get.putAsync(() => ApiService().init());
  // await Get.putAsync(SettingsService()).init();
  return;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'HerWork',
      initialRoute: '/',
      getPages: [
        // GetPage(
        //   name: '/main',
        //   page: () => const DashboardPage(),
        //   binding: NavBinding(),
        // ),
        GetPage(
          name: '/',
          page: () => WelcomePage(),
        ),
        GetPage(
          name: '/signup',
          page: () => SignupPage(),
          binding: SignupBinding(),
        ),
        GetPage(
          name: '/home',
          page: () => const HomePage(),
        ),
        GetPage(name: '/settings', page: () => SettingsPage()),
        GetPage(
          name: '/profile',
          page: () => ServicePage(),
        ),
        GetPage(
            name: '/serviceinfo',
            page: () => ServiceInfoPage(),
            binding: ServiceInfoBindings()),
        GetPage(
          name: '/manageservice',
          page: () => ManageServicePage(),
          binding: ManageServiceBindings(),
        ),
        // GetPage(name: '/admin', page: () => AdminPage()),
        GetPage(
          name: '/addservice',
          page: () => AddServicePage(),
          binding: AddServiceBinding(),
        ),
        GetPage(
            name: '/search',
            page: () => SearchPage(),
            transition: Transition.leftToRightWithFade),
        GetPage(
          name: '/verify',
          page: () => const VerificationPage(),
          binding: VerificationBindings(),
        ),
      ],
      theme: ThemeData(
        primarySwatch: Colors.pink,
        // textTheme: GoogleFonts.robotoTextTheme(
        //   Theme.of(context).textTheme,
        // ),
      ),
    );
  }
}
