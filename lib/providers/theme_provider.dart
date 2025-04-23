import 'package:flutter/material.dart';

//base colors
final Color defaultTextColor = Color(0xFF2E3A59);
final Color whiteTextColor = Color(0xFFEEEEEE);
final Color defaultGrey = Color(0xFFCCD2E2);
final Shadow defaultTextShadow = Shadow (color: Colors.black.withOpacity(0.05), offset: Offset(1, 2), blurRadius: 8,);
final LinearGradient whiteGradientBg = LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xFFFFFFFF), Color(0xFFFEEFFF)]);
final LinearGradient darkGradientBg = LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xFF1E1E2E), Color(0xFF23181F)]);
final LinearGradient unselectedGreyGradient = const LinearGradient(colors: [Color(0xFFCCD2E2),Color(0xFFCCD2E2)], begin: Alignment.centerLeft, end: Alignment.centerRight,);

final Color baseWhite = Color(0xFFFFFFFF);
final Color baseDark = Color(0xFF1E1E2E);

//gradient options
final LinearGradient gradientTheme1 = const LinearGradient(colors: [Color(0xFFF04CBA),Color(0xFFF382CE)], begin: Alignment.centerLeft, end: Alignment.centerRight,);
final Color themeColor1 = Color(0xFFF04CBA);
final LinearGradient gradientTheme2 = const LinearGradient(colors: [Color(0xFF704CF0),Color(0xFF82A6F3)], begin: Alignment.centerLeft, end: Alignment.centerRight,);
final Color themeColor2 = Color(0xFF704CF0);
final LinearGradient gradientTheme3 = const LinearGradient(colors: [Color(0xFFF0AC4C),Color(0xFFF6DB6C)], begin: Alignment.centerLeft, end: Alignment.centerRight,);
final Color themeColor3 = Color(0xFFF0AC4C);
final LinearGradient gradientTheme4 = const LinearGradient(colors: [Color(0xFFF04C4C),Color(0xFFF38282)], begin: Alignment.centerLeft, end: Alignment.centerRight,);
final Color themeColor4 = Color(0xFFF04C4C);

class ThemeProvider with ChangeNotifier {
  LinearGradient _currentGradientTheme = const LinearGradient(colors: [Color(0xFFF04CBA),Color(0xFFF382CE)], begin: Alignment.centerLeft, end: Alignment.centerRight,);
  Color _currentThemeColor = const Color(0xFFF04CBA);
  int _currentThemeNum = 1;
  LinearGradient _currentGradientBg = whiteGradientBg;
  Color _currentTextColor = defaultTextColor;
  Color _currentBaseColor = baseWhite;

  LinearGradient get currentGradientTheme => _currentGradientTheme;
  Color get currentThemeColor => _currentThemeColor;
  int get  currentThemeNum => _currentThemeNum;
  LinearGradient get currentGradientBg => _currentGradientBg;
  Color get currentTextColor => _currentTextColor;
  Color get currentBaseColor => _currentBaseColor;

  void setTheme(LinearGradient gradient, Color color, int themeNum, LinearGradient gradientBg, Color textC, Color baseColor)
  {
    _currentGradientTheme = gradient;
    _currentThemeColor = color;
    _currentThemeNum = themeNum;
    _currentGradientBg = gradientBg;
    _currentTextColor = textC;
    _currentBaseColor = baseColor;
    notifyListeners();
  }
}