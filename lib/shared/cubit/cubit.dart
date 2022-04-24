import 'package:shop_app/shared/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/network/end_points.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';

class LoginCubit extends Cubit<LoginStates> {

  LoginCubit() : super(InitialLoginState());

  static LoginCubit getInstance(context) => BlocProvider.of(context);

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
  })
  {
    DioHelper.login(
        path: MUST_LOGIN,
        email: email,
        password: password).then((value)
    {
      emit(SuccessLoginState());
      print(value);
    }).catchError((error)
    {
      emit(ErrorLoginState(error));
      print(error.toString());
    });
  }

}