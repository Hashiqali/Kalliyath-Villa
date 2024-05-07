part of 'details_bloc.dart';

@immutable
sealed class DetailsEvent {}

class Likebuttonclick extends DetailsEvent {
  final bool istrue;

  Likebuttonclick({required this.istrue});
}

class Starbuilder extends DetailsEvent {}

class Reviewbuilder extends DetailsEvent {
  final String id;

  Reviewbuilder({required this.id});
}

class VillaDetailsbuilder extends DetailsEvent {}

class ReviewaddLoader extends DetailsEvent {}
class ReviewBoxbuilder extends DetailsEvent {
   final Map<String, dynamic> details;

  ReviewBoxbuilder({required this.details});
}
