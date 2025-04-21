import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:bondly/widgets/input_fields.dart';
import 'package:bondly/providers/theme_provider.dart';

class CreateProfilePage extends StatefulWidget {
  const CreateProfilePage({super.key});

  @override
  State<CreateProfilePage> createState() => _CreateProfileState();
}
class _CreateProfileState extends State<CreateProfilePage> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: themeProvider.currentGradientBg,
        ),

        child: Stack(
          children: [
            Column(
              children: [
                pageTopPortion(),
            
                SizedBox(height: 25,),
            
                editProfilePicture(),
            
                SizedBox(height: 25,),

                userInputFields(),
              ],
            ),

            //separate the next button so it stays down always
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomGradientButton(
                text: 'Next', 
                textColor: Colors.white, 
                gradient: themeProvider.currentGradientTheme,
                heightUser: 40,
                widthUser: double.infinity,
                onPressed: () {
                  context.push('/cp_aboutyourself');
                }
              ),
            ),
          ]
        )
      )
    );
  }

  Column userInputFields() {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ColoredInputField(
          inputFontColor: defaultTextColor,
          inputbgColor: Color(0xFFEFE5FF),
          labelText: " First Name:",
          labelFontColor: themeProvider.currentTextColor,
          labelbgColor: Colors.transparent,
        ),

        SizedBox(height: 20,),

        ColoredInputField(
          inputFontColor: defaultTextColor,
          inputbgColor: Color(0xFFEFE5FF),
          labelText: " Last Name:",
          labelFontColor: themeProvider.currentTextColor,
          labelbgColor: Colors.transparent,
        ),

        SizedBox(height: 20,),

        ColoredInputField(
          inputFontColor: defaultTextColor,
          inputbgColor: Color(0xFFEFE5FF),
          labelText: " Birth Date:",
          labelFontColor: themeProvider.currentTextColor,
          labelbgColor: Colors.transparent,
        ),

        SizedBox(height: 20,),

        ColoredInputField(
          inputFontColor: defaultTextColor,
          inputbgColor: Color(0xFFEFE5FF),
          labelText: " Preferred Pronouns:",
          labelFontColor: themeProvider.currentTextColor,
          labelbgColor: Colors.transparent,
        )
      ],
    );
  }

  Container editProfilePicture() {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Container(
      alignment: Alignment.center,
      child: Column(                
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: defaultGrey,
            radius: 55,
          ),

          SizedBox(height: 3,),

          Opacity(
            opacity: 0.5,
            child: RichText(                                  
              text: TextSpan(                
                children: [
                  WidgetSpan(child: Icon(Icons.edit_square, color: themeProvider.currentTextColor, size: 20,)),
                  TextSpan(
                    text: "Edit Photo", 
                    style: TextStyle(
                      color: themeProvider.currentTextColor, 
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      shadows: [defaultTextShadow],
                    )
                  )
                ]
              ),
            ),
          )
          
        ],
      ),
    );
  }

  //contains the page title text and the page identifier
  SafeArea pageTopPortion() {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Text(
              "Create Profile",
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