import 'package:flutter/material.dart';

import 'package:bondly/providers/theme_provider.dart';

class FriendsCard extends StatelessWidget {
  final ThemeProvider themeProvider;
  final int index;

  const FriendsCard (
    {
      super.key,
      required this.themeProvider,
      required this.index,
    }
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,                   
      height: 80,
      width: double.infinity,         
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.transparent,
        border: Border.all(
          color: defaultGrey, 
          width: 1,
        )
      ),               
      child: Text("PLACEHOLDER", style: TextStyle(color: themeProvider.currentTextColor),),  
    );
  }  
}