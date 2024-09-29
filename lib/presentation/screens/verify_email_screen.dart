import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_system/logic/cubits/user_actions_cubit/user_actions_cubit.dart';
import 'package:login_system/presentation/styles/colors.dart';
import 'package:login_system/presentation/widgets/circular_progress_indicator.dart';
import 'package:login_system/presentation/widgets/sizedboxes.dart';
import 'package:login_system/presentation/widgets/snackbar.dart';
import 'package:login_system/presentation/widgets/submit_button.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<UserActionsCubit, UserActionsState>(
      listener: (context, state) {
        if (state is UserActionsDeleteUserSuccessState) {
          successSnackBar(
            context,
            content: state.content,
          );
        } else if (state is UserActionsCheckUserVerificationNotVerifiedState) {
          infoSnackBar(
            context,
            content: state.content,
          );
        } else if (state
            is UserActionsCheckUserVerificationVerifiedSuccessfullyState) {
          Navigator.of(context).pushReplacementNamed('/home');
          successSnackBar(
            context,
            content: state.content,
          );
        } else if (state is UserActionsCheckUserVerificationFailureState) {
          failureSnackBar(
            context,
            content: state.content,
          );
        } else if (state
            is UserActionsCheckUserVerificationUserNotFoundFailureState) {
          failureSnackBar(
            context,
            content: state.content,
          );
          Navigator.of(context).pushReplacementNamed('/login');
        }
      },
      child: Scaffold(
        backgroundColor: thirdColor,
        body: Column(
          children: [
            height(MediaQuery.of(context).padding.top),
            Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: (MediaQuery.of(context).size.height *
                              0.0578817733990148) +
                          MediaQuery.of(context).padding.top,
                    ),
                    child: Row(
                      children: [
                        width(24),
                        Text(
                          'Verify',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 44,
                            fontWeight: FontWeight.bold,
                            color: fourthColor,
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height *
                              0.1847290640394089,
                          child: Image.asset(
                            'assets/images/verify_email.jpg',
                            fit: BoxFit.contain,
                          ),
                        ),
                        width(24),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    height(
                      MediaQuery.of(context).size.height *
                          (1 - 0.6003694581280788),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height *
                              (0.6003694581280788) -
                          (MediaQuery.of(context).padding.top),
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    height(
                      MediaQuery.of(context).size.height *
                          (1 - 0.5815270935960591),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height *
                              (0.5815270935960591) -
                          (MediaQuery.of(context).padding.top),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        children: [
                          const Padding(
                            padding:
                                EdgeInsets.only(left: 16, right: 16, top: 96),
                            child: Text(
                              'We\'ve sent a link to your email inbox, follow it to verify your email.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          height(96),
                          BlocBuilder<UserActionsCubit, UserActionsState>(
                            builder: (context, state) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  state is UserActionsCheckUserVerificationLoadingState
                                      ? submitButtonCircularProgressIndicator(
                                          width:
                                              MediaQuery.of(context).size.width,
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 16,
                                          ),
                                          child: submitButton(
                                            context,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            label: 'Check Verification',
                                            labelStyle: TextStyle(
                                              color: thirdColor,
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            onTap: () {
                                              context
                                                  .read<UserActionsCubit>()
                                                  .checkEmailVerification(
                                                      context);
                                            },
                                          ),
                                        ),
                                  height(32),
                                  state is UserActionsDeleteUserLoadingState
                                      ? submitButtonCircularProgressIndicator(
                                          width:
                                              MediaQuery.of(context).size.width,
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 16,
                                          ),
                                          child: submitButton(
                                            context,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            label: 'Delete Account',
                                            labelStyle: TextStyle(
                                              color: thirdColor,
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            onTap: () async {
                                              await context
                                                  .read<UserActionsCubit>()
                                                  .deleteUser(context);
                                            },
                                          ),
                                        ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
