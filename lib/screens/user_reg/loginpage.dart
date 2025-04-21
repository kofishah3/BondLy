import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:bondly/widgets/input_fields.dart';
import 'package:bondly/providers/theme_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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

              // Main login content area                        
              contentBox(),
              
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
            "Welcome Back!",
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
            height: 460,
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

                passwordInputField(),
              
                const Spacer(),

                logInButton(),

                SizedBox(height: 10,),

                SocialsLogin(mainColor: defaultTextColor,),
              ]
            ),
          ),

        ],
      ),
    );
  }

  Column logInButton() {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Column(
      children: [
        CustomGradientButton(
          text: "Log In", 
          textColor: Colors.white, 
          gradient: themeProvider.currentGradientTheme,
          heightUser: 40,
          widthUser: double.infinity,
          onPressed: () {
            context.go('/homepage');
          }
        ),
        
        const SizedBox(height: 5,),
        
        RichText(
          text: TextSpan(
            text: "Don't have an account? ",
            style: TextStyle(
              fontFamily: 'Poppins',
              color: defaultTextColor,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
              
            children: [
              TextSpan(
                text: "Sign Up",
                style: TextStyle(
                  color: themeProvider.currentThemeColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                recognizer: TapGestureRecognizer() 
                  ..onTap = () {
                  context.go('/signup');
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

  Column passwordInputField() {
    return Column(
      children: [
        ColoredInputField(
          inputFontColor: defaultTextColor,
          inputbgColor: Color(0xFFEFE5FF),
          labelText: "Password:",
          labelFontColor: defaultTextColor,
          labelbgColor: Colors.transparent,
        ),

        const SizedBox(height: 7),

        //forgot password button
        Align(        
          alignment: Alignment.centerRight,
          child: RichText(
            text: TextSpan(
              text: 'Forgot Password?',
              style: TextStyle(
                color: defaultTextColor,
                fontFamily: 'Poppins',
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              recognizer: TapGestureRecognizer() 
                ..onTap = () {}
            )
          )
        )
      ],
    );
  }
}