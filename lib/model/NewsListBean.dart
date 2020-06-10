class NewsListBean {
  int code;
  String message;
  List<NewsListItemInfo> result;

  NewsListBean({this.code, this.message, this.result});

  NewsListBean.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['result'] != null) {
      result = new List<NewsListItemInfo>();
      json['result'] as List ..forEach((v) {
        print(v);
        result.add(new NewsListItemInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.result != null) {
      data['result'] = this.result.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NewsListItemInfo {
  String path;
  String image;
  String title;
  String passtime;

  NewsListItemInfo({this.path, this.image, this.title, this.passtime});

  NewsListItemInfo.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    image = json['image'];
    title = json['title'];
    passtime = json['passtime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['path'] = path;
    data['image'] = image;
    data['title'] = title;
    data['passtime'] = passtime;
  }
}
