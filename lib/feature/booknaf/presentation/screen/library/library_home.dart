import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import '../../../../../core/data/posts.dart';
import '../../../data/model/post.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
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
                      "My Library",
                      style: TextStyle(
                        fontFamily: 'MontserratBold',
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              toolbarHeight: 70,
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
                        // Row texts, Your Books, 21 items, Sort by
                        const Padding(
                          padding: EdgeInsets.only(left: 15, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Your Books",
                                style: TextStyle(
                                  fontFamily: 'MontserratBold',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "21 items",
                                style: TextStyle(
                                  fontFamily: 'MontserratBold',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Sort by",
                                    style: TextStyle(
                                      fontFamily: 'MontserratBold',
                                      fontSize: 14,
                                      color: Color.fromARGB(255, 48, 48, 48),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(
                          height: 15,
                        ),
                        Card(
                          color: Colors.white,
                          surfaceTintColor: Colors.white,
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 120,
                                height: 150,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                  ),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "https://m.media-amazon.com/images/I/91Cnrbd3JwL._AC_UF1000,1000_QL80_.jpg"), // Replace 'assets/book_cover.jpg' with your image path
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      const Text(
                                        'The Cosmose',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      const Text(
                                        'Carl Sagan',
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      Row(
                                        children: <Widget>[
                                          ElevatedButton(
                                            style: ButtonStyle(
                                              shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0),
                                                ),
                                              ),
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.transparent),
                                              // elevation: MaterialStateProperty.all(3),
                                              shadowColor:
                                                  MaterialStateProperty.all(
                                                      Colors.transparent),
                                            ),
                                            onPressed: () {},
                                            child: const Padding(
                                              padding: EdgeInsets.only(
                                                top: 0,
                                                bottom: 0,
                                              ),
                                              child: Text(
                                                "Open",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  // fontWeight: FontWeight.w700,
                                                  color: Color.fromARGB(
                                                      255, 46, 46, 46),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          ElevatedButton(
                                            onPressed: () {
                                              // Handle download button pressed
                                            },
                                            child: const Text(
                                              'Download',
                                              style: TextStyle(
                                                fontSize: 11,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
