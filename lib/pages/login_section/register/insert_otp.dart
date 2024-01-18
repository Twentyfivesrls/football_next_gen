import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:football_next_gen/constants/colors.dart';
import 'package:football_next_gen/widgets/buttons.dart';
import 'package:football_next_gen/widgets/scaffold.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/app_pages.dart';
import '../../../constants/language.dart';
import '../../../widgets/texts.dart';

class InsertOtp extends StatefulWidget{
  const InsertOtp({super.key});
  @override
  State<StatefulWidget> createState() => InsertOtpState();

}


class InsertOtpState extends State<InsertOtp>{
  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: titleSection(),
            ),

            Expanded(
              flex: 1,
              child: subtitleSection(),
            ),

            Expanded(
              flex: 1,
              child: otpSection(),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 60,top: 30),
              child: buttonSection(),
            ),


            Expanded(
              flex: 3,
              child: otpRequestSection(),
            ),
          ],
        )
    );
  }


  Widget titleSection() {
    return TextH1(
      text: getCurrentLanguageValue(INSERT_OTP) ?? "",
      textAlign: TextAlign.center,
    );
  }


  Widget subtitleSection(){
    return Text16(
      text: getCurrentLanguageValue(INSERT_OTP_SUBTITLE) ?? "",
      fontWeight: FontWeight.w600,
      textAlign: TextAlign.center,
    );
  }

  Widget otpSection(){
    return OtpTextField(
        numberOfFields: 6,
        filled: true,
        margin: const EdgeInsets.only(right: 0),
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        fieldWidth: 45,
        fillColor: secondary,
        borderColor: secondary,
        borderWidth: 1,
        focusedBorderColor: primary,
        showFieldAsBox: true,
        onCodeChanged: (String value) {
          //Handle each value
        },
        handleControllers: (controllers) {
          //get all textFields controller, if needed
          //controls = controllers;
        },
        onSubmit: (String verificationCode) {
    //set clear text to clear text from all fields
    });
  }

  Widget buttonSection(){
    return ActionButton(
        onPressed: (){
          GoRouter.of(context).go(AppPage.otpVerified.path);
        },
        text: getCurrentLanguageValue(VERIFY) ?? "",
    );
  }

  Widget otpRequestSection(){
    return Column(
      children: [
        Text16(
            text: getCurrentLanguageValue(SMS_NOT_RECEIVED) ?? "",
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: NavigationText(
              text: getCurrentLanguageValue(NEW_OTP_REQUEST) ?? "",
              onTap: () {},
          ),
        ),
      ],
    );
  }
}