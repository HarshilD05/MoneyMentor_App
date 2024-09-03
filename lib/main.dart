import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:moneymentor/auth/authentication.dart';
import 'package:moneymentor/bindings/general_bindings.dart';
import 'package:moneymentor/firebase_options.dart';
import 'package:moneymentor/utils/constants/colors.dart';
import 'package:moneymentor/utils/theme/theme.dart';

void main() async {
  // Ensure Flutter is initialized
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  // Initialize GetStorage for local storage management
  await GetStorage.init();

  // Preserve native splash screen until Flutter is ready
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Initialize Firebase and put AuthenticationRepository instance into GetX dependency injection system
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((FirebaseApp value) => Get.put(AuthenticationRepository()));

  // Run the main application
  runApp(
    GetMaterialApp(
      initialBinding:
          GeneralBindings(), // Set up initial bindings for dependency injection  
      themeMode: ThemeMode.system, // Use system theme mode (light or dark)
      theme: TAppTheme.lightTheme, // Define light theme
      darkTheme: TAppTheme.darkTheme, // Define dark theme
      home: const Scaffold(
        backgroundColor: TColors.primary, // Set primary background color
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white, // Set progress indicator color to white
          ),
        ),
      ),
    ),
  );
}
