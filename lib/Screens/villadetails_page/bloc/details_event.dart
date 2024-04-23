part of 'details_bloc.dart';

@immutable
sealed class DetailsEvent {}

class Likebuttonclick extends DetailsEvent {
  final bool istrue;

  Likebuttonclick({required this.istrue});
}

class Starbuilder extends DetailsEvent {}

class Reviewbuilder extends DetailsEvent {}
class VillaDetailsbuilder extends DetailsEvent {}

