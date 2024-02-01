import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter/material.dart';
import 'package:fulusi/colors/colors.dart';
import 'package:fulusi/data_Entry/account_Info.dart';
import 'package:fulusi/data_Entry/entry.dart';
import 'package:fulusi/logins/login_screens/register/register.dart';

import '../globalWidgets.dart';

//bool phoneNumber verified


class Carousel extends StatelessWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: white,
        body: Column(
          children: [
            
            SizedBox(
              height: 100,
              width: 100,
              child: Image.asset("assets/images/cropped-Oasis-Capital-Investments-trans.png"),
            ),
            FlutterCarousel(
              options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                viewportFraction: 1,
                enlargeCenterPage: true,
                height: 500.0,
                showIndicator: true,
                slideIndicator: const CircularSlideIndicator(
                    indicatorBorderColor: white,
                  currentIndicatorColor: mainOrange,
                  indicatorBackgroundColor: grey
                ),
                floatingIndicator: false
              ),
              items: sliders.map((item) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: 400,
                        height: 400,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            color: white
                        ),
                        child: Column(
                          children: [
                            Image(
                                height:300,
                                width:300,
                                fit: BoxFit.cover,
                                image: AssetImage(item.imagepath)),
                            SizedBox( height: 30,),

                            Text(item.textBody1,
                             style: TextStyle(
                                color:mainBlue,
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                              ),


                            ),

                            SizedBox( height: 20,),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(item.textBody2,
                                textAlign: TextAlign.center,
                              style:TextStyle(
                                color:grey,
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                              ),
                              ),
                            ),

                          ],
                        )
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(
              height: 50,
            ),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 ElavatedButton('Member ' , white ,mainBlue   , (){Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => Verify()),
                 );}),
                 const SizedBox(
                   width:15
                 ),
                 ElavatedButton('New user' , white, mainOrange,(){Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => const AccountInfo()),
                 );}),

               ],
             ),
          ],
        ),
      ),
    );
  }
}




class BuildCarousel{
  String imagepath;
  String textBody1;
  String textBody2;
  BuildCarousel (this.imagepath,this.textBody1,this.textBody2);
}


List sliders= [
  BuildCarousel('assets/images/african-man-black-suit-guy-sitting-table-businessman-with-money_1157-48554.webp',
  'Affordable Sacco loans', 'Build your savings to enjoy higher affordable Sacco loan limits.'
  ),
  BuildCarousel('assets/images/mortgage-contract-house-figurine_23-2147737962.jpg',
      'Loan products', 'Borrow at low interest to finance your needs, business or project.'
  ),
  BuildCarousel('assets/images/photorealistic-money-with-plant_23-2151027561.webp',
      'Sacco Investment shares', 'Invest on Sacco properties and earn dividends.'
  ),
];