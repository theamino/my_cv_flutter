abstract class UrlLaunchEvent {}

class NewTabOpenEvent extends UrlLaunchEvent {
  final String urlToLoad;

  NewTabOpenEvent(this.urlToLoad);
}