import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:practice_work/features/authentication/presentation/bloc/initial/initial_bloc.dart';
import 'package:practice_work/features/authentication/presentation/bloc/initial/initial_event.dart';
import 'package:practice_work/features/authentication/presentation/bloc/initial/initial_state.dart';
import 'package:practice_work/features/authentication/presentation/widgets/header_section.dart';
import 'package:practice_work/utils/widgets_comman/left_image_section.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InitialBloc, InitialState>(
      listener: (context, state) {
        if (state is NavigateToLoginState) {
          context.go('/login');
        } else if (state is NavigateToSignupState) {
          context.go('/signup');
        } else if (state is ProceedAsGuestState) {
          context.go('/patient');
        }
      },
      builder: (context, state) {
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
                        _buildButton(
                          context,
                          label: 'Login',
                          color: Colors.blue[900]!,
                          textColor: Colors.white,
                          onPressed: () {
                            context.read<InitialBloc>().add(NavigateToLogin());
                          },
                        ),
                        const SizedBox(height: 16),
                        _buildButton(
                          context,
                          label: 'Sign up',
                          color: const Color.fromARGB(205, 255, 255, 255),
                          textColor: Colors.black,
                          onPressed: () {
                            context.read<InitialBloc>().add(NavigateToSignup());
                          },
                        ),
                        const SizedBox(height: 32),
                        _buildProceedAsGuest(context),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildButton(
    BuildContext context, {
    required String label,
    required Color color,
    required Color textColor,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(color: textColor),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        minimumSize: const Size(150, 50),
      ),
    );
  }

  Widget _buildProceedAsGuest(BuildContext context) {
    return MouseRegion(
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
    );
  }
}
