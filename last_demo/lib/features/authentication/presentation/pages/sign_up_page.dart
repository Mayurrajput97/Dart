import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:last_demo/features/authentication/data/models/user_model.dart';
import 'package:last_demo/features/authentication/presentation/blocs/sign_up/sign_up_bloc.dart';
import 'package:last_demo/features/authentication/presentation/blocs/sign_up/sign_up_event.dart';
import 'package:last_demo/features/authentication/presentation/blocs/sign_up/sign_up_state.dart';
import 'package:last_demo/features/authentication/presentation/widgets/header_section.dart';
import 'package:last_demo/features/authentication/presentation/widgets/left_image_section.dart';
import 'package:go_router/go_router.dart';

class SignupPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                      subtitle: 'Create a new account',
                      description: '',
                    ),
                    const SizedBox(height: 32),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 300),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                              labelText: 'Email or Phone',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.email),
                            ),
                            onChanged: (value) {
                              context.read<SignupBloc>().add(
                                    SignupTextChangedEvent(
                                      _emailController.text,
                                      _passwordController.text,
                                      _confirmPasswordController.text,
                                    ),
                                  );
                            },
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.lock),
                            ),
                            onChanged: (value) {
                              context.read<SignupBloc>().add(
                                    SignupTextChangedEvent(
                                      _emailController.text,
                                      _passwordController.text,
                                      _confirmPasswordController.text,
                                    ),
                                  );
                            },
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: _confirmPasswordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: 'Confirm Password',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.lock),
                            ),
                            onChanged: (value) {
                              context.read<SignupBloc>().add(
                                    SignupTextChangedEvent(
                                      _emailController.text,
                                      _passwordController.text,
                                      _confirmPasswordController.text,
                                    ),
                                  );
                            },
                          ),
                          const SizedBox(height: 32),
                          ElevatedButton(
                            onPressed: () {
                              final user = UserModel(
                                email: _emailController.text,
                                password: _passwordController.text,
                                role: 'user',
                              );
                              context.read<SignupBloc>().add(
                                    SignupSubmittedEvent(user),
                                  );
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
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      context.go('/login');
                                    },
                                ),
                              ],
                            ),
                          ),
                          BlocConsumer<SignupBloc, SignupState>(
                            listener: (context, state) {
                              if (state is SignupSuccessState) {
                                context.go('/doctor');
                              }
                            },
                            builder: (context, state) {
                              if (state is SignupLoadingState) {
                                return CircularProgressIndicator();
                              }
                              if (state is SignupErrorState) {
                                return Text(
                                  state.errorMessage,
                                  style: TextStyle(color: Colors.red),
                                );
                              }
                              return SizedBox.shrink();
                            },
                          ),
                        ],
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
  }
}
