import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:kalliyath_villa/firebase/functions.dart';
import 'package:kalliyath_villa/firebase/get_functions.dart';
import 'package:meta/meta.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc() : super(DetailsInitial()) {
    on<Likebuttonclick>(likebuttonclick);
    on<Starbuilder>(starbuilder);
    on<Reviewbuilder>(reviewbuilder);
    on<VillaDetailsbuilder>(villaDetailsbuilder);
    on<ReviewaddLoader>(reviewaddLoader);
    on<ReviewBoxbuilder>(reviewBoxbuilder);
  }

  FutureOr<void> likebuttonclick(
      Likebuttonclick event, Emitter<DetailsState> emit) {
    if (event.istrue == true) {
      emit(LikebuttonclickState1());
    } else if (event.istrue == false) {
      emit(LikebuttonclickState2());
    }
  }

  FutureOr<void> starbuilder(Starbuilder event, Emitter<DetailsState> emit) {
    emit(StarbuilderState());
  }

  FutureOr<void> reviewbuilder(
      Reviewbuilder event, Emitter<DetailsState> emit) async {
    emit(ReviewLoaderState());
    final find = await getfirebasedetails('VillaDetails');
    final found = find.firstWhere((element) => element['id'] == event.id);
    emit(ReviewbuilderState(viiladetails: found));
  }

  FutureOr<void> villaDetailsbuilder(
      VillaDetailsbuilder event, Emitter<DetailsState> emit) {
    emit(VillaDetailsbuilderState());
  }

  FutureOr<void> reviewaddLoader(
      ReviewaddLoader event, Emitter<DetailsState> emit) {
    emit(ReviewaddLoaderState());
  }

  FutureOr<void> reviewBoxbuilder(
      ReviewBoxbuilder event, Emitter<DetailsState> emit) {
    final data = villaDetails.firstWhere(
      (element) => element['id'] == event.details['id'],
      orElse: () => {},
    );
    emit(ReviewBoxbuilderState(details: data));
  }
}
