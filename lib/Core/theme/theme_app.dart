import 'package:flutter/material.dart';
import '../../constant.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      //this is used for widgets like (FloatingActionButton, NavigationBar)
      //to take the primary color we added from the theme
      useMaterial3: true,

      //initialize the background color for the app
      scaffoldBackgroundColor: kBackgroundColor,

      //initialize the text theme with the google sans font for the whole application
      fontFamily: 'Google Sans',

      //initialize the colors for the theme of the application
      colorScheme: ColorScheme.fromSeed(
        seedColor: kPrimaryColor,
        primary: kPrimaryColor,
        secondary: kSecondaryColor,
        surface: kBackgroundColor,
      ),
    );
  }
}
