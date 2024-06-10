import 'package:exemplo_firebase/firebase_options.dart';
import 'package:exemplo_firebase/screens/home_screen.dart';
import 'package:exemplo_firebase/screens/resitro_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
      routes: {
        '/home':(context) => const HomeScreen(),
        '/login':(context) => const LoginScreen(),
        '/registro':(context) => const RegistroScreen()
      },
    );
  }
}
