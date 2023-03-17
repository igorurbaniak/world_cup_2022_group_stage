import 'package:world_cup_2022_group_stage/data/data_sources/matches_data_source.dart';
import 'package:world_cup_2022_group_stage/domain/models/matches.model.dart';

class MatchesRepository {
  MatchesRepository({required this.remoteDataSource});

  final MatchesDataSource remoteDataSource;

  Future<List<MatchModel>> getMatchModels(String group) async {
    final allMatches = await remoteDataSource.getMatches();

    return allMatches.where((match) => match.groupStage == group).toList();

  }
}
