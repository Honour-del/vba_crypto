part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class Login extends LoginEvent {
  final String email;
  final String password;

  Login(this.email, this.password);

}