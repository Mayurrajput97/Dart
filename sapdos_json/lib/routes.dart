import 'package:go_router/go_router.dart';
import 'package:practice_work/features/authentication/presentation/pages/initial_page.dart';
import 'package:practice_work/features/authentication/presentation/pages/login_page.dart';
import 'package:practice_work/features/authentication/presentation/pages/sign_up_page.dart';
import 'package:practice_work/features/doctor/presentation/pages/docter_page.dart';
import 'package:practice_work/features/patient/presentation/pages/patient_home_page.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const InitialPage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignUpPage(),
    ),
    GoRoute(
      path: '/doctor',
      builder: (context, state) => const DoctorPage(),
    ),
    GoRoute(
      path: '/patient',
      builder: (context, state) => PatientPage(),
    ),
  ],
);
