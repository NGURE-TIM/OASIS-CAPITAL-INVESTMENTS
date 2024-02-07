import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../data_Entry/code.dart';
import '../stateManagement_provider/provider.dart';
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