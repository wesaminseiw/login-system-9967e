part of 'login_bloc.dart';

abstract class LoginUserState {
  final bool isLoading;

  LoginUserState({required this.isLoading});
}

class LoginUserWithEmailAndPasswordInitialState extends LoginUserState {
  LoginUserWithEmailAndPasswordInitialState({required super.isLoading});
}

class LoginUserWithEmailAndPasswordLoadingState extends LoginUserState {
  LoginUserWithEmailAndPasswordLoadingState({required super.isLoading});
}

class LoginUserWithEmailAndPasswordSuccessUnverifiedState
    extends LoginUserState {
  LoginUserWithEmailAndPasswordSuccessUnverifiedState(
      {required super.isLoading});
}

class LoginUserWithEmailAndPasswordSuccessVerifiedState extends LoginUserState {
  LoginUserWithEmailAndPasswordSuccessVerifiedState({required super.isLoading});
}

class LoginUserWithEmailAndPasswordFailureState extends LoginUserState {
  final String e;

  LoginUserWithEmailAndPasswordFailureState({
    required this.e,
    required super.isLoading,
  });
}

class LoginUserWithEmailAndPasswordFailureWrongCredentialsState
    extends LoginUserState {
  final String e;

  LoginUserWithEmailAndPasswordFailureWrongCredentialsState({
    required this.e,
    required super.isLoading,
  });
}

class LoginUserWithEmailAndPasswordFailureInvalidEmailState
    extends LoginUserState {
  final String e;

  LoginUserWithEmailAndPasswordFailureInvalidEmailState({
    required this.e,
    required super.isLoading,
  });
}

class LoginUserWithEmailAndPasswordFailureEmptyFields extends LoginUserState {
  final String e;

  LoginUserWithEmailAndPasswordFailureEmptyFields({
    required this.e,
    required super.isLoading,
  });
}

// google sign in states

class LoginUserWithGoogleInitialState extends LoginUserState {
  LoginUserWithGoogleInitialState({required super.isLoading});
}

class LoginUserWithGoogleLoadingState extends LoginUserState {
  LoginUserWithGoogleLoadingState({required super.isLoading});
}

class LoginUserWithGoogleSuccessState extends LoginUserState {
  LoginUserWithGoogleSuccessState({required super.isLoading});
}

class LoginUserWithGoogleFailureState extends LoginUserState {
  final String e;

  LoginUserWithGoogleFailureState({
    required this.e,
    required super.isLoading,
  });
}

// phone auth

// class LoginUserWithPhoneNumberInitialState extends LoginUserState {
//   LoginUserWithPhoneNumberInitialState({required super.isLoading});
// }

// class LoginUserWithPhoneNumberLoadingState extends LoginUserState {
//   LoginUserWithPhoneNumberLoadingState({required super.isLoading});
// }

// class LoginUserWithPhoneNumberSuccessState extends LoginUserState {
//   LoginUserWithPhoneNumberSuccessState({required super.isLoading});
// }

// class LoginUserWithPhoneNumberFailureState extends LoginUserState {
//   final String e;

//   LoginUserWithPhoneNumberFailureState({
//     required this.e,
//     required super.isLoading,
//   });
// }

// class LoginUserWithPhoneNumberFailureEmptyFieldsState extends LoginUserState {
//   LoginUserWithPhoneNumberFailureEmptyFieldsState({
//     required super.isLoading,
//   });
// }

// class LoginUserWithPhoneNumberCodeSentState extends LoginUserState {
//   final String verificationId;

//   LoginUserWithPhoneNumberCodeSentState({
//     required this.verificationId,
//     required super.isLoading,
//   });
// }
