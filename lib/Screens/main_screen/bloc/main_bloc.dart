import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainInitial()) {
    on<NavigationbarBuilder>(navigationbarBuilder);
    on<NavigationOnOff>(navigationOnOff);
  }

  FutureOr<void> navigationbarBuilder(
      NavigationbarBuilder event, Emitter<MainState> emit) {
    emit(NavigationbarBuilderState());
  }

  FutureOr<void> navigationOnOff(
      NavigationOnOff event, Emitter<MainState> emit) {
    emit(NavigationOnOffState());
  }
}
