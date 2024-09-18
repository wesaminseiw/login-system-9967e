part of 'login_bloc.dart';

abstract class LoginUserState {
  final bool isLoading;
  final String content;

  LoginUserState({
    required this.content,
    required this.isLoading,
  });
}

class LoginUserWithEmailAndPasswordInitialState extends LoginUserState {
  LoginUserWithEmailAndPasswordInitialState({
    required super.isLoading,
    required super.content,
  });
}

class LoginUserWithEmailAndPasswordLoadingState extends LoginUserState {
  LoginUserWithEmailAndPasswordLoadingState({
    required super.isLoading,
    required super.content,
  });
}

class LoginUserWithEmailAndPasswordSuccessUnverifiedState
    extends LoginUserState {
  LoginUserWithEmailAndPasswordSuccessUnverifiedState({
    required super.isLoading,
    required super.content,
  });
}

class LoginUserWithEmailAndPasswordSuccessVerifiedState extends LoginUserState {
  LoginUserWithEmailAndPasswordSuccessVerifiedState({
    required super.isLoading,
    required super.content,
  });
}

class LoginUserWithEmailAndPasswordFailureState extends LoginUserState {
  LoginUserWithEmailAndPasswordFailureState({
    required super.isLoading,
    required super.content,
  });
}

class LoginUserWithEmailAndPasswordFailureWrongCredentialsState
    extends LoginUserState {
  LoginUserWithEmailAndPasswordFailureWrongCredentialsState({
    required super.isLoading,
    required super.content,
  });
}

class LoginUserWithEmailAndPasswordFailureInvalidEmailState
    extends LoginUserState {
  LoginUserWithEmailAndPasswordFailureInvalidEmailState({
    required super.isLoading,
    required super.content,
  });
}

class LoginUserWithEmailAndPasswordFailureEmptyFields extends LoginUserState {
  LoginUserWithEmailAndPasswordFailureEmptyFields({
    required super.isLoading,
    required super.content,
  });
}

// google sign in states

class LoginUserWithGoogleInitialState extends LoginUserState {
  LoginUserWithGoogleInitialState({
    required super.isLoading,
    required super.content,
  });
}

class LoginUserWithGoogleLoadingState extends LoginUserState {
  LoginUserWithGoogleLoadingState({
    required super.isLoading,
    required super.content,
  });
}

class LoginUserWithGoogleSuccessState extends LoginUserState {
  LoginUserWithGoogleSuccessState({
    required super.isLoading,
    required super.content,
  });
}

class LoginUserWithGoogleFailureState extends LoginUserState {
  LoginUserWithGoogleFailureState({
    required super.isLoading,
    required super.content,
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
//   LoginUserWithPhoneNumberFailureState({required super.isLoading});
// }

// class LoginUserWithPhoneNumberFailureEmptyFieldsState extends LoginUserState {
//   LoginUserWithPhoneNumberFailureEmptyFieldsState({required super.isLoading});
// }

// class LoginUserWithPhoneNumberCodeSentState extends LoginUserState {
//   final String verificationId;

//   LoginUserWithPhoneNumberCodeSentState({
//     required this.verificationId,
//     required super.isLoading,
//   });
// }
