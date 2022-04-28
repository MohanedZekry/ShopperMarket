import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:shop_app/shared/styles/colors.dart';

class ProfileLayout extends StatelessWidget {
  const ProfileLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: secondaryAccentColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              height: 200,
                              width: 150,
                            ),
                            SizedBox(
                              height: 160,
                              width: 110,
                              child: Image.asset(
                                'assets/images/person.png',
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(top: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Mohaned Zekry',
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: primarySwatchColor,
                              fontSize: 25,
                              overflow: TextOverflow.ellipsis,
                              fontFamily: 'NiseFont',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Row(
                            children: [
                              Icon(Icons.work_outline, color: primarySwatchColor,),
                              const SizedBox(width: 5.0,),
                              Text(
                                'Mobile App Developer',
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 17,
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 55,),
                          Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.pink.withOpacity(0.16),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.call,
                                  color: Colors.red,
                                ),
                              ),
                              const SizedBox(width: 8.0,),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.pink.withOpacity(0.16),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.message_sharp,
                                  color: Colors.orange,
                                ),
                              ),
                              const SizedBox(width: 8.0,),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.2),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.video_call,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12,),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.grey,
                ),
                const SizedBox(height: 8,),
                const Text(
                  'About',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Card(
                  elevation: 3.0,
                  child: Container(
                    height: 70,
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    color: Colors.white,
                    width: double.infinity,
                    child: Row(
                      children: [
                        const Icon(Icons.info, color: Colors.grey,),
                        const SizedBox(width: 8,),
                        Expanded(
                          child: Text(
                            'Job : Mobile App Developer',
                            maxLines: 2,
                            style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: secondaryColor,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8,),
                Card(
                  elevation: 3.0,
                  child: Container(
                    height: 70,
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    color: Colors.white,
                    width: double.infinity,
                    child: Row(
                      children: [
                        const Icon(Icons.info, color: Colors.grey,),
                        const SizedBox(width: 8,),
                        Expanded(
                          child: Text(
                            'Company : Company Name',
                            maxLines: 2,
                            style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: secondaryColor,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8,),
                Card(
                  elevation: 3.0,
                  child: Container(
                    height: 70,
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    color: Colors.white,
                    width: double.infinity,
                    child: Row(
                      children: [
                        const Icon(Icons.info, color: Colors.grey,),
                        const SizedBox(width: 8,),
                        Expanded(
                          child: Text(
                            'Mobile : +201000++++',
                            maxLines: 2,
                            style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: secondaryColor,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8,),
                Card(
                  elevation: 3.0,
                  child: Container(
                    height: 70,
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    color: Colors.white,
                    width: double.infinity,
                    child: Row(
                      children: [
                        const Icon(Icons.info, color: Colors.grey,),
                        const SizedBox(width: 8,),
                        Expanded(
                          child: Text(
                            'Address : 6th of October, Giza, Egypt',
                            maxLines: 2,
                            style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: secondaryColor,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
