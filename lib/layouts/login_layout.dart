import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/cubit/cubit.dart';
import 'package:shop_app/shared/cubit/states.dart';
import 'package:shop_app/shared/styles/colors.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class LoginLayout extends StatelessWidget {
  LoginLayout({Key? key}) : super(key: key);

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'SHOP-APP',
                          style: TextStyle(
                            color: primarySwatchColor,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20.0,),
                        mTextForm(
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            label: 'Email',
                            validator: (_value){
                              if(_value.toString().isEmpty){
                                return 'Please enter your email address..';
                              }
                            },
                            actionButton: TextInputAction.next,
                            prefixIcon: Icons.email),
                        const SizedBox(height: 18.0,),
                        mTextForm(
                            controller: passwordController,
                            type: TextInputType.text,
                            label: 'Password',
                            validator: (_value){
                              if(_value.toString().isEmpty){
                                return 'Please enter your password..';
                              }
                            },
                            actionButton: TextInputAction.done,
                            isPassword: true,
                            prefixIcon: Icons.lock),
                        const SizedBox(height: 15.0,),
                        ConditionalBuilder(
                          builder: (context) => Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              mButton(
                                  removeWidth: true,
                                  horizontalPadding: 20,
                                  onPressed: (){
                                    if(formKey.currentState!.validate())
                                    {
                                      LoginCubit.getInstance(context).userLogin(
                                          email: emailController.text,
                                          password: passwordController.text
                                      );
                                    }
                                  },
                                  text: 'LOGIN'
                              ),
                            ],
                          ),
                          condition: state is! LoadingLoginState,
                          fallback: (context) => const Center(child: CircularProgressIndicator()),
                        ),
                        const SizedBox(height: 8,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account',
                              style: TextStyle(
                                  fontSize: 16
                              ),
                            ),
                            TextButton(
                              onPressed: (){},
                              child: Text(
                                'Register',
                                style: TextStyle(
                                    fontSize: 16
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
