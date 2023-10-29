import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../../../../core/data/my_colors.dart';
import '../../../../../core/data/my_strings.dart';

import '../../../../../core/data/my_text.dart';
import '../../../data/model/book.dart';

class ReadingPage extends StatefulWidget {
  final BookModel book;

  ReadingPage({Key? key, required this.book}) : super(key: key);

  @override
  ReadingPageState createState() => ReadingPageState();
}

class ReadingPageState extends State<ReadingPage> {
  bool _isWidgetVisible = true;

  @override
  Widget build(BuildContext context) {
    const duration = Duration(milliseconds: 300);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.book.title!),
        leading: IconButton(
          icon: const Icon(
            Icons.sort,
            color: Color.fromARGB(255, 41, 40, 40),
            size: 40,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.translate),
            onPressed: () {
              // Handle language selection
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Handle search action
            },
          ),
        ],
      ),
      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          final ScrollDirection direction = notification.direction;
          setState(() {
            if (direction == ScrollDirection.reverse) {
              _isWidgetVisible = false;
            } else if (direction == ScrollDirection.forward) {
              _isWidgetVisible = true;
            }
          });
          return true;
        },
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context, builder: (_) => GdprBasicDialog());
                  },
                  child: const Text(
                    MyStrings.very_long_lorem_ipsum +
                        MyStrings.very_long_lorem_ipsum2,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: AnimatedSlide(
        duration: duration,
        offset: _isWidgetVisible ? Offset.zero : const Offset(0, 2),
        child: AnimatedOpacity(
          duration: duration,
          opacity: _isWidgetVisible ? 1 : 0,
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black
                      .withOpacity(0.5), // Adjust the opacity as needed
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon:
                                const Icon(Icons.settings, color: Colors.white),
                            onPressed: () {
                              // Handle collection seating action
                            },
                          ),
                        ],
                      ),
                      IconButton(
                        icon: const Icon(Icons.bookmark, color: Colors.white),
                        onPressed: () {
                          // Handle note action
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.assignment, color: Colors.white),
                        onPressed: () {
                          // Handle test action
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.nightlight_round,
                            color: Colors.white),
                        onPressed: () {
                          // Handle night mode action
                        },
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class GdprBasicDialog extends StatefulWidget {
  GdprBasicDialog({Key? key}) : super(key: key);

  @override
  GdprBasicDialogState createState() => GdprBasicDialogState();
}

class GdprBasicDialogState extends State<GdprBasicDialog> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 500, // Set your desired height here
        child: Container(
          margin: const EdgeInsets.all(15),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            color: Colors.white,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // ... Rest of your code remains unchanged
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Translation",
                                style: MyText.title(context)!.copyWith(
                                    color: const Color(0xFF4982E6),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "serif")),
                            Container(height: 2),
                            Text("Booknaf",
                                style: MyText.caption(context)!.copyWith(
                                    color: const Color(0xFF4982E6),
                                    fontFamily: "serif")),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add, color: MyColors.grey_60),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                ),
                const Divider(height: 0, thickness: 0.5),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        // grey background title text "English"
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                          decoration: BoxDecoration(
                            color: MyColors.grey_20,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text("English",
                              style: MyText.body1(context)!.copyWith(
                                  color: MyColors.grey_60,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "serif")),
                        ),
                        Text(MyStrings.medium_lorem_ipsum,
                            textAlign: TextAlign.justify,
                            style: MyText.body1(context)!.copyWith(
                                color: MyColors.grey_80, fontFamily: "serif")),

                        SizedBox(height: 5),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                          decoration: BoxDecoration(
                            color: MyColors.grey_20,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text("Amharic",
                              style: MyText.body1(context)!.copyWith(
                                  color: MyColors.grey_60,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "serif")),
                        ),
                        Text(
                            "የእኛ ተልእኮ የቡና የትውልድ ቦታን ውርስ በማክበር እና የቡና አድናቂዎችን ህይወት በዓለም አቀፍ ደረጃ በማበልጸግ ልዩ የኢትዮጵያ ልዩ ቡና የመጨረሻ ጠራጊ መሆን ነው። በቡና የመፍላትና የመፍላት ጥበብ ጠንቅቀን በመምራት ከጉጂ ሀይላንድ የሚገኘውን ምርጥ ባቄላ በጥንቃቄ በማውጣት የኢትዮጵያን የቡና ቅርስ እውነተኛ ይዘት የሚያሳዩ ልዩ ጣዕምና መዓዛዎችን ለማሳየት ቆርጠን ተነስተናል። ",
                            textAlign: TextAlign.justify,
                            style: MyText.body1(context)!.copyWith(
                                color: MyColors.grey_80, fontFamily: "serif")),
                      ],
                    ),
                  ),
                ),
                const Divider(height: 0, thickness: 0.5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.transparent),
                      child: Text("Close",
                          style: TextStyle(color: Colors.teal[500])),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
