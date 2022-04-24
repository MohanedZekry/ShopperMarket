abstract class LoginStates {}

class InitialLoginState extends LoginStates {}

class LoadingLoginState extends LoginStates {}

class ErrorLoginState extends LoginStates {

  late final String error;

  ErrorLoginState(this.error);
}

class SuccessLoginState extends LoginStates {}