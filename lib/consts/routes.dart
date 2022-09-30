import 'package:aggregator/blocs/auth/auth_bloc.dart';
import 'package:aggregator/presentation/login/login_screen.dart';
import 'package:aggregator/presentation/main/main_screen.dart';
import 'package:flutter/material.dart';

List<Page> onGeneratePages(
  AuthStatus status,
  List<Page<dynamic>> pages
) {
  switch (status) {
    case AuthStatus.loading:
      return const [MaterialPage<void>(
        child: _LoadingPage()
      )];
    case AuthStatus.authenticated:
      return [MainScreen.page()];
    case AuthStatus.unauthenticated:
      return [LoginScreen.page()];
  }
}

class _LoadingPage extends StatelessWidget {
  const _LoadingPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}