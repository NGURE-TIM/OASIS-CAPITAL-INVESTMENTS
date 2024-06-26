import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:fulusi/colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:animated_icon/animated_icon.dart';
import 'package:fulusi/home/repayment..dart';
import '../global/size_config.dart';
import '../globalWidgets.dart';
import '../loan/loan.dart';

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:fulusi/themes/theme.dart';

import '../networking/whatsapp.dart';

 List<String> imagePaths =['assets/images/home/mobile-phone.png','assets/images/home/validation.png','assets/images/home/expenses.png'];
 List<String> steps =['Fast application','Guarantor approval','Instant disbursement'];
 List <bool > stepsSates=[true,true,false];
class Dash extends StatefulWidget {
  @override
  State<Dash> createState() => _DashState();
}
class _DashState extends State<Dash> {
  @override
  Widget build(BuildContext context) {
    final Size screensize=MediaQuery.of(context).size;
    return  PopScope(

      canPop: false,
      child:
          Scaffold(
            backgroundColor: white,
            body: SingleChildScrollView(
              child: Stack(
                children: [
                Container(
                height: SizeConfig.screenHeight * 0.3,
                width: double.infinity,
                decoration:   BoxDecoration(
                    border:Border(
                        bottom: BorderSide(
                          color: mainOrange,
                          width: 12
                        )),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                    color: mainOrange.withOpacity(0.09)
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
                      child:Expanded(
                        child: Align(
                          alignment: Alignment(0, 0.4),
                          child:
                          Container(
                            margin:EdgeInsets.all(20),
                            child: Opacity(
                              opacity: 0.05,
                              child: Image.asset(
                                "assets/images/cropped-Oasis-Capital-Investments-trans.png",
                                fit: BoxFit.contain, // Adjust the fit to cover the SizedBox
                              ),
                            ),
                          ),
                        ),
                      )
              
                    ),
                  ),
                  Container(
                    height:SizeConfig.screenHeight,
                    width:SizeConfig.screenWidth,
                    child:   Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20 , top: 20),
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
                             Text(
                                'Hey, Tim',
                                //:todo user name
                                style: Theme.of(context).textTheme.titleLarge,),
                              const Spacer(),
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
                          Material(
                            shadowColor: mainOrange,
                            elevation: 3,
                            shape:RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Container(
                           // height: SizeConfig.screenHeight * 0.27,
                              width: double.infinity,
                              decoration: BoxDecoration(

                                borderRadius: BorderRadius.circular(20),
                                color: white
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(

                            crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),

                                      Text(
                                        'You can get upto ',
                                        style: TextStyle(
                                            shadows: [
                                              Shadow(
                                                color: black.withOpacity(0.3), // Shadow color
                                                offset: Offset(3, 3), // Offset of the shadow
                                                blurRadius: 8, // Blur radius of the shadow
                                              ),
                                            ],
                                            color: grey,
                                            fontWeight: FontWeight.w400,
                                            fontSize:15
                                        ),),


                                      Text(
                                        'Ksh 100,000',

                                        style: TextStyle(

                                          color: mainBlue,
                                          fontWeight: FontWeight.w700,
                                          fontSize:30,
                                          shadows: [
                                            Shadow(
                                              color: black.withOpacity(0.3), // Shadow color
                                              offset: Offset(3, 3), // Offset of the shadow
                                              blurRadius: 3, // Blur radius of the shadow
                                            ),
                                          ],
                                        ),),

                                  SizedBox(
                                    height: 30,
                                  ),

                                      Center(
                                        child: Container(

                                          padding:EdgeInsets.symmetric(vertical: 0 ,horizontal: 0),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            gradient: LinearGradient(
                                              colors: [
                                                Color.fromRGBO(255, 176, 51, 1.0),
                                                Color.fromRGBO(255, 176, 51, 1.0),
                                                Color.fromRGBO(254, 128, 51, 1.0),
                                                Color.fromRGBO(254, 128, 51, 1.0),
                                              ],
                                              stops: [0.1, 0.2, 0.7, 0.9],
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: black.withOpacity(0.3), // Shadow color
                                                offset: Offset(3, 3), // Offset of the shadow
                                                blurRadius: 3, // Blur radius of the shadow
                                              ),
                                            ],
                                          ),
                                          child: GestureDetector(
                                            onTap: (){
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => Loan()),
                                              );
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(left:40 ,right:40,top: 5 , bottom: 5),
                                              child: Text(
                                                'APPLY NOW',
                                                style: TextStyle(
                                                  color: white,
                                                  fontSize: 20,
                                                  shadows: [
                                                    Shadow(
                                                      color: black.withOpacity(0.3), // Shadow color
                                                      offset: Offset(3, 3), // Offset of the shadow
                                                      blurRadius: 3, // Blur radius of the shadow
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),



                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                                        const SizedBox(
                                        height: 25,
                                      ),
                          Row(

                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              homepageicons(Icons.send_to_mobile_sharp,'Repayment',(){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Repayment()),
                                );
                              } ),
                              const SizedBox(
                                width: 15,
                              ),
                              homepageicons(Icons.history,'Transactions',(){
                                //todo:history
                              } ),
                              const SizedBox(
                                width: 15,
                              ),
                              /* homepageicons(Icons.account_balance_wallet_sharp,'Account' ),
                              const SizedBox(
                                width: 15,
                              ),*/

                              homepageicons(Icons.share_sharp,'Invite',(){
                                //todo:invite
                              } ),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                           Container(
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(20),
                                 gradient: LinearGradient(
                                   begin: Alignment.topLeft,
                                   end: Alignment.bottomRight,
                                   colors: [mainOrange.withOpacity(0.09), white.withOpacity(0.01)],
                                 ),
                               ),
                               child: Padding(
                                 padding: const EdgeInsets.only(left: 25 ,right: 25,top: 20,bottom: 20),
                                 child: Column(

                                   children: [
                                    Row(
                                     children: [
                                       buildRow('KES100K','Daily Payments','assets/images/home/payment-method.png'),
                              Spacer(),
                                       buildRow('100+','Happy Customers','assets/images/home/rating (1).png'),
                                       //buildRow('10+','Experts','assets/images/home/support.png'),
                                     ],
                                    )
                                   ],
                                 ),
                               )
                           ),
                          const SizedBox(
                            height: 30,
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left:20,right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(3, (index) => buildImage(imagePaths[index] , steps[index] , stepsSates[index])),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),

                          Material(
                            elevation: 2,
                            shape:RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: InkWell(
                              onTap: (

                                  ){
                                Whatsapp.launchWhatsAppUri();
                              },
                              highlightColor: white,
                              splashColor: null ,
                              borderRadius: BorderRadius.circular(8),
                              radius: 10,
                              child: Container(
                                width:double.infinity,

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                        color: white
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row (

                                      children: [
                                        const Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Need help ?' , style: TextStyle(
                                                color:black,
                                                fontWeight: FontWeight.w600,
                                                fontSize:20
                                            )),

                                            Text('Chat with us on Whatsapp', style: TextStyle(
                                                color:grey,
                                                fontWeight: FontWeight.w600,
                                                fontSize:15
                                            )),
                                          ],
                                        ),
                                        Spacer(),
                                        Material(
                                          color: white,
                                          shadowColor: mainBlue,
                                          elevation: 6,
                                          shape:RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          child: SizedBox(
                                              height:40,
                                              width:40,
                                              child: Image( image: AssetImage('assets/images/home/whatsapp.png'),)),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    right:10,
                    child: SizedBox(
                      child: ClipRRect(
              
                        borderRadius: BorderRadius.circular(10), // Adjust the border radius as needed
                        child: Image.asset(
                          "assets/images/home/box/Screenshot_2024-05-23_150144-removebg-preview.png",
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

    );
  }

 buildImage(String imagePath ,String steps , bool states) =>

     Row(
       children: [
         Column(
           children: [
             SizedBox(
               height:40,
               width:40,
               child: Image(image:
                AssetImage(imagePath)
                ),
             ),
             Text(steps, style: const TextStyle(
                 color:grey,
                 fontWeight: FontWeight.w400,
                 fontSize:10
             )),
           ],
         ),
         states ? Icon(
           Icons.arrow_right_alt_outlined,
           size: 20,
           color: mainBlue,
         ): Container()
       ],
     );


  Row buildRow(String head1 ,String head2 , String imagepath) {
    return Row(

                                     children: [

                                       SizedBox(
                                         height:40,
                                           width:40,
                                           child: Image( image: AssetImage(imagepath),)),
                                     const SizedBox(
                                       width:10,
                                     ),
                                       Column(
                                         mainAxisAlignment: MainAxisAlignment.start,
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: [
                                           Text(head1 , style: const TextStyle(
                                           color:black,
                                           fontWeight: FontWeight.w800,
                                           fontSize:15
                                       )),

                                           Text(head2 , style: const TextStyle(
                                               color:grey,
                                               fontWeight: FontWeight.w400,
                                               fontSize:10
                                           )),

                                         ],
                                       )
                                     ],
                                   );
  }





  Column homepageicons(IconData icons , String action ,Function() onPress) {
    return Column(
                        children: [
                          Material(
                            color: white,
                            shadowColor: mainOrange,
                            shape:RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),

                            elevation: .5,
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration:   BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      white,
                                      Color.fromRGBO(255, 242, 216, 1),
                                      Color.fromRGBO(255, 212, 181, 1),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),

                                  borderRadius: BorderRadius.circular(15),


                              ),
                              child:Center(
                                child: IconButton(

                                  color:mainBlue,
                                  iconSize: 30,
                                  onPressed: onPress,
                                  icon:  Icon(
                                      shadows: [
                                        Shadow(
                                          color: black.withOpacity(0.3), // Shadow color
                                          offset: Offset(3, 3), // Offset of the shadow
                                          blurRadius: 7, // Blur radius of the shadow
                                        ),
                                      ],
                                    icons
                                  ),

                                ),
                              ) ,
                            ),
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
        image: AssetImage("assets/images/container.jpg"),
        fit: BoxFit.fill,
      ),
    ),
    child: Center(
      child: Column(
        children: [
          const SizedBox(
            height:20,
          ),
          const Text(
            'You can get upto',
            style: TextStyle(
                color: white,
                fontWeight: FontWeight.w500,
                fontSize:20
            ),),const SizedBox(
            height: 10,
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

          ElavatedButton('APPLY NOW' , mainOrange, white,() {

          },3),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
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














/* Column buildColumn(String title, String value) {
    return Column(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text(
                                        title,
                                        style: TextStyle(
                                            color: mainBlue,
                                            fontWeight: FontWeight.w500,
                                            fontSize:20
                                        ),),
                                       const SizedBox(
                                         height: 5,
                                       ),
                                       Text(
                                         value,
                                         style: TextStyle(
                                             color: mainOrange,
                                             fontWeight: FontWeight.w400,
                                             fontSize:15
                                         ),),
                                     ],
                                   );
  }*/


/*Row(
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
                        ),*/

/*SizedBox(
                    width: 320,
                    height: 250,
                    child: ListView.builder(

                        itemCount:popular.length,
                        itemBuilder: (context, index){
                          return   Padding(
                            padding: const EdgeInsets.only(top: 8.0,bottom: 4),
                            child: Container(

                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color:  Color.fromRGBO(250, 235, 215, 1)

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

                                              child: Icon(popular[index].icondata,
                                                size: 35,
                                                color: mainBlue,
                                              ),
                                            ) ,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                           Text(
                                           popular[index].typeOfLoan,
                                            style: TextStyle(
                                                color:mainBlue,
                                                fontWeight: FontWeight.w600,
                                                fontSize:20
                                            ),),
                                          const SizedBox(
                                            width: 50,
                                          ),
                                          const Spacer(),
                                          ElevatedButton(

                                            onPressed: (){
                                          //todo:application
                                          },
                                            style:  ElevatedButton.styleFrom(
                                                fixedSize: Size(80, 40),
                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                                elevation: 3, backgroundColor: white
                                            ), child: const Text(
                                              'Apply',
                                              style: TextStyle(
                                                  fontSize:12,
                                                  color:  mainOrange
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),const SizedBox(
                                        height: 10,
                                      ),
                                      Divider(
                                        color: mainBlue,
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

                                          buildColumn('Max amount', popular[index].max),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          buildColumn('Interest',popular[index].interest),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          buildColumn('Duration',popular[index].duration),
                                        ],
                                      ),const SizedBox(
                                        height: 10,
                                      ),


                                    ],
                                  ),
                                ),
                              ),
                          );
                          }

                    ),
                  ),*/



/*class Item{IconData icondata;
String typeOfLoan;
String max;
String interest;
String duration;
Item(this.icondata,this.typeOfLoan,this.max,this.interest,this.duration);}*/



/*List popular=[
//popular items icons
  Item(Icons.history_edu_sharp, 'Education Loan', 'Kshs 2 million', '1% pm', '3 years'),
  Item(Icons.house, 'Mortgage', 'Kshs 5 million', '1% pm', '10 years'),
  Item(Icons.business_center_sharp, 'Business Loan', 'Kshs 10 million', '2% pm', '10 years'),
  Item(Icons.car_rental, 'Car Loan', 'Kshs 2 million', '1% pm', '5 years')
];*/



