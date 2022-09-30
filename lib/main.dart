import 'package:aggregator/blocs/auth/auth_bloc.dart';
import 'package:aggregator/consts/routes.dart';
import 'package:aggregator/cubits/restaurant/restaurant_cubit.dart';
import 'package:aggregator/cubits/restaurant_details/restaurant_details_cubit.dart';
import 'package:aggregator/data/repositories/geolocation_repository.dart';
import 'package:aggregator/data/repositories/restaurant_repository.dart';
import 'package:aggregator/data/repositories/user_repository.dart';
import 'package:aggregator/presentation/root/root_screen.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print('${bloc.runtimeType} $event');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('${bloc.runtimeType} $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}
void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UserRepository>(create: (_) => UserRepository()),
        RepositoryProvider<RestaurantRepository>(create: (_) => RestaurantRepository()),
        RepositoryProvider<GeolocationRepository>(create: (_) => GeolocationRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthBloc(userRepository: context.read<UserRepository>())..add(AppStarted())),
        ],
        child: MaterialApp(
          title: 'Aggregator',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: const Color(0xFFF3F4F6),
            primaryColor: const Color(0xFF4631D2),
          ),
          home: const RootScreen()
        ),
      ),
    );
  }
}