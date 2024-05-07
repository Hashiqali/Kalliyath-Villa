import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'password_event.dart';
part 'password_state.dart';

class PasswordBloc extends Bloc<PasswordEvent, PasswordState> {
  PasswordBloc() : super(PasswordInitial()) {
    on<OldpassEvent>(oldpassEvent);
    on<NewpassEvent>(newpassEvent);
    on<NewConfirmpassEvent>(newConfirmpassEvent);
  }

  FutureOr<void> oldpassEvent(OldpassEvent event, Emitter<PasswordState> emit) {
    if (event.istrue == false) {
      emit(OldpassEventState(istrue: true));
    } else if (event.istrue == true) {
      emit(OldpassEventState(istrue: false));
    }
  }

  FutureOr<void> newpassEvent(NewpassEvent event, Emitter<PasswordState> emit) {
    if (event.istrue == false) {
      emit(NewpassEventState(istrue: true));
    } else if (event.istrue == true) {
      emit(NewpassEventState(istrue: false));
    }
  }

  FutureOr<void> newConfirmpassEvent(
      NewConfirmpassEvent event, Emitter<PasswordState> emit) {
    if (event.istrue == false) {
      emit(NewConfirmpassEventState(istrue: true));
    } else if (event.istrue == true) {
      emit(NewConfirmpassEventState(istrue: false));
    }
  }
}
