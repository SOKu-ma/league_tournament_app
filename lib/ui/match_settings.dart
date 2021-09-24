import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:league_tournament_app/ui/tournament_table.dart';
import 'league_table.dart';

// リーグ戦 or トーナメント戦選択用
final selectionsToggleLeagueProvider = StateProvider((ref) => true);
final selectionsToggleTournamentProvider = StateProvider((ref) => false);
// リーグ戦ルール選択プルダウン用
final selectLeagurRuleProvider = StateProvider((ref) => '総当たり1回');
// トーナメント戦シード選択用
final switchSeedProvider = StateProvider((ref) => false);
// リーグ戦名テキストフィールド用
final textFieldLeagueProvider = StateProvider((ref) => '');
// 全チーム数テキストフィールド用
final textFieldLeagueAllTeamProvider = StateProvider((ref) => '2');
// トーナメント戦名テキストフィールド用
final textFieldTournamentProvider = StateProvider((ref) => '');
// リーグ戦決勝トーナメント選択用
final switchFinalRoundProvider = StateProvider((ref) => false);

class MatchSettings extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final leagueFlg = watch(selectionsToggleLeagueProvider);
    final tournamentFlg = watch(selectionsToggleTournamentProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Match Settings')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: ToggleButtons(
                    children: [
                      Container(
                          child: Text('リーグ'),
                          padding: EdgeInsets.only(left: 40, right: 40)),
                      Container(
                          child: Text('トーナメント'),
                          padding: EdgeInsets.only(left: 40, right: 40)),
                    ],
                    selectedColor: Colors.green,
                    textStyle: TextStyle(fontWeight: FontWeight.bold),
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
                if (leagueFlg.state)
                  _leagueColumn(context, watch)
                else
                  _tournamentColumn(context, watch),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// League選択時のカラム
_leagueColumn(BuildContext context, ScopedReader watch) {
  final dropDownValue = watch(selectLeagurRuleProvider);
  final textFieldLeague = watch(textFieldLeagueProvider);
  final textFieldLeagueAllTeam = watch(textFieldLeagueAllTeamProvider);

  final switchFinalRound = watch(switchFinalRoundProvider);

  // リーグ名用テキストフィールドコントローラ
  var _leagueTextFieldController =
      TextEditingController(text: textFieldLeague.state);

  // 全チーム数用テキストフィールドコントローラ
  var _leagueAllTeamTextFieldController =
      TextEditingController(text: textFieldLeagueAllTeam.state);

  return Column(
    children: [
      Container(
        padding: EdgeInsets.only(bottom: 5),
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
        child: TextFormField(
            decoration: InputDecoration(hintText: 'リーグ名（任意）'),
            keyboardType: TextInputType.text,
            controller: _leagueTextFieldController),
      ),
      Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Row(
          children: [
            Expanded(child: Text('全チーム数：')),
            Expanded(
              child: TextField(
                decoration: InputDecoration(hintText: '例：6'),
                controller: _leagueAllTeamTextFieldController,
              ),
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Row(
          children: [
            Expanded(child: Text('リーグ数：')),
            Expanded(
              child: TextField(decoration: InputDecoration(hintText: '例：1')),
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Row(
          children: [
            Expanded(child: Text('総当たり回数：')),
            Expanded(
              child: TextField(decoration: InputDecoration(hintText: '例：2')),
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 10),
        child: Row(
          children: [
            Expanded(child: Text('ルール：')),
            DropdownButton(
              value: dropDownValue.state,
              items: <String>['総当たり1回', '総当たり2回', '総当たり3回以上', '勝ち抜け']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                    value: value, child: Text(value));
              }).toList(),
              hint: Text('ルールを選択'),
              onChanged: (String? newValue) {
                dropDownValue.state = newValue!;
              },
            ),
          ],
        ),
      ),
      // Container(
      //   margin: EdgeInsets.only(left: 10, right: 10),
      //   child: Row(
      //     children: [
      //       Expanded(child: Text('決勝トーナメント：')),
      //       Expanded(
      //         child: Switch(
      //           value: switchFinalRound.state,
      //           onChanged: (value) {
      //             switchFinalRound.state = value;
      //           },
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Row(
          children: [
            Expanded(child: Text('ルール：')),
            Expanded(
              child: IconButton(
                  onPressed: () {}, icon: Icon(Icons.settings_sharp)),
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Row(
          children: [
            Expanded(child: Text('勝利：')),
            Expanded(
              child: IconButton(onPressed: () {}, icon: Icon(Icons.remove)),
            ),
            Expanded(
              child: TextField(decoration: InputDecoration(hintText: '例：6')),
            ),
            Expanded(
              child: IconButton(onPressed: () {}, icon: Icon(Icons.add)),
            ),
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.only(top: 50, bottom: 5),
        margin: EdgeInsets.only(bottom: 5),
        child: ElevatedButton(
          child: Text('OK'),
          onPressed: () {
            textFieldLeague.state = _leagueTextFieldController.text;
            textFieldLeagueAllTeam.state =
                _leagueAllTeamTextFieldController.text;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LeagueTable(),
                fullscreenDialog: true,
              ),
            );
          },
        ),
      ),
    ],
  );
}

// Tournament選択時のカラム
_tournamentColumn(BuildContext context, ScopedReader watch) {
  final dropDownValue = watch(selectLeagurRuleProvider);
  final switchValue = watch(switchSeedProvider);
  final textFieldTournament = watch(textFieldTournamentProvider);

  var _tournamentTextFieldController = TextEditingController();

  final leagueFlg = watch(selectionsToggleLeagueProvider);

  return Column(
    children: [
      Container(
        padding: EdgeInsets.only(bottom: 5),
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
        child: TextField(
          decoration: InputDecoration(hintText: 'トーナメント名（任意）'),
          keyboardType: TextInputType.text,
          controller: _tournamentTextFieldController,
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Row(
          children: [
            Expanded(child: Text('全チーム数：')),
            Expanded(
              child: TextField(decoration: InputDecoration(hintText: '例：6')),
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Row(
          children: [
            Expanded(child: Text('シードあり：')),
            Expanded(
              child: Switch(
                value: switchValue.state,
                onChanged: (value) {
                  switchValue.state = value;
                },
              ),
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Row(
          children: [
            Expanded(child: Text('総当たり回数：')),
            Expanded(
              child: TextField(decoration: InputDecoration(hintText: '例：2')),
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 10),
        child: Row(
          children: [
            Expanded(child: Text('ルール：')),
            DropdownButton(
              value: dropDownValue.state,
              items: <String>['総当たり1回', '総当たり2回', '総当たり3回以上', '勝ち抜け']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                    value: value, child: Text(value));
              }).toList(),
              hint: Text('ルールを選択'),
              onChanged: (String? newValue) {
                dropDownValue.state = newValue!;
              },
            ),
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.only(top: 50, bottom: 5),
        margin: EdgeInsets.only(bottom: 5),
        child: ElevatedButton(
          child: Text('OK'),
          onPressed: () {
            textFieldTournament.state = _tournamentTextFieldController.text;
            if (leagueFlg.state) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LeagueTable(),
                    fullscreenDialog: true),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TournamentTable(),
                    fullscreenDialog: true),
              );
            }
          },
        ),
      ),
    ],
  );
}
