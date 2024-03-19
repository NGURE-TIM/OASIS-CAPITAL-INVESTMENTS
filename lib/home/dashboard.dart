import 'package:flutter/material.dart';
import 'package:fulusi/colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:animated_icon/animated_icon.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

import '../globalWidgets.dart';

//Color(0xFFFFDAB9),
//#FFEAC2
class Dash extends StatefulWidget {

  @override
  State<Dash> createState() => _DashState();
}

class _DashState extends State<Dash> {

  @override
  Widget build(BuildContext context) {
    final Size screensize=MediaQuery.of(context).size;
    return  WillPopScope(

      onWillPop: () async {
        return false;
      },
      child:
          Scaffold(
            backgroundColor: white,
            body: Stack(
              children: [
              Container(
              height: 200,
              width: double.infinity,
              decoration:  const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
                  color: Color.fromRGBO(250, 235, 215, 0.4)
              ),
            ),
                Positioned(
                  child: Container(
                    width: screensize.width,
                    height: screensize.height,
                    /*+ decoration: BoxDecoration(
                      image : DecorationImage(
                        image: AssetImage("assets/images/cropped-Oasis-Capital-Investments-trans.png"),
                        fit: BoxFit.contain,
                        colorFilter: ColorFilter.mode(
                          white.withOpacity(0.9),
                          BlendMode.darken,
                        ),
                      ),
                    ),*/
                    child:Column(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment(0, 0.2),
                            child: SizedBox(
                              height: 250,
                              width: 250,
                              child: Opacity(
                                opacity: 0.12,
                                child: Image.asset(
                                  "assets/images/cropped-Oasis-Capital-Investments-trans.png",
                                  fit: BoxFit.contain, // Adjust the fit to cover the SizedBox
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )

                  ),
                ),
                Container(
                  child:   Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20 , top: 40),
                    child:   Column(
                      children: [
                        Row(
                          children: [
                            const Icon(
                              CupertinoIcons.profile_circled , // Use any Cupertino icon you need
                              size: 28, // Adjust the size of the icon
                              color: mainOrange, // Adjust the color of the icon
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'Hey, Tim',
                              //:todo user name
                              style: TextStyle(
                                  color:black,
                                  fontWeight: FontWeight.w400,
                                  fontSize:20
                              ),),
                            Spacer(),
                            const Icon(
                              //:todo show messages
                              CupertinoIcons.arrow_up_bin , // Use any Cupertino icon you need
                              size: 28, // Adjust the size of the icon
                              color: black, // Adjust the color of the icon
                            ), const SizedBox(
                              width: 10,
                            ),
                            AnimateIcon(
                              //:todo only animate on init state and show the notifications with a red number
                              onTap: () {},
                              iconType: IconType.continueAnimation,
                              height: 28,
                              width: 28,
                              color:black,
                              animateIcon: AnimateIcons.bell,
                            ),

                          ],
                        ),const SizedBox(
                          height: 30,
                        ),
                      FlutterCarousel(
                          options: CarouselOptions(
                            aspectRatio:1.5,
                            clipBehavior: Clip.none,
                              autoPlay: false,
                             // height: 200,
                              viewportFraction:.9 ,
                              enlargeCenterPage: true,
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
                                return item;
                              },
                            );
                          }).toList(),
                        ),
                  const SizedBox(
                  height: 20,
                ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            homepageicons(Icons.send_to_mobile_sharp,'Payment' ),
                            const SizedBox(
                              width: 15,
                            ),
                            homepageicons(Icons.history,'Loan history' ),
                            const SizedBox(
                              width: 15,
                            ),
                            homepageicons(Icons.account_balance_wallet_sharp,'Account' ),
                            const SizedBox(
                              width: 15,
                            ),
                            homepageicons(Icons.share_sharp,'Invite' ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                       Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                         textBaseline: TextBaseline.alphabetic,
                          children: [
                            const Text(
                              'Popular loan offers',
                              style: TextStyle(
                                  color:black,
                                  fontWeight: FontWeight.w600,
                                  fontSize:20
                              ),),
                            GestureDetector(
                              onTap: (){
                                //todo: show more loan offers
                              },
                              child: const Text(
                                'See more',
                                style: TextStyle(
                                    color:mainOrange,
                                    fontWeight: FontWeight.w800,
                                    fontSize:15
                                ),),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                   SizedBox(
                    width: 320,
                    height: 250,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:popular.length,
                        itemBuilder: (context, index){
                          return   Container(

                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color:  Color.fromRGBO(250, 235, 215, 0.9)
                              ),
                              child:Padding(
                                padding: const EdgeInsets.only(left: 10 ,right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(

                                      children: [
                                        Container(
                                          height: 40,
                                          width: 40,
                                          decoration:   BoxDecoration(
                                              borderRadius: BorderRadius.circular(15),

                                              color:white
                                          ),
                                          child:Center(
                                            child: Icon(popular[index].typeOfLoan,
                                              size: 35,
                                              color: mainBlue,
                                            ),
                                          ) ,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Text(
                                          'Education Loan',
                                          style: TextStyle(
                                              color: mainBlue,
                                              fontWeight: FontWeight.w600,
                                              fontSize:20
                                          ),),
                                        const SizedBox(
                                          width: 50,
                                        ),
                                        ElevatedButton(onPressed: (){
                                        //todo:application
                                        },
                                          style:  ElevatedButton.styleFrom(
                                              fixedSize: Size(40, 20),
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                              elevation: 3, backgroundColor: white
                                          ), child: const Text(
                                            'Apply',
                                            style: TextStyle(

                                                color:  mainOrange
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),const SizedBox(
                                      height: 10,
                                    ),
                                    Divider(
                                      color: black,
                                      height: 1,
                                      thickness: 1,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(

                                      children: [
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        buildColumn('Max amount', 'Kshs 2 million'),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        buildColumn('Interest','1% pm'),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        buildColumn('Duration','3 years'),
                                      ],
                                    ),const SizedBox(
                                      height: 10,
                                    ),


                                  ],
                                ),
                              ),
                            );
                          }

                    ),
                  ),






                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

    );
  }



  Column buildColumn(String title, String value) {
    return Column(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text(
                                        title,
                                        style: TextStyle(
                                            color: mainOrange,
                                            fontWeight: FontWeight.w500,
                                            fontSize:20
                                        ),),
                                       const SizedBox(
                                         height: 5,
                                       ),
                                       Text(
                                         value,
                                         style: TextStyle(
                                             color: black,
                                             fontWeight: FontWeight.w400,
                                             fontSize:15
                                         ),),
                                     ],
                                   );
  }

  Column homepageicons(IconData icons , String action) {
    return Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration:   BoxDecoration(
                                borderRadius: BorderRadius.circular(15),

                                color: Color.fromRGBO(250, 235, 215, 0.9)
                            ),
                            child:Center(
                              child: IconButton(
                                color: mainBlue,
                                iconSize: 30,
                                onPressed: () {
                                  //todo: action
                                },
                                icon:  Icon(
                                  icons
                                ),

                              ),
                            ) ,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        Text(
                            action,
                            style: const TextStyle(
                                color:black,
                                fontWeight: FontWeight.w400,
                                fontSize:15
                            ),),
                        ],
                      );
  }
}


List sliders=[


  Container(

    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      image : const DecorationImage(
        image: AssetImage("assets/images/home/container.jpg"),
        fit: BoxFit.fill,
      ),
    ),
    child: Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        const Text(
          'You can get upto',
          style: TextStyle(
              color: white,
              fontWeight: FontWeight.w500,
              fontSize:20
          ),),const SizedBox(
          height: 20,
        ),
        const Text(
          'Ksh 1,000,000',
          style: TextStyle(
              color: white,
              fontWeight: FontWeight.w600,
              fontSize:40
          ),),
        const SizedBox(
          height: 10,
        ),
        const Text(
          '3min application || 24hr disbursement || Low interest rates',
          style: TextStyle(
              color: white,
              fontWeight: FontWeight.w400,
              fontSize:12
          ),),
        const SizedBox(
          height: 10,
        ),
        ElavatedButton('Apply loan' , mainOrange, white,() {
          //:todo loan application
        },3),

      ],
    ),
  ),

  Container(

    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: mainBlue
    ),
    child:Padding(
      padding: const EdgeInsets.only(left: 20 ,right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Considering a savings account ?',
            style: TextStyle(
                color: white,
                fontWeight: FontWeight.w500,
                fontSize:15
            ),),const SizedBox(
            height: 10,
          ),
          const Text(
            'Grow your savings with ease! Our high-yield savings account offers competitive rates, with our platform, you can easily manage your money anytime, anywhere. ',
            style: TextStyle(
                color: white,
                fontWeight: FontWeight.w300,
                fontSize:13
            ),)
          ,
          const SizedBox(
            height: 20,
          ),
          Center(
            child: ElavatedButton('Learn more' , mainOrange, white,() {
              //:todo take to savings webpage
            },3),
          ),

        ],
      ),
    ),
  ),

];

class Item{IconData icondata;
String typeOfLoan;
String max;
String interest;
String duration;
Item(this.icondata,this.typeOfLoan,this.max,this.interest,this.duration);}



List popular=[
  Item(Icons.history_edu_sharp, 'Education Loan', 'Kshs 2 million', '1% pm', '3 years'),
  Item(Icons.house, 'Mortgage', 'Kshs 5 million', '1% pm', '10 years'),
  Item(Icons.business_center_sharp, 'Business Loan', 'Kshs 10 million', '2% pm', '10 years'),
  Item(Icons.car_rental, 'Car Loan', 'Kshs 2 million', '1% pm', '5 years')
];


