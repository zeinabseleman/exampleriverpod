
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final providerData = FutureProvider<String>((ref) => fetchData());

Future<String> fetchData() async{
 // await Future.delayed(Duration(seconds: 2));
 var response = await http.get('https://jsonplaceholder.typicode.com/posts');
  print(response.body);
  var data = jsonDecode(response.body);
  return data[0]['body'];
}
class SecondScreen extends ConsumerWidget {

  @override
  Widget build(BuildContext context,watch) {
    final data = watch(providerData);
    return Scaffold(
        appBar: AppBar(
          title: Text('test'),
        ),
        body: Center(
      child: Container(
        child: data.when(
      data: (String value) =>Text(value),
          loading:()=>CircularProgressIndicator(),
          error: (error,stack)=>Text('error')
        ),
      ),
    ));
  }
}
