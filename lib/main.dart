import 'package:Mowasil/firebase_options.dart';
import 'package:Mowasil/helper/service/auth_methods.dart';
import 'package:Mowasil/screens/HomeScreen/home_screen.dart';
import 'package:Mowasil/screens/OrdersList/components/index_progress.dart';
import 'package:Mowasil/screens/frieght/frieght_page.dart';
import 'package:Mowasil/screens/oder_info/orderinfo.dart';
import 'package:Mowasil/screens/splash_screen.dart';
import 'package:Mowasil/stripe_payment/components/stripe_keys.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:double_tap_to_exit/double_tap_to_exit.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(AuthMethods()));
  await FirebaseAppCheck.instance.activate(
      // ignore: deprecated_member_use
      androidProvider: AndroidProvider.safetyNet);
  Stripe.publishableKey = ApiKeys.publishableKey;
  runApp(
    DevicePreview(
      enabled: true,
      tools: const [
        ...DevicePreview.defaultTools,
      ],
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return ChangeNotifierProvider(
            create: (context) => ProgressProvider(),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: DoubleTapToExit(
                  snackBar: const SnackBar(
                    content: Text(
                      'Tap again to exit !',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  // Use onPopInvoked for consistency
                  child: SplashScreen()),
              routes: {
                HomeScreen.id: (context) => HomeScreen(),
                Frieght.id: (context) => Frieght(),
              },
              initialRoute: "loginpage",
            ),
          );
        });
  }
}
