import 'package:bloc/bloc.dart';
import 'package:world_cup_2022_group_stage/app/core/enums.dart';
import 'package:world_cup_2022_group_stage/domain/models/groups_model.dart';
import 'package:world_cup_2022_group_stage/domain/repositories/group_repositories.dart';

part 'group_state.dart';

class GroupCubit extends Cubit<GroupState> {
  GroupCubit({required this.groupsRepository}) : super(GroupState());

  final GroupsRepository groupsRepository;

  Future<void> start() async {
    emit(
      GroupState(
        status: Status.loading,
      ),
    );

    try {
      final showGroups = await groupsRepository.getGroupModels();
      emit(
        GroupState(status: Status.success, showGroups: showGroups),
      );
    } catch (error) {
      emit(
        GroupState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}

