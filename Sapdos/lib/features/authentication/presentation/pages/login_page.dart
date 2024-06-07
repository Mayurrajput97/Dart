import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_work/features/authentication/presentation/widgets/header_section.dart';
import 'package:practice_work/features/authentication/presentation/widgets/left_image_section.dart';
import 'package:practice_work/features/authentication/presentation/bloc/login/login_bloc.dart';
import 'package:practice_work/features/authentication/presentation/bloc/login/login_event.dart';
import 'package:practice_work/features/authentication/presentation/bloc/login/login_state.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

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
                  create: (context) => LoginBloc(),
                  child: BlocListener<LoginBloc, LoginState>(
                    listener: (context, state) {
                      if (state is LoginSuccessState) {
                        if (state.role == 'doctor') {
                          Navigator.pushNamed(context, '/doctor');
                        } else if (state.role == 'patient') {
                          Navigator.pushNamed(context, '/patient');
                        }
                      } else if (state is LoginErrorState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.errorMessage)),
                        );
                      }
                    },
                    child: BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        if (state is LoginLoadingState) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }

                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const HeaderSection(
                              title: 'SAPDOS',
                              subtitle: 'Welcome back',
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
                                      context.read<LoginBloc>().add(
                                          LoginTextChangedEvent(
                                              value, passwordController.text));
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
                                      context.read<LoginBloc>().add(
                                          LoginTextChangedEvent(
                                              emailController.text, value));
                                    },
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Checkbox(
                                            value: true,
                                            onChanged: (value) {},
                                          ),
                                          const Text(
                                            'Remember me',
                                            style: TextStyle(
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ],
                                      ),
                                      MouseRegion(
                                        cursor: SystemMouseCursors.click,
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: const Text(
                                            'Forgot Password?',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 4, 48, 116),
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 32),
                                  ElevatedButton(
                                    onPressed: () {
                                      context.read<LoginBloc>().add(
                                          LoginSubmittedEvent(
                                              emailController.text,
                                              passwordController.text));
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
                                  MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: RichText(
                                      text: TextSpan(
                                        text: 'Not on Sapdos? ',
                                        style: const TextStyle(
                                            color: Colors.black),
                                        children: [
                                          TextSpan(
                                            text: 'Sign up',
                                            style: const TextStyle(
                                              color: Color.fromRGBO(
                                                  1, 118, 214, 0.772),
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                Navigator.pushNamed(
                                                    context, '/signup');
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
          ),
        ],
      ),
    );
  }
}
