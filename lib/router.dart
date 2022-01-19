
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_cv_project/bloc/url_launch_bloc.dart';
import 'package:my_cv_project/constants.dart';
import 'package:my_cv_project/network/network_service.dart';
import 'package:my_cv_project/pages/cv_widget.dart';
import 'package:my_cv_project/repository/repository.dart';

import 'bloc/LanguageBloc.dart';

class AppRouter {

  Route? generateRoute(RouteSettings routeSettings) {
    Repository repository = Repository(networkService: NetworkService());

    switch (routeSettings.name) {
      case DEFAULT_ROUTE:
        return MaterialPageRoute(builder: (_) =>
            MultiBlocProvider(providers: [
              BlocProvider(
                  create: (context) => LanguageBloc(repository: repository)
              ) ,
              BlocProvider(
                create: (context) => UrlLaunchBloc(repository: repository),
              )
            ], child: Scaffold(
                body: CVWidget()
            ))
        );
      default:
        return null;
    }
  }
}