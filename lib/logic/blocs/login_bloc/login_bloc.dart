import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginUserBloc extends Bloc<LoginUserEvent, LoginUserState> {
  String verificationId = '';
  LoginUserBloc()
      : super(LoginUserWithEmailAndPasswordInitialState(isLoading: false)) {
    on<LoggedInUserWithEmailAndPasswordEvent>((event, emit) async {
      if (event.email.isNotEmpty && event.password.isNotEmpty) {
        emit(LoginUserWithEmailAndPasswordLoadingState(isLoading: true));
        try {
          await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );
          if (FirebaseAuth.instance.currentUser!.emailVerified) {
            log('========= NAVIGATING TO HOME =========');
            emit(LoginUserWithEmailAndPasswordSuccessVerifiedState(
                isLoading: false));
            Navigator.pushReplacementNamed(
              event.context,
              '/',
            );
          } else {
            log('========= NAVIGATING TO VERIFY =========');
            await FirebaseAuth.instance.currentUser!.sendEmailVerification();
            emit(LoginUserWithEmailAndPasswordSuccessUnverifiedState(
                isLoading: false));
            Navigator.pushReplacementNamed(
              event.context,
              '/verify',
            );
          }
          log('========= SUCCESS =========');
        } on FirebaseAuthException catch (e) {
          if (e.code == 'invalid-email') {
            emit(
              LoginUserWithEmailAndPasswordFailureInvalidEmailState(
                e: 'Invalid email format!',
                isLoading: false,
              ),
            );
            log('========= INVALID EMAIL =========');
          } else if (e.code == 'wrong-credentials' ||
              e.code == 'user-not-found' ||
              e.code == 'wrong-password') {
            emit(
              LoginUserWithEmailAndPasswordFailureWrongCredentialsState(
                e: 'Wrong credentials!',
                isLoading: false,
              ),
            );
            log('========= WRONG CREDENTIALS =========');
          }
        }
      } else {
        emit(
          LoginUserWithEmailAndPasswordFailureEmptyFields(
            e: 'Email or password cannot be empty!',
            isLoading: false,
          ),
        );
        log('========= EMPTY FIELDS =========');
      }
    });
    on<LoggedInUserWithGoogleEvent>((event, emit) async {
      emit(LoginUserWithGoogleLoadingState(isLoading: true));
      try {
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

        // Obtain the auth details from the request
        final GoogleSignInAuthentication? googleAuth =
            await googleUser?.authentication;

        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );

        await FirebaseAuth.instance.signInWithCredential(credential);
        emit(LoginUserWithGoogleSuccessState(isLoading: false));
      } catch (e) {
        emit(LoginUserWithGoogleFailureState(
          isLoading: false,
          e: e.toString(),
        ));
      }
    });
    //   on<LoggedInUserWithPhoneNumberEvent>((event, emit) async {
    //     emit(LoginUserWithPhoneNumberLoadingState(isLoading: true));
    //     if (event.phoneNumber.isNotEmpty) {
    //       try {
    //         await FirebaseAuth.instance.verifyPhoneNumber(
    //           phoneNumber: event.phoneNumber,
    //           verificationCompleted: (PhoneAuthCredential credential) async {
    //             await FirebaseAuth.instance.signInWithCredential(credential);
    //             emit(LoginUserWithPhoneNumberSuccessState(isLoading: false));
    //           },
    //           verificationFailed: (FirebaseAuthException e) {
    //             emit(
    //               LoginUserWithPhoneNumberFailureState(
    //                 e: e.message ?? 'Error',
    //                 isLoading: false,
    //               ),
    //             );
    //           },
    //           codeSent: (String verificationId, int? resendToken) {
    //             verificationId = verificationId;
    //             emit(LoginUserWithPhoneNumberCodeSentState(
    //               verificationId: verificationId,
    //               isLoading: false,
    //             ));
    //           },
    //           codeAutoRetrievalTimeout: (String verificationId) {},
    //         );
    //       } catch (e) {
    //         emit(
    //           LoginUserWithPhoneNumberFailureState(
    //             e: e.toString(),
    //             isLoading: false,
    //           ),
    //         );
    //       }
    //     } else if (event.phoneNumber.isEmpty) {
    //       emit(LoginUserWithPhoneNumberFailureEmptyFieldsState(isLoading: false));
    //     }
    //   });

    //   on<VerifyPhoneNumberEvent>((event, emit) async {
    //     emit(LoginUserWithEmailAndPasswordLoadingState(isLoading: true));
    //     try {
    //       final PhoneAuthCredential credential = PhoneAuthProvider.credential(
    //         verificationId: event.verificationId,
    //         smsCode: event.smsCode,
    //       );
    //       await FirebaseAuth.instance.signInWithCredential(credential);
    //       emit(LoginUserWithEmailAndPasswordSuccessVerifiedState(
    //           isLoading: false));
    //     } catch (e) {
    //       emit(LoginUserWithEmailAndPasswordFailureState(
    //           e: 'Invalid code', isLoading: false));
    //     }
    //   });
  }
}
