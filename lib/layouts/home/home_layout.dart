import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layouts/home/cubit/home_cubit.dart';
import 'package:shop_app/layouts/home/cubit/home_states.dart';
import 'package:shop_app/layouts/home/screens/search/search_screen.dart';
import 'package:shop_app/shared/components/components.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => HomeCubit()..getHomeData(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit mCubit = HomeCubit.getInstance(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('ShopApp'),
              actions: [
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: ()
                  {
                    navigateTo(context, SearchScreen());
                  },
                ),
              ],
            ),
            body: mCubit.bottomWidgets[mCubit.currentState],
            bottomNavigationBar: BottomNavigationBar(
              onTap: (_index){
                mCubit.changeBottomNavIndex(_index);
              },
              currentIndex: mCubit.currentState,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.apps), label: 'Categories'),
                BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favories'),
                BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
              ],
            ),
          );
        },
      ),
    );
  }
}
