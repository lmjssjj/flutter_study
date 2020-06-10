import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  @override
  _TextFieldState createState() => _TextFieldState();
}

class _TextFieldState extends State<TextFieldWidget> {
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      print(_controller.value.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextField"),
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              textInputAction: TextInputAction.none,
              onSubmitted: (value) {
                print("onSubmitted:$value");
              },
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                ),
                labelText: "this is label text",
                hintText: "this is hint text",
                helperText: "this is helper text",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
