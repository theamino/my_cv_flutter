

import 'package:bloc/bloc.dart';
import 'package:my_cv_project/bloc/url_launch_bloc/url_launch_event.dart';
import 'package:my_cv_project/bloc/url_launch_bloc/url_launch_state.dart';
import 'package:my_cv_project/repository/repository.dart';

class UrlLaunchBloc extends Bloc<UrlLaunchEvent, UrlLaunchState> {

  final Repository repository;

  UrlLaunchBloc({required this.repository}) : super(InitialState()) {
    on<NewTabOpenEvent>((event, emit) => repository.launchUrl(event.urlToLoad));
  }
}