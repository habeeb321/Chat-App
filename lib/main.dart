import 'package:chat_app/view/forgot_password_page/controller/forgot_pass_controller.dart';
import 'package:chat_app/view/home_page/controller/home_controller.dart';
import 'package:chat_app/view/login_page/controller/login_controller.dart';
import 'package:chat_app/view/main_page/main_page.dart';
import 'package:chat_app/view/signup_page/controller/signup_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // if (kIsWeb) {
  //   await Firebase.initializeApp(
  //     options: const FirebaseOptions(
  //       apiKey: apiKey,
  //       appId: appId,
  //       messagingSenderId: messagingSenderId,
  //       projectId: projectId,
  //     ),
  //   );
  // } else {
  //   await Firebase.initializeApp();
  // }
  await Firebase.initializeApp();

  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginController>(
          create: (context) => LoginController(),
        ),
        ChangeNotifierProvider<SignupController>(
          create: (context) => SignupController(),
        ),
        ChangeNotifierProvider<ForgotPassController>(
          create: (context) => ForgotPassController(),
        ),
        ChangeNotifierProvider<HomeController>(
          create: (context) => HomeController(),
        ),
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MainPage(),
      ),
    );
  }
}
