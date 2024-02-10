import 'package:flutter/material.dart';

// Handling state using bloc

// class Counter extends BlocBase{
//
//   Stream<int> counter;
//
// }

class HomeScreenContainer extends StatefulWidget {
  const HomeScreenContainer({super.key});

  @override
  State<HomeScreenContainer> createState() => _HomeScreenContainerState();
}

class _HomeScreenContainerState extends State<HomeScreenContainer> {
  int _navigationIndex = 0;

  void _updateIndex(int newIndex) {
    setState(() {
      _navigationIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return HomeScreen(
      navigationIndex: _navigationIndex,
      onTapCallback: (newIndex) {
        _updateIndex(newIndex);
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen(
      {super.key, required this.navigationIndex, required this.onTapCallback});

  final PageController _pageController = PageController();
  final int navigationIndex;
  final Function(int index) onTapCallback;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App bar'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: PageView(
        controller: _pageController,
        children: [
          Column(
            children: [
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
                child: const Center(
                  child: Text(
                    'Hello',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
              ),
            ],
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.green,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationIndex,
        onTap: (index) {
          onTapCallback(index);
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastLinearToSlowEaseIn,
          );
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Item 1'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Item 2'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Item 3'),
        ],
      ),
    );
  }
}

// Use stl for a code template for stateless widget and stf for stateful
