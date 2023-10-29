// // ignore_for_file: use_build_context_synchronously

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../../../../core/utils/is_email_valid.dart';
// import '../../../../../injection.dart';
// import '../../../../hotspot/presentation/screens/home_bottom_nav.dart';
// import '../../../domain/usecases/change_profile.dart';
// import '../../../domain/usecases/get_user.dart';
// import '../../../domain/usecases/login_user.dart';
// import '../../../domain/usecases/register_user.dart';
// import '../../bloc/bloc.dart';
// import '../../bloc/bloc_state.dart';

// import '../../bloc/login/login_event.dart';
// import '../../bloc/login/login_state.dart';
// import '../../bloc/singup/signup_event.dart';
// import '../../bloc/singup/signup_state.dart';

// import '../../../../hotspot/presentation/screens/home_bottom_nav.dart';

// class LoginRoute extends StatefulWidget {
//   const LoginRoute({Key? key}) : super(key: key);

//   @override
//   State<LoginRoute> createState() => _LoginRouteState();
// }

// class _LoginRouteState extends State<LoginRoute> with TickerProviderStateMixin {
//   bool _isLoading = false;
//   double logoWidth = 90;
//   double buttonOpacity = 0.0; // Initial opacity for buttons

//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   late AnimationController _controller;
//   late Animation<double> _bounceAnimation;

//   @override
//   void initState() {
//     super.initState();

//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 1),
//     );
//     _bounceAnimation = Tween<double>(
//       begin: 0,
//       end: 10,
//     ).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: Curves.elasticOut,
//       ),
//     );

//     _controller.forward();
//     _controller.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         setState(() {
//           buttonOpacity = 1.0;
//         });
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     _usernameController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => UserBloc(
//         registerUser: sl<RegisterUserUseCase>(),
//         getUser: sl<GetUserUseCase>(),
//         loginUser: sl<LoginUserUseCase>(),
//         updateProfilePhoto: sl<ChangeProfileUseCase>(),
//       ),
//       child: BlocConsumer<UserBloc, UserState>(
//         listener: (context, state) async {
//           if (state is LoadedUserState) {
//             setState(() {
//               _isLoading = false;
//             });
//             // Store name in SharedPreferences
//             final prefs = await SharedPreferences.getInstance();
//             prefs.setString('auth_token', state.user.fullName!);

//             // LoginRoute
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (context) => const Home()),
//             );
//           }
//           // else if loading state
//           else if (state is UserLoading) {
//             setState(() {
//               _isLoading = true;
//             });
//           } else if (state is UserError) {
//             // Handle error if login fails
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 backgroundColor: Colors.red,
//                 content: Text(state.errorMessage),
//               ),
//             );
//           }
//         },
//         builder: (context, state) {
//           return buildBody(context);
//         },
//       ),
//     );
//   }

//   Widget buildBody(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Stack(
//         children: [
//           Container(
//             height: MediaQuery.of(context).size.height / 3.4,
//             width: MediaQuery.of(context).size.width / 1.9,
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/images/BG.png'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           SizedBox(
//             height: MediaQuery.of(context).size.height,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const SizedBox(
//                   height: 50,
//                 ),
//                 // Add "Log into your account" text with left padding
//                 const Padding(
//                   padding: EdgeInsets.only(left: 30.0, right: 30),
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       'Log into your account',
//                       style: TextStyle(
//                         fontFamily: 'MontserratBold',
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 // Email label and input field
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 30.0, vertical: 10.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'Email',
//                         style: TextStyle(
//                           fontFamily: 'MontserratRegural',
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       SizedBox(
//                         height: 40,
//                         child: TextFormField(
//                           controller: _usernameController,
//                           keyboardType: TextInputType.emailAddress,
//                           decoration: const InputDecoration(
//                             hintText: 'Your email',
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 color: Color(0xffDFE2E6),
//                               ),
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(30.0),
//                               ),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 color: Color(0xffDFE2E6),
//                               ),
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(30.0),
//                               ),
//                             ),
//                             filled: true,
//                             fillColor: Colors.white,
//                             prefixIcon: Icon(
//                               Icons.email,
//                               color: Color(0xffDFE2E6),
//                             ),
//                             hintStyle: TextStyle(
//                               color: Color(0xffDFE2E6),
//                               // Adjust the top padding as needed
//                               height:
//                                   1.5, // Increase this value to add more top padding
//                             ),
//                             contentPadding: EdgeInsets.symmetric(
//                                 vertical:
//                                     1.0), // Adjust the vertical padding as needed
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 // Password label and input field
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 30.0, vertical: 10.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'Passsword',
//                         style: TextStyle(
//                           fontFamily: 'MontserratRegural',
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       SizedBox(
//                         height: 40,
//                         child: TextFormField(
//                           controller: _passwordController,
//                           obscureText: true,
//                           decoration: const InputDecoration(
//                             hintText: 'Your password',
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 color: Color(0xffDFE2E6),
//                               ),
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(30.0),
//                               ),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 color: Color(0xffDFE2E6),
//                               ),
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(30.0),
//                               ),
//                             ),

//                             filled: true,
//                             fillColor: Colors.white,
//                             prefixIcon: Icon(
//                               Icons.lock,
//                               color: Color(0xffDFE2E6),
//                             ),
//                             hintStyle: TextStyle(
//                               color: Color(0xffDFE2E6),
//                               // Adjust the top padding as needed
//                               height:
//                                   1.5, // Increase this value to add more top padding
//                             ),
//                             contentPadding: EdgeInsets.symmetric(
//                                 vertical:
//                                     1.0), // Adjust the vertical padding as needed
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),

//                 // Buttons can be added here as you have in your existing code
//                 ElevatedButton(
//                   onPressed: () {
//                     // Navigator.pushReplacement(
//                     //   context,
//                     //   MaterialPageRoute(builder: (context) => const Home()),
//                     // );
//                     final email = _usernameController.text;
//                     final password = _passwordController.text;
//                     if (isEmailValid(email) && password.isNotEmpty) {
//                       context.read<UserBloc>().add(
//                           LoginUserEvent(email: email, password: password));
//                     } else {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(
//                           backgroundColor: Colors.red,
//                           content: Text('Invalid email or Password'),
//                         ),
//                       );
//                     }
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xffE9486D),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(
//                         25.0,
//                       ),
//                     ),
//                   ),
//                   child: Padding(
//                     padding: EdgeInsets.only(left: 80.0, right: 80.0),
//                     child: _isLoading
//                         ? const CircularProgressIndicator(
//                             color: Colors.white,
//                           ) // Show a CircularProgressIndicator if login is in progress
//                         : Text(
//                             'Login',
//                             style: TextStyle(
//                               fontFamily: 'MontserratBold',
//                               fontSize: 15,
//                               color: Colors.white,
//                             ),
//                           ),
//                   ),
//                 ),

//                 const SizedBox(
//                   height: 10,
//                 ),
//                 // Buttons can be added here as you have in your existing code
//                 ElevatedButton(
//                   onPressed: () {
//                     // SignUpRoute
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(builder: (context) => const Home()),
//                     );
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xff181A1F),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(25.0),
//                     ),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                     child: Row(
//                       mainAxisSize:
//                           MainAxisSize.min, // Align children horizontally
//                       children: [
//                         Image.asset(
//                           'assets/images/google-logo.png',
//                           width: 24.0, // Adjust the width and height as needed
//                           height: 24.0,
//                         ),
//                         const SizedBox(
//                             width: 10), // Add spacing between image and text
//                         const Text(
//                           'Login with Google',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontFamily: 'MontserratRegular',
//                             fontSize: 15,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
