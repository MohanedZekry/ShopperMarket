import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layouts/home/cubit/home_cubit.dart';
import 'package:shop_app/layouts/home/cubit/home_states.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shop_app/models/HomeModel.dart';
import 'package:shop_app/shared/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state){
          var mCubit = HomeCubit.getInstance(context);
          return ConditionalBuilder(
              condition: mCubit.homeModel != null,
              builder: (context) => productBuilder(mCubit.homeModel, mCubit),
              fallback: (context) => Center(child: CircularProgressIndicator()));
        }
    );

  }

  Widget productBuilder(HomeModel? model, HomeCubit mCubit) => Column(
    children: [
      Container(
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CarouselSlider(
                items: model!.data.bannerList.map((e) => ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image(
                    image: NetworkImage('${e.image}'),
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),).toList(),
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    mCubit.changeBannerIndex(index);
                  },
                  height: 250.0,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  viewportFraction: 1.0,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(seconds: 1),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  scrollDirection: Axis.horizontal,
                )
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedSmoothIndicator(
                activeIndex: mCubit.bannerIndex,
                count: model.data.bannerList.length,
                effect: ExpandingDotsEffect(
                  expansionFactor: 4,
                  dotHeight: 10,
                  dotColor: whiteGrey,
                  spacing: 5.0,
                  dotWidth: 10,
                  activeDotColor: secondaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
