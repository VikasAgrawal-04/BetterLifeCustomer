enum ApplicantRelation {
  self,
  spouse,
  son,
  daughter,
  father,
  mother,
  brother,
  sister,
  other
}

// generate extension method for checking if the enum value is other
extension ApplicantRelationExt on ApplicantRelation {
  bool get isOther => this == ApplicantRelation.other;
  bool get isSelf => this == ApplicantRelation.self;
  bool get isSpouse => this == ApplicantRelation.spouse;
  bool get isSon => this == ApplicantRelation.son;
  bool get isDaughter => this == ApplicantRelation.daughter;
  bool get isFather => this == ApplicantRelation.father;
  bool get isMother => this == ApplicantRelation.mother;
  bool get isBrother => this == ApplicantRelation.brother;
  bool get isSister => this == ApplicantRelation.sister;
}
