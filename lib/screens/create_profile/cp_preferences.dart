import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:bondly/widgets/input_fields.dart';
import 'package:bondly/providers/theme_provider.dart';

class CpPreferences extends StatefulWidget {
  const CpPreferences({super.key});

  @override
  State<CpPreferences> createState() => _CpPreferencesState();
}

class _CpPreferencesState extends State<CpPreferences> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(gradient: themeProvider.currentGradientBg),
        child: Stack(
          children: [
            Column(
              children: [
                pageTopPortion(),

                SizedBox(
                  height: 50,
                ),

                DisplayNameSelection(),

                SizedBox(
                  height: 20,
                ),

                ThemeSelection(),
                
                SizedBox(
                  height: 20,
                ),

                ColorSchemeSelection(),
              ],
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: CustomGradientButton(
                  text: 'Next',
                  textColor: Colors.white,
                  gradient: themeProvider.currentGradientTheme,
                  heightUser: 40,
                  widthUser: double.infinity,
                  onPressed: () {
                    context.go('/setupcomplete');
                  }),
            ),
          ],
        ),
      ),
    );
  }

  SafeArea pageTopPortion() {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Text(
              "Preferences",
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
                SizedBox(width: 5),
                Container(
                  height: 7,
                  width: 50,
                  decoration: BoxDecoration(
                    gradient: themeProvider.currentGradientTheme,
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

class ThemeSelection extends StatefulWidget {    
    const ThemeSelection({super.key});
    
    @override
    State<ThemeSelection> createState() => _ThemeSelectionState();
  }

class _ThemeSelectionState extends State<ThemeSelection> {

  @override
  Widget build(BuildContext context) {
    bool isLightSelected;
    final themeProvider = Provider.of<ThemeProvider>(context);
    if(themeProvider.currentGradientBg == whiteGradientBg)
    {
      isLightSelected = true;
    }
    else
    {
      isLightSelected = false;
    }


    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            " Theme:",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: themeProvider.currentTextColor,
              backgroundColor: Colors.transparent,
              shadows: [defaultTextShadow],
            ),
          ),
        ),
        
        SizedBox(
          height: 2,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: CustomGradientButton(
                text: "Light",
                textColor: isLightSelected ? Colors.white : defaultTextColor,
                gradient: isLightSelected ? themeProvider.currentGradientTheme : unselectedGreyGradient,
                onPressed: () {
                  if(!isLightSelected) {
                    setState(() {
                      isLightSelected = true;
                      Provider.of<ThemeProvider>(context, listen: false).setTheme(themeProvider.currentGradientTheme, themeProvider.currentThemeColor, themeProvider.currentThemeNum, whiteGradientBg, defaultTextColor);
                    });
                  }
                },
                heightUser: 40,
                widthUser: double.infinity
              ),
            ),

            SizedBox(
              width: 10,
            ),
          
            Expanded(
              child: CustomGradientButton(
                text: "Dark",
                textColor: isLightSelected ? defaultTextColor : Colors.white,
                gradient: isLightSelected ? unselectedGreyGradient : themeProvider.currentGradientTheme,
                onPressed: () {
                  if(isLightSelected) {
                    setState(() {
                      isLightSelected = false;
                      Provider.of<ThemeProvider>(context, listen: false).setTheme(themeProvider.currentGradientTheme, themeProvider.currentThemeColor, themeProvider.currentThemeNum, darkGradientBg, whiteTextColor);
                    });
                  }
                },
                heightUser: 40,
                widthUser: double.infinity
              ),
            ),
          ],
        )
      ],
    );
  }
}

class DisplayNameSelection extends StatefulWidget {    
    const DisplayNameSelection({super.key});
    
    @override
    State<DisplayNameSelection> createState() => _DisplayNameSelectionState();
  }

class _DisplayNameSelectionState extends State<DisplayNameSelection> {
  bool isLightSelected = true;

  @override
  Widget build(BuildContext context) {    
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            " Display Name:",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: themeProvider.currentTextColor,
              backgroundColor: Colors.transparent,
              shadows: [defaultTextShadow],
            ),
          ),
        ),

        SizedBox(
          height: 2,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: CustomGradientButton(
                text: "Username",
                textColor: isLightSelected ? Colors.white : defaultTextColor,
                gradient: isLightSelected ? themeProvider.currentGradientTheme : unselectedGreyGradient,
                onPressed: () {
                  if(!isLightSelected) {
                    setState(() {
                      isLightSelected = true;
                    });
                  }
                },
                heightUser: 40,
                widthUser: double.infinity
              ),
            ),

            SizedBox(
              width: 10,
            ),
          
            Expanded(
              child: CustomGradientButton(
                text: "Real Name",
                textColor: isLightSelected ? defaultTextColor : Colors.white,
                gradient: isLightSelected ? unselectedGreyGradient : themeProvider.currentGradientTheme,
                onPressed: () {
                  if(isLightSelected) {
                    setState(() {
                      isLightSelected = false;
                    });
                  }
                },
                heightUser: 40,
                widthUser: double.infinity
              ),
            ),
          ],
        )
      ],
    ); 
  }
}

