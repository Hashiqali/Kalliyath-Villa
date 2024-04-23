import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:kalliyath_villa/firebase/get_functions.dart';
import 'package:meta/meta.dart';

part 'saved_event.dart';
part 'saved_state.dart';

class SavedBloc extends Bloc<SavedEvent, SavedState> {
  SavedBloc() : super(SavedInitial()) {
    on<Savedbuild>(savedbuild);
  }

  FutureOr<void> savedbuild(Savedbuild event, Emitter<SavedState> emit) async {
    final data = await getSavedDetails();
    emit(SavedbuildState(saveddetails: data));
  }
}
