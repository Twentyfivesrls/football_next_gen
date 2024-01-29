import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football_next_gen/constants/colors.dart';
import 'package:football_next_gen/constants/images_constants.dart';
import 'package:football_next_gen/widgets/texts.dart';
import 'package:go_router/go_router.dart';
import 'buttons.dart';

class DialogWidget extends StatelessWidget {
  final String title;
  final String message;
  final String confirmText;
  final String cancelText;
  final Function() onConfirm;

  const DialogWidget({super.key, required this.title, required this.message, required this.confirmText, required this.cancelText, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: const EdgeInsets.all(20),
      contentPadding: const EdgeInsets.only(top: 20,left: 20,right: 20),
      titlePadding: EdgeInsets.zero,
      title: Container(
        padding: const EdgeInsets.all(10), decoration: const BoxDecoration(color: primary),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text14(text: title, textColor: white,),
              GestureDetector(
                onTap: (){
                  context.pop();
                },
                  child: const Icon(Icons.close,color: white,)
              )
            ],
          )
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(ImagesConstants.exclamationCircle),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text14(text: message, textAlign: TextAlign.center),
          ),
        ],
      ),
      actions: <Widget>[
        buttonsSection(context)
      ]
    );
  }

  Widget buttonsSection(BuildContext context){
    return Column(
      children: [
        ActionButton(
          onPressed: onConfirm,
          text: confirmText,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ActionButton(
            onPressed: (){
              context.pop();
            },
            text: cancelText,
            backgroundColor: cancelGrey,
            borderColor: cancelGrey,
          ),
        ),
      ],
    );
  }
}
