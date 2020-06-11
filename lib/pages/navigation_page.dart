import 'package:flutter/material.dart';

class NavigationWidget extends StatelessWidget {
  final List<ListItem> listData = [];

  void initData() {
    listData.clear();
    listData.add(ListItem("drawer", "/drawer", Icons.drag_handle));
    listData.add(ListItem("tab使用", "/tab", Icons.tab));
    listData.add(ListItem("textfield使用", "/textfield", Icons.tab));
    listData.add(ListItem("customsrcollview使用", "/customsrcollview", Icons.tab));
    listData.add(ListItem("futurebuilder使用", "/futurebuilder", Icons.tab));
    listData.add(ListItem("listview使用", "/listview", Icons.tab));
    listData.add(ListItem("tabview keepalive使用", "/tabview_keepalive", Icons.tab));
  }

  @override
  Widget build(BuildContext context) {
    initData();
    return Scaffold(
      appBar: AppBar(
        title: Text("navigation"),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              title: Text(listData[index].title),
              leading: Icon(listData[index].iconData),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pushNamed(context, listData[index].rountName);
              });
        },
        separatorBuilder:(BuildContext context, int index) {
          return Divider(
            color: Color.fromARGB(255, 55, 55, 55),
          );
        },
        itemCount: listData.length,
      ),
    );
  }
}

class ListItemWidget extends StatelessWidget {
  final ListItem listItem;

  ListItemWidget(this.listItem);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(listItem.title),
        leading: Icon(listItem.iconData),
        trailing: Icon(Icons.arrow_forward),
        onTap: () {
          Navigator.pushNamed(context, listItem.rountName);
        });
  }
}

class ListItem {
  String title;
  String rountName;
  IconData iconData;

  ListItem(this.title, this.rountName, this.iconData);
}
