import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:league_tournament_app/const/functions.dart';

import 'match_settings.dart';

class LeagueTable extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return _LeagueTable();
  }
}

class _LeagueTable extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _tab = <Tab>[
      Tab(text: 'Team List'),
      Tab(text: 'Match List'),
      Tab(text: 'League'),
      Tab(text: 'Data'),
    ];

    return DefaultTabController(
        length: _tab.length,
        child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(75),
              child: AppBar(
                bottom: TabBar(
                  tabs: _tab,
                  labelStyle: TextStyle(
                    fontSize: 16,
                    // fontWeight: FontWeight.bold,
                  ),
                  isScrollable: true,
                  // labelPadding:
                  // EdgeInsets.all(10),
                  labelPadding: EdgeInsets.symmetric(horizontal: 10.0),
                  indicatorSize: TabBarIndicatorSize.tab,
                ),
              ),
            ),
            body: TabBarView(children: [
              TabPage_TeamList(),
              TabPage_MatchList(),
              TabPage_League(),
              TabPage_Data()
            ])));
  }
}

class TabPage_TeamList extends ConsumerWidget {
  // チームリスト一覧用
  var _elements = [
    {'name': '東北楽天ゴールデンイーグルス', 'group': 'チーム名'},
    {'name': '西武ライオンズ', 'group': 'チーム名'},
    {'name': '阪神タイガース', 'group': 'チーム名'},
    {'name': '横浜DeNAベイスターズ', 'group': 'チーム名'},
  ];

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final textFieldLeagueAllTeam = watch(textFieldLeagueAllTeamProvider);

    return Scaffold(
      body: SafeArea(
        child: _teamList(),
        // child: ListView.builder(
        //   itemCount: int.parse(textFieldLeagueAllTeam.state),
        //   padding: EdgeInsets.all(10),
        //   itemBuilder: (BuildContext context, int index) {
        //     return Card(
        //       child: ListTile(
        //         title: Text(
        //           ' チームNo.${index + 1}',
        //         ),
        //         trailing: Icon(Icons.keyboard_arrow_right),
        //         shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(10),
        //             side: BorderSide(color: Colors.grey)),
        //         contentPadding: EdgeInsets.all(10),
        //         onTap: () {},
        //       ),
        //     );
        //   },
        // ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }

  _teamList() {
    var matchListView = GroupedListView<dynamic, String>(
      elements: _elements,
      groupBy: (element) => element['group'],
      groupComparator: (value1, value2) => value2.compareTo(value1),
      itemComparator: (item1, item2) => item1['name'].compareTo(item2['name']),
      order: GroupedListOrder.ASC,
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
        return Card(
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
        );
      },
    );

    return matchListView;
  }
}

class TabPage_MatchList extends ConsumerWidget {
  // 試合一覧リストビュー用
  var _elements = [
    {'name': '西武ライオンズ', 'group': '1回戦'},
    {'name': '東北楽天ゴールデンイーグルス', 'group': '1回戦'},
    {'name': 'Beth', 'group': '1回戦'},
    {'name': 'Miranda', 'group': '2回戦'},
    {'name': 'Mike', 'group': '2回戦'},
    {'name': 'Danny', 'group': '2回戦'},
    {'name': 'Miranda', 'group': '2回戦'},
    {'name': 'Mike', 'group': '2回戦'},
    {'name': 'Danny', 'group': '2回戦'},
    {'name': 'Mike', 'group': '3回戦'},
    {'name': 'Danny', 'group': '3回戦'},
    {'name': 'Mike', 'group': '3回戦'},
    {'name': 'Danny', 'group': '3回戦'},
  ];

  // final date = DateTime.now();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
      body: SafeArea(
        child: _matchList(),
      ),
    );
  }

  _matchList() {
    var matchListView = GroupedListView<dynamic, String>(
      elements: _elements,
      groupBy: (element) => element['group'],
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
        return Card(
          elevation: 8.0,
          margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            child: ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              // leading: Text(DateFormat.yMMMd('ja').format(date)),
              // leading: Text(sentDateFormatted),
              title: Text(
                  '$sentDateFormatted \n${element['name']} VS ${element['name']}'),
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
          ),
        );
      },
    );

    return matchListView;
  }
}

class TabPage_League extends ConsumerWidget {
  // final String name;
  // TabPage_League(this.name);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    // final numTeam = 20;
    // final teamList = ['ジャイアンツ', 'タイガース', 'カープ', 'ヤクルト', 'ドラゴンズ', 'ベイスターズ'];
    final teamList = ['巨人', '阪神', '広島', 'ヤクルト', '中日', '横浜'];
    final textFieldLeague = watch(textFieldLeagueProvider);

