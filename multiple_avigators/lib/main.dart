import 'package:flutter/material.dart';
import 'package:multiple_avigators/screens/home/home_first_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int? currentSelectedIndex;

  void _updateIndex(int index) {
    setState(() {
      currentSelectedIndex = currentSelectedIndex != index ? index : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: const HomeFirstScreen(),
        bottomNavigationBar: MainBottomNav(
          currentSelectedIndex: currentSelectedIndex,
          onItemClick: _updateIndex,
        ),
      ),
    );
  }
}

class MainBottomNav extends StatelessWidget {
  const MainBottomNav({
    super.key,
    required this.onItemClick,
    required this.currentSelectedIndex,
  });

  final int? currentSelectedIndex;
  final Function(int) onItemClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.blueGrey),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              onItemClick(0);
            },
            child: Icon(
              currentSelectedIndex == 0 ? Icons.check : Icons.home,
            ),
          ),
          GestureDetector(
            onTap: () {
              onItemClick(1);
            },
            child: Icon(
              currentSelectedIndex == 1 ? Icons.check : Icons.favorite,
            ),
          ),
          GestureDetector(
            onTap: () {
              onItemClick(2);
            },
            child: Icon(
              currentSelectedIndex == 2 ? Icons.check : Icons.settings,
            ),
          ),
        ],
      ),
    );
  }
}
