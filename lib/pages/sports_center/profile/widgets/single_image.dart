import 'package:flutter/material.dart';
import '../../../../models/image_entity.dart';

class SingleImage extends StatelessWidget{

  final ImageEntity image;
  final Function() onTap;

  const SingleImage({super.key, required this.image, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width / 133),
        width: MediaQuery.of(context).size.width / 3,
        child:Image.asset(image.imageUrl),
      ),
    );
  }

}