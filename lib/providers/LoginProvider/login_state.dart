// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class LoginState {}

//Initial
class LoginInitial extends LoginState {}

class UserAuthenticated extends LoginState {}
class UserNonAuthenticated extends LoginState {}

//Loading
class LoginLoading extends LoginState {}

//Success
class LoginSucess extends LoginState {}

//Failure
class LoginFailure extends LoginState {
  final String message;
  LoginFailure({
    required this.message,
  });
}
