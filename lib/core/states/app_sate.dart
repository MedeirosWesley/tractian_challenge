abstract interface class AppState {}

class IdleState implements AppState {}

class LoadingState implements AppState {}

class ErrorState implements AppState {
  final String message;

  ErrorState({required this.message});
}

class LoadedState<T> implements AppState {}
