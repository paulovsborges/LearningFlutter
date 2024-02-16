import 'package:rick_and_morty_api/domain/entity/character.dart';

abstract class DataState {}

class InitialState<Void> extends DataState {}

class LoadingState<Void> extends DataState {}

class SuccessState extends DataState {
  SuccessState({required this.data});

  final List<Character> data;
}

class ErrorState<Void> extends DataState {}
