import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../../core/data/my_colors.dart';
import '../../../../../core/data/my_text.dart';
import '../../../../../core/data/posts.dart';
import '../../../data/model/post.dart';

class PostDetailPage extends StatefulWidget {
  const PostDetailPage({super.key});

  @override
  PostDetailPageState createState() => PostDetailPageState();
}

class PostDetailPageState extends State<PostDetailPage> {
  bool showSheet = false;
  late List<Post> posts;
  var expand = false.obs;
  late double screenHeight;
  double initialSize = 0.1;

  void onItemClick(int index, Post obj) {}

  @override
  void initState() {
    super.initState();
    posts = dummyData.map((item) => Post.fromJson(item)).toList();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: MyColors.grey_5,
      appBar: AppBar(
        // not pinned to the top
        backgroundColor:
            Colors.transparent, // Make the AppBar background transparent
        elevation: 0, // Remove shadow
        title: const Center(
          child: Text(
            "Detail",
            style: TextStyle(color: Colors.white),
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            // Handle back button press
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.bookmark,
              color: Colors.white,
            ),
            onPressed: () {
              // Handle bookmark button press
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: screenHeight - (screenHeight * initialSize),
            child: Image.asset('assets/images/image_6.png', fit: BoxFit.cover),
          ),
          Obx(() => Column(
                children: [
                  expand.value
                      ? Container(
                          height: kToolbarHeight,
                          color: Colors.white,
                          child: Row(
                            children: [
                              Container(width: 3),
                              IconButton(
                                icon: const Icon(Icons.expand_more,
                                    color: MyColors.grey_80),
                                onPressed: () {},
                              ),
                              Container(width: 5),
                              Text("Addis Ababa Tour",
                                  style: MyText.medium(context)
                                      .copyWith(color: MyColors.grey_80)),
                              const Spacer(),
                            ],
                          ))
                      : Container(),
                  const Divider(
                      color: MyColors.grey_10, thickness: 1, height: 0),
                  Expanded(
                      child:
                          NotificationListener<DraggableScrollableNotification>(
                    onNotification: (DraggableScrollableNotification n) {
                      expand.value = n.extent >= n.maxExtent - 0.04;
                      return true;
                    },
                    child: DraggableScrollableSheet(
                      maxChildSize: 1,
                      minChildSize:
                          0.2, // Set your desired minimum pinned height (30%)
                      initialChildSize:
                          0.2, // Set your desired initial height (20%)
                      builder: (BuildContext context, myScrollController) {
                        return SingleChildScrollView(
                          clipBehavior:
                              expand.value ? Clip.hardEdge : Clip.none,
                          controller: myScrollController,
                          child: Column(
                            children: [
                              Obx(
                                () => ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                  ),
                                  child: Container(
                                    height: expand.value ? 0 : 75,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          160, 228, 228, 228),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 30,
                                          spreadRadius: 0,
                                          offset: const Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        // Add a Divider with custom height and color
                                        Container(
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(30),
                                              topRight: Radius.circular(30),
                                            ),
                                          ),
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                                sigmaX: 5, sigmaY: 5),
                                            child: Container(
                                              color: const Color.fromARGB(
                                                      218, 255, 255, 255)
                                                  .withOpacity(0.9),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20),
                                              child: const Stack(
                                                children: [],
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Divider(
                                          height: 3,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          thickness: 4,
                                          indent: 120,
                                          endIndent: 120,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ))
                ],
              ))
        ],
      ),
    );
  }
}
