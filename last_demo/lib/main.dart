import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:last_demo/config/routes.dart';
import 'service_locator.dart';
import 'features/authentication/presentation/blocs/login/login_bloc.dart';
import 'features/authentication/presentation/blocs/sign_up/sign_up_bloc.dart';
import 'features/authentication/presentation/blocs/initial/initial_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (_) => sl<LoginBloc>(),
        ),
        BlocProvider<SignupBloc>(
          create: (_) => sl<SignupBloc>(),
        ),
        BlocProvider<InitialBloc>(
          create: (_) => InitialBloc(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'SAPDOS',
        theme: ThemeData(),
        routerConfig: router,
      ),
    );
  }
}
