import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key, required this.id, required this.name}) : super(key: key);
  static const routeName = '/detail';
  final String id;
  final String name;

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
        child: Text(widget.id),
      ),
    );
  }
}
