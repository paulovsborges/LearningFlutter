import 'package:rick_and_morty_api/domain/entity/character.dart';

abstract class DataState {}

class InitialState<Void> extends DataState {}

class LoadingState<Void> extends DataState {}

class Success extends DataState {
  Success({required this.data});

  final List<Character> data;
}

class ErrorState<Void> extends DataState {}
