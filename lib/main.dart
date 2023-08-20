import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conectivity_bloc/Screen.dart';
import 'package:flutter_conectivity_bloc/bloc/conectivity_bloc.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _scaffoldkey = GlobalKey<ScaffoldMessengerState>();
    return BlocProvider(create: (BuildContext context) => InternetBloc(),

    child: MaterialApp(
      scaffoldMessengerKey: _scaffoldkey,
      home: connectivitywidget(),
    ),

    );
  }
}
