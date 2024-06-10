import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(
              'data',
              style: TextStyle(fontSize: 30.sp),
            ),
            Container(
              height: 100.h,
              width: 100.w,
              color: Colors.grey,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 100,
              width: 100,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
