import 'package:flutter/material.dart';
import 'package:riverpodexample/secondscreen.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  final providerName = StateProvider<int>((ref) => 0);
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      body: Center(
        child: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen()));
          },
        )
      ),
    );
  }
}

