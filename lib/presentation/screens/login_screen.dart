import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/blocs/login_bloc/login_bloc.dart';
import '../widgets/snackbar.dart';
import '../widgets/submit_button.dart';
import '../widgets/textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Login',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: BlocListener<LoginUserBloc, LoginUserState>(
          listener: (context, state) {
            if (state is LoginUserWithEmailAndPasswordLoadingState) {
            } else if (state
                is LoginUserWithEmailAndPasswordSuccessVerifiedState) {
              snackBar(context, content: 'Logged in successfully!');
            } else if (state
                is LoginUserWithEmailAndPasswordSuccessUnverifiedState) {
              snackBar(
                context,
                content:
                    'Logged in successfully but you need to verify your email to continue!',
              );
            } else if (state is LoginUserWithEmailAndPasswordFailureState) {
              snackBar(context, content: state.e);
            } else if (state
                is LoginUserWithEmailAndPasswordFailureInvalidEmailState) {
              snackBar(context, content: state.e);
            } else if (state
                is LoginUserWithEmailAndPasswordFailureWrongCredentialsState) {
              snackBar(context, content: state.e);
            } else if (state
                is LoginUserWithEmailAndPasswordFailureEmptyFields) {
              snackBar(context, content: state.e);
            } else if (state is LoginUserWithGoogleSuccessState) {
              Navigator.of(context).pushReplacementNamed('/');
              snackBar(context, content: 'Logged in successfully!');
            } else if (state is LoginUserWithGoogleFailureState) {
              snackBar(context, content: 'Failed to login. Try again later.');
            }
          },
          child: Column(
            children: [
              const SizedBox(height: 36),
              textField(
                controller: _emailController,
                hintText: 'Email Address..',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 24),
              textField(
                controller: _passwordController,
                hintText: 'Password..',
                isObscure: true,
                keyboardType: TextInputType.visiblePassword,
              ),
              const SizedBox(height: 24),
              BlocBuilder<LoginUserBloc, LoginUserState>(
                builder: (context, state) {
                  return state is LoginUserWithEmailAndPasswordLoadingState
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : submitButton(
                          context,
                          label: 'Login',
                          onTap: () {
                            context.read<LoginUserBloc>().add(
                                  LoggedInUserWithEmailAndPasswordEvent(
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                    context: context,
                                  ),
                                );
                          },
                        );
                },
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Don\'t have an account? '),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        '/register',
                      );
                    },
                    child: Text(
                      'Register now.',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 64),
              BlocBuilder<LoginUserBloc, LoginUserState>(
                builder: (context, state) {
                  return state is LoginUserWithGoogleLoadingState
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : googleSubmitButton(
                          context,
                          onTap: () {
                            context.read<LoginUserBloc>().add(
                                  LoggedInUserWithGoogleEvent(),
                                );
                          },
                        );
                },
              ),
              const SizedBox(height: 16),
              // BlocBuilder<LoginUserBloc, LoginUserState>(
              //   builder: (context, state) {
              //     return state is LoginUserWithGoogleLoadingState
              //         ? const Center(
              //             child: CircularProgressIndicator(),
              //           )
              //         : submitButton(
              //             context,
              //             label: 'Login with phone number',
              //             onTap: () {
              //               Navigator.of(context).pushNamed('/phone_login');
              //             },
              //           );
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
