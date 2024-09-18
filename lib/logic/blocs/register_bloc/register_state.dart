part of 'register_bloc.dart';

class RegisterUserState {
  final bool isLoading;
  final String content;

  RegisterUserState({
    required this.content,
    required this.isLoading,
  });
}

class RegisterUserInitialState extends RegisterUserState {
  RegisterUserInitialState({
    required super.isLoading,
    required super.content,
  });
}

class RegisterUserLoadingState extends RegisterUserState {
  RegisterUserLoadingState({
    required super.isLoading,
    required super.content,
  });
}

class RegisterUserSuccessState extends RegisterUserState {
  RegisterUserSuccessState({
    required super.isLoading,
    required super.content,
  });
}

class RegisterUserFailureState extends RegisterUserState {
  RegisterUserFailureState({
    required super.isLoading,
    required super.content,
  });
}

class RegisterUserFailureInvalidEmailState extends RegisterUserState {
  RegisterUserFailureInvalidEmailState({
    required super.isLoading,
    required super.content,
  });
}

class RegisterUserFailureEmailExistsState extends RegisterUserState {
  RegisterUserFailureEmailExistsState({
    required super.isLoading,
    required super.content,
  });
}

class RegisterUserFailureInvalidPasswordState extends RegisterUserState {
  RegisterUserFailureInvalidPasswordState({
    required super.isLoading,
    required super.content,
  });
}

class RegisterUserFailureEmptyFields extends RegisterUserState {
  RegisterUserFailureEmptyFields({
    required super.isLoading,
    required super.content,
  });
}
