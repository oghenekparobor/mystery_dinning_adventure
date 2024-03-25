sealed class AppState {}

class LoadedState extends AppState {
  final dynamic data;

  LoadedState(this.data);
}

class ErrorState extends AppState {
  final String msg;

  ErrorState(this.msg);
}
