import 'package:flutter/material.dart';
import 'login.dart';
import 'signup.dart';

class LoginOrSignUp extends StatefulWidget {
  const LoginOrSignUp({Key? key}) : super(key: key);

  @override
  State<LoginOrSignUp> createState() => _LoginOrSignUpState();
}

class _LoginOrSignUpState extends State<LoginOrSignUp>
    with TickerProviderStateMixin {
  double logoWidth = 90;
  double buttonOpacity = 0.0; // Initial opacity for buttons
  late AnimationController _controller;
  late Animation<double> _bounceAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _bounceAnimation = Tween<double>(
      begin: 0,
      end: 30,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut,
      ),
    );

    _controller.forward();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          buttonOpacity = 1.0;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3.4,
            width: MediaQuery.of(context).size.width / 1.9,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/BG.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, -_bounceAnimation.value),
                        child: SizedBox(
                          width: logoWidth,
                          height: logoWidth,
                          child: Image.asset(
                            'assets/images/logo.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    // // LoginRoute
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const LoginRoute()),
                    // );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(
                      255,
                      34,
                      34,
                      34,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        25.0,
                      ),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 60.0, right: 60.0),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontFamily: 'MontserratRegural',
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Text(
                    'or',
                    style: TextStyle(
                      fontFamily: 'MontserratRegural',
                      fontSize: 17,
                      color: Color.fromARGB(255, 34, 34, 34),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // // SignUpRoute
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const SignUpRoute()),
                    // );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white, // Text color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      side:
                          const BorderSide(color: Colors.black), // Black border
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 24.0, right: 24.0),
                    child: Text(
                      'Create account',
                      style: TextStyle(
                        fontFamily: 'MontserratRegural',
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
