import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home_bottom_nav.dart';
import '../onboarding.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    checkFirstVisit();
  }

  Future<void> checkFirstVisit() async {
    final prefs = await SharedPreferences.getInstance();
    final visitedBefore = prefs.getBool('visited_before') ?? false;

    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (!visitedBefore) {
          // If visited before, navigate to Home()
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Home()),
          );
        } else {
          // If first visit, navigate to OnBoardingScreen()
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
          );

          // Set visited_before flag to true for future visits
          prefs.setBool('visited_before', true);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor:
            Colors.transparent, // Set app bar background color to transparent
        elevation: 0, // Remove shadow from the app bar
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [Color(0xFF656AFC), Color(0xFF9755F3)],
              ),
            ),
          ),
          Center(
            child: Container(
              width: 300,
              height: 300,
              margin: const EdgeInsets.only(bottom: 50),
              child: Image.asset('assets/images/splash_logo.png'),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                    colors: [
                      Color.fromARGB(232, 204, 197, 239),
                      Colors.white,
                      Color(0xFFDCD6FA)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ).createShader(bounds);
                },
                child: const Text(
                  'BOOKNAF',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'MontserratBold',
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Text color
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
