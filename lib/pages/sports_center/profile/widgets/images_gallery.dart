import 'package:flutter/material.dart';
import 'package:football_next_gen/pages/sports_center/profile/widgets/single_image.dart';
import '../../../../models/image_entity.dart';

class ImagesGallery extends StatelessWidget{

  final List<ImageEntity> images;
  final Function() onTap;

  const ImagesGallery({super.key, required this.images, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ...images.map((e) => SingleImage(image: e,onTap: onTap,)),
      ],
    );
  }

}