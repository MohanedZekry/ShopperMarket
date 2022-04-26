import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shop_app/layouts/login/login_layout.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

/* MODEL FOR PAGER */
class BoardingModel{
  late String title;
  late String description;
  late String image;

  BoardingModel({
    required this.title,
    required this.description,
    required this.image});
}

class OnBoardingLayout extends StatefulWidget {
  const OnBoardingLayout({Key? key}) : super(key: key);

  @override
  State<OnBoardingLayout> createState() => _OnBoardingLayoutState();
}

class _OnBoardingLayoutState extends State<OnBoardingLayout> {

  var pagerController = PageController();

  bool isLast = false;
  IconData floatingIcon = Icons.arrow_forward_ios;

  List<BoardingModel> onBoardingList = [
    BoardingModel(title: "Title 1",
        description: "description 1",
        image: 'assets/images/1_onboarding.json'),
    BoardingModel(title: "Title 2",
        description: "description 2",
        image: 'assets/images/2_onboarding.json'),
    BoardingModel(title: "Title 3",
        description: "description 3",
        image: 'assets/images/3_onboarding.json'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            child: Text('SKIP'),
            onPressed:() => navigateAndFinish(context, LoginLayout()),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: pagerController,
                itemCount: 3,
                itemBuilder: (context, index) => buildBoardingScreen(onBoardingList[index]),
                onPageChanged: (index){
                  if(index == onBoardingList.length-1){
                    setState(() {
                      isLast = true;
                      floatingIcon = Icons.done;
                    });
                  }else{
                    setState(() {
                      isLast = false;
                      floatingIcon = Icons.arrow_forward_ios;
                    });
                  }
                },
              ),
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: pagerController,
                  effect: ExpandingDotsEffect(
                    expansionFactor: 4,
                    dotHeight: 10,
                    dotColor: Colors.grey,
                    spacing: 5.0,
                    dotWidth: 10,
                    activeDotColor: primarySwatchColor,
                  ),
                  count: onBoardingList.length,
                ),
                Spacer(),
                FloatingActionButton(
                    child: Icon(floatingIcon),
                    onPressed: (){
                      if(!isLast) {
                        pagerController.nextPage(
                            duration: Duration(milliseconds: 750),
                            curve: Curves.bounceIn);
                      }else{
                        navigateAndFinish(context, LoginLayout());
                      }
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingScreen(BoardingModel model) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        height: 370,
        width: double.infinity,
        child: Lottie.asset(model.image),
      ),
      SizedBox(
        height: 3.0,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "${model.title}",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                fontSize: 22.0,
              ),
            ),
            SizedBox(
              height: 2.0,
            ),
            Text(
              "${model.description}",
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
