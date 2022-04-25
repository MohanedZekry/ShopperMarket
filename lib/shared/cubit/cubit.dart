import 'package:shop_app/models/user_model.dart';
import 'package:shop_app/shared/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/network/end_points.dart';
import 'package:shop_app/shared/network/remote/dio/dio_helper.dart';

class LoginCubit extends Cubit<LoginStates> {

  LoginCubit() : super(InitialLoginState());

  static LoginCubit getInstance(context) => BlocProvider.of(context);

  late UserModel userModel;
  /*void userLogin({
    required String email,
    required String password}){
    emit(LoadingLoginState());
    DioHelper.postData(path: EP_LOGIN, data: {
      'email' : email,
      'password' : password
    }).then((value)
    {
      emit(SuccessLoginState());
      print(value);
    }).catchError((error)
    {
      emit(ErrorLoginState(error.toString()));
      print(error.toString());
    });
  }*/

  void userLogin({
    required String email,
    required String password
  }) async
  {
    emit(LoadingLoginState());
    DioHelper.login(
        path: MUST_LOGIN,
        email: email,
        password: password).then((value)
    {
      userModel = UserModel.fromJSON(value.data);
      emit(SuccessLoginState(userModel));
    }).catchError((error)
    {
      emit(ErrorLoginState(error));
    });
  }

}