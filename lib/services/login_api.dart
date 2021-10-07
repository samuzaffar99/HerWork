// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';

import 'api_firestore.dart';
//@todo manage session state

class LoginController extends GetxController {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final ApiService apiService = Get.find<ApiService>();
  User? firebaseUser = FirebaseAuth.instance.currentUser;
  ConfirmationResult? webConfirmationResult;
  String? verificationId;
  var currentUser;

  final TextEditingController phoneController =
      TextEditingController(text: "+92");
  final TextEditingController codeController = TextEditingController();

  //Load existing user from firebase to local variable
  Future<void> fetchUser() async {
    print("fetchUser");
    currentUser = await apiService.getUser(firebaseUser!.uid);
  }

  //From firebase userid, initialize user, if it exists, goto home, else goto signup page
  Future<void> initializeUser() async {
    print("initializeUser");
    print(currentUser);
    await fetchUser();
    print(currentUser);
    if (currentUser != null) {
      print("Existing user");
      Get.toNamed("/home");
    } else {
      print("User does not exist");
      Get.toNamed("/signup");
    }
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  Future<void> verifyPhoneNumber() async {
    kIsWeb ? verifyWebPhoneNumber() : verifyPhoneNumberMobile();
  }

  Future<void> confirmCode() async {
    kIsWeb ? confirmCodeWeb() : confirmCodePhone();
  }

  Future<void> verifyWebPhoneNumber() async {
    ConfirmationResult confirmationResult =
        await firebaseAuth.signInWithPhoneNumber("+44 7444 555666");
    webConfirmationResult = confirmationResult;
  }

  Future<void> confirmCodeWeb() async {
    if (webConfirmationResult != null) {
      try {
        await webConfirmationResult!.confirm(codeController.text).then((value) {
          Get.snackbar("Success", 'Login Success');
          print(value);
        });
      } catch (e) {
        Get.snackbar("Failure", 'Failed to sign in: ${e.toString()}');
      }
    } else {
      Get.snackbar("Failure",
          'Please input sms code received after verifying phone number');
    }
  }

  //verify phone number, with callback methods
  Future<void> verifyPhoneNumberMobile() async {
    try {
      print("trying to login");
      await firebaseAuth.verifyPhoneNumber(
        // phoneNumber: "+44 7444 555666",
        phoneNumber: phoneController.text,
        timeout: const Duration(seconds: 5),
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
          print("verificationCompleted");
          await firebaseAuth.signInWithCredential(phoneAuthCredential);
          Get.snackbar("Success",
              'Phone number automatically verified and user signed in: $phoneAuthCredential');
        },
        verificationFailed: (FirebaseAuthException authException) {
          print("verificationFailed");
          Get.snackbar("Failure",
              "Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}");
          if (authException.code == 'invalid-phone-number') {
            print('The provided phone number is not valid.');
          }
        },
        codeSent: (String verificationId, int? resendToken) async {
          print("codeSent");
          Get.snackbar("Code Sent",
              "Please check your phone for the verification code.");
          this.verificationId = verificationId;
          print(this.verificationId);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          print("codeAutoRetrievalTimeout");
          // Get.snackbar("Code Timeout", "Resend Code");
          this.verificationId = verificationId;
        },
      );
    } catch (e) {
      Get.snackbar("Error", 'Failed to Verify Phone Number: $e');
    }
  }

  // sign in with phone.
  Future<void> confirmCodePhone() async {
    try {
      print("verification Id: ${verificationId!}");
      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId!,
        // smsCode: "123456",
        smsCode: codeController.text,
      );
      firebaseUser = (await firebaseAuth.signInWithCredential(credential)).user;
      Get.snackbar(
          "Success", 'Successfully signed in UID: ${firebaseUser!.uid}');
      initializeUser();
    } catch (e) {
      print(e);
      Get.snackbar("Error", 'Failed to sign in');
    }
  }
}

// class Session extends GetxService {
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//   final GoogleSignIn _googleSignIn = GoogleSignIn();
//   User firebaseUser = FirebaseAuth.instance.currentUser!;
//
//   RxBool isLoggedIn = false.obs;
//   FirebaseFirestore db = FirebaseFirestore.instance;
//   late DocumentReference userRef;
//   late DocumentSnapshot userData;
//
//   ApiService api = Get.find<ApiService>();
//   RxBool isLoading = false.obs;
//
//   void initState() {
//     isSignedIn();
//   }
//
//   void isSignedIn() async {
//     isLoading.value = true;
//     isLoggedIn.value = await _googleSignIn.isSignedIn();
//     if (isLoggedIn.value) {
//       bool existsUser = await initializeUser();
//       if (existsUser) {
//         Get.offAllNamed('/root');
//       } else {
//         Get.toNamed('/setup');
//       }
//     }
//
//     isLoading.value = false;
//   }
//
//   Future<Null> handleSignIn() async {
//     isLoading.value = true;
//     try {
//       bool existsUser = await initializeUser();
//       Get.snackbar("Success", "Sign in success");
//       isLoading.value = false;
//       if (existsUser) {
//         print("unga bunga");
//         // Get.toNamed("/setup");
//         Get.offAllNamed('/root');
//       } else {
//         print("not unga bunga");
//         Get.toNamed('/setup');
//       }
//     } catch (err) {
//       print(err);
//       Get.snackbar("Error!", "Sign in fail");
//       isLoading.value = false;
//     }
//   }
//
//   Future<void> fetchUser() async {
//     print("fetchUser");
//     userRef = db.collection("users").doc(firebaseUser.uid);
//     userData = await api.getUser(firebaseUser.uid);
//   }
//
//   Future<bool> initializeUser() async {
//     print("initializeUser");
//     await signIn();
//     await fetchUser();
//     if (userData.exists) {
//       print("UserData present on firestore");
//       return true;
//     } else {
//       print("UserData not present on firestore");
//       return false;
//     }
//     // print(userData.data());
//     // Save Default Data to local preferences
//     // await prefs.setString('id', firebaseUser.uid);
//     // await prefs.setString('nickname', firebaseUser.displayName);
//     // await prefs.setString('photoUrl', firebaseUser.photoURL);
//     // print(UserData.data());
//     // Load Data from Cloud to local preferences
//     // await prefs.setString('id', UserData.get('id'));
//     // await prefs.setString('nickname', UserData["nickname"]);
//     // await prefs.setString('photoUrl', UserData[0].data()['photoUrl']);
//     // await prefs.setString('aboutMe', UserData[0].data()['aboutMe']);
//     // return existsUser;
//   }
//
//   Future<void> signIn() async {
//     print("signIn");
//     GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
//     GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
//
//     final AuthCredential _credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );
//     print("GoogleAuth Credentials done");
//     firebaseUser =
//         (await FirebaseAuth.instance.signInWithCredential(_credential)).user!;
//   }
//
//   Future<void> signOut() async {
//     // await _googleSignIn.signOut();
//     await _googleSignIn.disconnect();
//     await _firebaseAuth.signOut();
//   }
//
//   //Create new user data using firebase uid
//   Future<void> createUser(Map userData) async {
//     await api.putUser(firebaseUser.uid, userData);
//     return;
//   }
//
// }
