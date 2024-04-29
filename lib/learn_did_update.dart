import 'package:flutter/material.dart';

class MyDidUPdateTestWidget extends StatefulWidget {
  final String title;

  const MyDidUPdateTestWidget({super.key, required this.title});

  @override
  _MyDidUPdateTestWidgetState createState() => _MyDidUPdateTestWidgetState();
}

class _MyDidUPdateTestWidgetState extends State<MyDidUPdateTestWidget> {
  @override
  void didUpdateWidget(MyDidUPdateTestWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.title != oldWidget.title) {
      print(
          "yestai cha jindagi chalirako cha ${widget.title} ra yo chai purano ho ${oldWidget.title}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.title),
      ],
    );
  }
}

class TestWidget extends StatefulWidget {
  const TestWidget({super.key});

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  String _oldText = "Siuu! Krishna Ronaldo";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('didUpdateWidget Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MyDidUPdateTestWidget(title: _oldText),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _oldText = 'Sdasd';
                    });
                  },
                  child: const Text("change value")),
            )
          ],
        ),
      ),
    );
  }
}
