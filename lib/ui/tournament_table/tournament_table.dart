import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:league_tournament_app/const/functions.dart';

class TournamentTable extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tournament Table'),
      ),
      body: SafeArea(
        child: Row(
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10, top: 20),
                  child: SizedBox(
                    height: 60,
                    width: 120,
                    child: InkWell(
                      onTap: () {},
                      child: Card(
                        child: Center(
                          child: Text(
                            '中日ドラゴンズ',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, top: 20),
                  child: SizedBox(
                    height: 60,
                    width: 120,
                    child: InkWell(
                      onTap: () {},
                      child: Card(
                        child: Center(
                          child: Text(
                            '東北楽天ゴールデンイーグルス',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // Container(
                //   margin: EdgeInsets.only(left: 10, top: 20),
                //   child: SizedBox(
                //     height: 60,
                //     width: 120,
                //     child: InkWell(
                //       onTap: () {},
                //       child: Card(
                //         child: Center(
                //           child: Text(
                //             'ソフトバンクホークス',
                //             style: TextStyle(fontSize: 15),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                // Container(
                //   margin: EdgeInsets.only(left: 10, top: 20),
                //   child: SizedBox(
                //     height: 60,
                //     width: 120,
                //     child: InkWell(
                //       onTap: () {},
                //       child: Card(
                //         child: Center(
                //           child: Text(
                //             '西武ライオンズ',
                //             style: TextStyle(fontSize: 15),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
            Column(
              children: [
                // Container(
                //   child: Text('aaa'),
                // ),
                CustomPaint(painter: HorizonalLine(0)),
                CustomPaint(painter: VerticalLine(0)),
                // CustomPaint(painter: HorizonalLine(0)),
                // CustomPaint(painter: HorizonalLine(0)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
