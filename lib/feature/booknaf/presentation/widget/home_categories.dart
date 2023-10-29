import 'package:booknaf_app/feature/booknaf/presentation/screen/search/search_screen.dart';
import 'package:flutter/material.dart';

import '../../data/model/book.dart';

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final List<BookModel> books;

  CategoryItem({required this.icon, required this.text, required this.books});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchResult(books: books),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xFFE5E5E5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              icon,
              color: Colors.black,
              size: 24,
            ),
            const SizedBox(width: 8),
            Text(
              text,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryItemModel {
  final IconData icon;
  final String text;

  CategoryItemModel({required this.icon, required this.text});
}
