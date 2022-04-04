import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  DrawerMenu(this.name);
  final String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            decoration: new BoxDecoration(
              border: new Border(
                bottom: new BorderSide(color: Colors.grey),
              ),
            ),
            child: ListTile(
              subtitle: Text('基本設定'),
            ),
          ),
          Container(
            decoration: new BoxDecoration(
              border: new Border(
                bottom: new BorderSide(color: Colors.grey),
              ),
            ),
            child: ListTile(
              leading: Icon(Icons.color_lens),
              title: Text('アプリのテーマ'),
              onTap: () {},
            ),
          ),
          Container(
            decoration: new BoxDecoration(
              border: new Border(
                bottom: new BorderSide(color: Colors.grey),
              ),
            ),
            child: ListTile(
              leading: Icon(Icons.share),
              title: Text('List 2'),
              onTap: () {},
            ),
          ),
          Container(
            decoration: new BoxDecoration(
              border: new Border(
                bottom: new BorderSide(color: Colors.grey),
              ),
            ),
            child: ListTile(
              subtitle: Text('アプリについて'),
            ),
          ),
          Container(
            decoration: new BoxDecoration(
              border: new Border(
                bottom: new BorderSide(color: Colors.grey),
              ),
            ),
            child: ListTile(
              leading: Icon(Icons.info),
              title: Text('アプリのお問い合わせ'),
              onTap: () {
                // onTapInquiry(context);
              },
            ),
          ),
          Container(
            decoration: new BoxDecoration(
              border: new Border(
                bottom: new BorderSide(color: Colors.grey),
              ),
            ),
            child: ListTile(
              leading: Icon(Icons.reviews),
              title: Text('アプリをレビューする'),
              subtitle: Text('レビューいただけると嬉しいです'),
              onTap: () {
                // onTapAppReview(context);
              },
            ),
          ),

          Container(
            decoration: new BoxDecoration(
              border: new Border(
                bottom: new BorderSide(color: Colors.grey),
              ),
            ),
            child: ListTile(
              leading: Icon(Icons.settings_applications),
              title: Text('開発者の他のアプリ'),
              onTap: () {},
            ),
          ),
          Container(
            decoration: new BoxDecoration(
              border: new Border(
                bottom: new BorderSide(color: Colors.grey),
              ),
            ),
            child: ListTile(
              leading: Icon(Icons.info_outline_sharp),
              title: Text('アプリのバージョン'),
              trailing: Text('1.0.0'),
              onTap: () {},
            ),
          ),
          // 空の行
          Container(child: ListTile()),
        ],
      ),
    );
  }
}
