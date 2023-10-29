import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    Key? key,
    required this.title,
    required this.image,
    required this.note,
  }) : super(key: key);

  final String title;
  final String image;
  final String note;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end, // Align content at the bottom
        children: [
          SizedBox(
            child: Center(
              child: Lottie.asset(image),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 20, bottom: 100),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Color(0xff222222),
                      fontFamily: 'MontserratBold',
                      fontSize: 19,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    note,
                    style: const TextStyle(
                      color: Color(0xff222222),
                      fontFamily: 'MontserratRegular',
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
