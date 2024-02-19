import 'package:flutter/material.dart';
import 'package:infocom/resources/constants/app_colors.dart';
import 'package:infocom/resources/constants/app_text.dart';
import 'package:infocom/resources/strings/welcome_string.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screensize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.textcolor,
        title: Text(
          WelcomeStrings.appname,
          style: Apptext.smallwhite,
        ),
      ),
      body: Center(
        child: OutlinedButton(
            style: ButtonStyle(
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(
                        width: 5, color: AppColors.bordercolor))),
                fixedSize: MaterialStatePropertyAll(
                    Size.fromWidth(screensize.width * 0.8))),
            onPressed: () {},
            child: Text(
              WelcomeStrings.play,
              style: Apptext.smallDark,
            )),
      ),
    );
  }
}
