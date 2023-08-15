import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager_ostad/presentation/components/theme_data/dark_theme.dart';
import 'package:taskmanager_ostad/presentation/screens/splash_screen.dart';
import 'presentation/components/theme_data/light_theme.dart';

class TaskManagerApp extends StatefulWidget {
  static GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  const TaskManagerApp({super.key});

  @override
  State<TaskManagerApp> createState() => _TaskManagerAppState();
}

class _TaskManagerAppState extends State<TaskManagerApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      key: TaskManagerApp.globalKey,
      debugShowCheckedModeBanner: false,
      title: 'Task Manager',
      theme: AppLightTheme.lightTheme,
      darkTheme: AppDarkTheme.darkTheme,
      themeMode: ThemeMode.light,
      home: const SplashScreen(),
    );
  }
}
