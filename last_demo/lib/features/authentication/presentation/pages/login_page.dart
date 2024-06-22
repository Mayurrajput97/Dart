import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:last_demo/features/authentication/presentation/blocs/login/login_bloc.dart';
import 'package:last_demo/features/authentication/presentation/blocs/login/login_event.dart';
import 'package:last_demo/features/authentication/presentation/blocs/login/login_state.dart';
import 'package:last_demo/features/authentication/presentation/widgets/header_section.dart';
import 'package:last_demo/features/authentication/presentation/widgets/left_image_section.dart';
import 'package:go_router/go_router.dart'; 

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                      subtitle: 'Welcome back',
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
                              context.read<LoginBloc>().add(
                                  LoginTextChangedEvent(
                                      value, _passwordController.text));
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
                              context.read<LoginBloc>().add(
                                  LoginTextChangedEvent(
                                      _emailController.text, value));
                            },
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Checkbox(
                                value: true,
                                onChanged: (value) {},
                              ),
                              const Text('Remember Me'),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {},
                                child: const Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 32),
                          ElevatedButton(
                            onPressed: () {
                              context.read<LoginBloc>().add(LoginSubmittedEvent(
                                  _emailController.text,
                                  _passwordController.text));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[900],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              minimumSize: const Size(150, 50),
                            ),
                            child: const Text(
                              'Login',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text.rich(
                            TextSpan(
                              text: 'Don\'t have an account? ',
                              children: [
                                TextSpan(
                                  text: 'Sign Up',
                                  style: const TextStyle(
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      context.go('/signup');
                                    },
                                ),
                              ],
                            ),
                          ),
                          BlocConsumer<LoginBloc, LoginState>(
                            listener: (context, state) {
                              if (state is LoginSuccessState) {
                                context.go('/doctor');
                              }
                            },
                            builder: (context, state) {
                              if (state is LoginLoadingState) {
                                return CircularProgressIndicator();
                              }
                              if (state is LoginErrorState) {
                                return Text(state.errorMessage,
                                    style: TextStyle(color: Colors.red));
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
