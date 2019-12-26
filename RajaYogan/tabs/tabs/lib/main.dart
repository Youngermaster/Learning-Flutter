import 'package:flutter/material.dart';
import 'firstpage.dart' as first_page;
import 'secondpage.dart' as second_page;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text('Tabs app'),
        backgroundColor: Colors.teal,
      ),
      bottomNavigationBar: Material(
        color: Colors.teal,
        child: TabBar(
            controller: tabController,
            tabs: <Widget> [
              Tab(icon: Icon(Icons.monetization_on)),
              Tab(icon: Icon(Icons.all_inclusive)),
            ]
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: <Widget>[
          first_page.FirstPage(),
          second_page.SecondPage(),
        ],
      ),
    );
  }
}