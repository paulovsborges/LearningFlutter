import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty_api/app_module.dart';
import 'package:rick_and_morty_api/domain/entity/data_state.dart';
import 'package:rick_and_morty_api/presentation/app_bar.dart';
import 'package:rick_and_morty_api/presentation/loading_widget.dart';
import 'package:rick_and_morty_api/presentation/screens/character_details/character_details.dart';
import 'package:rick_and_morty_api/presentation/screens/characters_list/characters_list.dart';
import 'package:rick_and_morty_api/presentation/screens/characters_list/characters_list_cubit.dart';

main() {
  AppModuleInitializer();
  // runApp(ModularApp(module: AppModule(), child: const MyApp()));
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
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (_) => const MyHomePage(),
        '/character_details': (_) =>
            const CharacterDetails()
      },
      builder: (context, router){
        return SafeArea(child: router!);
      },
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
            create: (context) => GetIt.I.get<CharactersListCubit>(),
            child: BlocBuilder<CharactersListCubit, DataState>(
              builder: (context, state) {
                return _MainContent(
                  state: state,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class _MainContent extends StatelessWidget {
  const _MainContent({super.key, required this.state});

  final DataState state;

  @override
  Widget build(BuildContext context) {
    if (state is InitialState) {
      return const Center();
    } else if (state is LoadingState) {
      return const LoadingWidget();
    } else if (state is SuccessState) {
      return CharactersList(
        characters: (state as SuccessState).data,
      );
    } else if (state is ErrorState) {
      return const Center(
        child: Text('There was an error'),
      );
    } else {
      return const Placeholder();
    }
  }
}
