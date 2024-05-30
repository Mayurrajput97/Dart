import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_work/authentication/bloc/initial_page/initial_bloc.dart';
import 'package:practice_work/authentication/bloc/initial_page/initial_event.dart';
import 'package:practice_work/authentication/bloc/initial_page/initial_state.dart';
import 'package:practice_work/authentication/widgets/header_section.dart';
import 'package:practice_work/authentication/widgets/left_image_section.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<InitialBloc, InitialState>(
      listener: (context, state) {
        if (state is NavigateToLoginState) {
          Navigator.pushNamed(context, '/login');
        } else if (state is NavigateToSignupState) {
          Navigator.pushNamed(context, '/signup');
        } else if (state is ProceedAsGuestState) {}
      },
      child: Scaffold(
        body: Row(
          children: [
            const LeftImageSection(imagePath: 'assets/images/login_page.jpg'),
            Expanded(
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
                      description:
                          'Login to your existing account or create a new one to get started.',
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
                      child: const Text('Sign Up'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(150, 50),
                        backgroundColor: Colors.blue[700],
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
                            color: Color.fromARGB(255, 4, 48, 116),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
