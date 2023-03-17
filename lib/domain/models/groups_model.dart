import 'package:json_annotation/json_annotation.dart';

part 'groups_model.g.dart';

@JsonSerializable()
class GroupModel {
  const GroupModel({
    required this.groupName,
    required this.teams,
  });

  @JsonKey(name: 'name')
  final String groupName;

  final List<dynamic> teams;

  factory GroupModel.fromJson(Map<String, dynamic> json) => _$GroupModelFromJson(json);

    Map<String, dynamic> toJson() => _$GroupModelToJson(this);
}
