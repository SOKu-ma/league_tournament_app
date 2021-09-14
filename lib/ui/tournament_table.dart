import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TornamentTable extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tournament Table'),
      ),
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(border: Border.all()),
                    width: 50,
                    height: 50,
                    child: Center(
                      child: Text('AAA'),
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    // padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(border: Border.all()),
                    width: 50,
                    height: 50,
                    child: Center(
                      child: Text('AAA'),
                    ),
                  ),
                ),
              ],
            ),
            Flexible(
              child: ListView.builder(
                itemCount: 3,
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                        title: Text(
                          'AAA',
                        ),
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.grey)),
                        onTap: () {}),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
