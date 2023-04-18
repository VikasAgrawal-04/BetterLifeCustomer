import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum Language {
  english,
  hindi,
  konkani,
  marathi,
  kannada,
  malayalam,
  other,
}

extension LanguageExt on Language {
  bool get isOther => this == Language.other;
  bool get isEnglish => this == Language.english;
  bool get isHindi => this == Language.hindi;
  bool get isKonkani => this == Language.konkani;
  bool get isMarathi => this == Language.marathi;
  bool get isKannada => this == Language.kannada;
  bool get isMalayalam => this == Language.malayalam;
}
