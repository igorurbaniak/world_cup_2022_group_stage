import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:world_cup_2022_group_stage/domain/models/matches.model.dart';


part 'matches_data_source.g.dart';

@RestApi(baseUrl: "https://my-json-server.typicode.com/igorurbaniak/world-cup-2022")
abstract class MatchesDataSource {
  factory MatchesDataSource(Dio dio, {String baseUrl}) = _MatchesDataSource;

  @GET("/matches")
  Future<List<MatchModel>> getMatches();
}