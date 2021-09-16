import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:league_tournament_app/ui/home_base.dart';

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
    return HomeBase();
  }
}
