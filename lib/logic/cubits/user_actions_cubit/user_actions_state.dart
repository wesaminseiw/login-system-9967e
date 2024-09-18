part of 'user_actions_cubit.dart';

@immutable
abstract class UserActionsState {
  final bool isLoading;
  final String content;

  const UserActionsState({
    required this.content,
    required this.isLoading,
  });
}

class UserActionsInitialState extends UserActionsState {
  const UserActionsInitialState({
    required super.isLoading,
    required super.content,
  });
}

// Sign out states
class UserActionsSignOutLoadingState extends UserActionsState {
  const UserActionsSignOutLoadingState({
    required super.isLoading,
    required super.content,
  });
}

class UserActionsSignOutSuccessState extends UserActionsState {
  const UserActionsSignOutSuccessState({
    required super.isLoading,
    required super.content,
  });
}

class UserActionsSignOutFailureState extends UserActionsState {
  const UserActionsSignOutFailureState({
    required super.isLoading,
    required super.content,
  });
}

// Delete user states
class UserActionsDeleteUserLoadingState extends UserActionsState {
  const UserActionsDeleteUserLoadingState({
    required super.isLoading,
    required super.content,
  });
}

class UserActionsDeleteUserSuccessState extends UserActionsState {
  const UserActionsDeleteUserSuccessState({
    required super.isLoading,
    required super.content,
  });
}

class UserActionsDeleteUserFailureState extends UserActionsState {
  const UserActionsDeleteUserFailureState({
    required super.isLoading,
    required super.content,
  });
}

// Check user verification states
class UserActionsCheckUserVerificationLoadingState extends UserActionsState {
  const UserActionsCheckUserVerificationLoadingState({
    required super.isLoading,
    required super.content,
  });
}

class UserActionsCheckUserVerificationVerifiedSuccessfullyState
    extends UserActionsState {
  const UserActionsCheckUserVerificationVerifiedSuccessfullyState({
    required super.isLoading,
    required super.content,
  });
}

class UserActionsCheckUserVerificationFailureState extends UserActionsState {
  const UserActionsCheckUserVerificationFailureState({
    required super.isLoading,
    required super.content,
  });
}

class UserActionsCheckUserVerificationUserNotFoundFailureState
    extends UserActionsState {
  const UserActionsCheckUserVerificationUserNotFoundFailureState({
    required super.isLoading,
    required super.content,
  });
}

class UserActionsCheckUserVerificationNotVerifiedState
    extends UserActionsState {
  const UserActionsCheckUserVerificationNotVerifiedState({
    required super.isLoading,
    required super.content,
  });
}
