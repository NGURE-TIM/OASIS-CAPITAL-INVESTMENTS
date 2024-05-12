import 'package:flutter/material.dart';
import 'package:fulusi/colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:fulusi/stateManagement_provider/provider.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
bool showContainer =true;
double limit=0;
const khintstyle=TextStyle(
    color:grey,
);
List<String> limits =['14 Days/2 Installments',
  '21 Days/3 Installments','28 Days/4 Installments'
];
String selectedItem ='';


class Loan extends StatefulWidget {
  const Loan({Key? key}) : super(key: key);

  @override
  State<Loan> createState() => _LoanState();
}
class _LoanState extends State<Loan> {
  double lowerLimit=0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: mainOrange,
        ),
        SafeArea(child: Scaffold(
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: IconButton(onPressed: (){},
                icon: Icon(
                  Icons.headset_mic_outlined
                ),
                ),
              )
            ],
            title: Text(
        
              'Loan',
              style: Theme.of(context).textTheme.titleLarge),
            ),
        
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (showContainer)
              Container(
              width: double.infinity,
              color: mainOrange.withOpacity(0.09),
              child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
              children: [
              Expanded(
              child: Text(
              'If you repay your loan on time, you can get higher credit limits.',
              style: TextStyle(
              fontSize: 15,
              color: mainOrange,
              ),
              ),
              ),
              SizedBox(
              width: 24, // Adjust width as needed
              height: 24, // Adjust height as needed
              child: IconButton(
              padding: EdgeInsets.zero,
              color: Colors.black12,
              iconSize: 24,
              onPressed: () {
                setState(() {
                    showContainer=false;
                });
                    
              },
              icon: Icon(Icons.cancel),
              ),
              ),
              ],
              ),
              ),
                    
              ),
                const SizedBox(
                  height: 10,
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
                                      'Loan Amount',
                                      style: Theme.of(context).textTheme.displayMedium),
                                ),
                    
                                Center(
                                  child:
                                    Text(
                                          'KSh ${lowerLimit.toInt()}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 25,
                                          color: mainBlue
                                        ),
                                      ),
                                  ),
                    
                    
                                    FlutterSlider(
                                        values:  [lowerLimit],
                                      step: FlutterSliderStep(
                    
                                        step: 1,
                                        isPercentRange: true,
                                        rangeList: [
                                          FlutterSliderRangeStep(from: 0, to: 100, step: 5000),
                                        ]
                    
                                      ),
                                      handler: FlutterSliderHandler(
                    
                                        child: Icon(
                                          Icons.drag_indicator_rounded,
                                          color: mainOrange,
                                          size: 24,
                                        ) ,
                                        opacity: 1,
                                        decoration:  BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: white,
                                          boxShadow: [
                                          BoxShadow(
                                          color: mainOrange.withOpacity(0.5),
                                          blurRadius: 4,
                                          spreadRadius: .05,
                                            offset: Offset(0, 4)
                                        ),
                                    ],
                                        ),
                                      ),
                                      tooltip: FlutterSliderTooltip(
                                        disabled:true ,
                                        textStyle:  const TextStyle(
                                            fontSize: 15,
                                            color: white,
                                          ),
                                          boxStyle: FlutterSliderTooltipBox(
                                              decoration: BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                  color: mainOrange.withOpacity(0.5)
                                              )
                                          )
                    
                                      ),
                                      trackBar: FlutterSliderTrackBar(
                                        inactiveTrackBarHeight: 5,
                                        activeTrackBarHeight: 8,
                                        inactiveTrackBar: BoxDecoration(
                    
                                          borderRadius: BorderRadius.circular(20),
                                          color:Colors.black12,
                                            border: Border.all(width: 10, color: mainOrange)
                                        ),
                                        activeTrackBar: BoxDecoration(
                                            borderRadius: BorderRadius.circular(4),
                                            color: mainOrange.withOpacity(0.5)
                                        ),
                                      ),
                                      max: 100000,
                                      min: 0,
                                      onDragging: (handerIndex,lowerValue ,upperLimit){
                                          setState(() {
                                            lowerLimit=lowerValue;
                                          });
                                    }
                                    ),
                    
                                Padding(
                                  padding: const EdgeInsets.only(left:10 , right: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text( 'KSh 1',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: grey,
                                      ),
                                      ),
                                      Text( 'KSh 100000',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                          color: grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                             const SizedBox(
                               height: 10,
                             ),
                                Text(
                                    'Loan Term',
                                    style: Theme.of(context).textTheme.displayMedium),
                                const SizedBox(
                                  height: 20,
                                ),
                                DropdownSearch<String>(
                                  onChanged: (value){
                                    limit=value! as double;
                                  },
                                  popupProps:  PopupProps.menu(
                                    showSelectedItems: true,
                                    itemBuilder:(BuildContext context, String item,bool isSelected,){
                                      return
                                        Container(
                                          width: double.infinity,
                                          decoration:BoxDecoration(
                                            color: isSelected ?  mainOrange : white,
                                            border: const Border(
                                              top: BorderSide(
                                                color: black, // Set the color of the top border
                                                width: 0.05, // Set the width of the top border
                                              ),
                                              bottom: BorderSide(
                                                  color: black, // Set the color of the bottom border
                                                  width: 0.05 // Set the width of the bottom border
                                              ),
                                            ),
                                          ),
                    
                                          padding: EdgeInsets.all(20),
                                          child: Text(
                                            item,
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: isSelected ?  white : mainBlue,
                                              fontWeight: FontWeight.w600
                                            )
                    
                                          ),
                                        );
                                    },
                                    constraints: BoxConstraints(
                                        maxHeight:200
                                    ),
                    
                                    menuProps: MenuProps(
                                        elevation: 6,
                                        shadowColor:  mainOrange
                                    ),
                                  ),
                                  items: limits,
                                  dropdownDecoratorProps:  DropDownDecoratorProps(
                                    baseStyle:TextStyle(
                                        fontSize: 15,
                                        color:  mainBlue,
                                        fontWeight: FontWeight.w600
                                    ),
                    
                                    dropdownSearchDecoration:  InputDecoration(
                    
                                     hoverColor: mainOrange,
                                      focusColor: mainOrange,
                                      hintText: "Select a loan term",
                                      hintStyle: khintstyle,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: mainBlue),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color:mainOrange),
                                      ),
                                    ),
                                  ),
                                ),
                    
                              ],
                            ),
                          ) ,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
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
                                      'Pay Weekly',
                                      style: Theme.of(context).textTheme.displayMedium),
                                ),
                                Text(
                                    'Total Interest',
                                    style: Theme.of(context).textTheme.displayMedium),
                                Text(
                                    'Disbursement charges',
                                    style: Theme.of(context).textTheme.displayMedium),

                    
                              ],
                            ),
                          ) ,
                        ),
                      )
                    ],
                  ),
                ),
                    
              ],
            ),
          ),
        )),
      ],
    );
  }
}


