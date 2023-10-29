// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:lottie/lottie.dart';

// import 'home_bottom_nav.dart';

// class xOnBoardingScreen extends StatefulWidget {
//   const OnBoardingScreen({Key? key}) : super(key: key);

//   @override
//   State<OnBoardingScreen> createState() => _OnBoardingScreenState();
// }

// class _OnBoardingScreenState extends State<OnBoardingScreen> {
//   late PageController _pageController;
//   int _pageIndex = 0;
//   @override
//   void initState() {
//     _pageController = PageController(initialPage: 0);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor:
//             Colors.white, // Set app bar background color to transparent
//         elevation: 0, // Remove shadow from the app bar
//       ),
//       body: Column(
//         children: [
//           Expanded(
//               child: PageView.builder(
//             itemCount: demo_data.length,
//             controller: _pageController,
//             onPageChanged: (index) {
//               setState(() {
//                 _pageIndex = index;
//               });
//             },
//             itemBuilder: (context, index) => onboardingContent(
//               title: demo_data[index].title,
//               image: demo_data[index].image,
//               note: demo_data[index].note,
//             ),
//           )),
//           onBoardingNavigation(
//               pageIndex: _pageIndex, pageController: _pageController),
//         ],
//       ),
//     );
//   }
// }

// class onBoardingNavigation extends StatelessWidget {
//   const onBoardingNavigation({
//     super.key,
//     required int pageIndex,
//     required PageController pageController,
//   })  : _pageIndex = pageIndex,
//         _pageController = pageController;

//   final int _pageIndex;
//   final PageController _pageController;

//   @override
//   Widget build(BuildContext context) {
//     return _pageIndex == demo_data.length - 1
//         ? Container(
//             padding: const EdgeInsets.only(bottom: 10),
//             color: Colors.white,
//             width: MediaQuery.of(context).size.width,
//             child: Container(
//               padding: const EdgeInsets.only(left: 50, right: 50),
//               height: 60,
//               width: 150,
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(builder: (context) => const Home()),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10)),
//                   backgroundColor: Color(0xFF9755F3),
//                 ),
//                 child: const Text(
//                   'Get Started',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ),
//           )
//         : Container(
//             padding: const EdgeInsets.only(bottom: 10),
//             color: Colors.white,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const SizedBox(
//                   width: 20,
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(builder: (context) => const Home()),
//                     );
//                   },
//                   child: const Text(
//                     'SKIP',
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//                 const Spacer(),
//                 ...List.generate(
//                   demo_data.length,
//                   (index) => Padding(
//                     padding: const EdgeInsets.only(right: 8),
//                     child: DotIndicator(
//                       isActive: index == _pageIndex,
//                     ),
//                   ),
//                 ),
//                 const Spacer(),
//                 TextButton(
//                   onPressed: () {
//                     _pageController.nextPage(
//                         duration: const Duration(milliseconds: 1000),
//                         curve: Curves.ease);
//                   },
//                   child: const Text(
//                     'NEXT',
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 20,
//                 ),
//               ],
//             ),
//           );
//   }
// }

// class DotIndicator extends StatelessWidget {
//   const DotIndicator({
//     super.key,
//     this.isActive = false,
//   });

//   final bool isActive;

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 300),
//       height: 8,
//       width: isActive ? 10 : 10,
//       decoration: BoxDecoration(
//           color: isActive ? Color(0xFF9755F3) : Colors.grey,
//           borderRadius: const BorderRadius.all(Radius.circular(12))),
//     );
//   }
// }

// class Onboard {
//   late final String title;
//   late final String image;
//   late final String note;

//   Onboard({required this.title, required this.image, required this.note});
// }

// final List<Onboard> demo_data = [
//   Onboard(
//     title: 'Discover Limitless Worlds',
//     image: 'assets/lotties/phone_scrolling.json',
//     note:
//         'Dive into diverse stories, connect with authors, and explore endless possibilities. Your passport to a world of imagination.',
//   ),
//   Onboard(
//     title: 'Connect with Readers\n',
//     image: 'assets/lotties/engagment.json',
//     note:
//         ' Engage with authors, share ideas, and join a vibrant community of readers. Your space for literary connections.',
//   ),
//   Onboard(
//     title: 'Explore Translated Gems',
//     image: 'assets/lotties/engagment.json',
//     note:
//         'Reading Without Borders Immerse in stories from diverse cultures. Explore translated books that open windows to the world.',
//   ),
// ];

// class onboardingContent extends StatelessWidget {
//   const onboardingContent(
//       {super.key,
//       required this.title,
//       required this.image,
//       required this.note});
//   final String title;
//   final String image;
//   final String note;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const SizedBox(
//           height: 100,
//         ),
//         Padding(
//           padding: const EdgeInsets.all(20),
//           child: Text(
//             title,
//             style: const TextStyle(
//               fontFamily: 'Poppins-SemiBold',
//               fontSize: 22,
//               color: Color(0xFF9755F3),
//             ),
//           ),
//         ),
//         SizedBox(
//           width: MediaQuery.of(context).size.width * 0.7,
//           height: MediaQuery.of(context).size.height * 0.4,
//           child: Center(
//             child: Lottie.asset(image),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text(
//             note,
//             textAlign: TextAlign.center,
//             style: const TextStyle(fontFamily: 'Urbanist-Light', fontSize: 17),
//           ),
//         ),
//       ],
//     );
//   }
// }
