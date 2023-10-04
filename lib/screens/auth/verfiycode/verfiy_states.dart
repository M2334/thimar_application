class VerfiyStates{}
class VerfiyLoadingState extends VerfiyStates{}
class VerfiySuccessState extends VerfiyStates{
  String status;
  VerfiySuccessState(this.status);
}
class VerfiyFailedState extends VerfiyStates{
  String status;
  VerfiyFailedState(this.status);
}