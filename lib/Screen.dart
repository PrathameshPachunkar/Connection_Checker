import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conectivity_bloc/bloc/concectivity_event.dart';
import 'package:flutter_conectivity_bloc/bloc/conectivity_bloc.dart';
import 'package:flutter_conectivity_bloc/bloc/conectivity_state.dart';

class connectivitywidget extends StatelessWidget {
  const connectivitywidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocConsumer<InternetBloc,InternetState>(
          builder: (context,state){
            if(state is InternetGainedState){
              return Text("Connected");
            }
            else if(state is InternetLostState){
              return Text("Not Connected");
            }
            else {
              return Text("Loading.....");
            }
          },
              listener: (context,state){
               if(state is InternetGainedState){
                  ScaffoldMessenger.of(context).showSnackBar(
                   SnackBar(content: Text("Connected"),
                   backgroundColor: Colors.green,
                   ),

                 );
               }
               else {
                 ScaffoldMessenger.of(context).showSnackBar(
                   SnackBar(content: Text("Not Connected"),
                     backgroundColor: Colors.red,
                   ),

                 );
               }

              }

        ),
        ),
      )
    );
  }
}
