import 'package:flutter/material.dart';
import 'package:flutter_login_ui/notifiers/app_theme_notifier.dart';
import 'package:flutter_login_ui/pages/home_page.dart';

import 'package:flutter_login_ui/theme/app_theme.dart';
// import 'package:provider/provider.dart';

void main() {
runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final appThemeNotifier = Provider.of<AppThemeNotifier>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme.copyWith(useMaterial3: true),
      darkTheme: AppTheme.darkTheme.copyWith(useMaterial3: true),
      // themeMode:appThemeNotifier.isDarkMode?ThemeMode.dark:ThemeMode.light,
      // debugShowCheckedModeBanner: false,
      home: HomePage(),
      
    );
  }
}

 