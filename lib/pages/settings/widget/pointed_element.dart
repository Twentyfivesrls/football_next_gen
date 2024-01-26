import 'package:flutter/material.dart';
import 'package:football_next_gen/constants/colors.dart';
import 'package:football_next_gen/widgets/texts.dart';

class PointedElement extends StatelessWidget{

  final String text;

  const PointedElement({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
   return Row(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: [
       const Text(
         '\u2022',
         style: TextStyle(
           fontSize: 14,
         ),
       ),
       Expanded(
         child: Container(
           padding: const EdgeInsets.only(left: 5),
           child: Text(
             text,
             textAlign: TextAlign.left,
             softWrap: true,
             style: const TextStyle(
               fontSize: 14,
               color: black25,
             ),
           ),
         ),
       ),
     ],
   );
  }

}