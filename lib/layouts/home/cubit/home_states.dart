abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class ChangeNavigationBottomState extends HomeStates {}

class ChangeBannerIndexState extends HomeStates{}

class LoadingHomeDataState extends HomeStates{}

class SuccessHomeDataState extends HomeStates{

}

class ErrorHomeDataState extends HomeStates{

  late final String error;

  ErrorHomeDataState(this.error);

}

class SuccessCategoriesDataState extends HomeStates{

}

class ErrorCategoriesDataState extends HomeStates{

  late final String error;

  ErrorCategoriesDataState(this.error);

}

