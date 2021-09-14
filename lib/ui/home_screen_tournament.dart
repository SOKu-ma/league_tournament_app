import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:league_tournament_app/ui/tournament_table.dart';

class HomeScreenTournament extends ConsumerWidget {
  final leagueList = ['セ・リーグ', 'パ・リーグ', 'MLB'];

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: leagueList.length,
          padding: EdgeInsets.all(10),
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                  title: Text(
                    '${leagueList[0]}' + '\n' + '${TimeOfDay.now()}',
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.grey)),
                  contentPadding: EdgeInsets.all(10),
                  onTap: () {}),
            );
          },
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => TornamentTable(),
      //         fullscreenDialog: true,
      //       ),
      //     );
      //   },
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
