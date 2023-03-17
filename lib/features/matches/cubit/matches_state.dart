part of 'matches_cubit.dart';

class MatchesState {
   MatchesState({
    this.showMatches = const [],
    this.status = Status.initial,
    this.errorMessage,
  });

  final List<MatchModel> showMatches;
  final Status status;
  final String? errorMessage;
}
