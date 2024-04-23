import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<PriceBuilder>(priceBuilder);
    on<Checkboxbulder>(checkboxbulder);
    on<BhkBuilder>(bhkBuilder);
    on<VisibleBuilder>(visibleBuilder);
    on<NotVisibleBuilder>(notVisibleBuilder);
  }

  FutureOr<void> priceBuilder(PriceBuilder event, Emitter<SearchState> emit) {
    emit(PriceBuilderState());
  }

  FutureOr<void> checkboxbulder(
      Checkboxbulder event, Emitter<SearchState> emit) {
    if (event.istrue == false) {
      emit(CheckboxbulderclickedState());
    } else if (event.istrue == true) {
      emit(CheckboxbulderclickState());
    }
  }

  FutureOr<void> bhkBuilder(BhkBuilder event, Emitter<SearchState> emit) {
    emit(BhkBuilderState());
  }

  FutureOr<void> visibleBuilder(
      VisibleBuilder event, Emitter<SearchState> emit) {
    emit(VisibleBuilderState());
  }

  FutureOr<void> notVisibleBuilder(
      NotVisibleBuilder event, Emitter<SearchState> emit) {
    emit(NotVisibleBuilderState());
  }
}
