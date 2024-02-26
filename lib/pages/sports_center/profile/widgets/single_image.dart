import 'package:flutter/material.dart';
import 'package:football_next_gen/models/post_entity.dart';
import '../../../../models/image_entity.dart';

class SingleImage extends StatelessWidget{

  final PostEntityDtoForList image;
  final Function(String) onTap;

  const SingleImage({super.key, required this.image, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){onTap(image.id);},
      child: Container(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width / 133),
        width: MediaQuery.of(context).size.width / 3,
        child:Image.asset(image.url),
      ),
    );
  }

}