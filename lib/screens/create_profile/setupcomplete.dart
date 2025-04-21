import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:bondly/widgets/input_fields.dart';
import 'package:bondly/providers/theme_provider.dart';

class SetUpComplete extends StatefulWidget {
  const SetUpComplete({super.key});

  @override
  State<SetUpComplete> createState() => _SetUpCompleteState();
}

class _SetUpCompleteState extends State<SetUpComplete> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(gradient: whiteGradientBg),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                "You're all set!",
                style: TextStyle(
                  color: defaultTextColor,
                  shadows: [defaultTextShadow],
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: CustomGradientButton(
                  text: 'Done!',
                  textColor: Colors.white,
                  gradient: themeProvider.currentGradientTheme,
                  heightUser: 40,
                  widthUser: double.infinity,
                  onPressed: () {
                    context.push('/homepage');
                  }
                ),
            ),
          ],
        ),
      ),
    );
  }
}