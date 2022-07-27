import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ms_widgets/ms_widgets.dart';
import 'package:pet_orange/layout/cubit/cubit.dart';
import 'package:pet_orange/modules/Help_screen/help_your_friend.dart';
import 'package:pet_orange/modules/Login/login_screen.dart';
import 'package:pet_orange/modules/Request/request_screen.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../shared/colors.dart';
import '../modules/Sing_Up/Sing _Up.dart';
import '../modules/adaption_screen/adaption_screen.dart';
import '../shared/components.dart';
import '../shared/constants.dart';
import 'cubit/states.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scrollDirection = Axis.vertical;
  late final AutoScrollController controller;

  void initState() {
    //DO OTHER STUFF
    super.initState();
    controller = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: scrollDirection);
  }

  @override
  Widget build(BuildContext context) {
    PagesLayout cubit = PagesLayout.get(context);
    return BlocConsumer<PagesLayout, PagesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        PagesLayout cubit = PagesLayout.get(context);
        return SafeArea(
          child: Material(
            child: ListView(
              scrollDirection: scrollDirection,
              controller: controller,
              children: [
                //======================== Navbar Start =====================================
                // TODO Navbar
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
                            await controller.scrollToIndex(0,
                                preferPosition: AutoScrollPosition.begin);
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
                            await controller.scrollToIndex(1,
                                preferPosition: AutoScrollPosition.begin);
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
                            await controller.scrollToIndex(2,
                                preferPosition: AutoScrollPosition.begin);
                          },
                          text: 'Category',
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
                //======================== Navbar End =====================================

                //======================== Page Content Start =====================================
                //TODO Page Content
                Column(
                  children: [
                    FirstWidget(controller),
                    SecondWidget(controller),
                    CategoryWidget(controller),
                    FriendsSection(controller),
                    CareSection(controller),
                  ],
                ),
                //======================== Page Content End =====================================

                //TODO Footer
                footerBuilder(),
              ],
            ),
          ),
        );
      },
    );
  }
}

// TODO Home Section
class FirstWidget extends StatelessWidget {
  final AutoScrollController controller;

  FirstWidget(this.controller);

