import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_api/domain/entity/data_state.dart';
import 'package:rick_and_morty_api/presentation/app_bar.dart';
import 'package:rick_and_morty_api/presentation/loading_widget.dart';
import 'package:rick_and_morty_api/presentation/screens/characters_list/characters_list.dart';
import 'package:rick_and_morty_api/presentation/screens/characters_list/characters_list_state.dart';

import 'datasource/repository/rick_and_morty_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
            create: (_) => CharactersListState(
              repository: RickAndMortyRepository(),
            ),
            child: const MainContent(),
          )
        ],
      ),
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({super.key});

  @override
  Widget build(BuildContext context) {
    var state = context.watch<CharactersListState>().state;

    // print(state);

    if (state is InitialState) {
      return const Center();
    } else if (state is LoadingState) {
      return const LoadingWidget();
    } else if (state is Success) {
      return CharactersList(
        characters: state.data,
      );
    } else if (state is ErrorState) {
      return const Center(
        child: Text('There was an error'),
      );
    } else {
      return Placeholder();
    }
  }
}
