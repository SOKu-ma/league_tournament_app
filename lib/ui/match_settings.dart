import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectionsToggleLeagueProvider = StateProvider((ref) => true);
final selectionsToggleTournamentProvider = StateProvider((ref) => false);
final selectedIndexProvider = StateProvider((ref) => 0);

class MatchSettings extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final currentedIndex = watch(selectedIndexProvider);

    final leagueFlg = watch(selectionsToggleLeagueProvider);
    final tournamentFlg = watch(selectionsToggleTournamentProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Match Settings')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(30),
            margin: EdgeInsets.all(30),
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Column(
              children: [
                Container(
                  child: ToggleButtons(
                    children: [
                      Container(child: Text('リーグ'), padding: EdgeInsets.all(5)),
                      Container(
                          child: Text('トーナメント'), padding: EdgeInsets.all(5)),
                    ],
                    // isSelected: selectionFlg.state,
                    isSelected: [leagueFlg.state, tournamentFlg.state],
                    onPressed: (int index) {
                      for (int cnt = 0; cnt < 2; cnt++) {
                        if (index == cnt) {
                          if (index == 0) {
                            leagueFlg.state = true;
                            tournamentFlg.state = false;
                          } else {
                            leagueFlg.state = false;
                            tournamentFlg.state = true;
                          }
                        }
                      }
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextField(
                    decoration: InputDecoration(hintText: 'リーグ名 or トーナメント名'),
                    keyboardType: TextInputType.text,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 50),
                  child: ElevatedButton(
                      child: Text('OK ${currentedIndex.state}'),
                      onPressed: () {
                        currentedIndex.state++;
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
