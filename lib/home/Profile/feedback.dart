import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fulusi/colors/colors.dart';

import '../../networking/whatsapp.dart';


List<String> suggestions =[
  'Login Register: Failed/Slow to get verification code',
  'Credit amount reduced/Unclear interest/principal display',
      'Repayment problem: Repayment failure/ Unclear on how to repay',
  'Abnormal function: Slow loading/Error prompt/ Page freeze',
  'Other problems'
];
List<bool>isChecked=   List.generate(5, (int x) => false);

class Suggestions extends StatefulWidget {


  @override
  State<Suggestions> createState() => _SuggestionsState();
}

class _SuggestionsState extends State<Suggestions> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(

          backgroundColor: mainOrange,

        ),
        SafeArea(child: Scaffold(
         backgroundColor: white,
            appBar: AppBar(
              title: Text(

                  'Feedback & Suggestions',
                  style: Theme.of(context).textTheme.titleLarge),
            ),
            body:SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:10,right: 10),
                    child: Column(
                      children: [
                        Material(
                          shadowColor: mainOrange.withOpacity(0.6),
                          elevation:2,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            width: double.infinity,
              
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
              
                                crossAxisAlignment:CrossAxisAlignment.start ,
                                children: [
              
                                  Padding(
                                    padding: const EdgeInsets.only(top: 0,bottom: 20),
                                    child: Text(
                                        'Feedback Type',
                                        style: TextStyle(
                                          fontSize: 35,
                                          color: mainBlue,
                                          fontWeight: FontWeight.w700,
                                          decoration: TextDecoration.underline,
                                          decorationColor: mainOrange.withOpacity(0.8),
                                          decorationThickness: 4, // Adjust thickness if needed
                                        )
              
                  ),
                                  ),
                  Text(
                  'Select the problem you want to feedback.',
                  style: TextStyle(
                  fontSize: 15,
                  color: grey,
                  fontWeight: FontWeight.w500,
              
                  ),
                  ),
              
                                  Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: List.generate(5, (index)
                                      {
                                        return Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Checkbox(
                                                  value: isChecked[index], onChanged:(value){
                                                setState(() {
                                                  isChecked[index]=value!;
                                                });
                                              } ),
                                              Expanded(
                                                child: Text(
                                                    suggestions[index],
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color: grey,
              
                                                      fontWeight: FontWeight.w500,
                                                    )
                                                ),
                                              ),
              
              
                                            ],
                                          ),
                                        );
                                      }
                                      )
                                  ),
              
              
                                ],
                              ),
                            ) ,
                          ),
                        ),
                        SizedBox(height: 30,),
                        Center(
                          child: ElevatedButton(onPressed:(){
              
                            //todo: submit
              
                          },
                            style:
              
                            ElevatedButton.styleFrom(
                                fixedSize: Size(100, 45),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                elevation: 3, backgroundColor: mainOrange
                            ), child: Text(
                              'Submit',
                              style: TextStyle(
                                  color: white,
                                  fontSize:15
                              ),
                            ),
                          ),
              
                        ),
                      ],
                    ),
                  )
                ],
              ),
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
