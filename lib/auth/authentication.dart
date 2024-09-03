import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:moneymentor/auth/data/user_model.dart';
import 'package:moneymentor/screen/AppScreen/decide.dart';
import 'package:moneymentor/screen/login_page/login_screen_.dart';
import 'package:moneymentor/screen/on_boarding_screen.dart';
import 'package:moneymentor/screen/verify_screen/verify_screen.dart';
import 'package:moneymentor/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:moneymentor/utils/exceptions/firebase_exceptions.dart';
import 'package:moneymentor/utils/exceptions/format_exceptions.dart';
import 'package:moneymentor/utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  @override
  void onReady() {
    // Remove the native splash screen
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  // Redirect to the appropriate screen

  /// Function to Show Relevant Screen
  screenRedirect() async {
    final user = _auth.currentUser;

    if (user != null) {
      if (user.emailVerified) {
        // Fetch user json from firestore document
        try {
          FirebaseFirestore db = FirebaseFirestore.instance;
          DocumentSnapshot userDoc =
              await db.collection('Users').doc(user.uid).get();
          UserModel userJson =
              UserModel.fromJson(userDoc.data() as Map<String, dynamic>);

          Get.offAll(() => DecideScreen(userData: userJson));
        } on PlatformException catch (e) {
          throw TPlatformException(e.code).message;
        } catch (e) {
          print(e);
        }
      } else {
        Get.offAll(() => VerifyEmailScreen(
              email: _auth.currentUser?.email,
            ));
      }
    } else {
      // Local Storage
      deviceStorage.writeIfNull('IsFirstTime', true);

      // Check if it's the first time launching the app
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(() =>
              const LoginPageScreen()) // Redirect to Login Screen if not the first time
          : Get.offAll(
              const OnBoardingScreen()); // Redirect to OnBoarding Screen if it's the first time
    }
  }

  Future<UserCredential> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final FirebaseAuth auth = FirebaseAuth.instance;

      // Trigger the Google sign-in flow
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        String userId = userCredential.user!.uid;
        DocumentSnapshot userData = await FirebaseFirestore.instance
            .collection("Users")
            .doc(userId)
            .get();
        UserModel userJson =
            UserModel.fromJson(userData.data() as Map<String, dynamic>);

        // Navigate to the home screen
        Get.to(DecideScreen(
            userData: userJson)); // Replace '/home' with your home screen route
        return userCredential;
      } else {
        // User cancelled the sign-in flow
        throw 'Google sign-in cancelled.';
      }
    } catch (e) {
      throw 'Error signing in with Google: $e';
    }
  }

  /// [EmailAuthentication] - login
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// [EmailAuthentication] - REGISTER
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  //Logout Function

  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginPageScreen());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
