import 'package:booknaf_app/feature/booknaf/presentation/widget/home_categories.dart';
import 'package:booknaf_app/feature/booknaf/presentation/widget/recommandation_list.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import '../../data/model/book.dart';
import '../../data/model/post.dart';
import 'package:flutter/material.dart';
import '../../../../core/data/posts.dart';
import '../../../../core/data/my_colors.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'dart:async';
import 'package:share_plus/share_plus.dart';
import '../widget/new_books.dart';
import 'search/search_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  void onDrawerItemClicked(String name) {
    Navigator.pop(context);
  }

  List<BookModel> books = [
    BookModel(
      title: "The Alchemist",
      category: "Adventure",
      image:
          "https://m.media-amazon.com/images/I/51bVNTqHFlL._AC_UF1000,1000_QL80_.jpg",
      duration: "2h 30m",
      description:
          "An allegorical novel, The Alchemist follows a young Andalusian shepherd in his journey to the pyramids of Egypt, after having a recurring dream of finding ",
    ),
    BookModel(
        title: "Cosmos",
        category: "Book by Carl Sagan",
        image:
            "https://m.media-amazon.com/images/I/91Cnrbd3JwL._AC_UF1000,1000_QL80_.jpg",
        duration: "2h 30m",
        description:
            "Cosmos is one of the bestselling science books of all time. In clear-eyed prose, Sagan reveals a jewel-like blue world inhabited by a life form that is just ..."),
    BookModel(
        title: "Rich Dad Poor Dad",
        category: "Book by Robert Kiyosaki and Sharon Lechter",
        image:
            "https://m.media-amazon.com/images/I/81bsw6fnUiL._AC_UF1000,1000_QL80_.jpg",
        duration: "2h 30m",
        description:
            "Rich Dad Poor Dad is Robert's story of growing up with two dads — his real father and the father of his best friend, his rich dad — and the ways in which both ... "),
    BookModel(
        title: "The Alchemist",
        image:
            "https://m.media-amazon.com/images/I/51bVNTqHFlL._AC_UF1000,1000_QL80_.jpg",
        duration: "2h 30m",
        description:
            "An allegorical novel, The Alchemist follows a young Andalusian shepherd in his journey to the pyramids of Egypt, after having a recurring dream of finding a ... ")
  ];
  final List<CategoryItemModel> categories = [
    CategoryItemModel(icon: Icons.biotech, text: 'Health'),
    CategoryItemModel(icon: Icons.science, text: 'Science'),
    CategoryItemModel(icon: Icons.precision_manufacturing, text: 'Technology'),
    // Add more CategoryItemModels as needed
  ];
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
            SliverAppBar(
              // hide icon back
              automaticallyImplyLeading: false,
              backgroundColor: const Color(0xffF8FAFF),
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Color(0xffF8FAFF),
                statusBarIconBrightness: Brightness.dark,
              ),
              leading: IconButton(
                icon: const Icon(
                  Icons.sort,
                  color: Color.fromARGB(255, 41, 40, 40),
                  size: 40,
                ),
                onPressed: () {
                  // open or close drawer
                  scaffoldKey.currentState!.openDrawer();
                },
              ),
              title: const Padding(
                padding: EdgeInsets.only(left: 1.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "BOOKNAF",
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
              // actions: [
              //   Container(
              //     width: 42,
              //     margin: const EdgeInsets.only(
              //         left: 0, right: 20, top: 0, bottom: 0),
              //     child: GestureDetector(
              //       onTap: () {
              //         Navigator.pushNamed(context, '/profile');
              //       },
              //       child: Stack(
              //         children: [
              //           const Icon(
              //             Icons
              //                 .notifications, // Change this to the desired notification icon
              //             size: 27,
              //             color: Colors.black, // Change the color as needed
              //           ),
              //           Positioned(
              //             top: 4,
              //             right: 18,
              //             child: Container(
              //               width:
              //                   8, // Adjust the size of the red dot as needed
              //               height: 8,
              //               decoration: const BoxDecoration(
              //                 shape: BoxShape.circle,
              //                 color: Colors.red,
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ],
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
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    SearchResult(books: books),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                                top: 0, right: 20, left: 20, bottom: 0),
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: IgnorePointer(
                                    ignoring: true,
                                    child: TextField(
                                      controller: _searchController,
                                      onChanged: (value) {
                                        _searchStreamController.add(value);
                                      },
                                      decoration: InputDecoration(
                                        hintText: "Looking for ...",
                                        hintStyle: TextStyle(
                                          fontFamily: 'Poppins-ExtraLight',
                                          color: Colors.grey.shade400,
                                          fontSize: 15,
                                        ),
                                        contentPadding: const EdgeInsets.only(
                                            left: 10,
                                            top: 12,
                                            bottom: 12), // Add padding here
                                        border: InputBorder.none,
                                        suffixIcon: Container(
                                          width: 50,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            color: const Color(0xff376AED),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: IconButton(
                                            icon: const Icon(
                                              Icons.tune,
                                              size: 28,
                                            ),
                                            color: Colors.white,
                                            onPressed: () {
                                              // Navigator.push(
                                              //   context,
                                              //   MaterialPageRoute(
                                              //     builder: (context) => const SearchResult(
                                              //       keyword: '',
                                              //     ),
                                              //   ),
                                              // );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const Padding(
                                    padding: EdgeInsets.only(bottom: 7))
                              ],
                            ),
                          ),
                        ),

                        /// Qoute of the day
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: 170,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFF447EE3),
                                  Color(0xFF578EE9),
                                  Color(0xFF75A7FF)
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.bottomCenter,
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(149, 157, 165, 0.2),
                                  offset: Offset(0, 8),
                                  blurRadius: 24,
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    'Sep 20, 2021',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                ),
                                const Expanded(
                                  child: Center(
                                    child: Text(
                                      'Today a reader, \nTomorrow a leader',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    const Icon(
                                      Icons.bookmark,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    const SizedBox(width: 10),
                                    GestureDetector(
                                      onTap: () async {
                                        // share quote on social media
                                        await Share.share(
                                            'Today a reader, Tomorrow a leader',
                                            subject: 'Booknaf Daily Quote');
                                      },
                                      child: const Icon(
                                        Icons.share,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Catagories

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Categories',
                                style: TextStyle(
                                  fontSize: 25,
                                ),
                              ),
                            ),
                            Container(
                              height: 60,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: categories.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return CategoryItem(
                                    icon: categories[index].icon,
                                    text: categories[index].text,
                                    books: books,
                                  );
                                },
                              ),
                            ),
                          ],
                        )
                        // Categories List
                        ,
                        Recommandation(books: books),
                        NewBooks(books: books),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 190,
                child: Stack(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/banner_1.png",
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 40, horizontal: 14),
                      child: CircleAvatar(
                        radius: 36,
                        backgroundColor: Colors.grey[100],
                        child: const CircleAvatar(
                          radius: 33,
                          backgroundImage:
                              AssetImage("assets/images/no_profile.png"),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 18),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Hello",
                                style: TextStyle(
                                    color: Colors.grey[100],
                                    fontWeight: FontWeight.bold)),
                            Container(height: 5),
                            Text("", style: TextStyle(color: Colors.grey[100]))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: const Text("Blogs",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500)),
                leading:
                    const Icon(Icons.newspaper, size: 25.0, color: Colors.grey),
                onTap: () {},
              ),
              ListTile(
                title: const Text("Add Blog",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500)),
                leading: const Icon(Icons.edit, size: 25.0, color: Colors.grey),
                onTap: () {
                  Navigator.pushNamed(context, '/addBlog');
                },
              ),
              ListTile(
                title: const Text("Profile",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500)),
                leading:
                    const Icon(Icons.person, size: 25.0, color: Colors.grey),
                onTap: () {
                  Navigator.pushNamed(context, '/profile');
                },
              ),
              const Divider(),
              ListTile(
                title: const Text("Logout",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500)),
                leading:
                    const Icon(Icons.logout, size: 25.0, color: Colors.grey),
                onTap: () async {
                  // await clearAuthToken();

                  // ignore: use_build_context_synchronously
                  Navigator.pushReplacementNamed(context, '/login');
                },
              ),
            ],
          ),
        ),
      ),
    );
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
          label: "Share Thought",
          child: const Icon(Icons.create, color: MyColors.grey_80),
          backgroundColor: Colors.white,
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //       builder: (context) => const DialogAddPostRoute()),
            // );
          },
        ),
        SpeedDialChild(
          elevation: 2,
          label: "Share Images",
          child: const Icon(Icons.photo_camera, color: MyColors.grey_80),
          backgroundColor: Colors.white,
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const AddImagePost()),
            // );
          },
        ),
        SpeedDialChild(
          elevation: 2,
          label: "Panorama 3D",
          child:
              const Icon(Icons.panorama_photosphere, color: MyColors.grey_80),
          backgroundColor: Colors.white,
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const AddPanorama()),
            // );
          },
        ),
        SpeedDialChild(
          elevation: 2,
          label: " Share Place  ",
          child: const Icon(Icons.place, color: MyColors.grey_80),
          backgroundColor: Colors.white,
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //       builder: (context) => const DialogAddPostRoute()),
            // );
          },
        ),
      ],
    );
  }
}
