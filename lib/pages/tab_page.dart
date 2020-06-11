import 'package:flutter/material.dart';

class TabWidget extends StatefulWidget {
  @override
  _TabWidgetState createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  List tabName = ["tab1", "tab3", "tab3", "tab4", "tab5"];
  List<Tab> tabWidgets;

  initData() {
    _controller = new TabController(length: tabName.length, vsync: this);
    tabWidgets = tabName
        .map((e) => Tab(
              text: e,
            ))
        .toList();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("initstate");
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tab Demo"),
        bottom: TabBar(
          tabs: tabWidgets,
          controller: _controller,
        ),
      ),
      body: TabBarView(
        children: tabName
            .map((e) => Container(
                  margin: EdgeInsets.all(5),
                  decoration:
                      BoxDecoration(color: Color.fromARGB(255, 200, 55, 100)),
                  child: Center(
                    child: Text("$e"),
                  ),
                ))
            .toList(),
        controller: _controller,
      ),
    );
  }
}
