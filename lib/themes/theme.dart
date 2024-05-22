
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fulusi/colors/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme{
  static  ThemeData Theme(){
    return ThemeData(
      iconTheme:IconThemeData(
          color: mainBlue,

      ) ,
      fontFamily:'Roboto',
      appBarTheme: const AppBarTheme(
        surfaceTintColor: mainOrange,
        centerTitle: true,
        foregroundColor:mainOrange,

      shadowColor: mainOrange,
        iconTheme:IconThemeData(
            color: mainOrange
        ),
        elevation: 0.5
      ),
      primaryColor: mainOrange,
      scaffoldBackgroundColor: white,
      highlightColor: mainOrange,
      textTheme: TextTheme(

        titleLarge: GoogleFonts.getFont(
            'Roboto',
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: mainBlue
        ),
        displayMedium: GoogleFonts.getFont(
            'Roboto',
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: black,
        ),
        displaySmall: GoogleFonts.getFont(
            'Roboto',
            fontSize: 20,
        ),
      ),
      colorScheme:  ColorScheme.fromSwatch().copyWith(
        primary: mainOrange,
        onPrimary: mainOrange,
        secondary: mainBlue,
        onSecondary:  mainBlue,
        surface: white,
        onSurface: white,
        error: error,
        onError: error,
        background: white,
        onBackground:black,
        brightness: Brightness.light,
      ),
    );
  }
}
