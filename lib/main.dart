import 'package:flutter/material.dart';
import 'package:stancebeam/screens/reg/1.tellaboutscreen.dart';
import 'package:stancebeam/screens/welcomescreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShotMaster',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xffE75B42),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color(0xffE75B42)),
          ),
        ),
        useMaterial3: false,
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xffE75B42)),
      ),
      home: WelcomeScreen(),
      // home: TellAboutScreen(),
    );
  }
}
