import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:bondly/widgets.dart';
import 'package:bondly/colors.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient
            (
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF7CB9FF), //Sky Blue
                Color(0xFFFFA5E1), //Light Pink
              ], 
            ), 
          ),

          child: Stack(
            children: [  
              // Main login content area                        
              contentBox(),

              // Back button
              SafeArea(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: CircularButton(
                    faIcon: FontAwesomeIcons.arrowLeft, 
                    bgColor: Colors.white, 
                    iconColor: defaultTextColor, 
                    onPressed: () {
                      context.go('/');
                    }
                  ),
                ),
              ),
              
            ],
          )

        )
      );
    }

  Align contentBox() {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text (
            "Nice to meet you!",
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              shadows: [defaultTextShadow],
            ),
          ),
      
          Container (
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            width: double.infinity,
            height: 600,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xFFFFFFFF), //white
                    Color(0xFFFEEFFF),
                ],                    
              ),            
            ),

            child: Column(
              children: [
                emailInputField(),

                SizedBox(height: 15,),

                usernameInputField(),

                SizedBox(height: 15,),

                passwordInputField(),

                SizedBox(height: 15,),

                confirmPasswordField(),

                const Spacer(),

                SignUpButton(),

                SizedBox(height: 10,),
                
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SocialsLogin(mainColor: defaultTextColor,)
                ),
              ]
            ),
          ),

        ],
      ),
    );
  }

  ColoredInputField usernameInputField() {
    return ColoredInputField(
                inputFontColor: defaultTextColor,
                inputbgColor: Color(0xFFEFE5FF),
                labelText: "Username:",
                labelFontColor: defaultTextColor,
                labelbgColor: Colors.transparent,
              );
  }

  ColoredInputField confirmPasswordField() {
    return ColoredInputField(
                inputFontColor: defaultTextColor,
                inputbgColor: Color(0xFFEFE5FF),
                labelText: "Confirm Password:",
                labelFontColor: defaultTextColor,
                labelbgColor: Colors.transparent,
              );
  }

  Column SignUpButton() {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Column(
      children: [
        CustomGradientButton(
          text: "Sign Up", 
          textColor: Colors.white, 
          gradient: themeProvider.currentGradientTheme,
          heightUser: 40,
          widthUser: double.infinity,
          onPressed: () { context.go('/createprofile'); }
        ),
        
        const SizedBox(height: 5,),
        
        RichText(
          text: TextSpan(
            text: "Already have an account? ",
            style: TextStyle(
              fontFamily: 'Poppins',
              color: defaultTextColor,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
              
            children: [
              TextSpan(
                text: "Log In",
                style: TextStyle(
                  color: themeProvider.currentThemeColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                recognizer: TapGestureRecognizer() 
                  ..onTap = () {
                  context.go('/login');
                }
              )
            ]
          )
        ),
      ],
    );
  }

  ColoredInputField emailInputField() {
    return ColoredInputField(
      inputFontColor: defaultTextColor,
      inputbgColor: Color(0xFFEFE5FF),
      labelText: "Email address:",
      labelFontColor: defaultTextColor,
      labelbgColor: Colors.transparent,
    );
  }

  ColoredInputField passwordInputField() {
    return ColoredInputField(
        inputFontColor: defaultTextColor,
        inputbgColor: Color(0xFFEFE5FF),
        labelText: "Password:",
        labelFontColor: defaultTextColor,
        labelbgColor: Colors.transparent,
    );
  }
}