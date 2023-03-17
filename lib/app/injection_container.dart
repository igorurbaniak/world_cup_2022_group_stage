import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:world_cup_2022_group_stage/data/data_sources/groups_data_source.dart';
import 'package:world_cup_2022_group_stage/data/data_sources/matches_data_source.dart';
import 'package:world_cup_2022_group_stage/domain/repositories/group_repositories.dart';
import 'package:world_cup_2022_group_stage/domain/repositories/matches_repositories.dart';
import 'package:world_cup_2022_group_stage/features/group/cubit/group_cubit.dart';
import 'package:world_cup_2022_group_stage/features/matches/cubit/matches_cubit.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  getIt.registerFactory(() => GroupCubit(groupsRepository: getIt()));
  getIt.registerFactory(() => MatchesCubit(matchesRepository: getIt()));

  getIt.registerFactory(() => GroupsRepository(remoteDataSource: getIt()));
  getIt.registerFactory(() => MatchesRepository(remoteDataSource: getIt()));

  getIt.registerFactory(() => GroupsDataSource(Dio()));
  getIt.registerFactory(() => MatchesDataSource(Dio()));
}
