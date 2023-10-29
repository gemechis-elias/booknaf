import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/data/img.dart';
import '../../../../../core/data/my_colors.dart';
import '../../../../../core/data/my_strings.dart';
import '../../../../../core/data/my_text.dart';
import '../../../data/model/book.dart';
import '../../widget/related_books.dart';
import '../reading/reading_screen.dart';
import '../reading/splite_pdf_view.dart';

class DetailPage extends StatefulWidget {
  final BookModel book;
  final List<BookModel> books;

  const DetailPage({super.key, required this.book, required this.books});

  @override
  DetailPageState createState() => DetailPageState();
}

class DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 300.0,
              floating: false,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: Stack(
                  children: <Widget>[
                    CachedNetworkImage(
                      imageUrl: widget.book.image!,
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: double.infinity,
                      alignment: Alignment.center,
                    ),
                    Container(
                        height: double.infinity,
                        width: double.infinity,
                        color: Colors.black.withOpacity(0.2)),
                  ],
                ),
              ),
              bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(200),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // centered image
                        Center(
                          child: Container(
                            height: 200,
                            width: 190,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 2)),
                            child: CachedNetworkImage(
                              imageUrl: widget.book.image!,
                              fit: BoxFit.cover,
                              height: double.infinity,
                              width: double.infinity,
                              alignment: Alignment.center,
                            ),
                          ),
                        ),
                        Container(height: 15),
                      ],
                    ),
                  )),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: <Widget>[
                // overflow menu
                PopupMenuButton<String>(
                  icon: const Icon(Icons.more_vert, color: Colors.white),
                  onSelected: (String value) {},
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: "Settings",
                      child: Text("Settings"),
                    ),
                  ],
                )
              ],
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  color: const Color(0xfff2f2f2),
                  height: 170,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.book.title!,
                        style: MyText.headline(context)?.copyWith(
                          color: const Color.fromARGB(255, 49, 49, 49),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // centered elements
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.book.category!,
                            style: MyText.body1(context)?.copyWith(
                              color: const Color.fromARGB(255, 49, 49, 49),
                            ),
                          ),
                          Text(
                            " | ",
                            style: MyText.body1(context)?.copyWith(
                              color: const Color.fromARGB(255, 49, 49, 49),
                            ),
                          ),
                          Text(
                            widget.book!.duration!,
                            style: MyText.body1(context)?.copyWith(
                              color: const Color.fromARGB(255, 49, 49, 49),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // insert rating here
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            color: Color(0xffff6b03),
                            size: 20,
                          ),
                          Icon(
                            Icons.star,
                            color: Color(0xffff6b03),
                            size: 20,
                          ),
                          Icon(
                            Icons.star,
                            color: Color(0xffff6b03),
                            size: 20,
                          ),
                          Icon(
                            Icons.star,
                            color: Color(0xffff6b03),
                            size: 20,
                          ),
                          Icon(
                            Icons.star_border_outlined,
                            color: Color(0xffff6b03),
                            size: 20,
                          ),
                        ],
                      ),

                      // round corner buttron tag and save to fav button in row
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              "Free",
                              style: MyText.body1(context)
                                  ?.copyWith(color: Colors.grey, fontSize: 18),
                            ),
                          ),
                          Container(width: 10),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: const Icon(
                              Icons.favorite_border_outlined,
                              color: Color.fromARGB(255, 124, 124, 124),
                              size: 24,
                            ),
                          ),
                          Container(width: 10),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: const Icon(
                              Icons.share,
                              color: Color.fromARGB(255, 124, 124, 124),
                              size: 24,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  )),

              // BOOK INFORMATION
              Column(
                children: [
                  // tick vert line and book information text in row
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        height: 20,
                        width: 4,
                        color: const Color(0xffff6b03),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Book Information",
                          style: MyText.headline(context)?.copyWith(
                              color: const Color.fromARGB(255, 61, 61, 61),
                              fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  // book description
                  Container(
                    margin: const EdgeInsets.only(left: 20, top: 15),
                    child: Text(
                      widget.book!.description!,
                      style:
                          MyText.body1(context)?.copyWith(color: Colors.grey),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 20,
              ),
              // AUTHOR INFO
              Column(
                children: [
                  // tick vert line and book information text in row
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        height: 20,
                        width: 4,
                        color: const Color(0xffff6b03),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Text(
                          "About Author",
                          style: MyText.headline(context)?.copyWith(
                              color: const Color.fromARGB(255, 61, 61, 61),
                              fontSize: 18),
                        ),
                      ),
                    ],
                  ),

                  // book description
                  Container(
                    margin: const EdgeInsets.only(left: 20, top: 15),
                    child: Text(
                      widget.book!.description!,
                      style:
                          MyText.body1(context)?.copyWith(color: Colors.grey),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              // USER Review
              // "user review" text and see all button in row,
              Container(
                margin: const EdgeInsets.only(left: 20, top: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "User review",
                          style: MyText.headline(context)?.copyWith(
                            fontSize: 18,
                            color: const Color.fromARGB(255, 61, 61, 61),
                          ),
                        ),
                        // right arrow icon
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Color.fromARGB(255, 61, 61, 61),
                          size: 20,
                        ),
                      ],
                    ),

                    // User profile, comment, and date
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              image: DecorationImage(
                                image: AssetImage(Img.get("no_profile.png")),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Gemechis",
                                  style: MyText.body1(context)
                                      ?.copyWith(color: Colors.grey),
                                ),
                                Text(
                                  "This is Amazing Book",
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: MyText.body1(context)?.copyWith(
                                      color: const Color.fromARGB(
                                          255, 75, 75, 75)),
                                ),
                                Text(
                                  "Oct 2023",
                                  style: MyText.body1(context)
                                      ?.copyWith(color: Colors.grey),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),

                    RelatedBooks(
                      books: widget.books,
                      book: widget.book,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 40.0, right: 50),
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            barrierDismissible:
                                false, // Prevent user from dismissing the dialog
                            builder: (BuildContext context) {
                              return const AlertDialog(
                                content: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CircularProgressIndicator(
                                      strokeWidth:
                                          2, // Adjust the stroke width as needed
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.blue), // Customize color
                                    ),
                                    SizedBox(
                                        width:
                                            16), // Add some space between CircularProgressIndicator and Text
                                    Text('Downloading...'),
                                  ],
                                ),
                              );
                            },
                          );

                          Future.delayed(const Duration(seconds: 5), () {
                            // Close the Downloading Dialog
                            Navigator.pop(context);

                            // Navigate to the next screen (SplitScreen in this case)
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SplitScreen(
                                  book: widget.book,
                                ),
                              ),
                            );
                          });
                        },
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(10),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                              ),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                            return const Color(0xFF4982E6); // #4982E6
                          }),
                          shadowColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            return const Color(
                                0xFF6095F3); // Shadow color #6095F3
                          }),
                          overlayColor: MaterialStateProperty.all(
                              const Color(0xFF6095F3)),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          child: const Center(
                            child: Text(
                              'Start Reading',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
