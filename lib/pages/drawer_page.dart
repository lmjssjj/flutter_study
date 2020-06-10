import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerState createState() => _DrawerState();
}

class _DrawerState extends State<DrawerWidget> {
  var drawerOptions = List<Widget>();
  var curentPageName = "test1";

  void initData() {
    List<DrawerItem> drawerItems = [
      DrawerItem("test1", Icons.text_rotate_vertical),
      DrawerItem("test2", Icons.texture),
      DrawerItem("test3", Icons.text_fields),
    ];
    for (var i = 0; i < drawerItems.length; i++) {
      drawerOptions.add(ListTile(
        title: Text(drawerItems[i].title),
        leading: Icon(drawerItems[i].icon),
        trailing: Icon(Icons.arrow_right),
        dense: true,
        onTap: () {
          _switchBody(drawerItems[i]);
        },
      ));
    }
    drawerOptions.add(Divider());
    drawerOptions.add(InkWell(
        onTap: () => {},
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 16,horizontal: 24),
          child: Row(
            children: <Widget>[
              Icon(Icons.alarm),
              Padding(
                child: Text("item"),
                padding: EdgeInsets.only(left: 8),
              ),
              Text("item"),
            ],
          ),
        )));
  }

  void _switchBody(DrawerItem item) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop(); // close the drawer
    }
    print(item.title);
    curentPageName = item.title;
    setState(() {});
  }

  Widget _getBodyWidget(String name) {
    Widget bodyWidget;
    switch (name) {
      case "test1":
        bodyWidget = Container(
            child: Center(
          child: Text("test1"),
        ));
        break;
      case "test2":
        bodyWidget = Container(
            child: Center(
          child: Text("test2"),
        ));
        break;
      case "test3":
        bodyWidget = Container(
            child: Center(
          child: Text("test3"),
        ));
        break;
      default:
        bodyWidget = Container(
            child: Center(
          child: Text("lmjssjj"),
        ));
    }
    return bodyWidget;
  }

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Drawer"),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(),
              accountName: Text("lmjssjj"),
              accountEmail: Text("lmjssjj@lmjssjj.com"),
            ),
            Column(
              children: drawerOptions,
            ),
          ],
        ),
      ),
      body: _getBodyWidget(curentPageName),
    );
  }
}

/*抽屉item实体类*/
class DrawerItem {
  String title;
  IconData icon;

  DrawerItem(this.title, this.icon);
}
