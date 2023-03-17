// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matches.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchModel _$MatchModelFromJson(Map<String, dynamic> json) => MatchModel(
      round: json['round'] as String,
      groupStage: json['group'] as String,
      date: json['date'] as String,
      team1: json['team1'] as String,
      team2: json['team2'] as String,
      picture1: json['picture1'] as String,
      picture2: json['picture2'] as String,
    );

Map<String, dynamic> _$MatchModelToJson(MatchModel instance) =>
    <String, dynamic>{
      'round': instance.round,
      'group': instance.groupStage,
      'date': instance.date,
      'team1': instance.team1,
      'team2': instance.team2,
      'picture1': instance.picture1,
      'picture2': instance.picture2,
    };