  @override
  Widget build(BuildContext context) {
    return AutoScrollTag(
      controller: this.controller,
      key: ValueKey(0),
      index: 0,
      child: Container(
        decoration: BoxDecoration(gradient: LinearGradient(colors: gradient)),
        height: 650,
        width: double.maxFinite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Not only people need a house',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, \n sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat,\n sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.\n Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.\n Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy.',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 40,
                ),
                defaultButton(
                  hoverColor: Colors.grey[400],
                  buttonWidth: 350,
                  buttonHeight: 50,
                  backgroundColor: Colors.white,
                  borderColor: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  function: () {
                    navigateTo(context, HelpScreen());
                  },
                  text: 'Help them',
                  textStyle: TextStyle(color: Colors.black, fontSize: 20),
                  isUpperCase: false,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/dog2.png',
                  width: 400,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// TODO About us Section

class SecondWidget extends StatelessWidget {
  final AutoScrollController controller;

  SecondWidget(this.controller);

  @override
  Widget build(BuildContext context) {
    return AutoScrollTag(
      controller: this.controller,
      key: ValueKey(1),
      index: 1,
      child: Container(
        color: Colors.white,
        height: 600,
        width: double.maxFinite,
        child: Stack(
          children: [
            Image.asset('assets/images/dog3.png'),
            Positioned(
              top: 30,
              right: 40,
              child: Image.asset('assets/images/leg.png', width: 400),
            ),
            Positioned(
                top: 60,
                right: 100,
                child: Padding(
                  padding: const EdgeInsets.all(100.0),
                  child: Column(
                    children: [
                      Text(
                        'Not only people need a house',
                        style: TextStyle(
                          color: Colors.brown,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, \n sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat,\n sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.\n Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.\n Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy.',
                        style: TextStyle(color: Colors.brown),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

// TODO Category Section

class CategoryWidget extends StatelessWidget {
  final AutoScrollController controller;

  CategoryWidget(this.controller);

  @override
  Widget build(BuildContext context) {
    return AutoScrollTag(
      controller: this.controller,
      key: ValueKey(2),
      index: 2,
      child: Container(
        color: Colors.grey[150],
        height: 600,
        width: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
                right: MediaQuery.of(context).size.width * 0.4,
                top: MediaQuery.of(context).size.height * 0.1,
                child: Transform.scale(
                  scaleX: -1,
                  child: Image.asset(
                    'assets/images/leg.png',
                  ),
                )),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 100),
                child: Column(
                  children: [
                    Text(
                      'Let\'s get this right',
                      style: TextStyle(
                        fontSize: 40,
                        color: kBrown,
                      ),
                    ),
                    Text(
                      'What kind of friend you looking for?',
                      style: TextStyle(color: kBrown, fontSize: 37),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          child: Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                                color: kOffWhite,
                                border: Border.all(color: kBrown),
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/dogIcon.png',
                                  width: 100,
                                ),
                                Text(
                                  'Dog',
                                  style: TextStyle(
                                    fontSize: 40,
                                    color: kBrown,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          child: Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                                color: kOffWhite,
                                border: Border.all(color: kBrown),
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/cat.png',
                                  width: 100,
                                ),
                                Text(
                                  'Cats',
                                  style: TextStyle(
                                    fontSize: 40,
                                    color: kBrown,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// TODO Our Friends Section

class FriendsSection extends StatelessWidget {
  final AutoScrollController controller;
  var boardController = PageController();

  FriendsSection(this.controller);

  @override
  Widget build(BuildContext context) {
    return AutoScrollTag(
      controller: this.controller,
      key: ValueKey(3),
      index: 3,
      child: Container(
        color: Colors.white,
        height: 1100,
        width: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
                right: MediaQuery.of(context).size.width * 0.4,
                top: MediaQuery.of(context).size.height * 0.1,
                child: Transform.scale(
                  scaleX: -1,
                  child: Image.asset(
                    'assets/images/leg.png',
                  ),
                )),
            Positioned(
              top: 400,
              right: 50,
              child: Center(
                child: defaultButton(
                  backgroundColor: kBrown,
                  borderColor: kBrown,
                  borderRadius: BorderRadius.circular(50),
                  decoration: BoxDecoration(
                    color: kBrown,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  borderWidth: 1,
                  buttonWidth: 50,
                  buttonHeight: 50,
                  text: '>',
                  textStyle: TextStyle(
                    fontSize: 30,
                    color: Colors.white
                  ),
                  function: (){},
                ),
              ),
            ),
            Positioned(
              top: 400,
              left: 50,
              child: Center(
                child: defaultButton(
                  backgroundColor: kBrown,
                  borderColor: kBrown,
                  borderRadius: BorderRadius.circular(50),
                  decoration: BoxDecoration(
                    color: kBrown,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  borderWidth: 1,
                  buttonWidth: 50,
                  buttonHeight: 50,
                  text: '<',
                  textStyle: TextStyle(
                      fontSize: 30,
                      color: Colors.white
                  ),
                  function: (){},
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 100),
                child: Column(
                  children: [
                    Text(
                      'Our friends who\nlooking for a house',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40,
                        color: kBrown,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 550,
                        width: 350,
                        child: PageView.builder(
                          onPageChanged: (int index) {
                            print(index);
                          },
                          physics: const BouncingScrollPhysics(),
                          controller: boardController,
                          itemBuilder: (context, index) =>
                              buildBoardingItem(boards[index]),
                          itemCount: 4,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Positioned(
                      bottom: 10,
                      child: defaultButton(
                        borderRadius: BorderRadius.circular(20),
                        backgroundColor: kBrown,
                        decoration: BoxDecoration(
                          color: kBrown,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        function: (){
                                navigateTo(context, AdaptionScreen());
                        },
                        text: 'Read more',
                        borderColor: kBrown,
                        textStyle: TextStyle(
                          fontSize: 30,
                          color: kWhite,
                        ),


                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CareSection extends StatelessWidget {
  final AutoScrollController controller;
  CareSection(this.controller);

  @override
  Widget build(BuildContext context) {
    return AutoScrollTag(
      controller: this.controller,
      key: ValueKey(4),
      index: 4,
      child: Container(
        color: Colors.grey[200],
        height: 900,
        width: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
                right: MediaQuery.of(context).size.width * 0.4,
                top: MediaQuery.of(context).size.height * 0.1,
                child: Transform.scale(
                  scaleX: -1,
                  child: Image.asset(
                    'assets/images/leg.png',
                  ),
                ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 100),
                child: Column(
                  children: [
                    Text(
                      'How to take care of\nyour friends?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40,
                        color: kBrown,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Image.asset(
                      'assets/images/care1.png',
                      width: 1000,
                    ),
                    Image.asset(
                      'assets/images/care2.png',
                      width: 1000,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
