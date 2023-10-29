import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../booknaf/presentation/screen/home_bottom_nav.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  bool _isLoading = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool pasword_obscure = true;
  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return buildBody(context);
  }

  Widget buildBody(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome back',
              style: TextStyle(
                  color: Color(0xFF0D253C),
                  fontFamily: 'Urbanist-Regular',
                  fontSize: 28),
            ),
            const Text(
              'Sign in with your account',
              style: TextStyle(
                color: Color(0xFF2D4379),
                fontFamily: 'Urbanist-Bold',
                fontSize: 17,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(
                  color: Color(0xFF2D4379),
                  fontFamily: 'Urbanist-Light',
                  fontSize: 18,
                ),
              ),
            ),
            TextField(
              controller: _passwordController,
              obscureText: pasword_obscure,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: const TextStyle(
                  color: Color(0xFF2D4379),
                  fontFamily: 'Urbanist-Light',
                  fontSize: 18,
                ),
                suffixIcon: TextButton(
                    onPressed: () {
                      setState(() {
                        pasword_obscure = !pasword_obscure;
                      });
                    },
                    child: Text(
                      pasword_obscure ? 'show' : 'Hide',
                      style: const TextStyle(
                        color: Color(0xFF2D4379),
                        fontFamily: 'Urbanist-Bold',
                        fontSize: 14,
                      ),
                    )),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            //Login button
            Center(
              child: SizedBox(
                height: 60,
                width: 295,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isLoading = true;
                    });

                    // final email = _usernameController.text;
                    // final password = _passwordController.text;
                    // if (isEmailValid(email) && password.isNotEmpty) {
                    //   context.read<UserBloc>().add(
                    //       LoginUserEvent(email: email, password: password));
                    // } else {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     const SnackBar(
                    //       backgroundColor: Colors.red,
                    //       content: Text('Invalid email or Password'),
                    //     ),
                    //   );
                    // }
                    Future.delayed(const Duration(seconds: 5), () {
                      setState(() {
                        _isLoading = true;
                      });
                      // Close the Downloading Dialog
                      Navigator.pop(context);

                      // Navigate to the next screen (SplitScreen in this case)
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(),
                        ),
                      );
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: const Color(0xFF9755F3),
                  ),
                  child: _isLoading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        ) // Show a CircularProgressIndicator if login is in progress
                      : const Text(
                          'LOGIN',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Urbanist-Bold',
                            fontSize: 16,
                          ),
                        ),
                ),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Forgot your password?',
                    style: TextStyle(
                        color: Color(0xFF2D4379),
                        fontFamily: 'Urbanist-Bold',
                        fontSize: 14),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Reset here',
                        style: TextStyle(
                            color: Color(0xFF376AED),
                            fontFamily: 'Urbanist-Regular',
                            fontSize: 14),
                      )),
                ],
              ),
            ),
          ],
        ));
  }
}
