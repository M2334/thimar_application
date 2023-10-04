class RegisterStates{}
class RegisterLoadingState extends RegisterStates{}
class RegisterSuccessState extends RegisterStates{
  String status;
  RegisterSuccessState(this.status);
}
class RegisterFailedState extends RegisterStates{}