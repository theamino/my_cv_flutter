import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

abstract class SocialIconEvent {}

class MouseIn extends SocialIconEvent {}

class MouseOut extends SocialIconEvent {}


class SocialIconBloc extends Bloc<SocialIconEvent, Color> {
  SocialIconBloc() : super(Colors.grey) {
    on<MouseIn>((event, emit) => emit(Colors.orange));
    on<MouseOut>((event, emit) => emit(Colors.grey));
  }

}