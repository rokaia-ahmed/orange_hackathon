import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ms_widgets/ms_widgets.dart';
import 'package:pet_orange/modules/Sing_Up/cubit/cubit.dart';
import 'package:pet_orange/modules/Sing_Up/cubit/states.dart';
import 'package:pet_orange/shared/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:pet_orange/shared/components.dart';
import '../../shared/components.dart';
import '../../shared/constants.dart';
import '../Login/login_screen.dart';

class SingUp extends StatelessWidget {
  const SingUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SingUpCubit, SingUpStates>(
        listener: (context, state) {},
        builder: (context, state) {
          SingUpCubit cubit = SingUpCubit.get(context);
          var emailController = TextEditingController();
          var passwordController = TextEditingController();
          var passwordController1 = TextEditingController();
          var FiristnameController = TextEditingController();
          var CountryController = TextEditingController();
          var lastNameController = TextEditingController();

          var formKey = GlobalKey<FormState>();


          return SafeArea(
            child: SingleChildScrollView(
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
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 400.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Form(
                                key: formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Sign up',
                                      style: TextStyle(color: kBrown, fontSize: 45),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          defaultIconButton(
                                            buttomTitle: 'Facebook',
                                            iconSvgPath: facebook,
                                            onPressed: () {},
                                            borderRadius: BorderRadius.circular(20),
                                            backgroundColor: kBlueFb,
                                            height: 50,
                                            width: 200,
                                            textStyle:
                                                TextStyle(color: Colors.white),
                                          ),
                                          // TODO def

                                          SizedBox(
                                            width: 30,
                                          ),
                                          defaultIconButton(
                                            buttomTitle: 'Google',
                                            iconSvgPath: icongoogle,
                                            onPressed: () {},
                                            borderRadius: BorderRadius.circular(20),
                                            backgroundColor: Colors.white,
                                            height: 50,
                                            width: 200,
                                            textStyle:
                                                TextStyle(color: Colors.black),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    const Text(
                                      "_________________________    Or     __________________________",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: kBrown),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Card(
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20)),
                                      child: defaultTextFormField(
                                        width: 400,
                                        borderRadius: BorderRadius.circular(20),
                                        filledColor: Colors.white,
                                        hintText: 'First Name',
                                        borderColor: Colors.transparent,
                                        validateTextField: (String? text) {
                                          if (text!.isEmpty) {
                                            return 'Please enter First name';
                                          }
                                        },
                                        textFieldController: FiristnameController,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Card(
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20)),
                                      child: defaultTextFormField(
                                        width: 400,
                                        borderRadius: BorderRadius.circular(20),
                                        filledColor: Colors.white,
                                        hintText: 'Last Name',
                                        borderColor: Colors.transparent,
                                        validateTextField: (String? text) {
                                          if (text!.isEmpty) {
                                            return 'Please enter Last name';
                                          }
                                        },
                                        textFieldController: lastNameController,
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
                                        width: 400,
                                        borderRadius: BorderRadius.circular(20),
                                        filledColor: Colors.white,
                                        hintText: 'Email',
                                        borderColor: Colors.transparent,
                                        validateTextField: (String? text) {
                                          if (text!.isEmpty) {
                                            return 'Please enter email';
                                          }
                                          if (!RegExp(
                                                  "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                              .hasMatch(text)) {
                                            return 'Please a valid Email';
                                          }
                                          return null;
                                        },
                                        textFieldController: emailController,
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
                                          width: 400,
                                          borderRadius: BorderRadius.circular(20),
                                          filledColor: Colors.white,
                                          borderColor: Colors.transparent,
                                          hintText: 'Password',
                                          textFieldController: passwordController,
                                          isSecure: cubit.isPassword,
                                          prefixWidget: Icon(Icons.lock),
                                          validateTextField: (String? text) {
                                            if (text!.isEmpty) {
                                              return 'Please enter Password';
                                            }
                                          }),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Card(
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20)),
                                      child: defaultTextFormField(
                                          width: 400,
                                          borderRadius: BorderRadius.circular(20),
                                          filledColor: Colors.white,
                                          borderColor: Colors.transparent,
                                          hintText: 'Re-Enter Password',
                                          textFieldController: passwordController1,
                                          isSecure: cubit.isPassword,
                                          prefixWidget: Icon(Icons.lock),
                                          validateTextField: (String? text) {
                                            if (text!.isEmpty) {
                                              return 'Please enter Password';
                                            }
                                            if (passwordController.text !=
                                                passwordController1.text) {
                                              return "كلمة المرور غير متطابقة";
                                            }
                                            return null;
                                          }),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),

                                    Card(
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20)),
                                      child: defaultTextFormField(
                                          width: 400,
                                          borderRadius: BorderRadius.circular(20),
                                          filledColor: Colors.white,
                                          borderColor: Colors.transparent,
                                          hintText: 'country',
                                          textFieldController: CountryController,

                                          validateTextField: (String? text) {
                                            if (text!.isEmpty) {
                                              return 'Please enter country';
                                            }


                                          }),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 30),
                                      child: Container(
                                        child: ConditionalBuilder(
                                          condition: true,
                                          builder: (context) => defaultButton(
                                            hoverColor: kBrown,
                                            buttonWidth: 400,
                                            buttonHeight: 40,
                                            backgroundColor: kBrown,
                                            borderColor: Colors.transparent,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              gradient: LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: <Color>[kBrown, kBrown]),
                                            ),
                                            function: () {
                                              if (formKey.currentState!
                                                  .validate()) {
                                                cubit.UserSingup(
                                                    email: emailController.text,
                                                    password:
                                                        passwordController.text,
                                                    country:CountryController.text,
                                                    firstName:FiristnameController.text,
                                                    lastName: lastNameController.text);
                                              }
                                            },
                                            text: 'Sign up',
                                            textStyle: TextStyle(
                                                color: kOffWhite, fontSize: 20),
                                            borderRadius: BorderRadius.circular(15),
                                            isUpperCase: false,
                                          ),   fallback: (context)=> Center(child: CircularProgressIndicator(),),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 17,
                                    ),
                                    RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                          text: "Already have an account?",
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                        TextSpan(
                                            text: ' Sign up',
                                            style: TextStyle(
                                              color: kBrown,
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) => LoginScreen()));


                                              }),
                                      ]),
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                    //TODO Footer
                    footerBuilder(),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
