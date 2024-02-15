import 'package:equatable/equatable.dart';

import 'character.dart';

abstract class DataState extends Equatable {}

class InitialState extends DataState {
  @override
  List<Object?> get props => [];
}

class LoadingState extends DataState {
  @override
  List<Object?> get props => [];
}

class Success<T> extends DataState {
  Success({required this.data});

  final T data;

  @override
  List<Object?> get props => [data];
}

class Error extends DataState {
  @override
  List<Object?> get props => [];
}
