import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterUserBloc extends Bloc<RegisterUserEvent, RegisterUserState> {
  RegisterUserBloc()
      : super(RegisterUserInitialState(
          isLoading: false,
          content: '',
        )) {
    on<RegisteredUserEvent>((event, emit) async {
      log('========= LOADING =========');
      if (event.email.isNotEmpty && event.password.isNotEmpty) {
        emit(RegisterUserLoadingState(
          isLoading: true,
          content: '',
        ));
        try {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );
          await FirebaseAuth.instance.currentUser!.sendEmailVerification();
          log('========= SUCCESS =========');
          emit(RegisterUserSuccessState(
            isLoading: false,
            content: 'Registered successfully!',
          ));
        } on FirebaseAuthException catch (e) {
          if (e.code == 'invalid-email') {
            emit(
              RegisterUserFailureInvalidEmailState(
                content: 'Invalid email format!',
                isLoading: false,
              ),
            );
            log('========= INVALID EMAIL =========');
          } else if (e.code == 'weak-password') {
            emit(
              RegisterUserFailureInvalidPasswordState(
                content: 'The provided password is weak!',
                isLoading: false,
              ),
            );
            log('========= INVALID PASSWORD =========');
          } else if (e.code == 'email-already-in-use') {
            emit(
              RegisterUserFailureEmailExistsState(
                content: 'Email already in use by another user!',
                isLoading: false,
              ),
            );
            log('========= EMAIL ALREADY IN USE =========');
          } else {
            emit(
              RegisterUserFailureState(
                content: 'An error occurred! Try again later',
                isLoading: false,
              ),
            );
            log('========= FAILURE =========');
          }
        }
      } else {
        emit(
          RegisterUserFailureEmptyFields(
            content: 'Email or password cannot be empty!',
            isLoading: false,
          ),
        );
        log('========= EMPTY FIELDS =========');
      }
    });
  }
}
