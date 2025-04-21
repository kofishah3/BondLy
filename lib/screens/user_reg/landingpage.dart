import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:bondly/widgets/input_fields.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
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

        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "Logo Here WIP!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),


            Column(
              children: [
                Align(alignment: Alignment.centerLeft, child: WelcomeText()),

                SizedBox(height: 20,),

                LoginSignUpButtons(),

                SizedBox(height: 15,),

                SocialsLogin(mainColor: Colors.white),
              ],
            )
          ],
        ),
      )
    );
  }
  
}

// WIDGETS ---------------------------------------------------------------

class LoginSignUpButtons extends StatelessWidget {
  const LoginSignUpButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column (
      children: [

        CustomBorderlessButton (
          text: 'Log In',
          textColor: Color(0xFFDC5DB2), 
          bgColor: Colors.white,
          onPressed: () {
            context.go('/login'); //navigate to login page
          },
        ), 

        const SizedBox(height: 10,),

        CustomOutlinedButton (
          text: 'Sign Up',
          borderColor: Colors.white,
          textColor: Colors.white, 
          bgColor: Colors.transparent,
          onPressed: () {
            context.go('/signup'); //navigate to login page
          },
        ), 

      ],
    );
  }
}

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column (
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome to",
            style: TextStyle (
              fontSize: 35,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              height: 0.01,
              shadows: [
                  Shadow(
                    color: Colors.black12,
                    offset: Offset(1, 2),
                    blurRadius: 10,
                  )
              ] 
            ),
            textAlign: TextAlign.left,
          ),
    
          Text(
            "BondLy!",
            style: TextStyle (
                fontSize: 70,
                fontWeight: FontWeight.w700,
                color: Colors.white,   
                shadows: [
                  Shadow(
                    color: Colors.black12,
                    offset: Offset(1, 2),
                    blurRadius: 10,
                  )
                ]             
            ),
            textAlign: TextAlign.left,
          ),
    
          Text.rich ( //so that the word BOND can be bold by itself
            TextSpan (
              text: "Never miss out with the people you love!\nPlan, Share, and ",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                height: 1.1,
                shadows: [
                  Shadow(
                    color: Colors.black12,
                    offset: Offset(1, 2),
                    blurRadius: 10,
                  )
                ]  
              ),
              children: [
                TextSpan (
                  text: "Bond",
                  style: TextStyle (
                    fontSize: 16,
                    fontWeight: FontWeight.w700, // "Bond" is bold
                    color: Colors.white, 
                    shadows: [
                      Shadow(
                        color: Colors.black12,
                        offset: Offset(1, 2),
                        blurRadius: 10,
                      )
                    ]  
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.left,
          ),
        ],
      );
  }
}