import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_work/features/authentication/presentation/widgets/header_section.dart';
import 'package:practice_work/features/authentication/presentation/widgets/left_image_section.dart';
import 'package:practice_work/features/authentication/presentation/bloc/sign_up/sign_up_bloc.dart';
import 'package:practice_work/features/authentication/presentation/bloc/sign_up/sign_up_event.dart';
import 'package:practice_work/features/authentication/presentation/bloc/sign_up/sign_up_state.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController nameController = TextEditingController();

    return Scaffold(
      body: Row(
        children: [
          const LeftImageSection(imagePath: 'assets/images/login_page.jpg'),
          Expanded(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(32.0),
              child: BlocProvider(
                create: (context) => SignUpBloc(),
                child: BlocListener<SignUpBloc, SignUpState>(
                  listener: (context, state) {
                    if (state is SignUpSuccessState) {
                      Navigator.pushNamed(context, '/doctor');
                    } else if (state is SignUpErrorState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.errorMessage)),
                      );
                    }
                  },
                  child: BlocBuilder<SignUpBloc, SignUpState>(
                    builder: (context, state) {
                      if (state is SignUpLoadingState) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const HeaderSection(
                            title: 'SAPDOS',
                            subtitle: 'Register',
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
                                            emailController.text,
                                            passwordController.text,
                                            nameController.text,
                                          ),
                                        );
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
                                            nameController.text,
                                          ),
                                        );
                                  },
                                ),
                                const SizedBox(height: 16),
                                TextFormField(
                                  controller: nameController,
                                  decoration: const InputDecoration(
                                    labelText: 'Name',
                                    border: OutlineInputBorder(),
                                    prefixIcon: Icon(Icons.person),
                                  ),
                                  onChanged: (value) {
                                    context.read<SignUpBloc>().add(
                                          SignUpTextChangedEvent(
                                            emailController.text,
                                            passwordController.text,
                                            value,
                                          ),
                                        );
                                  },
                                ),
                                const SizedBox(height: 32),
                                ElevatedButton(
                                  onPressed: () {
                                    context.read<SignUpBloc>().add(
                                          SignUpSubmittedEvent(
                                            emailController.text,
                                            passwordController.text,
                                            nameController.text,
                                          ),
                                        );
                                  },
                                  child: const Text(
                                    'Sign Up',
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
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Already on Sapdos? ',
                                      style:
                                          const TextStyle(color: Colors.black),
                                      children: [
                                        TextSpan(
                                          text: 'Sign in',
                                          style: const TextStyle(
                                            color: Color.fromRGBO(
                                                1, 118, 214, 0.941),
                                            decoration:
                                                TextDecoration.underline,
                                            fontSize: 20.0,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Navigator.pushNamed(
                                                  context, '/login');
                                            },
                                        ),
                                      ],
                                    ),
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
        ],
      ),
    );
  }
}
