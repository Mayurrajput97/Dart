import 'package:go_router/go_router.dart';
import 'package:last_demo/features/authentication/presentation/pages/demo_doctor.dart';
import 'package:last_demo/features/authentication/presentation/pages/initial_page.dart';
import 'package:last_demo/features/authentication/presentation/pages/login_page.dart';
import 'package:last_demo/features/authentication/presentation/pages/sign_up_page.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const InitialPage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => SignupPage(),
    ),
    GoRoute(
      path: '/doctor',
      builder: (context, state) => const DemoDoctor(),
    ),
    // GoRoute(
    //   path: '/patient',
    //   builder: (context, state) => PatientPage(),
    // ),
    // GoRoute(
    //   path: '/doctor/:id',
    //   builder: (context, state) {
    //     final doctor = state.extra as Doctor;
    //     return DoctorDetailPage(doctor: doctor);
    //   },
    // ),
    // GoRoute(
    //   path: '/payment',
    //   builder: (context, state) => const PaymentPage(),
    // ),
  ],
);
