import 'package:bloc/bloc.dart';

class DetailsPresenter extends Cubit<DetailsState> {
  DetailsPresenter()
      : super(DetailsState(
          id: null,
          isLoading: false,
        ));

  void setId(String id) {
    state.id = id;
  }

  void test() async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(isLoading: false));
  }
}

class DetailsState {
  DetailsState({
    required this.id,
    required this.isLoading,
  });

  String? id;
  final bool isLoading;

  DetailsState copyWith({
    String? id,
    bool? isLoading,
  }) {
    return DetailsState(
      id: id ?? this.id,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
