import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/features/details/details_presenter.dart';
import 'package:presentation/features/navigation/n_cage_navigation_helper.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    super.key,
    required this.presenter,
  });

  static const String routeName = '/details_page';

  final DetailsPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: context.myRouterPop,
          child: const Text('Back'),
        ),
      ),
      body: BlocBuilder<DetailsPresenter, DetailsState>(
        builder: (_, state) {
          return GestureDetector(
            onTap: presenter.test,
            child: Center(
              child: state.isLoading
                  ? const CircularProgressIndicator()
                  : Text('Details page id ${state.id}'),
            ),
          );
        },
      ),
    );
  }
}
