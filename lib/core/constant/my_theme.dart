import 'package:flutter/material.dart';
import 'package:todo_route/core/constant/my_colors.dart';

class MyThemeData {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: standeredColor,
    scaffoldBackgroundColor:
    mainbackgroundColor,
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

      subtitle1:const TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      subtitle2:const  TextStyle(
        fontSize: 20,
        
        color:Colors.black,
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
    ),
    appBarTheme: AppBarTheme(
      backgroundColor:standeredColor,
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
 )
 
  );
  static final ThemeData darkTheme = ThemeData(
    primaryColor: standeredColorDark,
    textTheme: TextTheme(

      //To Do List
      headline1: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: standeredColorDark,
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
    ),
    



    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
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
  
  
  
  
  );
}
