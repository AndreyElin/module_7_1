import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  static const routeName = '/detail';
  final String about;
  final String name;

  const Detail({Key? key, required this.about, required this.name})
      : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Center(
        child: Text(widget.about),
      ),
    );
  }
}
