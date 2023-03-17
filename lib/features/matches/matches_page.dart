import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_cup_2022_group_stage/app/core/enums.dart';
import 'package:world_cup_2022_group_stage/app/injection_container.dart';
import 'package:world_cup_2022_group_stage/domain/models/groups_model.dart';
import 'package:world_cup_2022_group_stage/domain/models/matches.model.dart';
import 'package:world_cup_2022_group_stage/features/matches/cubit/matches_cubit.dart';
import 'package:world_cup_2022_group_stage/utils/extensions.dart';

class MatchesPage extends StatelessWidget {
  const MatchesPage({
    super.key,
    required this.groupName,
  });

  final GroupModel groupName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          groupName.groupName,
          style: GoogleFonts.secularOne(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: '#ACDBFF'.toColor(),
      ),
      body: BlocProvider<MatchesCubit>(
        create: (context) =>
            getIt()..maatchesData(groupStage: groupName.groupName),
        child: BlocBuilder<MatchesCubit, MatchesState>(
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
                if (state.showMatches.isEmpty) {
                  return const Center(
                    child: Text('No matches for now'),
                  );
                }
                return ListView(
                  children: [
                    const SizedBox(height: 40),
                    const Center(
                      child: Text(
                        'Group Stage',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 5),
                    _ListOfTeams(groupModel: groupName),
                    const SizedBox(height: 50),
                    const Center(
                      child: Text(
                        '⚽ Upcoming Matches 🙌',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 5),
                    for (final match in state.showMatches)
                      _MatchesWidget(matchModel: match),
                  ],
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

class _MatchesWidget extends StatelessWidget {
  const _MatchesWidget({
    Key? key,
    required this.matchModel,
  }) : super(key: key);

  final MatchModel matchModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 100,
          margin: const EdgeInsets.fromLTRB(15, 8, 15, 8),
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
          decoration: BoxDecoration(
              color: const Color.fromRGBO(48, 79, 242, 0.16),
              borderRadius: BorderRadius.circular(10.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              BoxTeam(
                team: matchModel.team1,
                imageUrl: matchModel.picture1,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    matchModel.round,
                    style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    matchModel.date,
                    style: TextStyle(color: Colors.grey[700], fontSize: 16),
                  ),
                ],
              ),
              BoxTeam(
                team: matchModel.team2,
                imageUrl: matchModel.picture2,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ListOfTeams extends StatelessWidget {
  const _ListOfTeams({
    Key? key,
    required this.groupModel,
  }) : super(key: key);

  final GroupModel groupModel;

  @override
  Widget build(BuildContext context) {
    List<int> number = [1, 2, 3, 4];

    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: groupModel.teams.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 5,
          ),
          child: InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: '#FFC395'.toColor()),
              height: 60,
              width: 60,
              padding: const EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 5,
              ),
              child: Center(
                child: Text(
                  '${number[index]}. ${groupModel.teams[index]}',
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class BoxTeam extends StatelessWidget {
  const BoxTeam({super.key, required this.team, required this.imageUrl});

  final String team;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.network(
            imageUrl,
            width: 40,
            height: 40,
            alignment: Alignment.centerLeft,
          ),
          const SizedBox(height: 8),
          AutoSizeText(
            team,
            style: TextStyle(
              color: '#223843'.toColor(),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
