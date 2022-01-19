import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:my_cv_project/bloc/language_bloc/language_bloc_event.dart';
import 'package:my_cv_project/bloc/language_bloc/language_bloc_state.dart';
import 'package:my_cv_project/repository/repository.dart';


class LanguageBloc extends Bloc<LanguageEvent, LanguageBlocState> {

  final Repository repository;

  LanguageBloc({required this.repository}) : super(EnglishState(person_name: 'Mohammad Amin Aghababaei', field: 'Mobile Application Developer', resume: 'Download Resume', contact_me: 'Contact Me')) {
    on<LanguageChange>((event, emit) {
      emit((event as LanguageChange).currentLanguage == Language.fa ?FarsiState(person_name: 'محمدامین آقابابایی', field: 'توسعه دهنده اپلیکیشن های موبایل', resume: 'دانلود رزومه', contact_me: 'ارتباط با من') :
      EnglishState(person_name: 'Mohammad Amin Aghababaei', field: 'Mobile Application Developer', resume: 'Download Resume', contact_me: 'Contact Me')
      );
    });
  }
}