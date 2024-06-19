import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter/material.dart';
import 'package:fulusi/colors/colors.dart';
import 'package:fulusi/data_Entry/account_Info.dart';
import 'package:fulusi/home/dashboard.dart';
import '../global/size_config.dart';
import '../globalWidgets.dart';
import '../logins/login_screens/register/verify.dart';
import 'package:fulusi/home/home.dart';

class Carousel extends StatelessWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        body: SingleChildScrollView(
          child: Column(
            children: [

          SizedBox(
                  height: SizeConfig.screenHeight * 0.15,
                  width: SizeConfig.screenWidth * 0.3,
                  child: Image.asset("assets/images/cropped-Oasis-Capital-Investments-trans.png"),
                ),

              SizedBox(height: SizeConfig.screenHeight * 0.02),
              FlutterCarousel(
                options: CarouselOptions(
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 5),
                  viewportFraction: 1,
                  enlargeCenterPage: true,
                  height: SizeConfig.screenHeight * 0.6,
                  showIndicator: true,
                  slideIndicator: const CircularSlideIndicator(
                    indicatorBorderColor: white,
                    currentIndicatorColor: mainOrange,
                    indicatorBackgroundColor: grey,
                  ),
                  floatingIndicator: false,
                ),
                items: sliders.map((item) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: SizeConfig.screenWidth * 0.8,
                        height: SizeConfig.screenHeight * 0.5,
                        margin: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.05),
                        decoration: BoxDecoration(
                          color: white,
                        ),
                        child: Column(
                          children: [
                            Flexible(
                              flex: 10,
                              child: Image(
                                height: SizeConfig.screenHeight * 0.35,
                                width: SizeConfig.screenWidth * 0.6,
                                fit: BoxFit.cover,
                                image: AssetImage(item.imagepath),
                              ),
                            ),
                            SizedBox(height: SizeConfig.screenHeight * 0.04),
                            Flexible(
                              flex: 1,
                              child: Text(
                                item.textBody1,
                                style: TextStyle(
                                  color: mainBlue,
                                  fontWeight: FontWeight.w700,
                                  fontSize: SizeConfig.screenWidth * 0.05,
                                ),
                              ),
                            ),
                            SizedBox(height: SizeConfig.screenHeight * 0.025),
                            Flexible(
                              flex: 4,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.05),
                                child: Text(
                                  item.textBody2,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: grey,
                                    fontWeight: FontWeight.w400,
                                    fontSize: SizeConfig.screenWidth * 0.05,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.06),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElavatedButton('Member', white, mainBlue, () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Verify()),
                    );
                  }, 3),
                  SizedBox(width: SizeConfig.screenWidth * 0.04),
                  ElavatedButton('New user', white, mainOrange, () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AccountInfo()),
                    );
                  }, 3),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildCarousel {
  String imagepath;
  String textBody1;
  String textBody2;
  BuildCarousel(this.imagepath, this.textBody1, this.textBody2);
}

List sliders = [
  BuildCarousel(
    'assets/images/african-man-black-suit-guy-sitting-table-businessman-with-money_1157-48554.webp',
    'Affordable Sacco loans',
    'Build your savings to enjoy higher affordable Sacco loan limits.',
  ),
  BuildCarousel(
    'assets/images/mortgage-contract-house-figurine_23-2147737962.jpg',
    'Loan products',
    'Borrow at low interest to finance your needs, business or project.',
  ),
  BuildCarousel(
    'assets/images/photorealistic-money-with-plant_23-2151027561.webp',
    'Sacco Investment shares',
    'Invest on Sacco properties and earn dividends.',
  ),
];