import 'package:flutter/material.dart';

import 'artists.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: Drawer(
        child: Column(
          children:  [
            const SizedBox(
              height: 80,
            ),
            const ListTile(
              title: Text('Home'),
              selected: true,
            ),
            ListTile(
              title: const Text('Artists'),
              onTap: () => Navigator.pushReplacementNamed(context, Artists.routeName),
            ),
          ],
        ),
      ),
      body: Container(),
    );
  }
}
