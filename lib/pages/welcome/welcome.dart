import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/login_api.dart';
import '../../widgets/background_wave.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({Key? key}) : super(key: key);

  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Opacity(
            opacity: 0.6,
            child: BackgroundWave(),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('HerWork',
                        style: TextStyle(
                            fontSize: 36,
                            color: Colors.pinkAccent,
                            letterSpacing: 3)),
                    const SizedBox(height: 24),
                    TextField(
                        keyboardType: TextInputType.phone,
                        controller: loginController.phoneController,
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
                              loginController.verifyPhoneNumber();
                            },
                            child: const Text("Send Verification Code"),
                          ),
                        ),
                      ],
                    ),
                    PinCodeTextField(
                      appContext: context,
                      length: 6,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      animationDuration: const Duration(milliseconds: 300),
                      controller: loginController.codeController,
                      onChanged: (_) {},
                    ),
                    ElevatedButton(
                      onPressed: () {
                        loginController.confirmCode();
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
                const SizedBox(height: 20),
                //@todo remove skip to home button once ready (only for avoiding auth)
                ElevatedButton(
                  onPressed: () {
                    Get.offAllNamed('/home');
                  },
                  child: const Text("Skip"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
