import 'package:flutter/material.dart';
import 'package:flutter_responsive_dashboard_ui/dashboard.dart';
import 'package:flutter_responsive_dashboard_ui/style/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: AppColors.primaryBg),
      home: Dashboard(),
    );
  }
}
