import 'package:universal_html/html.dart';
import 'package:url_launcher/url_launcher.dart';

class NetworkService {


  launchURL(var url) async {
    if (await canLaunch(url)) {
      await launch(url, enableJavaScript: true);
    } else {
      throw 'Could not launch $url';
    }
  }
}