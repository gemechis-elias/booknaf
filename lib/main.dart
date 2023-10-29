import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../core/locale/languages.dart';
import 'package:firebase_core/firebase_core.dart';
import '../../../../core/data/my_colors.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import SharedPreferences package
import 'core/bloc.dart';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'feature/booknaf/presentation/screen/notes/core/db/db_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'feature/booknaf/presentation/screen/home_bottom_nav.dart';
import 'feature/booknaf/presentation/screen/splash/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDb();
  Bloc.observer = const AppBlocObserver();

  await SystemChrome.setPreferredOrientations(
      <DeviceOrientation>[DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const initialRoute = '/splash';

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Booknaf',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          secondary: const Color(0xffEE6F57),
        ),
        useMaterial3: true,
      ),
      initialRoute: initialRoute, // Use initialRoute based on 'auth_token'
      routes: {
        '/splash': (context) => const Splash(),
        '/home': (context) => const Home(),
      },
    );
  }
}
