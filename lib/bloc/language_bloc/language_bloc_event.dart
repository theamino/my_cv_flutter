abstract class LanguageEvent {}

enum Language {
  en,
  fa
}

class InitialState extends LanguageEvent {
  Language initialLanguage = Language.en;
}

class LanguageChange extends LanguageEvent {
  Language currentLanguage;
  LanguageChange({required this.currentLanguage});
}
