import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../data_Entry/code.dart';
import '../globalWidgets.dart';
import '../stateManagement_provider/provider.dart';
import 'package:fulusi/data_Entry/dob.dart';
import 'package:fulusi/data_Entry/emailandPhone.dart';
import 'package:fulusi/data_Entry/income.dart';
import 'package:fulusi/data_Entry/name.dart';
import 'package:fulusi/data_Entry/photo.dart';
import 'dart:convert';
//this function gets  checks the referral code
checkReferral (String code ,BuildContext context )async{
  try{
    CollectionReference collection=FirebaseFirestore.instance.collection('referralCode');
    QuerySnapshot snapshot=await collection.where('code', isEqualTo: code).get();

    if (snapshot.docs.isNotEmpty && context.mounted){

      Provider.of<Code>(context , listen: false).dbCall();

    }
    else if(snapshot.docs.isEmpty &&context.mounted){

      Provider.of<Code>(context , listen: false).wrong();


      wrongCode();
      await Future.delayed(const Duration(seconds:3));
      Provider.of<Code>(context , listen: false).turnWrongON();

    }
  }
  catch(e){
    //TODO :HANDLE ERRORS LIKE NO INTERNET CONNECTION , CONGESTED DB
  }
}

//this code checks for phoneNumber/email existance in the db and return true or false
verifyPhoneNumber(String address ,BuildContext context )async{
  try{
    CollectionReference collection=FirebaseFirestore.instance.collection('userData');
    QuerySnapshot snapshot=await collection.where('Phone number', isEqualTo: address).get();

    if (snapshot.docs.isNotEmpty && context.mounted){

      Provider.of<VerifyPage>(context , listen: false).dbCall();

    }
    else if(snapshot.docs.isEmpty &&context.mounted){

      Provider.of<VerifyPage>(context , listen: false).inValid();
      await Future.delayed(const Duration(seconds:3));
      Provider.of<Code>(context , listen: false).turnWrongON();

    }
  }
  catch(e){
    //TODO :HANDLE ERRORS
  }

}

FirebaseFirestore db =FirebaseFirestore.instance;
 pushToDb(BuildContext context)async{
  Provider.of<Code>(context , listen: false).reset();
    buildShowProgress(context);
  try{
    await db.collection('userData').add({
      "Full name":name,
      "National id number":id,
      "Phone number":phoneNumber,
      "Email":email,
      " Date of birth":selectedDate ,
      " Education":educationLevel,
      "Salary":wageLevel,
      //TODO :HANDLE lARGE IMAGE SIZE
    });
await Provider.of<Code>(context , listen: false).dbCall();
    await Future.delayed(const Duration(milliseconds: 100));
    navigate(context);

  }

  catch(e){
    print(e);
  }
}