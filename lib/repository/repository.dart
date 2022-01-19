
import 'package:my_cv_project/network/network_service.dart';

class Repository {

  final NetworkService networkService;

  Repository({required this.networkService});

  launchUrl(String url) {
    networkService.launchURL(url);
  }


}