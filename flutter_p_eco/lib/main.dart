import 'package:flutter/material.dart';
import 'package:flutter_p_eco/pages/cartScreen.dart';
import 'package:flutter_p_eco/pages/mainScreen.dart';
import 'package:flutter_p_eco/pages/productsDetails.dart';
import 'package:flutter_p_eco/pages/themain.dart';
import 'package:flutter_p_eco/providers/cartp.dart';
import 'package:flutter_p_eco/providers/productsp.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => Products()),
        ChangeNotifierProvider(create: (BuildContext context) => Cart()),
      
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(colorSchemeSeed: Colors.pinkAccent),
     
        home:  MainScreen(),
        routes: {
          HomeScreen.id: (c) => HomeScreen(),
          DetailsScreen.id: (c) => DetailsScreen(),
          CartScreen.id: (c) => CartScreen(),
        
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScreen();
  }
}
