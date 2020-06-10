import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomScrollViewWidget extends StatefulWidget {
  @override
  CustomScrollViewState createState() => CustomScrollViewState();
}

class CustomScrollViewState extends State<CustomScrollViewWidget> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
//          title: Text("SliverAppBar Title"),
          centerTitle: false,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("titile"),
            centerTitle: false,
            background: Image.network(
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1549129578802&di=f866c638ea12ad13c5d603bcc008a6c2&imgtype=0&src=http%3A%2F%2Fpic2.16pic.com%2F00%2F07%2F66%2F16pic_766297_b.jpg",
              fit: BoxFit.cover,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.access_alarm),
              onPressed: () => print("actions item"),
              tooltip: "test",
            ),
            PopupMenuButton<String>(
                icon: Icon(Icons.list),
                onSelected: (value) => print(value),
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                      PopupMenuItem(
                        value: "item1",
                        child: Text("item1"),
                      ),
                      PopupMenuItem(
                        value: "item2",
                        child: Text("item2"),
                      ),
                      PopupMenuItem(
                        value: "item3",
                        child: Text("item3"),
                      ),
                      PopupMenuItem(
                        value: "item4",
                        child: Text("item4"),
                      ),
                      PopupMenuItem(
                        value: "item5",
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.map,
                              color: Colors.pink,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text("item5"),
                          ],
                        ),
                      ),
                    ]),
          ],
          expandedHeight: 252,
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 1.5,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 9)],
                child: Text('Grid Item $index'),
              );
            },
            childCount: 10,
          ),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 1.5,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 9)],
                child: Text('Grid Item $index'),
              );
            },
            childCount: 10,
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(<Widget>[
            Text("text"),
            Icon(
              Icons.map,
              color: Colors.red,
            ),
          ]),
        ),
        SliverFixedExtentList(
          itemExtent: 50.0,
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: Text('List Item $index'),
              );
            },
            childCount: 10,
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.all(8),
        ),
        SliverPrototypeExtentList(
          prototypeItem: SizedBox(
            height: 20,
          ), //item的高度
          delegate: SliverChildBuilderDelegate((content, index) {
            return Container(
              color: Colors.primaries[index % Colors.primaries.length],
            );
          }, childCount: 50),
        ),
      ],
    );
  }
}
