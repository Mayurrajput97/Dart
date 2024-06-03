import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_work/features/authentication/presentation/bloc/initial/initial_bloc.dart';
import 'package:practice_work/features/authentication/presentation/bloc/initial/initial_event.dart';
import 'package:practice_work/features/authentication/presentation/bloc/initial/initial_state.dart';
import 'package:practice_work/features/authentication/presentation/widgets/header_section.dart';
import 'package:practice_work/features/authentication/presentation/widgets/left_image_section.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InitialBloc, InitialState>(listener: (context, state) {
      if (state is NavigateToLoginState) {
        Navigator.pushNamed(context, '/login');
      } else if (state is NavigateToSignupState) {
        Navigator.pushNamed(context, '/signup');
      } else if (state is ProceedAsGuestState) {}
    }, builder: (context, State) {
      return Scaffold(
        body: Row(
          children: [
            const LeftImageSection(imagePath: 'assets/images/login_page.jpg'),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const HeaderSection(
                        title: 'SAPDOS',
                        subtitle:
                            'Login to your sapdos account or create one now.',
                        description: '',
                      ),
                      const SizedBox(height: 32),
                      ElevatedButton(
                        onPressed: () {
                          context.read<InitialBloc>().add(NavigateToLogin());
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[900],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          minimumSize: const Size(150, 50),
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          context.read<InitialBloc>().add(NavigateToSignup());
                        },
                        child: const Text(
                          'Sign up',
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(205, 255, 255, 255),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          minimumSize: const Size(150, 50),
                        ),
                      ),
                      const SizedBox(height: 32),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            context.read<InitialBloc>().add(ProceedAsGuest());
                          },
                          child: const Text(
                            'Proceed as a Guest',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 2, 10, 23),
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
