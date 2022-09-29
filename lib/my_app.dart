import 'package:apitaller/Pages/Home_page.dart';
import 'package:flutter/material.dart';


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplicación de pokeApi',
      home: Center(
        child: MyHomeApp(),
      ),
    );
  }
}