class ColorSchemeSelection extends StatefulWidget {    
    const ColorSchemeSelection({super.key});
    
    @override
    State<ColorSchemeSelection> createState() => _ColorSchemeSelectionState();
  }

class _ColorSchemeSelectionState extends State<ColorSchemeSelection> {

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);  

    bool is1Selected = themeProvider.currentThemeNum == 1;
    bool is2Selected = themeProvider.currentThemeNum == 2;
    bool is3Selected = themeProvider.currentThemeNum == 3;
    bool is4Selected = themeProvider.currentThemeNum == 4;

    LinearGradient gradientTheme = themeProvider.currentGradientBg;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            " Color Scheme:",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: themeProvider.currentTextColor,
              backgroundColor: Colors.transparent,
              shadows: [defaultTextShadow],
            ),
          ),
        ),

        SizedBox(
          height: 2,
        ),
        
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomGradientButton(
                    text: "",
                    textColor: Colors.white,
                    gradient: gradientTheme1,
                    onPressed: () {
                      if(!is1Selected) {
                        setState(() {
                          is1Selected = true;
                          is2Selected = false;
                          is3Selected = false;
                          is4Selected = false;

                          Provider.of<ThemeProvider>(context, listen: false).setTheme(gradientTheme1, themeColor1, 1, gradientTheme, themeProvider.currentTextColor);
                        });
                      }
                    },
                    heightUser: 40,
                    widthUser: double.infinity
                  ),

                  Icon(
                    Icons.maximize_rounded,
                    color: is1Selected ? themeColor1 : Colors.transparent,
                    size: 50,
                  )
                ],
              ),
            ),        

            SizedBox(width: 5,),

            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomGradientButton(
                    text: "",
                    textColor: Colors.white,
                    gradient: gradientTheme2,
                    onPressed: () {
                      if(!is2Selected) {
                        setState(() {
                          is1Selected = false;
                          is2Selected = true;
                          is3Selected = false;
                          is4Selected = false;     

                          Provider.of<ThemeProvider>(context, listen: false).setTheme(gradientTheme2, themeColor2, 2, gradientTheme, themeProvider.currentTextColor);
                        });
                      }
                    },
                    heightUser: 40,
                    widthUser: double.infinity
                  ),

                  Icon(
                    Icons.maximize_rounded,
                    color: is2Selected ? themeColor2 : Colors.transparent,
                    size: 50,
                  )
                ],
              ),
            ),   

            SizedBox(width: 5,),

            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomGradientButton(
                    text: "",
                    textColor: Colors.white,
                    gradient: gradientTheme3,
                    onPressed: () {
                      if(!is3Selected) {
                        setState(() {
                          is1Selected = false;
                          is2Selected = false;
                          is3Selected = true;
                          is4Selected = false;
                          Provider.of<ThemeProvider>(context, listen: false).setTheme(gradientTheme3, themeColor3, 3, gradientTheme, themeProvider.currentTextColor);
                        });
                      }
                    },
                    heightUser: 40,
                    widthUser: double.infinity
                  ),

                  Icon(
                    Icons.maximize_rounded,
                    color: is3Selected ? themeColor3 : Colors.transparent,
                    size: 50,
                  )
                ],
              ),
            ),      

            SizedBox(width: 5,),

            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomGradientButton(
                    text: "",
                    textColor: Colors.white,
                    gradient: gradientTheme4,
                    onPressed: () {
                      if(!is4Selected) {
                        setState(() {
                          is1Selected = false;
                          is2Selected = false;
                          is3Selected = false;
                          is4Selected = true;
                          Provider.of<ThemeProvider>(context, listen: false).setTheme(gradientTheme4, themeColor4, 4, gradientTheme, themeProvider.currentTextColor);
                        });
                      }
                    },
                    heightUser: 40,
                    widthUser: double.infinity
                  ),

                  Icon(
                    Icons.maximize_rounded,
                    color: is4Selected ? themeColor4 : Colors.transparent,
                    size: 50,
                  )
                ],
              ),
            ),  

            SizedBox(width: 5,),

            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomGradientButton(
                    text: "+",
                    textColor: defaultTextColor,
                    gradient: unselectedGreyGradient,
                    onPressed: () {
                      if(!is1Selected) {
                        setState(() {
                          is1Selected = false;
                          is2Selected = false;
                          is3Selected = false;
                          is4Selected = false;
                        });
                      }
                    },
                    heightUser: 40,
                    widthUser: double.infinity
                  ),

                  Icon(
                    Icons.maximize_rounded,
                    color: Colors.transparent,
                    size: 50,
                  )
                ],
              ),
            ),             
          ],
        )
      ],
    ); 
  }
}