import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/data/img.dart';
import '../../../../../core/data/my_colors.dart';
import '../../../../../core/data/my_text.dart';

class ProfileBlueAppbarRoute extends StatefulWidget {
  const ProfileBlueAppbarRoute({super.key});

  @override
  ProfileBlueAppbarRouteState createState() => ProfileBlueAppbarRouteState();
}

class ProfileBlueAppbarRouteState extends State<ProfileBlueAppbarRoute> {
  final List<String> menuItems = [
    'Inbox',
    'Activities',
    'Wishlist',
    'Notifications',
    'Theme',
    'Language',
    'Account Settings',
    'Privacy Policy',
    'Help',
    'Log Out',
  ];

  final List<IconData> icons = [
    Icons.mail,
    Icons.accessibility,
    Icons.favorite,
    Icons.notifications,
    Icons.color_lens,
    Icons.language,
    Icons.account_circle,
    Icons.security,
    Icons.help,
    Icons.exit_to_app,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          elevation: 0,
          title: const Text(
            "Profile",
            style: TextStyle(
              fontFamily: 'MontserratBold',
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          // leading: IconButton(
          //   icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          // ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.search,
                  color: Color.fromARGB(255, 26, 26, 26)),
              onPressed: () {},
            ),
            PopupMenuButton<String>(
              onSelected: (String value) {},
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: "Settings",
                  child: Text("Settings"),
                ),
              ],
            )
          ]),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 52,
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(Img.get("no_profile.png")),
                    ),
                  ),
                  Container(height: 15),
                  Text("Fares Belayneh",
                      style: MyText.title(context)!.copyWith(
                          color: const Color.fromARGB(255, 29, 29, 29))),
                ],
              ),
            ),

            // Menu
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(icons[index],
                      color: const Color.fromARGB(255, 24, 24, 24)),
                  title: Text(
                    menuItems[index],
                    style: MyText.medium(context)!
                        .copyWith(color: const Color.fromARGB(255, 24, 24, 24)),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios,
                      size: 14, color: Color.fromARGB(255, 24, 24, 24)),
                  onTap: () {},
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  color: Color.fromARGB(255, 238, 238, 238),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
