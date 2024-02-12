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

  void _changeToPage(int newPage) {
    onTapCallback(newPage);
    _pageController.animateToPage(
      newPage,
      duration: const Duration(milliseconds: 200),
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App bar'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              child: Text('This is the header'),
            ),
            const UserAccountsDrawerHeader(
              accountName: Text('testing name'),
              accountEmail: Text('testing@gmail.com'),
            ),
            ListTile(
              title: Text('Page 1'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                _changeToPage(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Page 2'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                _changeToPage(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Page 3'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                _changeToPage(2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
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
          _changeToPage(index);
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
