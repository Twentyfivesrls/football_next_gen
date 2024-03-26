import 'package:flutter/material.dart';
import 'package:football_next_gen/constants/colors.dart';
import 'package:football_next_gen/widgets/texts.dart';

class SingleSelection extends StatelessWidget {
  final String labelText;
  final Function() remove;
  final String name;

  const SingleSelection({super.key, required this.labelText, required this.name, required this.remove});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text14(
              text: labelText,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
            decoration: BoxDecoration(
                color: greyBox,
                border: Border.all(color: opaqueBlack25),
                borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text14(text: name),
                GestureDetector(
                    onTap: remove,
                    child: const Icon(Icons.cancel,color: red)

                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
