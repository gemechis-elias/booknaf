import 'package:booknaf_app/feature/booknaf/presentation/widget/home_categories.dart';
import 'package:booknaf_app/feature/booknaf/presentation/widget/recommandation_list.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'dart:async';

import '../../../../../core/data/my_colors.dart';
import '../../../../../core/data/posts.dart';
import '../../../data/model/post.dart';
import 'post_with_images.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final TextEditingController _searchController = TextEditingController();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final StreamController<String> _searchStreamController =
      StreamController<String>();
  bool _showFab = true;
  @override
  void dispose() {
    _searchStreamController.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  final List<Post> posts =
      dummyData.map((item) => Post.fromJson(item)).toList();
  @override
  Widget build(BuildContext context) {
    const duration = Duration(milliseconds: 300);
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xffF8FAFF),
        body: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;
            setState(() {
              if (direction == ScrollDirection.reverse) {
                _showFab = false;
              } else if (direction == ScrollDirection.forward) {
                _showFab = true;
              }
            });
            return true;
          },
          child: CustomScrollView(
            slivers: <Widget>[
              const SliverAppBar(
                // hide icon back
                automaticallyImplyLeading: false,
                backgroundColor: Color(0xffF8FAFF),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Color(0xffF8FAFF),
                  statusBarIconBrightness: Brightness.dark,
                ),

                title: Padding(
                  padding: EdgeInsets.only(left: 1.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "News Feed",
                        style: TextStyle(
                          fontFamily: 'MontserratBold',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                toolbarHeight: 80,
                floating:
                    false, // Set this to false to hide the app bar on scrolling
                pinned:
                    false, // Set this to false to allow the app bar to collapse
              ),
              SliverToBoxAdapter(
                child: SingleChildScrollView(
                  child: Container(
                    color: const Color(0xffF8FAFF),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 4.0, right: 4, bottom: 5),
                      child: Column(
                        children: [
                          for (final post in posts)
                            Column(children: [
                              PostWithImages(post: post),
                              const SizedBox(
                                height: 10,
                              ),
                            ])
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: AnimatedSlide(
            duration: duration,
            offset: _showFab ? Offset.zero : const Offset(0, 2),
            child: AnimatedOpacity(
                duration: duration,
                opacity: _showFab ? 1 : 0,
                child: buildSpeedDial())));
  }

  Widget buildSpeedDial() {
    return SpeedDial(
      elevation: 2,
      // icondata
      icon: Icons.add,
      // icon color
      iconTheme: const IconThemeData(color: Colors.white),

      activeIcon: Icons.close,
      // animatedIcon: AnimatedIcons.menu_close,
      // animatedIconTheme: const IconThemeData(color: Colors.white),
      curve: Curves.linear,
      overlayColor: Colors.black,
      overlayOpacity: 0.8,

      backgroundColor: const Color(0xff3A75DD),
      children: [
        SpeedDialChild(
          elevation: 2,
          label: "Share Posts",
          child: const Icon(Icons.photo_camera, color: MyColors.grey_80),
          backgroundColor: Colors.white,
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const AddImagePost()),
            // );
          },
        ),
      ],
    );
  }
}
