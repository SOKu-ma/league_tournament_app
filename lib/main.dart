import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:league_tournament_app/ui/drawer_menu.dart';
import 'package:league_tournament_app/ui/home_screen_league.dart';
import 'package:league_tournament_app/ui/home_screen_tournament.dart';
import 'package:league_tournament_app/ui/match_settings.dart';
import 'package:league_tournament_app/ui/tournament_table.dart';

// final appNameProvider = Provider((ref) => 'RiverPod Sample');
final selectedIndexProvider = StateProvider((ref) => 0);

void main() {
  // RiverPodの宣言
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: MyHome(),
    );
  }
}

class MyHome extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final currentedIndex = watch(selectedIndexProvider).state;
    // final appName = watch(appNameProvider);

    final List<Widget> tabs = [
      HomeScreenLeague(),
      HomeScreenTournament(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: Drawer(
        child: DrawerMenu(''),
      ),
      body: tabs[currentedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_on),
            label: 'League',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_rounded),
            label: 'Tournament',
          ),
        ],
        currentIndex: currentedIndex, // 0始まり
        onTap: (index) {
          if (currentedIndex != index) {
            if (currentedIndex == 0) {
              context.read(selectedIndexProvider).state = 1;
            } else {
              context.read(selectedIndexProvider).state = 0;
            }
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MatchSettings(),
              fullscreenDialog: true,
            ),
          );
        },
      ),
    );
  }
}
