import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bondly/providers/theme_provider.dart';

 // Custom Button
class CustomBorderlessButton extends StatelessWidget 
{
  final String text;
  final Color textColor;
  final Color bgColor;
  final VoidCallback? onPressed;

  const CustomBorderlessButton(
    {
      super.key,
      required this.text,
      required this.textColor,
      required this.bgColor,
      required this.onPressed,
    }
  ); 

  @override
  Widget build(BuildContext context)
  {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onPressed: onPressed,
        child: Text(text, style: TextStyle(color: textColor, fontSize: 16),
        ),
      ),
    );
  }
}

class CustomGradientButton extends StatelessWidget {
  const CustomGradientButton({
    super.key,
    required this.text,
    required this.textColor,
    required this.gradient,
    required this.onPressed,
    required this.heightUser,
    required this.widthUser,
  });

  final String text;
  final Color textColor;
  final Gradient gradient;
  final double heightUser;
  final double widthUser;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(      
      width: widthUser,
      height: heightUser,
      child: Stack(
        children: [
          // Gradient Background
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: gradient,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),

          // Transparent Button
          Positioned.fill(
            child: ElevatedButton(            
              style: ElevatedButton.styleFrom(                          
                backgroundColor: Colors.transparent, // Transparent to show gradient
                shadowColor: Colors.transparent, // No shadow for a clean look
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: onPressed,
              child: Text(
                text,
                style: TextStyle(color: textColor, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomOutlinedButton extends StatelessWidget 
{
  final String text;
  final Color borderColor;
  final Color textColor;
  final Color bgColor;
  final VoidCallback? onPressed;

  const CustomOutlinedButton(
    {
      super.key,
      required this.text,
      required this.borderColor,
      required this.textColor,
      required this.bgColor,
      required this.onPressed,
    }
  ); 

  @override
  Widget build(BuildContext context )
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
          onPressed: onPressed,
          child: Text(text, style: TextStyle(color: textColor, fontSize: 16),
          ),    
        ),
      );
  }
}

class CircularButton extends StatelessWidget
{
  final IconData faIcon;
  final Color iconColor;
  final Color bgColor;
  final VoidCallback? onPressed;

  const CircularButton (
    {
      super.key,
      required this.faIcon,
      required this.bgColor,
      required this.iconColor,
      required this.onPressed,
    }
  );

  @override
  Widget build(BuildContext context)
  {
    return CircleAvatar(
      radius: 25,
      backgroundColor: bgColor,
      child: IconButton(
        icon: FaIcon(faIcon),
        color: iconColor,
        iconSize: 18,
        onPressed: onPressed,
      ),
    );
  }
}

// colored input field 
class ColoredInputField extends StatefulWidget
{
  final Color inputFontColor;
  final Color inputbgColor;
  final String labelText;
  final Color labelFontColor;
  final Color labelbgColor;
  
  const ColoredInputField (
    {
      super.key,
      required this.inputFontColor,
      required this.inputbgColor,
      required this.labelText,
      required this.labelFontColor,
      required this.labelbgColor,
    }
  );

  @override
  State<ColoredInputField> createState() => _ColoredInputFieldState();
}

class _ColoredInputFieldState extends State<ColoredInputField> {
  @override
  Widget build(BuildContext context)
  {
    return Column(  
      children: [
        Align(        
          alignment: Alignment.centerLeft,
          child: Text(          
            widget.labelText,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: widget.labelFontColor,
              backgroundColor: widget.labelbgColor,
              shadows: [defaultTextShadow],
            ),
          ),
        ),

        SizedBox(height: 2,),

        // text input field
        // wrapped in container to have border radius
        Container(
          decoration: BoxDecoration(
            color: widget.inputbgColor,
            borderRadius: BorderRadius.circular(15)
          ),

          child: SizedBox(
            height: 45,
            child: TextField(            
              decoration: InputDecoration(              
                filled: true,          
                fillColor: Colors.transparent,
                border: InputBorder.none, 
              ),              
            ),
          ),
        )
      ],
    );
  }
}


// socials login like facebook, apple, and google
class SocialsLogin extends StatelessWidget {
  final Color mainColor;
  
  const SocialsLogin({
    super.key,
    required this.mainColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(thickness: 1, color: mainColor),
        
        Text(
          "or continue with",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: mainColor,
            height: 1,
            shadows: [defaultTextShadow] 
          ),
          textAlign: TextAlign.center,
        ),
     
        SizedBox(height: 15,),
    
        Container(
          width: 180,
          decoration: const BoxDecoration(
            color: Colors.transparent
          ),
          child: Row(      
            mainAxisAlignment: MainAxisAlignment.spaceBetween,    
            children: [
              CircularButton(
                faIcon: FontAwesomeIcons.google, 
                iconColor: Colors.white, 
                bgColor: Colors.red,
                onPressed: () {
                  print("nothing happens yet");
                },  
              ),

              CircularButton(
                faIcon: FontAwesomeIcons.apple, 
                iconColor: Colors.white, 
                bgColor: Colors.black,
                onPressed: () {
                  print("nothing happens yet");
                },  
              ),

              CircularButton(
                faIcon: FontAwesomeIcons.facebook, 
                iconColor: Colors.white, 
                bgColor: Colors.blue,
                onPressed: () {
                  print("nothing happens yet");
                },  
              ),
            ],
          )
        ),
      ],
    );
  }
}


