import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/home_screen/functions.dart';
import 'package:kalliyath_villa/firebase/get_functions.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<Homerebuild>(homerebuild);
    on<Likebutton>(likebutton);
    on<Gridbuilder>(gridbuilder);
    on<Gridlikebutton>(gridlikebutton);
    on<SearchGridbuilder>(searchGridbuilder);
    on<FilterGridbuilder>(filterGridbuilder);
  }

  FutureOr<void> homerebuild(Homerebuild event, Emitter<HomeState> emit) async {
    await getVillaDetails();
   final data= await  villafiltered(villaDetails);
    emit(HomerebuildState(vllaDetails: data));
  }

  FutureOr<void> likebutton(Likebutton event, Emitter<HomeState> emit) {
    if (event.istrue == false) {
      emit(LikebuttonOnState());
    } else if (event.istrue == true) {
      emit(LikebuttonOffState());
    }
  }

  FutureOr<void> gridbuilder(Gridbuilder event, Emitter<HomeState> emit) async {
    await getVillaDetails();
  }

  FutureOr<void> gridlikebutton(
      Gridlikebutton event, Emitter<HomeState> emit) async {
    if (event.istrue == true) {
      emit(GridlikebuttonclikedState(istrue: false));
    } else if (event.istrue == false) {
      emit(GridlikebuttonclikedState(istrue: true));
    }
  }

  FutureOr<void> searchGridbuilder(
      SearchGridbuilder event, Emitter<HomeState> emit) {
    emit(SearchGridbuilderState(filtereditems: event.filtereditems));
  }

  FutureOr<void> filterGridbuilder(
      FilterGridbuilder event, Emitter<HomeState> emit) {
    emit(FilterGridbuilderState(filtereditems: event.filtereditems));
  }
}
