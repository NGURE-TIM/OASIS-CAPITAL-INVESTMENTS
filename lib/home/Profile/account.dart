import 'package:flutter/material.dart';
import 'package:fulusi/colors/colors.dart';

import '../../networking/whatsapp.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(

            backgroundColor: mainOrange,

        ),
      SafeArea(child: Scaffold(
        appBar: AppBar(
          title: Text(

              'Review Application Profile',
              style: Theme.of(context).textTheme.titleLarge),
        ),
        body:Column(
         children: [
           SizedBox(
             height: 10,
           ),
           Container(

             width: double.infinity,
             child: Padding(
               padding: EdgeInsets.all(20),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(
                     'My information',
                         style: TextStyle(
                   color: black,
                   fontSize: 20,
                   fontWeight: FontWeight.w500,
                   ),
                   ),
                   SizedBox(height: 20,),

                   buildContainer('Name','Tim Ngure'),
                   buildContainer('National ID','36963975'),
                   buildContainer('Date of Birth','1999-12-29'),
                   buildContainer('Gender','Male'),
                   buildContainer('Phone Number','07487080855'),
                   buildContainer('Personal Email','kangushtim@gmail.com'),
                   buildContainer('Education','College'),
                   buildContainer('Monthly Income','above 500,000 KES'),
                   buildContainer('Oasis UID','XXXXXXXXXXXXX'),
                 ],
               ),
             ) ,
           )
         ],
        )

      ))
      ],

    );
  }

  Container buildContainer(String label ,String text) {
    return Container(
                   height: 50,
                   decoration: BoxDecoration(
                     border: const Border(
                       top: BorderSide(
                         color: black,
                         width: 0.05,
                       ),
                       bottom: BorderSide(
                           color: black,
                           width: 0.05
                       ),
                     ),
                   ),
                   child: Row(
                     children: [

                       Text(
                         label,
                         style: TextStyle(
                           color: grey,
                           fontSize: 15,
                           fontWeight: FontWeight.w500,
                         ),
                       ),
                       Spacer(),
                       Text(
                         text,
                         style: TextStyle(
                           color: black,
                           fontSize: 15,
                           fontWeight: FontWeight.w500,
                         ),
                       ),

                     ],
                   ),
                 );
  }
}
