import 'package:flutter/material.dart';

import 'package:bondly/providers/theme_provider.dart';
import 'package:bondly/widgets/input_fields.dart';

class FriendsWidget extends StatelessWidget {
  const FriendsWidget({
    super.key,
    required this.themeProvider,
  });

  final ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    return Stack(        
      children: [  
        //top bar    
        SafeArea(                   
          child: Stack(              
            alignment: Alignment.center,
            children: [
              // Centered title
              Text(
                "Friends",
                style: TextStyle(
                  color: themeProvider.currentTextColor,
                  shadows: [defaultTextShadow],
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
    
              // Row of icons overlaid
              Row(                  
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    onPressed: () {},
                    icon: Icon(Icons.add_circle_outline),
                    iconSize: 25,
                  ),                    
                ],
              ),
            ],
          ),
        ),
    
        //filter buttons
        FriendsFilterButtons()
      ],
    );
  }
}

class FriendsFilterButtons extends StatefulWidget {
  const FriendsFilterButtons({
    super.key,
  });

  @override
  State<FriendsFilterButtons> createState() => _FriendsFilterButtonState();
}

class _FriendsFilterButtonState extends State<FriendsFilterButtons> {
  

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Row(
        children: [
          
        ],
      ),
    );
  }
}
