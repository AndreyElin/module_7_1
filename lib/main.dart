import 'package:flutter/material.dart';
import 'package:module_7_1/screen/artists.dart';
import 'package:module_7_1/screen/detail.dart';
import 'package:module_7_1/screen/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (BuildContext context) {
          return const NotFound();
        });
      },
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case Home.routeName:
            return MaterialPageRoute(builder: (BuildContext context) {
              return const Home();
            });
          case Artists.routeName:
            return MaterialPageRoute(builder: (BuildContext context) {
              return const Artists();
            });
          case Detail.routeName:
            final args = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(builder: (BuildContext context) {
              if (args.containsKey('about')) {
                return Detail(about: args['about'], name: args['name']);
              }
              return const NotFound();
            });
          default:
            return MaterialPageRoute(builder: (BuildContext context) {
              return const NotFound();
            });
        }
      },
      home: const Home(),
    );
  }
}

class NotFound extends StatelessWidget {
  const NotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Not found page'),
      ),
    );
  }
}
