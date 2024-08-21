import 'package:flutter/material.dart';

import 'home/home_screen.dart';
import 'my_theme.dart';

void main(){
  runApp(MyApplication());
}
class MyApplication extends StatelessWidget {
  const MyApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News',
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName : (context) => HomeScreen(),
      },
      theme: ThemeData(
        // scaffoldBackgroundColor: Colors.transparent,
          primaryColor: MyThemeData.primaryColor,
          appBarTheme: AppBarTheme(
              backgroundColor: MyThemeData.primaryColor
          )
      ),

    );
  }
}
