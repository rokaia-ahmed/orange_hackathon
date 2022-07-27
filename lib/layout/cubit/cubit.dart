import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_orange/layout/cubit/states.dart';
import '../../modules/Request/request_screen.dart';


class PagesLayout extends Cubit<PagesStates> {
  PagesLayout() : super(PagesInitialStates());

  static PagesLayout get(context) => BlocProvider.of(context);



  
}