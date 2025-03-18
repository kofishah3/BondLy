import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import 'package:bondly/widgets.dart';

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
            height: 650,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                emailInputField(),

                ColoredInputField(
                  inputFontColor: defaultTextColor,
                  inputbgColor: Color(0xFFEFE5FF),
                  labelText: "Username:",
                  labelFontColor: defaultTextColor,
                  labelbgColor: Colors.transparent,
                ),

                passwordInputField(),

                ColoredInputField(
                  inputFontColor: defaultTextColor,
                  inputbgColor: Color(0xFFEFE5FF),
                  labelText: "Confirm Password:",
                  labelFontColor: defaultTextColor,
                  labelbgColor: Colors.transparent,
                ),

                logInButton(),

                SocialsLogin(mainColor: defaultTextColor,),
              ]
            ),
          ),

        ],
      ),
    );
  }

  Column logInButton() {
    return Column(
                children: [
                  CustomGradientButton(
                    text: "Sign Up", 
                    textColor: Colors.white, 
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFFF04CBA),
                        Color(0xFFF382CE)
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ), 
                    onPressed: () {}
                  ),
                  
                  const SizedBox(height: 10,),
                  
                  RichText(
                    text: TextSpan(
                      text: "Already have an account? ",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: defaultTextColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                       
                      children: [
                        TextSpan(
                          text: "Log In",
                          style: TextStyle(
                            color: Color(0xFFF04CBA),
                            fontSize: 13,
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