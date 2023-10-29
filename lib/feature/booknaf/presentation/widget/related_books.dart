import 'package:booknaf_app/feature/booknaf/data/model/book.dart';
import 'package:flutter/material.dart';

import '../screen/detail/detail.dart';

class RelatedBooks extends StatelessWidget {
  final List<BookModel> books;
  final BookModel book;

  const RelatedBooks({Key? key, required this.books, required this.book})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5, bottom: 20),
      // color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text(
                  'Related Books',
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20.0,
                )
              ],
            ),
          ),
          SizedBox(
            height: 250.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: books.length, // Replace with the number of saved books
              itemBuilder: (BuildContext context, int index) {
                // Replace with movie data or information
                return InkWell(
                  onTap: () {
                    // navigate without name
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailPage(book: books[index], books: books),
                      ),
                    );
                  },
                  child: MovieCard(
                    title: books[index].title!,
                    duration: books[index].duration!,
                    // Replace with image URL or AssetImage
                    image: NetworkImage(books[index].image!),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  final String title;
  final String duration;
  final ImageProvider<Object> image;

  MovieCard({
    required this.title,
    required this.duration,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 200.0,
            width: 150.0,
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: image,
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: Alignment.topRight, // Align to the top right corner
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 30,
                  height: 40,
                  padding: const EdgeInsets.all(5.0),
                  decoration: const BoxDecoration(
                    color: Color(0xffFF6B03),
                    borderRadius: BorderRadius.all(
                      Radius.circular(7.0),
                    ),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 15,
                          ),
                          Text(' 4.5',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 10.0)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          //
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              maxLines: 1, // Set the maximum number of lines for the title text
              overflow: TextOverflow
                  .ellipsis, // Handle overflow with ellipsis (...) if the text is too long
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
