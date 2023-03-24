import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home.dart';

class Artists extends StatefulWidget {
  static const routeName = '/artists';

  const Artists({Key? key}) : super(key: key);

  @override
  State<Artists> createState() => _ArtistsState();
}

class _ArtistsState extends State<Artists> {
  List _items = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/artists.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["items"];
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Artists'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Home.routeName),
            ),
            const ListTile(
              title: Text('Artists'),
              selected: true,
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Colors.green,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  '/detail',
                  arguments: {
                    'about': _items[index]['about'],
                    'name': _items[index]['name']
                  },
                );
              },
              child: Text(
                _items[index]['name'],
                style: const TextStyle(fontSize: 20),
              ),
            ),
          );
        },
      ),
    );
  }
}
