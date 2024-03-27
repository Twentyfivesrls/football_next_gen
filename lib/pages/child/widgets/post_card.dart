import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football_next_gen/constants/colors.dart';
import 'package:football_next_gen/constants/images_constants.dart';
import 'package:football_next_gen/models/post_entity.dart';
import 'package:football_next_gen/widgets/texts.dart';
import 'package:intl/intl.dart';

class PostCard extends StatelessWidget{

  final PostEntity post;
  final Function() favoriteOnTap;
  final Function() shareOnTap;
  final IconData favoriteIcon;
  final Color favoriteIconColor;
  String firstHalf = "";
  String secondHalf = "";
  bool flag = true;

  PostCard({
    super.key,
    required this.post,
    required this.favoriteOnTap,
    required this.shareOnTap,
    required this.favoriteIcon,
    required this.favoriteIconColor
  });

  @override
  Widget build(BuildContext context) {
    if (post.description.length > 120) {
      firstHalf = post.description.substring(0, 120);
      secondHalf = post.description.substring(120, post.description.length);
    } else {
      firstHalf = post.description;
      secondHalf = "";
    }
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0)
      ),
      child: Column(
          children: [
            headerSection(),
            imageSection(context),
            buttonsSection()
          ],

      ),
    );
  }
  Widget headerSection() {
    return Padding(
      padding: const EdgeInsets.only(left: 15,right: 15,top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: SvgPicture.asset(ImagesConstants.childImg,
                    height: 30, width: 30),
              ),
              Text14(
                text: "Giovanni Bianchi",
                fontWeight: FontWeight.w600,
              ),
            ],

          ),
          
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text10(text:DateFormat('yyyy-MM-dd').format(post.date)),
          ),

          ExpandableText(
            post.description,
            expandText: 'Altro',
            maxLines: 2,
            linkColor: lightBlue,
          ),

        ],
      ),
    );
  }

  Widget imageSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Image.asset(ImagesConstants.postImg,
      ),
    );
  }

  Widget buttonsSection() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20,left: 15,right: 15,top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: favoriteOnTap,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    favoriteIcon,
                    color: favoriteIconColor,
                    size: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text14(text: post.likes.toString(), fontWeight: FontWeight.bold,),
                  )
                ],
              )
          ),
          GestureDetector(
              onTap: shareOnTap,
              child: const Icon(
                Icons.share_outlined,
                color: black25,
                size: 25,

              )
          ),
        ],
      ),
    );
  }




}