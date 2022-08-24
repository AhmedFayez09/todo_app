import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_route/core/utils/app_router.dart';
import 'package:todo_route/core/constant/my_strings.dart';
import 'package:todo_route/logic/proviser.dart';

import 'core/constant/my_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseFirestore.instance.disableNetwork();
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => App_Provider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  late App_Provider app_provider;

  @override
  Widget build(BuildContext context) {
     app_provider = Provider.of<App_Provider>(context);
    getValueFromShared();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: mainScreen,
      routes: routes,
      themeMode:
          // provider.savedMode? ThemeMode.dark :ThemeMode.light,
          app_provider.themeMode,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
    );
  }

  void getValueFromShared() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    app_provider.chanchAppTheme(prefs.getString('theme') as ThemeMode);

    if (prefs.getString('theme') == 'light') {
      app_provider.chanchAppTheme(ThemeMode.light);
    } else if (prefs.getString('theme') == 'dark') {
      app_provider.chanchAppTheme(ThemeMode.dark);
    }
  }
}
