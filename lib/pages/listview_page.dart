import 'dart:convert';

import 'package:async/async.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappstudy/model/NewsListBean.dart';
import 'package:flutterappstudy/pages/webview_page.dart';
import 'package:flutterappstudy/utils/ApiContants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ListViewWiget extends StatefulWidget {
  @override
  ListViewState createState() => ListViewState();
}

class ListViewState extends State<ListViewWiget> {
  AsyncMemoizer _memoizer = AsyncMemoizer();

  _getData() {
    return _memoizer.runOnce(() async {
      return await Dio().get(ApiContants.news_url);
    });
  }

  Future _refresh() async {
    setState(() {
//      _memoizer = AsyncMemoizer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
      ),
      body: RefreshIndicator(
          child: FutureBuilder(
              future: _getData(),
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
//                    print(snapshot.data);
                    return _creatListWidget(context, snapshot);
                    break;
                  default:
                    return Text('还没有开始网络请求');
                    break;
                }
              }),
          onRefresh: _refresh),
    );
  }

  _creatListWidget(BuildContext context, AsyncSnapshot snapshot) {
    Response response = snapshot.data;
    var entity;
    if (response.data is! Map) {
      entity = json.decode(response.data);
    } else {
      entity = response.data;
    }
    NewsListBean bean = NewsListBean.fromJson(entity);
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
//              print(bean.result[index].path);
                Navigator.push(context, MaterialPageRoute(
                  builder: (context){
                    return WebViewWidget(url: bean.result[index].path);
                  },
                ));
          },
          child: _itemBuilder(context, index, bean.result[index]),
        );
//        return _itemBuilder(context, index, bean.result[index]);
      },
      itemCount: bean.result.length,
    );
  }

  Widget _itemBuilder(BuildContext context, int index, NewsListItemInfo info) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: info.image,
            width: 140,
            height: 88,
            placeholder: (context, url) => ImageLoadingWidget(
                // backgroundColor: Colors.pink,
                ),
            errorWidget: (context, url, error) => ErrorWidget(),
            fit: BoxFit.cover,
          ),
//          Image.network(
//            info.image,
//            fit: BoxFit.cover,
//          ),
          new Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      info.title,
                      maxLines: 2,
                      textAlign: TextAlign.left,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    )),
                SizedBox(
                  height: 16,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(info.passtime),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ImageLoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 88,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class ErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 88,
      child: Center(
        child: Icon(Icons.error),
      ),
    );
  }
}
