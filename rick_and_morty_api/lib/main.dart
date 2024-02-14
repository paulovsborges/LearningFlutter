import 'package:flutter/material.dart';
import 'package:rick_and_morty_api/app_bar.dart';
import 'package:rick_and_morty_api/character.dart';
import 'package:rick_and_morty_api/screens/characters_list/character_item.dart';
import 'package:rick_and_morty_api/screens/characters_list/characters_list.dart';

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
      home: const SafeArea(child: MyHomePage()),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = const Color.fromARGB(255, 40, 43, 50);
    List<Character> characters = [
      Character(
          name: "Toxic Rick",
          image: "https://rickandmortyapi.com/api/character/avatar/361.jpeg",
          status: "Dead",
          gender: "Male"),
      Character(
          name: "Toxic Rick",
          image: "https://rickandmortyapi.com/api/character/avatar/361.jpeg",
          status: "Dead",
          gender: "Male"),
      Character(
          name: "Toxic Rick",
          image: "https://rickandmortyapi.com/api/character/avatar/361.jpeg",
          status: "Dead",
          gender: "Male"),
      Character(
          name: "Toxic Rick",
          image: "https://rickandmortyapi.com/api/character/avatar/361.jpeg",
          status: "Dead",
          gender: "Male"),
      Character(
          name: "Toxic Rick",
          image: "https://rickandmortyapi.com/api/character/avatar/361.jpeg",
          status: "Dead",
          gender: "Male"),
      Character(
          name: "Toxic Rick",
          image: "https://rickandmortyapi.com/api/character/avatar/361.jpeg",
          status: "Dead",
          gender: "Male"),
      Character(
          name: "Toxic Rick",
          image: "https://rickandmortyapi.com/api/character/avatar/361.jpeg",
          status: "Dead",
          gender: "Male"),
      Character(
          name: "Toxic Rick",
          image: "https://rickandmortyapi.com/api/character/avatar/361.jpeg",
          status: "Dead",
          gender: "Male"),
      Character(
          name: "Toxic Rick",
          image: "https://rickandmortyapi.com/api/character/avatar/361.jpeg",
          status: "Dead",
          gender: "Male"),
      Character(
          name: "Toxic Rick",
          image: "https://rickandmortyapi.com/api/character/avatar/361.jpeg",
          status: "Dead",
          gender: "Male"),
    ];

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          const MyAppBar(),
          const SizedBox(
            height: 10,
          ),
          CharactersList(characters: characters),
        ],
      ),
    );
  }
}
