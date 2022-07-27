
import 'dart:convert';
import 'dart:io';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ms_widgets/ms_widgets.dart';
import 'package:pet_orange/modules/Help_screen/cubit/states.dart';
import 'package:pet_orange/shared/components.dart';
import 'package:pet_orange/shared/constants.dart';
import '../../shared/colors.dart';
import 'cubit/cubit.dart';

class HelpScreen extends StatefulWidget {
   HelpScreen({Key? key}) : super(key: key);
  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  var selectedItem;
  List<String>items = ['cat','dog'];
  File? _image;
  String? imageBase64;
  int? categoryId ;
  FilePickerResult? pickedFile;
  var logoBase64;
  var formKey = GlobalKey<FormState>();
  var locationController = TextEditingController();
  var phoneNumberController = TextEditingController();
  void chooseImage() async {
    pickedFile = await FilePicker.platform.pickFiles();
    if (pickedFile != null) {
      try {
        setState(() {
          logoBase64 = pickedFile!.files.first.bytes;
          imageBase64 = base64Encode(logoBase64);
        });
        print(imageBase64);
      } catch (err) {
        print(err);
      }
    } else {
      print('No Image Selected');
    }
  }

  @override
  Widget build(BuildContext context) {
    HelpCubit cubit = HelpCubit.get(context);
    return BlocConsumer<HelpCubit,HelpStates>(
      listener:(context, state){}  ,
      builder:(context, state){
        return SingleChildScrollView(
          child: Material(
            child: Column(
              children: [
                //TODO Header
                Container(
                  decoration:
                  BoxDecoration(gradient: LinearGradient(colors: gradient)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          width: 150,
                        ),
                        Spacer(),
                        defaultButton(
                          backgroundColor: Colors.transparent,
                          function: () async {
                          },
                          text: 'Home',
                          textStyle: TextStyle(
                            color: Colors.white,
                          ),
                          borderColor: Colors.transparent,
                        ),
                        defaultButton(
                          backgroundColor: Colors.transparent,
                          function: () async {
                          },
                          text: 'About us',
                          textStyle: TextStyle(
                            color: Colors.white,
                          ),
                          borderColor: Colors.transparent,
                        ),
                        defaultButton(
                          backgroundColor: Colors.transparent,
                          function: () async {
                          },
                          text: 'Category',
                          textStyle: TextStyle(
                            color: Colors.white,
                          ),
                          borderColor: Colors.transparent,
                        ),
                        defaultButton(
                          backgroundColor: Colors.transparent,
                          function: () {
                          },
                          text: 'Services',
                          textStyle: TextStyle(
                            color: Colors.white,
                          ),
                          borderColor: Colors.transparent,
                        ),
                        defaultButton(
                          backgroundColor: Colors.transparent,
                          function: () {
                          },
                          text: 'Request',
                          textStyle: TextStyle(
                            color: Colors.white,
                          ),
                          borderColor: Colors.transparent,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        defaultButton(
                          hoverColor: Colors.white,
                          backgroundColor: Colors.transparent,
                          function: () {},
                          borderRadius: BorderRadius.circular(20),
                          text: 'Sign up',
                          textStyle: TextStyle(color: kOffWhite),
                          borderColor: kOffWhite,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        defaultButton(
                          hoverColor: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          backgroundColor: Colors.transparent,
                          function: () {},
                          text: 'Login',
                          textStyle: TextStyle(color: kOffWhite),
                          borderColor: kOffWhite,
                        ),
                      ],
                    ),
                  ),
                ),
                //TODO Body
                SizedBox(
                  height: 40,
                ),
                Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                    child: Stack(
                      children: [
                        Center(
                          child: Container(
                            height:700 ,
                            width:600,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: kBrown,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Help your friend',
                                  style: TextStyle(
                                    color:kBrown,
                                    fontSize: 40,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                GestureDetector(
                                  onTap:chooseImage,
                                  child: Icon(
                                    Icons.camera_alt_rounded,
                                    size: 80,
                                    color: Color(0xff4b2f24),
                                  ),
                                ) ,
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height:55 ,
                                  width:500 ,
                                  decoration:BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(18),
                                    border:Border.all(
                                      color: Colors.grey[100]!,
                                    ),
                                  ) ,
                                  child: Center(
                                    child: defaultDropDownMenu(
                                      items: items,
                                      selectedItem: selectedItem,
                                      borderRadius: BorderRadius.circular(18),
                                      backgroundColor: Colors.white,
                                      dropDownColor: Colors.white,
                                      borderColor: Colors.transparent,
                                      alignment: Alignment.center,
                                      itemTextStyle: TextStyle(
                                        color:Colors.brown.withOpacity(0.6),
                                      ),
                                      contentPadding: EdgeInsets.all(10),
                                      onChanged: (item){
                                        selectedItem = item;
                                        if(item=='cat'){
                                          categoryId=1;
                                        }else{
                                          categoryId=2;
                                        }
                                      },
                                      icon: Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 100),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Detect your current location',
                                      style: TextStyle(
                                        color: Color(0xff4b2f24),
                                        fontWeight: FontWeight.w900,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                                Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                  //TODO Location
                                  child: defaultTextFormField(
                                    validateTextField: (String? val){
                                      if(val!.isEmpty){
                                        return 'Please enter location';
                                      }
                                    },
                                    textFieldController: locationController,
                                    width: 500,
                                    borderRadius: BorderRadius.circular(20),
                                    filledColor: Colors.white,
                                    hintText: 'Location',
                                    hintColor:Colors.brown.withOpacity(0.6) ,
                                    suffixWidget: IconButton(
                                      onPressed:(){

                                      },
                                      icon:Icon(Icons.place,
                                        color:Color(0xff4a2f24),
                                      ) ,

                                    ),
                                    borderColor: Colors.transparent,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: defaultTextFormField(
                                    textFieldController: phoneNumberController,
                                    width: 500,
                                    height: 55,
                                    validateTextField: (String? val){
                                      if(val!.isEmpty){
                                        return 'Please enter phone number';
                                      }
                                    },
                                    borderRadius: BorderRadius.circular(20),
                                    filledColor: Colors.white,
                                    hintColor:Colors.brown.withOpacity(0.6) ,
                                    hintText: 'phone number',
                                    borderColor: Colors.transparent,
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                //TODO Send button
                                ConditionalBuilder(
                                  condition: state is !HelpLoadingState,
                                  builder: (context)=>defaultButton(
                                    backgroundColor:kBrown,
                                    hoverColor:kBrown ,
                                    decoration: BoxDecoration(
                                      color: kBrown,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    function: (){
                                      print(categoryId!);
                                      print(imageBase64!);
                                      print(locationController.text);
                                      print(phoneNumberController.text);
                                      cubit.helpRequest(
                                          categoryId: categoryId!,
                                          image: imageBase64!,
                                          location: locationController.text,
                                          phoneNumber: phoneNumberController.text,
                                      );
                                    }, text: 'Send',
                                    buttonWidth:500 ,
                                    buttonHeight: 55,
                                    textStyle:TextStyle(
                                      color:Color(0xffFFE3C5) ,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ), borderColor:Colors.transparent,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  fallback: (context)=>Center(child: CircularProgressIndicator(),),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                defaultButton(
                                  backgroundColor:Color(0xffFFE3C5),
                                  hoverColor:Color(0xffFFE3C5),
                                  function: (){}, text: 'Call',
                                  buttonWidth:500 ,
                                  buttonHeight: 55,
                                  decoration: BoxDecoration(
                                    color: Color(0xffFFE3C5),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  textStyle:TextStyle(
                                    color:kBrown ,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ), borderColor:Colors.transparent,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //TODO Footer
                footerBuilder(),
              ],
            ),
          ),
        );
      } ,
    );
  }
}

