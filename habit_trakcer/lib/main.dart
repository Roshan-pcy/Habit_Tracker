import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_trakcer/pages/HomePage.dart';
import 'package:habit_trakcer/pages/light_mode.dart';
import 'package:habit_trakcer/pages/night_mode.dart';
import 'package:habit_trakcer/pages/theme/theme_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('Habit_DataBase');
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
              title: 'Flutter Demo',
              theme: Provider.of<ThemeProvider>(context).getTheme,
              home: const MyHomePage(),
            ));
  }
}
