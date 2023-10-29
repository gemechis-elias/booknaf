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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Color(0xFF656AFC),
          elevation: 0,
          title: Text("Profile",
              style: MyText.title(context)!.copyWith(color: Colors.white)),
          // leading: IconButton(
          //   icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          // ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.search, color: Colors.white),
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
              color: Color(0xFF656AFC),
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 52,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(Img.get("no_profile.png")),
                    ),
                  ),
                  Container(height: 15),
                  Text("Abebe Kebede",
                      style:
                          MyText.title(context)!.copyWith(color: Colors.white)),
                  Container(height: 5),
                  Text("Student",
                      style: MyText.subhead(context)!
                          .copyWith(color: MyColors.grey_10)),
                ],
              ),
            ),
            Container(height: 20),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Text("0",
                          style: MyText.title(context)!
                              .copyWith(color: MyColors.grey_90)),
                      Container(height: 5),
                      Text("Posts",
                          style: MyText.subhead(context)!
                              .copyWith(color: MyColors.grey_60))
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Text("0",
                          style: MyText.title(context)!
                              .copyWith(color: MyColors.grey_90)),
                      Container(height: 5),
                      Text("Followers",
                          style: MyText.subhead(context)!
                              .copyWith(color: MyColors.grey_60))
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Text("1",
                          style: MyText.title(context)!
                              .copyWith(color: MyColors.grey_90)),
                      Container(height: 5),
                      Text("Following",
                          style: MyText.subhead(context)!
                              .copyWith(color: MyColors.grey_60))
                    ],
                  ),
                ),
              ],
            ),
            Container(height: 20),
            const Divider(height: 0),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Photos",
                      style: MyText.medium(context).copyWith(
                          color: MyColors.grey_90,
                          fontWeight: FontWeight.bold)),
                  Container(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        // You don't have posts yet text small and centered
                        Container(
                          child: Text("You don't have photo yet",
                              style: MyText.subhead(context)!
                                  .copyWith(color: MyColors.grey_60)),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Saved Post",
                      style: MyText.medium(context).copyWith(
                          color: MyColors.grey_90,
                          fontWeight: FontWeight.bold)),
                  Container(height: 10),
                  Row(
                    children: <Widget>[
                      Text("You don't have saved post yet",
                          style: MyText.subhead(context)!
                              .copyWith(color: MyColors.grey_60))
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
