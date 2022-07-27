import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ms_widgets/ms_widgets.dart';
import 'package:pet_orange/modules/adaption_screen/cubit/adaption_cubit.dart';
import 'package:pet_orange/shared/components.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../shared/colors.dart';
import '../../shared/constants.dart';
import '../Login/login_screen.dart';
import '../Request/request_screen.dart';
import '../Sing_Up/Sing _Up.dart';
import 'cubit/adaption_state.dart';

class AdaptionScreen extends StatelessWidget {
   AdaptionScreen({Key? key}) : super(key: key);
  String? selectedItem1;
  List<String> gender = ['male', 'female'];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdaptionCubit, AdaptionState>(
        builder: (context, state) {
          var cubit = AdaptionCubit.get(context);
          // List<String> gender =
          // [
          //   '${cubit.petsModel!.gender!.male}',
          //   '${cubit.petsModel!.gender!.female}'
          // ];
          return Scaffold(
            body: SingleChildScrollView(
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
                            text: 'Adaption',
                            textStyle: TextStyle(
                              color: Colors.white,
                            ),
                            borderColor: Colors.transparent,
                          ),
                          defaultButton(
                            backgroundColor: Colors.transparent,
                            function: () {},
                            text: 'Services',
                            textStyle: TextStyle(
                              color: Colors.white,
                            ),
                            borderColor: Colors.transparent,
                          ),
                          defaultButton(
                            backgroundColor: Colors.transparent,
                            function: () {
                              navigateTo(context, RequestScreen());
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
                            function: () {
                              navigateTo(context, SingUp());
                            },
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
                            function: () {
                              navigateTo(context, LoginScreen());
                            },
                            text: 'Login',
                            textStyle: TextStyle(color: kOffWhite),
                            borderColor: kOffWhite,
                          ),
                        ],
                      ),
                    ),
                  ),
                  //TODO Body
                  Stack(
                    children: [
                      const Image(image: AssetImage('assets/images/Home – 2.jpg'),width: double.infinity,fit: BoxFit.fill,),
                      Center(
                        child: Column(
                          children: [
                            cubit.petsFilterModel == null ? const Center(child: CircularProgressIndicator()) :Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      const Text('Breed'),
                                      const SizedBox(height: 10,),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        width: 200,
                                        height: 40,
                                        child: defaultDropDownMenu(
                                          items: AdaptionCubit.get(context).petsFilterModel!.breed,
                                          selectedItem: selectedItem1,
                                          borderRadius: BorderRadius.circular(10.0),
                                          backgroundColor: Colors.white,
                                          dropDownColor: Colors.white,
                                          borderColor: Colors.black,
                                          alignment: Alignment.center,
                                          itemTextStyle: const TextStyle(
                                            color: Colors.black,
                                          ),
                                          contentPadding: const EdgeInsets.all(10),
                                          onChanged: (item){
                                            selectedItem1 = item;
                                          },
                                          icon: const Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 30,),
                                      const Text('Gender'),
                                      const SizedBox(height: 10,),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        width: 200,
                                        height: 40,
                                        child: defaultDropDownMenu(
                                          items: gender,
                                          selectedItem: selectedItem1,
                                          borderRadius: BorderRadius.circular(10.0),
                                          backgroundColor: Colors.white,
                                          dropDownColor: Colors.white,
                                          borderColor: Colors.black,
                                          alignment: Alignment.center,
                                          itemTextStyle: const TextStyle(
                                            color: Colors.black,
                                          ),
                                          contentPadding: const EdgeInsets.all(10),
                                          onChanged: (item){
                                            selectedItem1 = item;
                                          },
                                          icon: const Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      const Text('Age'),
                                      const SizedBox(height: 10,),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        width: 200,
                                        height: 40,
                                        child: defaultDropDownMenu(
                                          items: cubit.petsFilterModel!.ages,
                                          selectedItem: selectedItem1,
                                          borderRadius: BorderRadius.circular(10.0),
                                          backgroundColor: Colors.white,
                                          dropDownColor: Colors.white,
                                          borderColor: Colors.black,
                                          alignment: Alignment.center,
                                          itemTextStyle: const TextStyle(
                                            color: Colors.black,
                                          ),
                                          contentPadding: const EdgeInsets.all(10),
                                          onChanged: (item){
                                            selectedItem1 = item;
                                          },
                                          icon: const Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 30,),
                                      const Text('Color'),
                                      const SizedBox(height: 10,),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        width: 200,
                                        height: 40,
                                        child: defaultDropDownMenu(
                                          items: cubit.petsFilterModel!.colors,
                                          selectedItem: selectedItem1,
                                          borderRadius: BorderRadius.circular(10.0),
                                          backgroundColor: Colors.white,
                                          dropDownColor: Colors.white,
                                          borderColor: Colors.black,
                                          alignment: Alignment.center,
                                          itemTextStyle: const TextStyle(
                                            color: Colors.black,
                                          ),
                                          contentPadding: const EdgeInsets.all(10),
                                          onChanged: (item){
                                            selectedItem1 = item;
                                          },
                                          icon: const Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      const Text('Size'),
                                      const SizedBox(height: 10,),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        width: 200,
                                        height: 40,
                                        child: defaultDropDownMenu(
                                          items: cubit.petsFilterModel!.size,
                                          selectedItem: selectedItem1,
                                          borderRadius: BorderRadius.circular(10.0),
                                          backgroundColor: Colors.white,
                                          dropDownColor: Colors.white,
                                          borderColor: Colors.black,
                                          alignment: Alignment.center,
                                          itemTextStyle: const TextStyle(
                                            color: Colors.black,
                                          ),
                                          contentPadding: const EdgeInsets.all(10),
                                          onChanged: (item){
                                            selectedItem1 = item;
                                          },
                                          icon: const Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 30,),
                                      const Text('Hair length'),
                                      const SizedBox(height: 10,),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        width: 200,
                                        height: 40,
                                        child: defaultDropDownMenu(
                                          items: cubit.petsFilterModel!.hairLength,
                                          selectedItem: selectedItem1,
                                          borderRadius: BorderRadius.circular(10.0),
                                          backgroundColor: Colors.white,
                                          dropDownColor: Colors.white,
                                          borderColor: Colors.black,
                                          alignment: Alignment.center,
                                          itemTextStyle: const TextStyle(
                                            color: Colors.black,
                                          ),
                                          contentPadding: const EdgeInsets.all(10),
                                          onChanged: (item){
                                            selectedItem1 = item;
                                          },
                                          icon: const Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      const Text('Good with'),
                                      const SizedBox(height: 10,),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        width: 200,
                                        height: 40,
                                        child: defaultDropDownMenu(
                                          items: cubit.petsFilterModel!.goodWith,
                                          selectedItem: selectedItem1,
                                          borderRadius: BorderRadius.circular(10.0),
                                          backgroundColor: Colors.white,
                                          dropDownColor: Colors.white,
                                          borderColor: Colors.black,
                                          alignment: Alignment.center,
                                          itemTextStyle: const TextStyle(
                                            color: Colors.black,
                                          ),
                                          contentPadding: const EdgeInsets.all(10),
                                          onChanged: (item){
                                            selectedItem1 = item;
                                          },
                                          icon: const Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 30,),
                                      const Text('Care & Behavior'),
                                      const SizedBox(height: 10,),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        width: 200,
                                        height: 40,
                                        child: defaultDropDownMenu(
                                          items: cubit.petsFilterModel!.behaviour,
                                          selectedItem: selectedItem1,
                                          borderRadius: BorderRadius.circular(10.0),
                                          backgroundColor: Colors.white,
                                          dropDownColor: Colors.white,
                                          borderColor: Colors.black,
                                          alignment: Alignment.center,
                                          itemTextStyle: const TextStyle(
                                            color: Colors.black,
                                          ),
                                          contentPadding: const EdgeInsets.all(10),
                                          onChanged: (item){
                                            selectedItem1 = item;
                                          },
                                          icon: const Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 50,),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 100,horizontal: 150),
                              child: SizedBox(
                                height: 900,
                                width: double.infinity,
                                child: buildGridViewOfAnimalsItems(cubit.petsList),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  //TODO footer
                  footerBuilder(),
                ],
              ),
            ),
          );
        },
        listener: (context, state) {});
  }

  Widget buildGridViewOfAnimalsItems(List list) {
    return GridView.count(
                crossAxisSpacing: 1.0,
                mainAxisSpacing: 1.0,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                crossAxisCount: 3,
                childAspectRatio:  2.98/3.2 ,
                children: List.generate(
                    list.length,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 30),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color:  const Color (0xffC9C9C9)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                 Image(image:  AssetImage('assets/images/Home – 2.jpg'), width: 250,height: 300,),
                                 Text(list[index].name.toString()),
                                Container(
                                  width: 200,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color(0xff4b2f24),
                                  ),
                                  child: defaultButton(
                                      backgroundColor: Colors.black,
                                      hoverColor: const Color(0xff4b2f24),
                                      borderRadius: BorderRadius.circular(20),
                                      borderWidth: 200,
                                      buttonHeight: 50,
                                      function: (){},
                                      text: 'Reed more',
                                      textStyle: const TextStyle(color: Colors.white),
                                      borderColor: Colors.black),
                                )
                              ],
                            ),
                          ),
                        )
                ),
              );
  }
}
