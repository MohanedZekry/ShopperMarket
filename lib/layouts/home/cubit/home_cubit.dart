import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layouts/home/cubit/home_states.dart';
import 'package:shop_app/layouts/home/screens/categories/categories_screen.dart';
import 'package:shop_app/layouts/home/screens/favorites/favorites_screen.dart';
import 'package:shop_app/layouts/home/screens/products/products_screen.dart';
import 'package:shop_app/layouts/home/screens/settings/settings_screen.dart';
import 'package:shop_app/models/HomeModel.dart';
import 'package:shop_app/shared/network/end_points.dart';
import 'package:shop_app/shared/network/remote/dio/dio_shop_helper.dart';

class HomeCubit extends Cubit<HomeStates>{

  HomeCubit() : super(HomeInitialState());

  static HomeCubit getInstance(context) => BlocProvider.of(context);

  int currentState = 0;
  int bannerIndex = 0;

  List<Widget> bottomWidgets = [
    ProductScreen(),
    CategoryScreen(),
    FavoriteScreen(),
    SettingScreen(),
  ];

  void changeBottomNavIndex(int _index){
    currentState = _index;
    emit(ChangeNavigationBottomState());
  }

  void changeBannerIndex(int _index){
    bannerIndex = _index;
    emit(ChangeBannerIndexState());
  }

  HomeModel? homeModel;

  void getHomeData(){
    emit(LoadingHomeDataState());
    DioShopHelper.getData(url: EP_HOME).then((value) {
      if(value.data != null) {
        homeModel = HomeModel.fromJson(value.data);
        emit(SuccessHomeDataState());
      }else{
        emit(ErrorHomeDataState('There\'s unusual error happened.'));
      }
    }).catchError((error){
      emit(ErrorHomeDataState(error));
    });
  }
}