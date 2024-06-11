import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_work/features/authentication/presentation/bloc/initial/initial_bloc.dart';
import 'package:practice_work/features/authentication/presentation/bloc/login/login_bloc.dart';
import 'package:practice_work/routes.dart';
import 'features/authentication/data/repository/user_repo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userRepository = UserRepository();

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UserRepository>.value(value: userRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<InitialBloc>(
            create: (context) => InitialBloc(),
          ),
          BlocProvider<LoginBloc>(
            create: (context) =>
                LoginBloc(userRepository: context.read<UserRepository>()),
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'SAPDOS',
          theme: ThemeData(),
          routerConfig: router,
        ),
      ),
    );
  }
}
