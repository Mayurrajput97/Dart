import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_work/features/authentication/presentation/bloc/initial/initial_bloc.dart';
import 'package:practice_work/features/authentication/presentation/pages/initial_page.dart';
import 'package:practice_work/features/authentication/presentation/pages/login_page.dart';
import 'package:practice_work/features/authentication/presentation/pages/sign_up_page.dart';
import 'package:practice_work/features/doctor/presentation/pages/docter_page.dart';
import 'package:practice_work/features/patient/presentation/pages/patient_home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InitialBloc>(
          create: (context) => InitialBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SAPDOS',
        initialRoute: '/',
        routes: {
          '/': (context) => const InitialPage(),
          '/login': (context) => const LoginPage(),
          '/signup': (context) => const SignUpPage(),
          '/doctor': (context) => const DoctorPage(),
          '/patient': (context) => PatientPage(),
        },
      ),
    );
  }
}
