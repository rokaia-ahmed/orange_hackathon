import 'dart:convert';
import 'dart:html';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ms_widgets/ms_widgets.dart';
import 'package:pet_orange/modules/Login/login_screen.dart';
import 'package:pet_orange/modules/Request/cubit/cubit.dart';
import 'package:file_picker/file_picker.dart';
import '../../shared/colors.dart';
import '../../shared/components.dart';
import '../../shared/constants.dart';
import 'cubit/states.dart';

class RequestScreen extends StatefulWidget {
  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  var selectedItem;

  File? _image;

  String? imageBase64;

  int? categoryId;

  var logoBase64;

  FilePickerResult? pickedFile;

  void chooseImage() async {
    pickedFile = await FilePicker.platform.pickFiles();
    if (pickedFile != null) {
      try {
        setState(() {
          logoBase64 = pickedFile!.files.first.bytes;
          imageBase64 = base64Encode(logoBase64);
        });
      } catch (err) {
        print(err);
      }
    } else {
      print('No Image Selected');
    }
  }

  List<String> items = ['Dog'];
  var nameController,
      locationController,
      phoneNumberController,
      descController = TextEditingController();
  var category, year, months, size, Breed, hairLength, care, trained, color;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RequestCubit, RequestStates>(
      listener: (context, state) {},
      builder: (context, state) {
        RequestCubit cubit = RequestCubit.get(context);
        return SafeArea(
          child: SingleChildScrollView(
            child: Material(
              child: Stack(
                children: [
                  Column(
                    children: [
                      // TODO Navbar
                      Container(
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(colors: gradient)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/logo.png',
                                width: 150,
                              ),
                              const Spacer(),
                              defaultButton(
                                backgroundColor: Colors.transparent,
                                function: () async {},
                                text: 'Home',
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                ),
                                borderColor: Colors.transparent,
                              ),
                              defaultButton(
                                backgroundColor: Colors.transparent,
                                function: () async {},
                                text: 'About us',
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                ),
                                borderColor: Colors.transparent,
                              ),
                              defaultButton(
                                backgroundColor: Colors.transparent,
                                function: () async {},
                                text: 'Category',
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                ),
                                borderColor: Colors.transparent,
                              ),
                              defaultButton(
                                backgroundColor: Colors.transparent,
                                function: () {},
                                text: 'Services',
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                ),
                                borderColor: Colors.transparent,
                              ),
                              defaultButton(
                                backgroundColor: Colors.transparent,
                                function: () {},
                                text: 'Request',
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                ),
                                borderColor: Colors.transparent,
                              ),
                              const SizedBox(
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
                              const SizedBox(
                                width: 20,
                              ),
                              defaultButton(
                                hoverColor: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                backgroundColor: Colors.transparent,
                                function: () {
                                  navigateTo(context, LoginScreen());
                                },
                                text: 'Login',
                                textStyle: const TextStyle(color: kOffWhite),
                                borderColor: kOffWhite,
                              ),
                            ],
                          ),
                        ),
                      ),
                      //TODO Screen Body

                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 317, vertical: 265.2),
                        child: Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30)),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'Request',
                                  style: TextStyle(
                                    color: Color(0xff492f24),
                                    fontSize: 60,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ElevatedButton.icon(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                      ),
                                      onPressed: () async {
                                        chooseImage();
                                      },
                                      label: const Text(
                                        'Choose Image',
                                        style:
                                            TextStyle(color: Color(0xff4b2f24)),
                                      ),
                                      icon: const Icon(Icons.image,
                                          color: Color(0xff4b2f24), size: 80),
                                    ),
                                    ElevatedButton.icon(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                      ),
                                      onPressed: () async {
                                        chooseImage();
                                      },
                                      label: const Text(
                                        'Take Photo',
                                        style:
                                            TextStyle(color: Color(0xff4b2f24)),
                                      ),
                                      icon: const Icon(
                                          Icons.camera_alt_outlined,
                                          color: Color(0xff4b2f24),
                                          size: 80),
                                    ),
                                  ],
                                ),

                                const SizedBox(
                                  height: 20,
                                ),
                                defaultTextFormField(
                                  textFieldController: nameController,
                                  width: 600,
                                  borderRadius: BorderRadius.circular(30),
                                  filledColor: Colors.white,
                                  hintText: 'Name',
                                  borderColor: const Color(0xffC9C9C9),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                //TODO Drop down section
                                Container(
                                  width: 600,
                                  child: defaultDropDownMenu(
                                    items: items,
                                    selectedItem: category,
                                    borderRadius: BorderRadius.circular(30),
                                    backgroundColor: Colors.white,
                                    dropDownColor: Colors.white,
                                    borderColor: const Color(0xffC9C9C9),
                                    labelText: "Category",
                                    alignment: Alignment.center,
                                    itemTextStyle: const TextStyle(
                                      color: Colors.black,
                                    ),
                                    contentPadding: EdgeInsets.all(10),
                                    onChanged: (item) {
                                      category = item;
                                    },
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 230,
                                      child: defaultDropDownMenu(
                                        items: cubit.petsFilterModel!.ages,
                                        selectedItem: year,
                                        borderRadius: BorderRadius.circular(20),
                                        backgroundColor: Colors.white,
                                        dropDownColor: Colors.white,
                                        borderColor: Color(0xffC9C9C9),
                                        labelText: "Year",
                                        alignment: Alignment.center,
                                        itemTextStyle: const TextStyle(
                                          color: Colors.black,
                                        ),
                                        contentPadding: EdgeInsets.all(10),
                                        onChanged: (item) {
                                          year = item;
                                        },
                                        icon: const Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 140,
                                    ),
                                    Container(
                                      width: 230,
                                      child: defaultDropDownMenu(
                                        items: cubit.petsFilterModel!.ages,
                                        selectedItem: year,
                                        borderRadius: BorderRadius.circular(20),
                                        backgroundColor: Colors.white,
                                        labelText: "Months",
                                        dropDownColor: Colors.white,
                                        borderColor: const Color(0xffC9C9C9),
                                        alignment: Alignment.center,
                                        itemTextStyle: const TextStyle(
                                          color: Colors.black,
                                        ),
                                        contentPadding:
                                            const EdgeInsets.all(10),
                                        onChanged: (item) {
                                          year = item;
                                        },
                                        icon: Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 230,
                                      child: defaultDropDownMenu(
                                        items: cubit.petsFilterModel!.size,
                                        selectedItem: size,
                                        borderRadius: BorderRadius.circular(20),
                                        backgroundColor: Colors.white,
                                        dropDownColor: Colors.white,
                                        borderColor: Color(0xffC9C9C9),
                                        labelText: "Size",
                                        alignment: Alignment.center,
                                        itemTextStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                        contentPadding: EdgeInsets.all(10),
                                        onChanged: (item) {
                                          size = item;
                                        },
                                        icon: Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 140,
                                    ),
                                    Container(
                                      width: 230,
                                      child: defaultDropDownMenu(
                                        items: cubit.petsFilterModel!.breed,
                                        selectedItem: Breed,
                                        borderRadius: BorderRadius.circular(20),
                                        backgroundColor: Colors.white,
                                        dropDownColor: Colors.white,
                                        borderColor: Color(0xffC9C9C9),
                                        labelText: "Breed",
                                        alignment: Alignment.center,
                                        itemTextStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                        contentPadding: EdgeInsets.all(10),
                                        onChanged: (item) {
                                          Breed = item;
                                        },
                                        icon: Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 230,
                                      child: defaultDropDownMenu(
                                        items: items,
                                        selectedItem: selectedItem,
                                        borderRadius: BorderRadius.circular(20),
                                        backgroundColor: Colors.white,
                                        dropDownColor: Colors.white,
                                        borderColor: Color(0xffC9C9C9),
                                        alignment: Alignment.center,
                                        labelText: "Gender",
                                        itemTextStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                        contentPadding: EdgeInsets.all(10),
                                        onChanged: (item) {
                                          selectedItem = item;
                                        },
                                        icon: Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 140,
                                    ),
                                    Container(
                                      width: 230,
                                      child: defaultDropDownMenu(
                                        items: cubit.petsFilterModel!.breed,
                                        selectedItem: selectedItem,
                                        borderRadius: BorderRadius.circular(20),
                                        backgroundColor: Colors.white,
                                        dropDownColor: Colors.white,
                                        labelText: "Breed",
                                        borderColor: Color(0xffC9C9C9),
                                        alignment: Alignment.center,
                                        itemTextStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                        contentPadding: EdgeInsets.all(10),
                                        onChanged: (item) {
                                          Breed = item;
                                        },
                                        icon: Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 230,
                                      child: defaultDropDownMenu(
                                        items:
                                            cubit.petsFilterModel!.hairLength,
                                        selectedItem: hairLength,
                                        borderRadius: BorderRadius.circular(30),
                                        backgroundColor: Colors.white,
                                        dropDownColor: Colors.white,
                                        borderColor: Color(0xffC9C9C9),
                                        labelText: "Hair Length",
                                        alignment: Alignment.center,
                                        itemTextStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                        contentPadding: EdgeInsets.all(10),
                                        onChanged: (item) {
                                          hairLength = item;
                                        },
                                        icon: Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 140,
                                    ),
                                    Container(
                                      width: 230,
                                      child: defaultDropDownMenu(
                                        items: cubit.petsFilterModel!.behaviour,
                                        selectedItem: care,
                                        borderRadius: BorderRadius.circular(20),
                                        backgroundColor: Colors.white,
                                        labelText: "Care & behavior",
                                        dropDownColor: Colors.white,
                                        borderColor: Color(0xffC9C9C9),
                                        alignment: Alignment.center,
                                        itemTextStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                        contentPadding: EdgeInsets.all(10),
                                        onChanged: (item) {
                                          care = item;
                                        },
                                        icon: Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 230,
                                      child: defaultDropDownMenu(
                                        items: cubit.petsFilterModel!.goodWith,
                                        selectedItem: trained,
                                        borderRadius: BorderRadius.circular(20),
                                        labelText: "House Trained",
                                        backgroundColor: Colors.white,
                                        dropDownColor: Colors.white,
                                        borderColor: Color(0xffC9C9C9),
                                        alignment: Alignment.center,
                                        itemTextStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                        contentPadding: EdgeInsets.all(10),
                                        onChanged: (item) {
                                          trained = item;
                                        },
                                        icon: Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 140,
                                    ),
                                    Container(
                                      width: 230,
                                      child: defaultDropDownMenu(
                                        items: cubit.petsFilterModel!.colors,
                                        selectedItem: color,
                                        borderRadius: BorderRadius.circular(30),
                                        backgroundColor: Colors.white,
                                        dropDownColor: Colors.white,
                                        borderColor: Color(0xffC9C9C9),
                                        labelText: "color",
                                        alignment: Alignment.center,
                                        itemTextStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                        contentPadding: EdgeInsets.all(10),
                                        onChanged: (item) {
                                          color = item;
                                        },
                                        icon: Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),

                                const Text(
                                  "Detect your current location",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff4b2f24)),
                                ),
                                //TODO  Input Section
                                Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: defaultTextFormField(
                                    textFieldController: locationController,
                                    width: 600,
                                    borderRadius: BorderRadius.circular(20),
                                    filledColor: Colors.white,
                                    hintText: 'Location',
                                    isSecure: true,
                                    suffixWidget: IconButton(
                                      icon: const Icon(Icons.place),
                                      color: Colors.black,
                                      onPressed: () {},
                                    ),
                                    borderColor: Color(0xffC9C9C9),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: defaultTextFormField(
                                    textFieldController: phoneNumberController,
                                    width: 600,
                                    borderRadius: BorderRadius.circular(20),
                                    filledColor: Colors.white,
                                    hintText: 'Phone number',
                                    borderColor: Color(0xffC9C9C9),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: defaultTextFormField(
                                    textFieldController: descController,
                                    width: 600,
                                    borderRadius: BorderRadius.circular(20),
                                    filledColor: Colors.white,
                                    hintText: 'Description',
                                    borderColor: Color(0xffC9C9C9),
                                  ),
                                ),

                                const Text(
                                  'Vaccinated (up to date)',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff4b2f24)),
                                ),
                                //TODO Send button
                                Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: Container(
                                    child: ConditionalBuilder(
                                      condition: state is !Request2LoadingState,
                                      builder: (context)=>defaultButton(
                                        hoverColor: Color(0xFFFFFFFF),
                                        buttonWidth: 400,
                                        buttonHeight: 40,
                                        backgroundColor: Colors.white,
                                        borderColor: Color(0xffC9C9C9),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: <Color>[kBlack, kBrown]),
                                        ),
                                        function: () {
                                          cubit.sendRequest(
                                              name: nameController.text,
                                              image: imageBase64,
                                              year: year,
                                              month: months,
                                              size: size,
                                              breed: Breed,
                                              gender: year,
                                              hairLength: hairLength,
                                              color: color,
                                              careBehavior: care,
                                              houseTrained: trained,
                                              description: descController.text,
                                              location: locationController.text,
                                              phone: phoneNumberController.text,
                                              vaccinated: care,
                                              categoryId: '2');
                                        },
                                        text: 'Send',
                                        textStyle: TextStyle(
                                            color: kOffWhite, fontSize: 20),
                                        borderRadius: BorderRadius.circular(15),
                                        isUpperCase: false,
                                      ),
                                      fallback: (context)=>Center(child: CircularProgressIndicator(),),
                                    )
                                  ),
                                ),
                                const SizedBox(
                                  height: 200,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      //TODO Footer
                      footerBuilder(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
