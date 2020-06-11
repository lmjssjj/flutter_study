import 'package:flutter/material.dart';
import 'package:flutterappstudy/pages/tab_view_page.dart';

class TabViewKeepAliveWidget extends StatefulWidget {
  @override
  TabViewKeepAliveState createState() => TabViewKeepAliveState();
}

class TabViewKeepAliveState extends State<TabViewKeepAliveWidget>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  List _tabName = ["tab1", "tab2", "tab3", "tab4"];
  List<Widget> _tabs;

  initData() {
    _controller = TabController(length: _tabName.length, vsync: this);
    _tabs = _tabName
        .map((e) => Tab(
              text: e,
            ))
        .toList();
  }

  @override
  void initState() {
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("keep alive"),
        bottom: TabBar(
          tabs: _tabs,
          controller: _controller,
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: _tabName.map((e) => KeepAlivePage()).toList(),
      ),
    );
  }
}
