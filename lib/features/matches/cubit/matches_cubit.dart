import 'package:bloc/bloc.dart';
import 'package:world_cup_2022_group_stage/app/core/enums.dart';
import 'package:world_cup_2022_group_stage/domain/models/matches.model.dart';
import 'package:world_cup_2022_group_stage/domain/repositories/matches_repositories.dart';
part 'matches_state.dart';

class MatchesCubit extends Cubit<MatchesState> {
  MatchesCubit({required this.matchesRepository}) : super(MatchesState());

  final MatchesRepository matchesRepository;

  Future<void> maatchesData({required String groupStage}) async {
    emit(
      MatchesState(
        status: Status.loading,
      ),
    );

    try {
      final showMatches = await matchesRepository.getMatchModels(groupStage);
      emit(
        MatchesState(
          status: Status.success,
          showMatches: showMatches,
        ),
      );
    } catch (error) {
      emit(
        MatchesState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
