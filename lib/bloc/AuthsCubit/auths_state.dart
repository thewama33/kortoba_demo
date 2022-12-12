part of 'auths_cubit.dart';

abstract class AuthsState extends Equatable {
  const AuthsState();

  @override
  List<Object> get props => [];
}

class AuthsInitial extends AuthsState {}


class LoginSuccessState extends AuthsState {}

class LoginLoadingState extends AuthsState {}

class LoginFailureState extends AuthsState {
  final String errorMessage;

  LoginFailureState(this.errorMessage);
}

class RegisterSuccessState extends AuthsState {}

class RegisterLoadingState extends AuthsState {}

class RegisterFailureState extends AuthsState {
  final String errorMessage;

  RegisterFailureState(this.errorMessage);
}


class LogOutState extends AuthsState{}