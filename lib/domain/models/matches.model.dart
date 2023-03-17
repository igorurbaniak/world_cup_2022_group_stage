import 'package:json_annotation/json_annotation.dart';

part 'matches.model.g.dart';

@JsonSerializable()
class MatchModel {
  const MatchModel({
    required this.round,
    required this.groupStage,
    required this.date,
    required this.team1,
    required this.team2,
    required this.picture1,
    required this.picture2,
  });

  final String round;

  @JsonKey(name: 'group')
  final String groupStage;

  final String date;
  final String team1;
  final String team2;
  final String picture1;
  final String picture2;

    factory MatchModel.fromJson(Map<String, dynamic> json) => _$MatchModelFromJson(json);

    Map<String, dynamic> toJson() => _$MatchModelToJson(this);
}
