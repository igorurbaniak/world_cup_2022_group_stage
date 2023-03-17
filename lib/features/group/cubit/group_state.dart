part of 'group_cubit.dart';

class GroupState {
  GroupState({
    this.showGroups = const [],
    this.status = Status.initial,
    this.errorMessage,
  });

  final List<GroupModel> showGroups;
  final Status status;
  final String? errorMessage;
}