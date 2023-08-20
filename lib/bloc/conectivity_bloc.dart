

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';


import 'package:flutter_conectivity_bloc/bloc/concectivity_event.dart';
import 'package:flutter_conectivity_bloc/bloc/conectivity_state.dart';

class InternetBloc extends Bloc<InternetEvent,InternetState>{
  StreamSubscription? _sub;
  Connectivity _connect = Connectivity();
  InternetBloc():super(InternetInitialState()){
    on<InternetGainedEvent>((event, emit) =>emit(InternetGainedState()) );
    on<InternetLostEvent>(((event, emit) => emit(InternetLostState())));
    _sub = _connect.onConnectivityChanged.listen((result) {
      if(result == ConnectivityResult.mobile||result == ConnectivityResult.wifi) {
      add(InternetGainedEvent());
    }
    else {
      add(InternetLostEvent());
    } });

    }
  @override
  Future<void> close() {
    _sub?.cancel();
    return super.close();
  }

}




