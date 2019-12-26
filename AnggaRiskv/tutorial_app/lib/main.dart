import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'styles/fontStyle.dart';
import 'styles/mainColor.dart';
import 'styles/images.dart';

// TODO: run pub get.
// TODO: check if we need the scroll view
/**
 * SingleChildScrollView(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: <Widget>[]
    )
   )
 */

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(
        color: whiteHoly,
        children: SafeArea(
          child: Container(
            children: <Widget>[
              SvgPicture.asset(logo),
              Image.asset(
                lauterBrunnen,
                height: 250,
              ),
              Text("Go camp with us", style: mainHeader,),
              Row(
                children: <Widget>[
                  Icon(Icons.arrow_back),
                  Icon(Icons.settings),
                  Icon(Icons.arrow_back),
                ]
              ),
              Column(
                children: <Widget>[
                  Icon(Icons.arrow_back),
                  Icon(Icons.settings),
                  Icon(Icons.arrow_back),
                ]
              )
            ]
          )
        )
      ),
    );
  }
}