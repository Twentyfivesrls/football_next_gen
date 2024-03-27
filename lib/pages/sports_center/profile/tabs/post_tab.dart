import 'package:flutter/material.dart';
import 'package:football_next_gen/models/post_entity.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/images_constants.dart';
import '../../../../constants/language.dart';
import '../../../../models/image_entity.dart';
import '../../../../widgets/buttons.dart';
import '../../../../widgets/texts.dart';
import '../widgets/images_gallery.dart';

class PostTab extends StatelessWidget{

  final List<PostEntity> images;
  final Function() addPost;
  final Function(String) goToDetail;

  const PostTab({super.key, required this.images, required this.addPost, required this.goToDetail});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 30,horizontal: 20),
            child: ActionButton(
              onPressed: addPost,
              text: getCurrentLanguageValue(ADD_POST) ?? "",
              showPrefixIcon: true,
              svgPrefixIcon: ImagesConstants.addCircleWhiteImg,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text18(
              text: getCurrentLanguageValue(PHOTO_AND_VIDEO) ?? "",
              textColor: primary,
            ),
          ),

          Padding(
              padding: const EdgeInsets.only(top: 20),
              child: images.isNotEmpty ? ImagesGallery(
                  images: images,
                  onTap: (tapped) {goToDetail(tapped);}
              ) : const Center(
                child: Text14(
                  text: "Nessun post aggiunto!",
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                ),
              )
          )
        ],
      ),
    );
  }
}