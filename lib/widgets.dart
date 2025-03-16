import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

  // Custom Button
  Widget buildButton(String text, Color textColor, Color bgColor)
  {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onPressed: () {},
        child: Text(text, style: TextStyle(color: textColor, fontSize: 16),
        ),
      ),
    );
  }

  Widget buildOutlinedButton(String text, Color textColor, Color bgColor, Color borderColor)
  {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          side: BorderSide(color: borderColor, width: 2),
          ),    
          onPressed: () {},
          child: Text(text, style: TextStyle(color: textColor, fontSize: 16),
          ),    
        ),
      );
  }

  Widget buildCircularButton(IconData faIcon, Color iconColor, Color bgColor)
  {
    return CircleAvatar(
      radius: 30,
      backgroundColor: bgColor,
      child: IconButton(
        icon: FaIcon(faIcon),
        color: iconColor,
        iconSize: 30,
        onPressed: () {},
      ),
    );
    
    
  }


  