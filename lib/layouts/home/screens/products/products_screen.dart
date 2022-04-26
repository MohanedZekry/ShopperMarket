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
              fallback: (context) => Center(child:  CircularProgressIndicator()));
        }
    );

  }

  Widget productBuilder(HomeModel? model, HomeCubit mCubit)
  => SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
    child: Column(
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
        const SizedBox(height: 8.0,),
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Container(
              color: Colors.grey[300],
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 1.0,
                childAspectRatio: 1/1.55,
                children: List.generate(
                  model.data.productList.length,
                      (index) => productItemBuilder(model.data.productList[index]),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );

  Widget productItemBuilder(ProductModel model)
  => Container(
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Image(
              image: NetworkImage(model.image!),
              width: double.infinity,
              height: 200,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              color: Colors.red,
              child: const Text(
                'DISCOUNT',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                '${model.name}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  height: 1.1,
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: 3.0,),
              Row(
                children: [
                  Text(
                    '${model.price.round()}',
                    style: TextStyle(
                      color: primarySwatchColor,
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                    ),

                  ),
                  const SizedBox(width: 8.0,),
                  if(model.old_price != null)
                    Text(
                      '${model.old_price.round()}',
                      style: TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                        fontSize: 13.0,
                        fontWeight: FontWeight.bold,
                      ),

                    ),
                  const Spacer(),
                  IconButton(
                      padding: EdgeInsetsDirectional.zero,
                      onPressed: (){},
                      icon: Icon(
                        Icons.favorite_border,
                        size: 10.0,
                      )),
                ],
              ),
            ],
          ),
        ),

      ],
    ),
  );
}
