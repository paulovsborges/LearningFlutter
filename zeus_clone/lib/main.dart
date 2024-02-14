import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: BlocProvider(
          create: (_) => PageControllerState(),
          child: const LandingPage(),
        ),
      ),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    var navigationIndexWatcher =
        context.watch<PageControllerState>().state.currentPageIndex;

    return Scaffold(
      body: PageView(
        controller: context.read<PageControllerState>().state.pageController,
        children: [
          Column(
            children: [
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
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
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.amber,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (newPageIndex) {
          context
              .read<PageControllerState>()
              .changeBottomNavigationPageIndex(newPageIndex);
        },
        currentIndex: navigationIndexWatcher,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: const IconThemeData(color: Colors.black, size: 24),
        unselectedIconTheme:
            const IconThemeData(color: Colors.black12, size: 16),
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/images/categories.svg'),
              label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add, color: Colors.black), label: 'Passwords'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add, color: Colors.black), label: 'item 3'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add, color: Colors.black), label: 'item 4'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add, color: Colors.black), label: 'item 5'),
        ],
      ),
    );
  }
}

class PageControllerState extends Cubit<LandingPageState> {
  PageControllerState()
      : super(LandingPageState(
            pageController: PageController(), currentPageIndex: 0));

  void changeBottomNavigationPageIndex(int newIndex) {
    const animDuration = Duration(milliseconds: 200);
    var animCurve = Curves.bounceIn;

    state.pageController
        .animateToPage(newIndex, duration: animDuration, curve: animCurve);

    emit(
      LandingPageState(
          pageController: state.pageController, currentPageIndex: newIndex),
    );
  }
}

class LandingPageState {
  LandingPageState(
      {required this.pageController, required this.currentPageIndex});

  final PageController pageController;
  final int currentPageIndex;
}
