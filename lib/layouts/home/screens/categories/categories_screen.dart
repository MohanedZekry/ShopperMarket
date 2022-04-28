import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layouts/home/cubit/home_cubit.dart';
import 'package:shop_app/layouts/home/cubit/home_states.dart';
import 'package:shop_app/models/categories_model.dart';
import 'package:shop_app/shared/styles/colors.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state){},
      builder: (context, state) {
        HomeCubit mCubit = HomeCubit.getInstance(context);
        return ConditionalBuilder(
            condition: mCubit.categoriesModel != null,
            builder: (context) => Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder:(context, index) => buildCategoriesItem(mCubit.categoriesModel!.data.data[index]),
                  separatorBuilder:(context, index) => const SizedBox(height: 5.0,),
                  itemCount: mCubit.categoriesModel!.data.data.length),
            ),
            fallback: (context) => const Center(
                child: CircularProgressIndicator()
            )
        );
      },
    );
  }

  Widget buildCategoriesItem(CategoriesInnerDataModel model)
  => Stack(
    alignment: Alignment.topLeft,
    children: [
      Container(
        margin: const EdgeInsetsDirectional.only(start: 50, top: 20),
        padding: const EdgeInsetsDirectional.only(start: 65, end: 10, top: 10, bottom: 10),
        color: primarySwatchColor,
        width: double.infinity,
        height: 90,
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.name,
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  padding: EdgeInsetsDirectional.only(start: 10),
                  child: const Text(
                    'Discover Here',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white70,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios,
              color: Colors.white,),
          ],
        ),
      ),
      Card(
        elevation: 3,
        child: Container(
          width: 100,
          height: 90,
          decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: NetworkImage(
                  model.image,
                ),
              )
          ),
        ),
      )
    ],
  );

}
