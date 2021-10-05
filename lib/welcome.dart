import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/signup/signup.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({Key? key}) : super(key: key);

  // final String title = "Welcome";

  // final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // leading: const Icon(Icons.person),
        // title: Text(title, style: const TextStyle(letterSpacing: 3)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('HerWork',
                    style: TextStyle(fontSize: 32)),
                // const Text("Login"),
                const SizedBox(height: 24),
                TextField(
                    keyboardType: TextInputType.phone,
                    // controller: loginController.phoneController,
                    decoration: const InputDecoration(
                      labelText: "Phone Number",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.phone),
                    )),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          //@todo move if condition to loginController
                          // kIsWeb
                          //     ? loginController.verifyWebPhoneNumber()
                          //     : loginController.verifyPhoneNumber();
                        },
                        child: const Text("Send Verification Code"),
                      ),
                    ),
                  ],
                ),
                // PinCodeTextField(
                //   appContext: context,
                //   length: 6,
                //   obscureText: false,
                //   animationType: AnimationType.fade,
                //   animationDuration: const Duration(milliseconds: 300),
                //   controller: loginController.codeController,
                //   onChanged: (_) {},
                // ),
                ElevatedButton(
                  onPressed: () {
                    // kIsWeb
                    //     ? loginController.confirmCodeWeb()
                    //     : loginController.signInWithPhoneNumber();
                  },
                  child: const Text("Verify"),
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed("/signup");
                        },
                        child: const Text("Register"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // const Text('Profile',
            //     style: TextStyle(fontSize: 32), textAlign: TextAlign.center),
            const SizedBox(height: 20),
            //@todo remove skip to home button once ready (only for avoiding auth)
            ElevatedButton(
              onPressed: () {
                // Get.offAll(()=>const DashboardPage());
                // Get.offAllNamed('/main');
              },
              child: const Text("Skip"),
            ),
          ],
        ),
      ),
    );
  }
}
