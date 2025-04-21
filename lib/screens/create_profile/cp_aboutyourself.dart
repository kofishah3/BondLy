import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:bondly/widgets/input_fields.dart';
import 'package:bondly/providers/theme_provider.dart';

class CpAboutyourself extends StatefulWidget{
  const CpAboutyourself({super.key});

  @override
  State<CpAboutyourself> createState() => _CpAboutyourselfState();
}

class _CpAboutyourselfState extends State<CpAboutyourself> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: themeProvider.currentGradientBg
        ),

        child: Stack(
          children: [
            Column(
              children: [
                pageTopPortion(),
                
                SizedBox(height: 50,),

                ColoredInputField(
                  inputFontColor: defaultTextColor,
                  inputbgColor: Color(0xFFEFE5FF),
                  labelText: " Interests and Hobbies:",
                  labelFontColor: themeProvider.currentTextColor,
                  labelbgColor: Colors.transparent,
                ),

                SizedBox(height: 20,),

                ColoredInputField(
                  inputFontColor: defaultTextColor,
                  inputbgColor: Color(0xFFEFE5FF),
                  labelText: " Bio:",
                  labelFontColor: themeProvider.currentTextColor,
                  labelbgColor: Colors.transparent,
                ),
              ],
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: CustomGradientButton(
                text: 'Next', 
                textColor: Colors.white, 
                gradient: themeProvider.currentGradientTheme,
                heightUser: 40,
                widthUser: double.infinity,
                onPressed: () {
                  context.push('/cp_preferences');
                }
              ),
            ),
          ],
        ),
      ),
    );
  }

  SafeArea pageTopPortion() {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Text(
              "About Yourself",
              style: TextStyle(
                color: themeProvider.currentTextColor,
                shadows: [defaultTextShadow],
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),

            //navigator identifier
            Row(    
              mainAxisSize: MainAxisSize.min,                                 
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,       
              children: [
                Container(
                  height: 7,
                  width: 50,
                  decoration: BoxDecoration(
                    color: defaultGrey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                SizedBox(width: 5),

                Container(
                  height: 7,
                  width: 50,
                  decoration: BoxDecoration(
                    gradient: themeProvider.currentGradientTheme,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                SizedBox(width: 5),

                Container(
                  height: 7,
                  width: 50,
                  decoration: BoxDecoration(
                    color: defaultGrey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  } 
}