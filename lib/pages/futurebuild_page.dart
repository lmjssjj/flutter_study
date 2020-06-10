import 'package:async/async.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class FutureBuilderWidget extends StatefulWidget {
  @override
  FutureBuilderState createState() => FutureBuilderState();
}

class FutureBuilderState extends State<FutureBuilderWidget> {
  AsyncMemoizer _memoizer = AsyncMemoizer(); // async: ^2.4.1  很容易地只运行一次按需异步操作（缓存数据）
  _getData() {
    return _memoizer.runOnce(() async {
//      return await HttpUtil()
//          .get('http://rap2api.taobao.org/app/mock/162762/skill/dragoon');
      return await Dio().get("http://www.google.cn");
    });
  }

  Future _refreshData() async {
    setState(() {
      _memoizer = AsyncMemoizer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("future builder"),
      ),
      body: RefreshIndicator(
          child: FutureBuilder(
              future: _getData(),//加载数据
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    print('还没有开始网络请求');
                    return Text('还没有开始网络请求');
                    break;
                  case ConnectionState.active:
                    print('active');
                    return Text('ConnectionState.active');
                    break;
                  case ConnectionState.waiting:
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                    break;
                  case ConnectionState.done:
                    print('done');
                    if (snapshot.hasError)
                      return Text('Error: ${snapshot.error}');
                    print(snapshot.data);
                    return SingleChildScrollView(
                        child: Text(snapshot.data.toString()));
                  default:
                    return Text('还没有开始网络请求');
                }
              }),
          onRefresh: _refreshData
      ),
    );
  }
}
