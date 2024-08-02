import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/cubit/AppStates.dart';

class AppCubit extends Cubit<AppStates>{

  AppCubit() : super(AppInitialState());

  static AppCubit getInstance(context) => BlocProvider.of(context);


}