import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fulusi/colors/colors.dart';

import '../../networking/whatsapp.dart';


List<String> title =[
'What types of loans does Oasis Capital offer?',
  'Who is eligible to apply for a loan at Oasis Capital?',
  'What is the maximum loan amount I can apply for?',
'What are the interest rates for loans?',
  'Can I pay off my loan early, and are there any penalties for early repayment?',
'What is the repayment period for a loan?',
'What collateral is required to secure a loan?',
'How long does it take to process and disburse a loan?',
'Are there any additional fees involved in loan processing?',

];
List <String> paragraph =[
'Oasis Capital offers a variety of loans, including personal loans, business loans,car loans,education loans,home loans and wedding loans.Kindly spare time to check on our services to learn more about the loans.',
'To be eligible for a loan, applicants must be registered members of Oasis Capital,be 18 yrs and above , must be approved by a guarantor, and meet other specific requirements of the loan product they are applying for.',
'The maximum loan amount for Personal Loans is Kshs 1,000,000 (One million).',
  'Oasis Capital offers 16% interest rate per month.',
  'Early repayment is possible, and we encourage it as it reduces the total interest payable. Please check with our loan guarantor/officer if any penalties apply for early repayment of your specific loan product.',
  'Personal loans need to be settled within the specified timeframe, typically within four weeks for smaller loans. The duration for repayment may differ based on the type of loan and the terms set during the loan approval process.',
'Loans must be fully guaranteed by a guarantor against his or her shares or by collateral such as a title deed or a vehicle log book, which covers up to 70% of the loan value after independent valuation.',
  'Loan processing and disbursement happen instantly after the application is approved.',
  'Borrowers may incur additional costs, such as transaction charges, penalties, the cost of conducting colateral verifications or other fees related to loan processing. Specific fees will be outlined during the loan application process.',


];



List<bool>isChecked=   List.generate(5, (int x) => false);

class FAQ extends StatefulWidget {


  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
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

                  'Frequently asked questions',
                  style: Theme.of(context).textTheme.titleLarge),
            ),
            body:SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
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
              
                                  Text(
                                    'The following FAQs may solve your problem:',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: grey,
                                      fontWeight: FontWeight.w500,
              
                                    ),
                                  ),
                            Column(
                              children: List.generate(8, (index) =>  ExpansionTile(
                                title: Text(title[index],
                                  style: TextStyle(
                                      color: black
                                  ),
              
                                ),
                                children: <Widget>[
              
                                  ListTile(
                                    title: Expanded(
                                      child: Text(paragraph[index],
                                        style: TextStyle(
                                          color: mainOrange
                                      ),),
                                    ),
                                  ),
              
              
                                ],
                              ))
                            )
              
              
              
              
                                ],
                              ),
                            ) ,
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
