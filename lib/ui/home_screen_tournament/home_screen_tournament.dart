import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grouped_list/grouped_list.dart';

import '../match_seettings/match_settings.dart';

class HomeScreenTournament extends ConsumerWidget {
  final _elements = [
    {'name': 'パ・リーグ', 'group': '日本', 'date': '2021/07/01', 'month': '2021/07'},
    {'name': '6大学リーグ', 'group': '日本', 'date': '2021/08/01', 'month': '2021/08'},
    {'name': 'セ・リーグ', 'group': '日本', 'date': '2021/09/01', 'month': '2021/09'},
    {'name': 'メジャー', 'group': 'アメリカ', 'date': '2021/08/02', 'month': '2021/08'},
    {'name': 'メジャー', 'group': 'アメリカ', 'date': '2021/08/02', 'month': '2021/08'},
    {'name': 'メジャー', 'group': 'アメリカ', 'date': '2021/09/02', 'month': '2021/09'},
    {'name': 'メジャー', 'group': 'アメリカ', 'date': '2021/10/02', 'month': '2021/10'}
  ];

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
      body: SafeArea(
        child: _tournamentList(context),
      ),
    );
  }

  _tournamentList(BuildContext context) {
    var matchListView = GroupedListView<dynamic, String>(
      elements: _elements,
      groupBy: (element) => element['month'],
      groupComparator: (value1, value2) => value2.compareTo(value1),
      itemComparator: (item1, item2) => item1['name'].compareTo(item2['name']),
      order: GroupedListOrder.DESC,
      useStickyGroupSeparators: true,
      groupSeparatorBuilder: (String value) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          value,
          // textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
      itemBuilder: (c, element) {
        return InkWell(
          child: Card(
            elevation: 8.0,
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: Container(
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                leading: Icon(Icons.account_circle),
                title: Text(
                  '${element['name']}',
                  style: TextStyle(fontSize: 17),
                ),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MatchSettings(),
              ),
            );
          },
        );
      },
    );

    return matchListView;
  }
}
