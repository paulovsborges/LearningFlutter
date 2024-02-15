import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_api/app_bar.dart';
import 'package:rick_and_morty_api/character.dart';
import 'package:rick_and_morty_api/screens/characters_list/characters_list.dart';
import 'package:rick_and_morty_api/service/fetch_api.dart';

void main() {
  runApp(const MyApp());
}

class CubitCharacters extends Cubit<List<Character>> {
  CubitCharacters({required this.api}) : super([]);

  final RickAndMortyApi api;

  void getCharacters() {
    api.fetchCharacters().forEach((characters) {
      emit(characters);
    });
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
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

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          const MyAppBar(),
          const SizedBox(
            height: 10,
          ),
          BlocProvider(
            create: (_) => CubitCharacters(api: RickAndMortyApi()),
            child: const CharactersList(),
          )
        ],
      ),
    );
  }
}
