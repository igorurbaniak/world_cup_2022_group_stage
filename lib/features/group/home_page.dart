import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_cup_2022_group_stage/app/core/enums.dart';
import 'package:world_cup_2022_group_stage/app/injection_container.dart';
import 'package:world_cup_2022_group_stage/domain/models/groups_model.dart';
import 'package:world_cup_2022_group_stage/features/group/cubit/group_cubit.dart';
import 'package:world_cup_2022_group_stage/features/matches/matches_page.dart';
import 'package:world_cup_2022_group_stage/utils/extensions.dart';

class GroupPage extends StatelessWidget {
  const GroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<GroupCubit>(
        create: (context) => getIt()..start(),
        child: BlocBuilder<GroupCubit, GroupState>(
          builder: (context, state) {
            switch (state.status) {
              case Status.initial:
                return const Center(
                  child: Text('Initial state'),
                );
              case Status.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case Status.success:
                return Center(
                  child: GridView.count(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    primary: false,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    children: [
                      for (final group in state.showGroups)
                        _GroupsWidget(
                          model: group,
                        ),
                    ],
                  ),
                );
              case Status.error:
                return Center(
                  child: Text(
                    state.errorMessage ?? 'Unknown error',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}

class _GroupsWidget extends StatelessWidget {
  const _GroupsWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final GroupModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => MatchesPage(groupName: model),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: '#ACDBFF'.toColor()),
              width: 130,
              height: 130,
              child: Center(
                child: Text(
                  model.groupName,
                  style: GoogleFonts.secularOne(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
