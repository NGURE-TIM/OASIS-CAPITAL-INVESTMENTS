import 'package:flutter/material.dart';
import 'package:fulusi/colors/colors.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import '../globalWidgets.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:io';

import 'contacts.dart';
import 'emailandPhone.dart';
class Photo extends StatefulWidget {

  const Photo({Key? key}) : super(key: key);

  @override
  State<Photo> createState() => _PhotoState();
}

class _PhotoState extends State<Photo> {

   static File? image;
   static final picker=ImagePicker();


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        backgroundColor: white,
        body: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Center(
                child: image!=null? ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.file(

                      image!, fit: BoxFit.cover,
                    height: 200,
                    width: 200,

                  ),
                ) :
          const Image(
                  width: 200,
                  height: 200,
                  image:  Svg('assets/images/account_Info/Photo/undraw_pic_profile_re_7g2h.svg'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: OutlinedButton(onPressed: (){

                    showModalBottomSheet(
                        backgroundColor: transparent,
                        transitionAnimationController: AnimationController(
                          vsync: Navigator.of(context),
                          duration: Duration(milliseconds: 800), // Adjust animation duration as needed
                          reverseDuration: Duration(milliseconds: 900),
                        ),
                        context: context,
                        isScrollControlled: true,
                        builder: (ctx) => Padding(
                          padding:  EdgeInsets.only(
                              bottom: MediaQuery.of(ctx).viewInsets.bottom
                          ),
                          child: Container(

                              width: double.infinity,
                              height: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: white
                              ),
                              child:  Column(
                                children: [
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  buildDivider(70),
                                  buildDivider(40),
                                  buildDivider(10),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(

                                    mainAxisAlignment: MainAxisAlignment.center,

                                    children: [
                                      buildIcons('Take picture',Icons.add_a_photo,(){
                                        openImagePicker(ImageSource.camera,

                                                (XFile? pickedImage){
                                              if(pickedImage != null){
                                                setState(() {
                                                  _PhotoState.image=File(pickedImage.path);
                                                });

                                              }
                                            }
                                        );
                                      }),
                                      const SizedBox(
                                        width: 40,
                                      ),
                                      buildIcons('Upload image',Icons.upload_file,(){
                                        openImagePicker(ImageSource.gallery,(XFile? pickedImage){
                                          if(pickedImage != null){
                                            setState(() {
                                              _PhotoState.image=File(pickedImage.path);
                                            });

                                          }
                                        } );
                                      })
                                    ],
                                  )
                                ],
                              )
                          ),
                        ));

                },
                  style: ButtonStyle(
                    side: MaterialStateProperty.all<BorderSide>(
                      const BorderSide(color: mainOrange,
                        width: 2.0,
                      ),
                      // Set the border color
                    ),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0), // Set border radius
                      ),
                    ),
                  ), child: TextWidget('Upload photo',
                  FontWeight.w700,
                  mainOrange,
                ),

                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElavatedButton('Skip ' , white ,mainBlue , (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>   const Contacts()),
                    );
                  }),
                  const SizedBox(
                      width:15
                  ),
                  ElavatedButton('Continue' , white, mainOrange,(){

                    if(image!=null){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  const Contacts()),
                      );
                    }
                  }),


                ],
              ),


            ],
          ),
        )
    ));
  }

}




Future<void> openImagePicker(ImageSource x,Function(XFile?) onImagePicked )async

{
  final XFile? pickedImage= await _PhotoState.picker.pickImage(source: x);
  onImagePicked(pickedImage);

}







Column buildIcons(String text , IconData icon, Function() onPressed) {
  return Column(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: grey
                            ),
                            color: transparent,
                            shape: BoxShape.circle
                        ),
                        child: Center(
                          child: IconButton(
                            onPressed: onPressed,
                            icon: Icon(icon),
                            color: grey,
                            iconSize: 30,
                          )
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(text,
                        style: const TextStyle(
                          color: grey,
                          fontSize: 18
                        ),
                      )

                    ],
                  );
}

