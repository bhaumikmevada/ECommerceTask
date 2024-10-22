
import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'internet_state.dart';

class InternetCubit extends Cubit<InternetState>{

  late Connectivity connectivity;
  late StreamSubscription streamSubscription;

  InternetCubit({required this.connectivity}) :
      assert(connectivity != null), super(InternetLoading()){
    streamSubscription = connectivity.onConnectivityChanged.listen((event) {

      if(event == ConnectivityResult.wifi){

        emit(InternetConnected(connectionType: ConnectionType.wifi));
      }else if(event == ConnectionType.mobile){
        emit(InternetConnected(connectionType: ConnectionType.mobile));
      }
      else if(event != ConnectivityResult.none){
        emit(InternetDisConnected());
      }

    });
  }

  @override
  Future<void> close() {
    streamSubscription.cancel();
    return super.close();
  }

}