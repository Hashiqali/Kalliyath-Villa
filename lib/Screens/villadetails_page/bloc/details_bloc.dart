import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc() : super(DetailsInitial()) {
    on<Likebuttonclick>(likebuttonclick);
    on<Starbuilder>(starbuilder);
    on<Reviewbuilder>(reviewbuilder);
    on<VillaDetailsbuilder>(villaDetailsbuilder);
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
      Reviewbuilder event, Emitter<DetailsState> emit) {
    emit(ReviewbuilderState());
  }

  FutureOr<void> villaDetailsbuilder(
      VillaDetailsbuilder event, Emitter<DetailsState> emit) {
    emit(VillaDetailsbuilderState());
  }
}
