import 'package:flutter/material.dart';
import 'package:presentation/features/login/auth_presenter.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
    required this.presenter,
  });

  static const String routeName = '/profile_page';
  final AuthPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Profile'),
    );
  }
}