    // final FocusNode _nodeText1 = FocusNode();

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 10, bottom: 20),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                    width: 200,
                    height: 50,
                    child: Center(child: Text('${textFieldLeague.state}'))),
                LayoutBuilder(
                  builder: (context, constraints) {
                    return Table(border: TableBorder.all(), columnWidths: {
                      0: FractionColumnWidth(.2)
                    }, children: [
                      // Table Headr生成
                      TableRow(children: _createTableHeader(teamList)),
                      for (int row = 0; row < teamList.length; row++)
                        // Table Row生成
                        _createTableRows(teamList, row, context)
                    ]);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Tableヘッダー（チーム名）を生成
  _createTableHeader(List teamList) {
    List<TableCell> headerList = [];
    headerList.add(TableCell(
        child: Center(child: Text('チーム名', style: TextStyle(fontSize: 12)))));
    for (int cnt = 0; cnt < teamList.length; cnt++) {
      headerList.add(TableCell(
          child: Center(
              child: Text('' + '${teamList[cnt]}',
                  style: TextStyle(fontSize: 12)))));
    }
    return headerList;
  }

  // Tableデータを生成
  _createTableRows(List teamList, int row, BuildContext context) {
    TableRow tableRow = TableRow(children: []);

    for (int col = 0; col < teamList.length + 1; col++) {
      // 先頭列：チーム名
      if (col == 0) {
        tableRow.children!.add(TableRowInkWell(
          child: TableCell(
              child: Center(
                  child: Text('\n' + '${teamList[row]}',
                      style: TextStyle(fontSize: 12)))),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Column(
                    children: [
                      Text('チーム名を変更'),
                      TextField(
                        controller:
                            TextEditingController(text: '${teamList[row]}'),
                        autofocus: true,
                      ),
                      ElevatedButton(onPressed: () {}, child: Text('OK'))
                    ],
                  ),
                );
              },
            );
          },
        ));
      } else if (col == row + 1) {
        // グレーアウト列
        tableRow.children!.add(
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Container(
              child: Center(
                // color: Colors.grey,
                child: Column(children: [
                  Text(''),
                  Text('-'),
                  Text(''),
                  // Text('\n'),
                ]),
              ),
            ),
          ),
        );
      } else {
        // スコア列
        tableRow.children!.add(TableRowInkWell(
          child: TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Center(
              child: Column(
                children: [Text('10/10'), Text('● 1-2')],
              ),
            ),
          ),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  insetPadding: EdgeInsets.symmetric(vertical: 200),
                  content: Container(
                    child: Column(
                      children: [
                        Row(children: [
                          Text('${teamList[row]}'),
                          Text(' VS '),
                          Text('${teamList[col - 1]}')
                        ]),
                        Row(children: [
                          Expanded(
                              child: TextField(
                                  keyboardType: TextInputType.number)),
                          Text(' VS '),
                          Expanded(
                              child:
                                  TextField(keyboardType: TextInputType.number))
                        ]),
                        Container(child: Text(''), height: 50),
                        ElevatedButton(onPressed: () {}, child: Text('OK'))
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ));
      }
    }
    return tableRow;
  }
}

class Keyboard_Action extends StatelessWidget {
  final FocusNode _nodeText1 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return KeyboardActions(
      config: _buildConfig(context),
    );
  }

  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(actions: [
      KeyboardActionsItem(
        focusNode: _nodeText1,
      ),
    ]);
  }
}

class TabPage_Data extends ConsumerWidget {
  // final String name;
  // TabPage_Data(this.name);

  final headerList = [
    '順位',
    'チーム',
    '試合',
    '勝利',
    '敗戦',
    '引分',
    '勝率',
    // '勝点',
    // '得点',
    // '失点',
  ];

  final teamList = ['巨人', '阪神', '広島', 'ヤクルト', '中日', '横浜'];

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                  child: Center(child: Text('2021前期リーグ戦')),
                  width: 200,
                  height: 50),
              LayoutBuilder(
                builder: (context, constraints) {
                  return Table(border: TableBorder.all(), columnWidths: {
                    1: FractionColumnWidth(.2)
                  }, children: [
                    // Table Headr生成
                    TableRow(children: _createTableHeader(headerList)),
                    for (int row = 0; row < teamList.length; row++)
                      // Table Row生成
                      _createTableRows(teamList, row, context)
                  ]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 成績ヘッダー生成
  _createTableHeader(List headerList) {
    List<TableCell> list = [];
    // headerList.add(TableCell(
    //     child: Center(child: Text('チーム名', style: TextStyle(fontSize: 15)))));
    for (int cnt = 0; cnt < headerList.length; cnt++) {
      list.add(TableCell(
          child: Center(
              child:
                  Text('${headerList[cnt]}', style: TextStyle(fontSize: 15)))));
    }
    return list;
  }

  _createTableRows(List<String> teamList, int row, BuildContext context) {
    final list1 = [
      '1',
      '阪神',
      '5',
      '3',
      '1',
      '1',
      '0.6',
    ];

    TableRow tableRow = TableRow(children: []);

    for (int col = 0; col < headerList.length; col++) {
      tableRow.children!.add(TableCell(
          child: Container(
              child: Center(child: Text('${list1[col]}')),
              width: 45,
              height: 45)));
    }

    return tableRow;
  }
}
