import 'package:flutter/services.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../../../../core/utils/greeting.dart';
import 'package:flutter/material.dart';
import '../../../user/presentation/screen/profile/profile.dart';
import 'home_page.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

import 'library/library_home.dart';
import 'notes/ui/pages/note_page.dart';
import 'post/post_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class _HomeState extends State<Home> {
  List<Widget> listOfStrings = [
    const HomePage(),
    const PostPage(),
    const NoteHomePage(),
    const LibraryPage(),
    const ProfileBlueAppbarRoute(),
  ];

  @override
  void initState() {
    super.initState();
  }

  String greeting = getGreeting();
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        body: listOfStrings[_currentIndex],
        bottomNavigationBar: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(35),
                    topLeft: Radius.circular(35)),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(111, 114, 121, 0.39),
                    blurRadius: 24,
                    offset: Offset(0, 8),
                  ),
                ]),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              child: SalomonBottomBar(
                backgroundColor: Colors.white,
                currentIndex: _currentIndex,
                onTap: (i) {
                  setState(() {
                    _currentIndex = i;
                  });
                },
                items: [
                  /// Home
                  SalomonBottomBarItem(
                    // icondata (U+0)
                    icon: const Icon(FluentIcons.home_16_regular),
                    title: const Text("Home"),
                    selectedColor: const Color.fromARGB(255, 21, 45, 87),
                  ),

                  /// Likes
                  SalomonBottomBarItem(
                    icon: const Icon(Icons.newspaper),
                    title: const Text("Posts"),
                    selectedColor: const Color.fromARGB(255, 21, 45, 87),
                  ),

                  /// Search
                  SalomonBottomBarItem(
                    icon: const Icon(
                      Icons.bookmark_outline,
                    ),
                    title: const Text("Notes"),
                    selectedColor: const Color.fromARGB(255, 21, 45, 87),
                  ),
                  SalomonBottomBarItem(
                    icon: const Icon(
                      Icons.cloud_download_outlined,
                    ),
                    title: const Text("Library"),
                    selectedColor: const Color.fromARGB(255, 21, 45, 87),
                  ),

                  /// Profile
                  SalomonBottomBarItem(
                    icon: const Icon(FluentIcons.person_20_regular),
                    title: const Text("Profile"),
                    selectedColor: const Color.fromARGB(255, 21, 45, 87),
                  ),
                ],
              ),
            )));

    //   bottomNavigationBar: AnimatedBottomNavigationBar(
    //     barColor: Colors.white,
    //     controller: FloatingBottomBarController(initialIndex: 1),
    //     bottomBar: [
    //       BottomBarItem(
    //         icon: const Icon(Icons.home, size: example.Dimens.iconNormal),
    //         iconSelected: const Icon(Icons.home,
    //             color: example.AppColors.cherryRed,
    //             size: example.Dimens.iconNormal),
    //         title: example.Strings.home,
    //         dotColor: example.AppColors.cherryRed,
    //         onTap: (value) {
    //           setState(() {
    //             index = value;
    //           });
    //           log('Home $value');
    //         },
    //       ),
    //       BottomBarItem(
    //         icon: const Icon(Icons.photo, size: example.Dimens.iconNormal),
    //         iconSelected: const Icon(Icons.photo,
    //             color: example.AppColors.cherryRed,
    //             size: example.Dimens.iconNormal),
    //         title: example.Strings.search,
    //         dotColor: example.AppColors.cherryRed,
    //         onTap: (value) {
    //           setState(() {
    //             index = value;
    //           });
    //           log('Search $value');
    //         },
    //       ),
    //       BottomBarItem(
    //         icon: const Icon(Icons.person, size: example.Dimens.iconNormal),
    //         iconSelected: const Icon(Icons.person,
    //             color: example.AppColors.cherryRed,
    //             size: example.Dimens.iconNormal),
    //         title: example.Strings.person,
    //         dotColor: example.AppColors.cherryRed,
    //         onTap: (value) {
    //           setState(() {
    //             index = value;
    //           });
    //           log('Profile $value');
    //         },
    //       ),
    //       BottomBarItem(
    //         icon: const Icon(Icons.settings, size: example.Dimens.iconNormal),
    //         iconSelected: const Icon(Icons.settings,
    //             color: example.AppColors.cherryRed,
    //             size: example.Dimens.iconNormal),
    //         title: example.Strings.settings,
    //         dotColor: example.AppColors.cherryRed,
    //         onTap: (value) {
    //           setState(() {
    //             index = value;
    //           });
    //           log('Settings $value');
    //         },
    //       ),
    //     ],
    //     bottomBarCenterModel: BottomBarCenterModel(
    //       centerBackgroundColor: example.AppColors.cherryRed,
    //       centerIcon: const FloatingCenterButton(
    //         child: Icon(
    //           Icons.add,
    //           color: AppColors.white,
    //         ),
    //       ),
    //       centerIconChild: [
    //         FloatingCenterButtonChild(
    //           child: const Icon(
    //             Icons.home,
    //             color: AppColors.white,
    //           ),
    //           onTap: () => log('Item1'),
    //         ),
    //         FloatingCenterButtonChild(
    //           child: const Icon(
    //             Icons.access_alarm,
    //             color: AppColors.white,
    //           ),
    //           onTap: () => log('Item2'),
    //         ),
    //         FloatingCenterButtonChild(
    //           child: const Icon(
    //             Icons.ac_unit_outlined,
    //             color: AppColors.white,
    //           ),
    //           onTap: () => log('Item3'),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
