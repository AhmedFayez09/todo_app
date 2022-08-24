import 'package:flutter/material.dart';
import 'package:todo_route/core/constant/my_colors.dart';

import 'my_colors.dart';

class MyThemeData {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: standeredColor,
    scaffoldBackgroundColor: mainbackgroundColor,
    colorScheme: ColorScheme(
      primary: standeredColor,
      onPrimary: whiteColor,
      secondary: greenColor,
      onSecondary: whiteColor,
      brightness: Brightness.light,
      error: redColor,
      onError: whiteColor,
      background: mainbackgroundColor,
      onBackground: whiteColor,
      surface: whiteColor,
      onSurface: Colors.grey,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: whiteColor,
      ),
      //Done
      headline2: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: greenColor,
      ),
      //not Done
      headline3: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: standeredColor,
      ),

      subtitle1: const TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      subtitle2: const TextStyle(
        fontSize: 20,
        color: Colors.black,
      ),
      // title Add
      headline4: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: titleAddTask,
      ),
      //hint text
      headline5: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: hiteTextColoe,
      ),
caption:const TextStyle(
  color: Colors.black,
  fontSize: 15,
  fontWeight: FontWeight.bold
),
      headline6: TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.bold,
        color: greenColor,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: standeredColor,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: whiteColor,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: standeredColor,
      unselectedItemColor: hiteTextColoe,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: standeredColor,
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: whiteColor,
    ),
  );
  static final ThemeData darkTheme = ThemeData(
    primaryColor: standeredColorDark,
    scaffoldBackgroundColor: mainbackgroundColorDark,
    colorScheme: ColorScheme(
      primary: standeredColor,
      onPrimary: whiteColor,
      secondary: greenColor,
      onSecondary: whiteColor,
      brightness: Brightness.light,
      error: redColor,
      onError: whiteColor,
      background: mainbackgroundColorDark,
      onBackground: whiteColor,
      surface: whiteColor,
      onSurface: Colors.grey,
    ),
    textTheme: TextTheme(
      //To Do List
      headline1: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: whiteColor,
      ),
      //Done
      headline2: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: greenColor,
      ),
      //not Done
      headline3: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: standeredColor,
      ),
      // title Add
      headline4: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: whiteColor,
      ),
      //hint text
      headline5: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: hiteTextColorDark,
      ),
  


caption: TextStyle(
  color: whiteColor,
  fontSize: 15,
  fontWeight: FontWeight.bold
),  
   headline6: TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.bold,
        color: greenColor,
      ),
  
    ),
     floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: standeredColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: standeredColorDark,
      elevation: 0,
      titleTextStyle: TextStyle(color: mainbackgroundColorDark),
      centerTitle: true,
      iconTheme: IconThemeData(
        color: whiteColor,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: standeredColor,
        unselectedItemColor: hiteTextColoe,
        backgroundColor: mainbackgroundColorDark),
    bottomAppBarTheme: BottomAppBarTheme(
      color: lightmainbackgroundDark,
    ),
  );
}
