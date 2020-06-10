import 'package:flutter/material.dart';
import 'package:flutterappstudy/pages/customscrollView_page.dart';
import 'package:flutterappstudy/pages/drawer_page.dart';
import 'package:flutterappstudy/pages/futurebuild_page.dart';
import 'package:flutterappstudy/pages/listview_page.dart';
import 'package:flutterappstudy/pages/navigation_page.dart';
import 'package:flutterappstudy/pages/tab_page.dart';
import 'package:flutterappstudy/pages/textfield_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Study',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
//      home: MyHomePage(title: 'Flutter Study Home Page'),
      routes: <String, WidgetBuilder>{
        "/": (_) => NavigationWidget(),
        "/drawer": (_) => DrawerWidget(),
        "/tab": (_) => TabWidget(),
        "/textfield": (_) => TextFieldWidget(),
        "/customsrcollview": (_) => CustomScrollViewWidget(),
        "/futurebuilder": (_) => FutureBuilderWidget(),
        "/listview": (_) => ListViewWiget(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}
