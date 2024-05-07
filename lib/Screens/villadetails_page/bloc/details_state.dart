part of 'details_bloc.dart';

@immutable
sealed class DetailsState {}

final class DetailsInitial extends DetailsState {}

class LikebuttonclickState1 extends DetailsState {}

class LikebuttonclickState2 extends DetailsState {}

class StarbuilderState extends DetailsState {}

class ReviewbuilderState extends DetailsState {
  final Map<String, dynamic> viiladetails;

  ReviewbuilderState({required this.viiladetails});
}

class ReviewLoaderState extends DetailsState {}

class VillaDetailsbuilderState extends DetailsState {}

class ReviewaddLoaderState extends DetailsState {}

class ReviewBoxbuilderState extends DetailsState {
  final Map<String, dynamic> details;

  ReviewBoxbuilderState({required this.details});
}
