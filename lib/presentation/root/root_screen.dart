import 'package:aggregator/blocs/auth/auth_bloc.dart';
import 'package:aggregator/consts/routes.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FlowBuilder(
      state: context.select((AuthBloc appBloc) => appBloc.state.authStatus),
      onGeneratePages: onGeneratePages
    );
  }
}