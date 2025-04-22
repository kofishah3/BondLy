import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import 'package:bondly/providers/theme_provider.dart';
import 'package:bondly/widgets/homeplans_card.dart';
import 'package:flutter/rendering.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
    required this.themeProvider,
  });

  final ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,        
      children: [
        Column(         
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 100,),

            Container(
              alignment: Alignment.center,
              child: welcomeGreeting(),
            ),      
    
            SizedBox(height: 50,),
    
            upcomingPlans(),
    
            SizedBox(height: 40,),
    
            //Recent Activity Placeholder
            recentActivity(),
    
          ],
        ),
      ]
    );
  }

  Column recentActivity() {
    return Column(
      children: [
        // Recent activity title text
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Recent Activity",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 20,
              color: themeProvider.currentTextColor,
              fontWeight: FontWeight.w600,
              shadows: [defaultTextShadow],      
            ),
          ),
        ), 

        SizedBox(height: 10,),

        Column(                  
          children: [
            placeholderContainerWide(),
            SizedBox(height: 5,),
            placeholderContainerWide(),
            SizedBox(height: 5,),
            placeholderContainerWide(),
            SizedBox(height: 5,),
            placeholderContainerWide(),
            SizedBox(height: 5,),
            placeholderContainerWide(),
          ],
        ),     

        SizedBox(height: 10,),

        RichText(
          text: TextSpan(
            text: "View All",                                        
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              color: themeProvider.currentThemeColor,
              fontSize: 12,
            ),
            recognizer: TapGestureRecognizer() 
            ..onTap = () {},
          )
        )               
      ],
    );
  }

  Column upcomingPlans() {
    return Column(
      children: [
        //Upcoming Plans text
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Upcoming Plans",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                  color: themeProvider.currentTextColor,
                  fontWeight: FontWeight.w600,
                  shadows: [defaultTextShadow],      
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "within the next week",
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 10,
                  color: themeProvider.currentTextColor.withOpacity(0.5),
                  fontWeight: FontWeight.w600,
                  shadows: [defaultTextShadow],      
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: 5,),

        // Add Activity Button
        SizedBox(
          width: double.infinity,
          height: 30,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: themeProvider.currentBaseColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              side: BorderSide(color: themeProvider.currentTextColor.withOpacity(0.5), width: 1),                      
            ),
            
            onPressed: () {}, 
            child: Text(
              "+ Add Activity",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                shadows: [defaultTextShadow],
                color: themeProvider.currentTextColor.withOpacity(0.8),
              ),  
            ),                      
          ),
        ),

        SizedBox(height: 10,),

        //ListView for Plans
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.hardEdge,                
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 15),
                child: PlansCard(themeProvider: themeProvider, index: index,),
              );
            },
          ),
        )
      ],
    );
  }

  Column welcomeGreeting() {
    return Column(
      children: [
        Text(
          "Hey, username!",
          style: TextStyle(
            color: themeProvider.currentTextColor,
            shadows: [defaultTextShadow],
            fontSize: 35,
            fontWeight: FontWeight.w700,
            height: 0.8
          ),
        ),

        Text(
          "Any plans with anyone?",
          style: TextStyle(
            color: themeProvider.currentTextColor,
            shadows: [defaultTextShadow],
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Container placeholderContainerWide() {
    return Container(
      alignment: Alignment.center,
      height: 30,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: themeProvider.currentBaseColor,
        border: Border.all(color: themeProvider.currentTextColor.withOpacity(0.5), width: 1,),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
          )
        ]
      ),
      child: Text("PLACEHOLDER", style: TextStyle(color: themeProvider.currentTextColor),), 
    );
  }
}