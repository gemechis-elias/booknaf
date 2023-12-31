import 'dart:developer';
import 'package:flutter/material.dart';

import '../../widgets/login_widget.dart';
import '../../widgets/signUp_widget.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  int activeIndex = 0;

  final List<Widget> AuthWidgets = [const LoginWidget(), const SignUpWidget()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: const BoxDecoration(color: Color(0xFF656AFC)),
                  child: Center(
                    child: Container(
                      width: 181,
                      margin: const EdgeInsets.only(bottom: 50),
                      child: Image.asset('assets/images/splash_logo.png'),
                    ),
                  ),
                ),
                Positioned(
                  top: 200,
                  child: Container(
                    alignment: const Alignment(0, 0),
                    width: MediaQuery.of(context).size.width,
                    height: 120,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  activeIndex = 0;
                                });
                              },
                              child: Text(
                                'LOGIN',
                                style: TextStyle(
                                    color: activeIndex == 0
                                        ? Colors.black
                                        : Colors.grey,
                                    fontFamily: 'Urbanist-Bold',
                                    fontSize: 18),
                              )),
                          const SizedBox(
                            width: 50,
                          ),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  activeIndex = 1;
                                });
                              },
                              child: Text(
                                'SIGN UP',
                                style: TextStyle(
                                    color: activeIndex == 1
                                        ? Colors.black
                                        : Colors.grey,
                                    fontFamily: 'Urbanist-Bold',
                                    fontSize: 18),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 270,
                  child: Container(
                    alignment: const Alignment(0, 0),
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // BlocBuilder<UserBloc, UserState>(
            //   builder: (context, state) {
            //     if (state is UserLoaded) {
            //       final user = state.user;
            //       log("User logged in");

            //       return Text('Welcome, ${user.fullName}');
            //     } else if (state is UserError) {
            //       return Text('Error: ${state.errorMessage}');
            //     } else {
            //       return const CircularProgressIndicator(); // Loading state
            //     }
            //   },
            // ),
            Container(
              child: AuthWidgets[activeIndex],
            ),
          ],
        ),
      ),
    );
  }
}
