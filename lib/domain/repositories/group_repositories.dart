import 'package:world_cup_2022_group_stage/domain/models/groups_model.dart';
import 'package:world_cup_2022_group_stage/data/data_sources/groups_data_source.dart';

class GroupsRepository {
  GroupsRepository({required this.remoteDataSource});

  final GroupsDataSource remoteDataSource;

  Future<List<GroupModel>> getGroupModels() async {
    return remoteDataSource.getGroups();
  }
}
