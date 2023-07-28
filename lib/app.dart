import 'package:flutter/material.dart';
import 'package:taskmanager_ostad/ui/presentation/screens/splash_screen.dart';
import 'package:taskmanager_ostad/ui/theme_data/dark_theme.dart';
import 'package:taskmanager_ostad/ui/theme_data/light_theme.dart';

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Manager',
      theme: AppLightTheme.lightTheme,
      darkTheme: AppDarkTheme.darkTheme,
      themeMode: ThemeMode.light,
      home: const SplashScreen(),
    );
  }
}
