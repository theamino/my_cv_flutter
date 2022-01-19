abstract class LanguageBlocState {
  late final String person_name;
  late final String field;
  late final String resume;
  late final String contact_me;

  LanguageBlocState(this.person_name, this.field, this.resume, this.contact_me);
}

class FarsiState extends LanguageBlocState {
  FarsiState({required String person_name
    , required String field
    , required String resume
    , required String contact_me}) 
      : super(person_name, field, resume, contact_me);
  
}

class EnglishState extends LanguageBlocState {
  EnglishState({required String person_name
    , required String field
    , required String resume
    , required String contact_me}) 
      : super(person_name, field, resume, contact_me);
}