import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

import 'package:skeletons/skeletons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../../core/locale/languages.dart';
import '../../../../../core/utils/circle_image.dart';
import '../../../../../core/utils/human_readable_time.dart';
import '../../../data/model/post.dart';
import 'post_detail_page.dart';

class PostWithImages extends StatefulWidget {
  final Post post;
  const PostWithImages({Key? key, required this.post}) : super(key: key);

  @override
  State<PostWithImages> createState() => _PostWithImagesState();
}

class _PostWithImagesState extends State<PostWithImages>
    with TickerProviderStateMixin {
  late AnimationController _favoriteController;
  @override
  void initState() {
    super.initState();
    _favoriteController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  @override
  void dispose() {
    _favoriteController.dispose();

    super.dispose();
  }

  String extractFileIdFromGoogleDriveLink(String googleDriveLink) {
    final RegExp regex = RegExp(
        r'^https:\/\/drive\.google\.com\/file\/d\/([a-zA-Z0-9_-]+)\/[view|edit]+.*$');
    final match = regex.firstMatch(googleDriveLink);

    if (match != null && match.groupCount >= 1) {
      final fileId = match.group(1);
      final newLink = 'https://drive.google.com/uc?export=view&id=$fileId';
      return newLink;
    }

    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(149, 157, 165, 0.089),
            blurRadius: 24,
            offset: Offset(0, -2), // Change the vertical offset to -2
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleImage(
                size: 40,
                imageProvider: AssetImage(
                    'assets/images/${widget.post.user!.profilePic!}'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.post.user!.fullName!,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    formatDateTimeDifference(
                        DateTime.parse(widget.post.createdAt!)),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 1,
            )
          ]),
          SizedBox(
            height: 220.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.post.images!
                  .length, // Replace with the number of saved movies
              itemBuilder: (BuildContext context, int index) {
                // Replace with movie data or information
                return PostCard(
                  title: "",
                  duration: "",
                  // Replace with image URL or AssetImage
                  image: widget.post.images![index].contains('drive.google.com')
                      ? extractFileIdFromGoogleDriveLink(
                          widget.post.images![index])
                      : widget.post.images![index],
                );
              },
            ),
          ),
          // post content text
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 8, top: 5),
            child: ExpandableText(
              widget.post.content!,
              animation: true,
              collapseOnTextTap: true,
              linkColor: const Color.fromARGB(218, 9, 44, 73),
              expandText: AppLocale.show_more.getString(context),
              collapseText: 'show less',
              maxLines: 2,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),

              // advanced
              // prefixText: '@gemechis',
              // onPrefixTap: () {
              //showProfile(username)
              // },
              // prefixStyle: const TextStyle(fontWeight: FontWeight.bold),
              onHashtagTap: (name) {
                // showHashtag(name)
              },
              hashtagStyle: const TextStyle(
                color: Color.fromARGB(238, 42, 96, 177),
              ),
              onMentionTap: (username) {
                //  showProfile(username)
              },
              mentionStyle: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
              onUrlTap: (url) {
                launch(url);
              },
              urlStyle: const TextStyle(
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          // post actions, love icon and like count, comment icon and comment count, bookmark icon and bookmark count
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 8, top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 40,
                      width: 40,
                      child: IconButton(
                        // tint color
                        color: Colors.black,
                        splashRadius: 10,
                        iconSize: 25,

                        icon: const Icon(
                          FluentIcons.heart_24_regular,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      widget.post.likes!.toString(),
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    const Icon(
                      FluentIcons.comment_20_regular,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      widget.post.comments!.length.toString(),
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    const Icon(
                      FluentIcons.bookmark_20_regular,
                      color: Colors.black,
                    ),
                  ],
                ),
                const Icon(
                  Icons.reply,
                  color: Colors.black,
                ),
              ],
            ),
          ),

          // const Divider(
          //   color: Color.fromARGB(28, 165, 165, 165),
          //   thickness: 1,
          //   indent: 0,
          //   endIndent: 0,
          // ),
        ],
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  final String title;
  final String duration;
  final String image;

  PostCard({
    required this.title,
    required this.duration,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => const PostDetailPage()),
        // );
      },
      child: Container(
        width: 230.0,
        margin: const EdgeInsets.symmetric(horizontal: 2.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
        ),
        // check if image is link and not null
        child: image != null && image.startsWith("https")
            ? CachedNetworkImage(
                key: Key(image),
                imageUrl: image,
                height: 140,
                width: 140,
                fit: BoxFit.cover,
                placeholder: (context, url) => SkeletonItem(
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF222222),
                          Color(0xFF242424),
                          Color(0xFF2B2B2B),
                          Color(0xFF242424),
                          Color(0xFF222222),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : Image.asset(
                "assets/images/no_image.jpg",
                height: 130,
                width: 130,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
