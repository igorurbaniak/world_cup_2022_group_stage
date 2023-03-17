import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:world_cup_2022_group_stage/domain/models/groups_model.dart';

part 'groups_data_source.g.dart';

@RestApi(baseUrl: "https://my-json-server.typicode.com/igorurbaniak/world-cup-2022")
abstract class GroupsDataSource {
  factory GroupsDataSource(Dio dio, {String baseUrl}) = _GroupsDataSource;

  @GET("/groups")
  Future<List<GroupModel>> getGroups();
}