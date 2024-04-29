import 'package:flutter/material.dart';
import 'dart:developer' as dev;

class NewWidget extends StatefulWidget {
  const NewWidget({super.key});

  @override
  State<NewWidget> createState() => _NewWidgetState();
}

class _NewWidgetState extends State<NewWidget> {
  int _counter = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    dev.log("k cha sathi haru");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Learning Inherited Widgets"),
      ),
      body: Counter(
        count: _counter,
        child: Center(
          child: Column(
            children: [
              const CustomTextWidget(),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _counter++;
                    });
                  },
                  child: const Text("Increase value"))
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextWidget extends StatefulWidget {
  const CustomTextWidget({
    super.key,
  });

  @override
  State<CustomTextWidget> createState() => _CustomTextWidgetState();
}

class _CustomTextWidgetState extends State<CustomTextWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    dev.log("asds");
  }

  @override
  Widget build(BuildContext context) {
    final count = Counter.of(context)?.count;
    return Text("No of times button was clicked: $count");
  }
}

class Counter extends InheritedWidget {
  ///num of times button is clicked.
  final int count;

  const Counter({required this.count, super.key, required super.child});

  static Counter? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Counter>();
  }

  @override
  bool updateShouldNotify(covariant Counter oldWidget) {
    return oldWidget.count != count;
  }
}
