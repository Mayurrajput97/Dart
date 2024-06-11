import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:practice_work/features/authentication/presentation/widgets/header_section.dart';
import 'package:practice_work/features/widgets_comman/left_image_section.dart';
import 'package:practice_work/features/authentication/presentation/bloc/sign_up/sign_up_bloc.dart';
import 'package:practice_work/features/authentication/presentation/bloc/sign_up/sign_up_event.dart';
import 'package:practice_work/features/authentication/presentation/bloc/sign_up/sign_up_state.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    return Scaffold(
      body: Row(
        children: [
          const LeftImageSection(imagePath: 'assets/images/login_page.jpg'),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(32.0),
                child: BlocProvider(
                  create: (context) => SignUpBloc(),
                  child: BlocListener<SignUpBloc, SignUpState>(
                    listener: (context, state) {
                      if (state is SignUpSuccessState) {
                        context.go('/patient');
                      } else if (state is SignUpErrorState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.errorMessage)),
                        );
                      }
                    },
                    child: BlocBuilder<SignUpBloc, SignUpState>(
                      builder: (context, state) {
                        if (state is SignUpLoadingState) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }

                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const HeaderSection(
                              title: 'SAPDOS',
                              subtitle: 'Create a new account',
                              description: '',
                            ),
                            const SizedBox(height: 32),
                            ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 300),
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: emailController,
                                    decoration: const InputDecoration(
                                      labelText: 'Email or Phone',
                                      border: OutlineInputBorder(),
                                      prefixIcon: Icon(Icons.email),
                                    ),
                                    onChanged: (value) {
                                      context.read<SignUpBloc>().add(
                                          SignUpTextChangedEvent(
                                              value,
                                              passwordController.text,
                                              confirmPasswordController.text));
                                    },
                                  ),
                                  const SizedBox(height: 16),
                                  TextFormField(
                                    controller: passwordController,
                                    obscureText: true,
                                    decoration: const InputDecoration(
                                      labelText: 'Password',
                                      border: OutlineInputBorder(),
                                      prefixIcon: Icon(Icons.lock),
                                    ),
                                    onChanged: (value) {
                                      context.read<SignUpBloc>().add(
                                          SignUpTextChangedEvent(
                                              emailController.text,
                                              value,
                                              confirmPasswordController.text));
                                    },
                                  ),
                                  const SizedBox(height: 16),
                                  TextFormField(
                                    controller: confirmPasswordController,
                                    obscureText: true,
                                    decoration: const InputDecoration(
                                      labelText: 'Confirm Password',
                                      border: OutlineInputBorder(),
                                      prefixIcon: Icon(Icons.lock),
                                    ),
                                    onChanged: (value) {
                                      context.read<SignUpBloc>().add(
                                          SignUpTextChangedEvent(
                                              emailController.text,
                                              passwordController.text,
                                              value));
                                    },
                                  ),
                                  const SizedBox(height: 32),
                                  ElevatedButton(
                                    onPressed: () {
                                      context.read<SignUpBloc>().add(
                                          SignUpSubmittedEvent(
                                              emailController.text,
                                              passwordController.text,
                                              confirmPasswordController.text));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue[900],
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      minimumSize: const Size(150, 50),
                                    ),
                                    child: const Text(
                                      'Sign Up',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Text.rich(
                                    TextSpan(
                                      text: 'Already have an account? ',
                                      children: [
                                        TextSpan(
                                          text: 'Login',
                                          style: const TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              context.go('/login');
                                            },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
