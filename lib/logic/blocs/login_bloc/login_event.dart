part of 'login_bloc.dart';

abstract class LoginUserEvent {}

class LoggedInUserWithEmailAndPasswordEvent extends LoginUserEvent {
  final String email;
  final String password;
  final BuildContext context;

  LoggedInUserWithEmailAndPasswordEvent({
    required this.email,
    required this.password,
    required this.context,
  });
}

class LoggedInUserWithGoogleEvent extends LoginUserEvent {}

// class LoggedInUserWithPhoneNumberEvent extends LoginUserEvent {
//   final String phoneNumber;

//   LoggedInUserWithPhoneNumberEvent({required this.phoneNumber});
// }

// class VerifyPhoneNumberEvent extends LoginUserEvent {
//   final String verificationId;
//   final String smsCode;

//   VerifyPhoneNumberEvent({
//     required this.verificationId,
//     required this.smsCode,
//   });
// }
