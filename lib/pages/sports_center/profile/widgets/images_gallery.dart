import 'package:flutter/material.dart';
import 'package:football_next_gen/models/post_entity.dart';
import 'package:football_next_gen/pages/sports_center/profile/widgets/single_image.dart';
import '../../../../models/image_entity.dart';

class ImagesGallery extends StatelessWidget{

  final List<PostEntityDtoForList> images;
  final Function(String) onTap;

  const ImagesGallery({super.key, required this.images, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ...images.map((e) => SingleImage(
          image: e,
          onTap: (String tapped){onTap(tapped);},
        )
        ),
      ],
    );
  }

}