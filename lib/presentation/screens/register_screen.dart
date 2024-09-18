import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_system/logic/blocs/login_bloc/login_bloc.dart';
import 'package:login_system/presentation/widgets/circular_progress_indicator.dart';
import 'package:login_system/presentation/widgets/or_seperator.dart';
import 'package:login_system/presentation/widgets/sizedboxes.dart';
import '../../logic/blocs/register_bloc/register_bloc.dart';
import '../widgets/snackbar.dart';
import '../widgets/submit_button.dart';
import '../widgets/textfield.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  // Function to scroll to the bottom after the keyboard appears
  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    if (bottomInset > 0) {
      _scrollToBottom();
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: MultiBlocListener(
          listeners: [
            BlocListener<RegisterUserBloc, RegisterUserState>(
              listener: (context, state) {
                if (state is RegisterUserLoadingState) {
                } else if (state is RegisterUserSuccessState) {
                  successSnackBar(context, content: state.content);
                  Navigator.of(context).pushReplacementNamed('/verify');
                } else if (state is RegisterUserFailureState) {
                  failureSnackBar(context, content: state.content);
                } else if (state is RegisterUserFailureEmailExistsState) {
                  failureSnackBar(context, content: state.content);
                } else if (state is RegisterUserFailureInvalidEmailState) {
                  failureSnackBar(context, content: state.content);
                } else if (state is RegisterUserFailureInvalidPasswordState) {
                  failureSnackBar(context, content: state.content);
                } else if (state is RegisterUserFailureEmptyFields) {
                  failureSnackBar(context, content: state.content);
                }
              },
            ),
            BlocListener<LoginUserBloc, LoginUserState>(
              listener: (context, state) {
                if (state is LoginUserWithGoogleSuccessState) {
                  successSnackBar(context, content: state.content);
                  Navigator.of(context).pushReplacementNamed('/home');
                } else if (state is LoginUserWithGoogleFailureState) {
                  failureSnackBar(context, content: state.content);
                }
              },
            ),
          ],
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Container(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height,
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/register_screen_bg.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  height(MediaQuery.of(context).size.height / 2.1),
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 16,
                          bottom: 16,
                        ),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 36,
                          ),
                        ),
                      ),
                    ],
                  ),
                  textField(
                    controller: _emailController,
                    hintText: 'Email Address..',
                    focusNode: _emailFocusNode,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Image.asset(
                      'assets/images/email.png',
                      scale: 11,
                    ),
                  ),
                  height(16),
                  textField(
                    controller: _passwordController,
                    isObscure: true,
                    focusNode: _passwordFocusNode,
                    hintText: 'Password..',
                    keyboardType: TextInputType.visiblePassword,
                    prefixIcon: Image.asset(
                      'assets/images/password.png',
                      scale: 11,
                    ),
                  ),
                  height(16),
                  BlocBuilder<RegisterUserBloc, RegisterUserState>(
                    builder: (context, state) {
                      return state is RegisterUserLoadingState
                          ? submitButtonCircularProgressIndicator(
                              width: MediaQuery.of(context).size.width,
                            )
                          : Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: submitButton(
                                context,
                                label: 'Sign Up',
                                onTap: () {
                                  context.read<RegisterUserBloc>().add(
                                        RegisteredUserEvent(
                                          email: _emailController.text,
                                          password: _passwordController.text,
                                          context: context,
                                        ),
                                      );
                                },
                              ),
                            );
                    },
                  ),
                  height(18),
                  orSeperator(),
                  height(18),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: submitButton(
                          context,
                          width: MediaQuery.of(context).size.width * 0.436,
                          label: 'Login',
                          onTap: () {
                            Navigator.pushReplacementNamed(
                              context,
                              '/login',
                            );
                          },
                        ),
                      ),
                      BlocBuilder<LoginUserBloc, LoginUserState>(
                        builder: (context, state) {
                          return state is LoginUserWithGoogleLoadingState
                              ? submitButtonCircularProgressIndicator(
                                  width:
                                      MediaQuery.of(context).size.width * 0.436,
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
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
