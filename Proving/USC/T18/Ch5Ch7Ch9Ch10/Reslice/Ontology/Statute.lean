











import Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Ontology.Types
import Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Ontology.Predicates

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Ontology

open Proving.USC.Common





structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String
deriving Repr





structure DanglingTerm where
  term      : String
  usedIn    : String
  definedAt : String
deriving Repr


def defEdges : List DefEdge :=
  [
    { defined := "substantial bodily injury",
      dependsOn := "temporary but substantial disfigurement",
      citeDefine := "18 USC § 113(b)(1)(A)" },
    { defined := "substantial bodily injury",
      dependsOn := "temporary but substantial loss or impairment of bodily function",
      citeDefine := "18 USC § 113(b)(1)(B)" },
    { defined := "serious bodily injury", dependsOn := "18 USC § 1365 definition",
      citeDefine := "18 USC § 113(b)(2)" },
    { defined := "dating partner", dependsOn := "18 USC § 2266 definition",
      citeDefine := "18 USC § 113(b)(3)" },
    { defined := "spouse or intimate partner", dependsOn := "18 USC § 2266 definition",
      citeDefine := "18 USC § 113(b)(3)" },
    { defined := "strangling", dependsOn := "intentionally, knowingly, or recklessly",
      citeDefine := "18 USC § 113(b)(4)" },
    { defined := "suffocating", dependsOn := "intentionally, knowingly, or recklessly",
      citeDefine := "18 USC § 113(b)(5)" },
    { defined := "immediate family member", dependsOn := "spouse, parent, sibling, child, in loco parentis",
      citeDefine := "18 USC § 115(c)(2)(A)" },
    { defined := "immediate family member", dependsOn := "household member related by blood or marriage",
      citeDefine := "18 USC § 115(c)(2)(B)" },
    { defined := "female genital mutilation", dependsOn := "performed for non-medical reasons",
      citeDefine := "18 USC § 116(e)" },
    { defined := "female genital mutilation",
      dependsOn := "removal of or injury to the external female genitalia",
      citeDefine := "18 USC § 116(e)" },
    { defined := "female genital mutilation", dependsOn := "clitoridectomy",
      citeDefine := "18 USC § 116(e)(1)" },
    { defined := "female genital mutilation", dependsOn := "excision of the labia",
      citeDefine := "18 USC § 116(e)(2)" },
    { defined := "female genital mutilation", dependsOn := "infibulation",
      citeDefine := "18 USC § 116(e)(3)" },
    { defined := "female genital mutilation", dependsOn := "other harmful genital procedure",
      citeDefine := "18 USC § 116(e)(4)" },
    { defined := "domestic assault", dependsOn := "assault",
      citeDefine := "18 USC § 117(b)" },
    { defined := "domestic assault", dependsOn := "domestic relation to victim",
      citeDefine := "18 USC § 117(b)" },
    { defined := "restricted personal information", dependsOn := "enumerated personal data item",
      citeDefine := "18 USC § 119(b)(1)" },
    { defined := "restricted personal information", dependsOn := "identifiable to that individual",
      citeDefine := "18 USC § 119(b)(1)" },
    { defined := "covered person", dependsOn := "individual designated in section 1114",
      citeDefine := "18 USC § 119(b)(2)(A)" },
    { defined := "covered person", dependsOn := "court officer, juror, or witness",
      citeDefine := "18 USC § 119(b)(2)(B)" },
    { defined := "covered person", dependsOn := "federal investigation informant or witness",
      citeDefine := "18 USC § 119(b)(2)(C)" },
    { defined := "covered person", dependsOn := "state or local officer assisting a federal investigation",
      citeDefine := "18 USC § 119(b)(2)(D)" },
    { defined := "crime of violence", dependsOn := "18 USC § 16 definition",
      citeDefine := "18 USC § 119(b)(3)" },

    { defined := "immediate family (§ 119)", dependsOn := "immediate family member (§ 115(c)(2))",
      citeDefine := "18 USC § 119(b)(4)" },

    { defined := "debtor", dependsOn := "petition filed under title 11",
      citeDefine := "18 USC § 151" },
    { defined := "estate of a debtor", dependsOn := "debtor",
      citeDefine := "18 USC § 152(1)" },
    { defined := "property belonging to the estate", dependsOn := "estate of a debtor",
      citeDefine := "18 USC § 152(1)" },
    { defined := "person described in § 153(b)", dependsOn := "access to estate property or documents",
      citeDefine := "18 USC § 153(b)" },
    { defined := "person described in § 153(b)", dependsOn := "participation in the administration of the estate",
      citeDefine := "18 USC § 153(b)" },
    { defined := "party in interest", dependsOn := "debtor",
      citeDefine := "18 USC § 155" },
    { defined := "party in interest", dependsOn := "creditor",
      citeDefine := "18 USC § 155" },
    { defined := "party in interest", dependsOn := "receiver",
      citeDefine := "18 USC § 155" },
    { defined := "party in interest", dependsOn := "trustee",
      citeDefine := "18 USC § 155" },
    { defined := "party in interest", dependsOn := "attorney for a party in interest",
      citeDefine := "18 USC § 155" },
    { defined := "bankruptcy petition preparer", dependsOn := "document for filing",
      citeDefine := "18 USC § 156(a)(1)" },
    { defined := "bankruptcy petition preparer", dependsOn := "debtor's attorney or employee thereof",
      citeDefine := "18 USC § 156(a)(1)" },
    { defined := "document for filing", dependsOn := "debtor",
      citeDefine := "18 USC § 156(a)(2)" },
    { defined := "document for filing", dependsOn := "case under title 11",
      citeDefine := "18 USC § 156(a)(2)" },

    { defined := "biological agent", dependsOn := "microorganism or infectious substance",
      citeDefine := "18 USC § 178(1)" },
    { defined := "biological agent", dependsOn := "capable of causing biological harm",
      citeDefine := "18 USC § 178(1)(A)-(C)" },
    { defined := "toxin", dependsOn := "toxic material or product",
      citeDefine := "18 USC § 178(2)" },
    { defined := "toxin", dependsOn := "biological or synthesized origin",
      citeDefine := "18 USC § 178(2)" },
    { defined := "delivery system", dependsOn := "biological agent",
      citeDefine := "18 USC § 178(3)(A)" },
    { defined := "delivery system", dependsOn := "toxin",
      citeDefine := "18 USC § 178(3)(A)" },
    { defined := "delivery system", dependsOn := "vector",
      citeDefine := "18 USC § 178(3)(B)" },
    { defined := "vector", dependsOn := "biological agent",
      citeDefine := "18 USC § 178(4)" },
    { defined := "vector", dependsOn := "toxin",
      citeDefine := "18 USC § 178(4)" },
    { defined := "national of the United States", dependsOn := "8 USC § 1101(a)(22) definition",
      citeDefine := "18 USC § 178(5)" },
    { defined := "for use as a weapon", dependsOn := "peaceful purpose",
      citeDefine := "18 USC § 175(c)" },
    { defined := "select agent", dependsOn := "biological agent",
      citeDefine := "18 USC § 175b(d)(1)" },
    { defined := "select agent", dependsOn := "toxin",
      citeDefine := "18 USC § 175b(d)(1)" },
    { defined := "select agent", dependsOn := "naturally occurring, unextracted agent or toxin",
      citeDefine := "18 USC § 175b(d)(1)" },
    { defined := "select agent", dependsOn := "listed select biological agent or toxin (42 CFR pt. 73)",
      citeDefine := "18 USC § 175b(a)(2)(A)" },
    { defined := "restricted person", dependsOn := "under indictment for a felony",
      citeDefine := "18 USC § 175b(d)(2)(A)" },
    { defined := "restricted person", dependsOn := "convicted of a felony",
      citeDefine := "18 USC § 175b(d)(2)(B)" },
    { defined := "restricted person", dependsOn := "fugitive from justice",
      citeDefine := "18 USC § 175b(d)(2)(C)" },
    { defined := "restricted person", dependsOn := "unlawful user of a controlled substance",
      citeDefine := "18 USC § 175b(d)(2)(D)" },
    { defined := "restricted person", dependsOn := "alien unlawfully in the United States",
      citeDefine := "18 USC § 175b(d)(2)(E)" },
    { defined := "restricted person", dependsOn := "adjudicated mental defective or committed",
      citeDefine := "18 USC § 175b(d)(2)(F)" },
    { defined := "restricted person", dependsOn := "national of a terrorism-supporting country",
      citeDefine := "18 USC § 175b(d)(2)(G)" },
    { defined := "restricted person", dependsOn := "dishonorably discharged",
      citeDefine := "18 USC § 175b(d)(2)(H)" },
    { defined := "restricted person", dependsOn := "affiliated with a terrorist organization",
      citeDefine := "18 USC § 175b(d)(2)(I)" },
    { defined := "restricted person", dependsOn := "alien",
      citeDefine := "18 USC § 175b(d)(3)" },
    { defined := "restricted person", dependsOn := "lawfully admitted for permanent residence",
      citeDefine := "18 USC § 175b(d)(4)" },
    { defined := "restricted person", dependsOn := "terrorist organization",
      citeDefine := "18 USC § 175b(d)(2)(I)" },
    { defined := "variola virus", dependsOn := "causes human smallpox",
      citeDefine := "18 USC § 175c(d)" },
    { defined := "variola virus", dependsOn := "variola gene-sequence derivative",
      citeDefine := "18 USC § 175c(d)" } ]


def danglingTerms : List DanglingTerm :=
  [ { term := "person designated in section 1114", usedIn := "18 USC §§ 111(a), 115(a)(1), 119(b)(2)(A)",
      definedAt := "18 USC § 1114" },
    { term := "foreign government", usedIn := "18 USC § 112", definedAt := "18 USC § 1116(b)" },
    { term := "foreign official", usedIn := "18 USC § 112", definedAt := "18 USC § 1116(b)" },
    { term := "internationally protected person", usedIn := "18 USC § 112", definedAt := "18 USC § 1116(b)" },
    { term := "international organization", usedIn := "18 USC § 112", definedAt := "18 USC § 1116(b)" },
    { term := "official guest", usedIn := "18 USC § 112", definedAt := "18 USC § 1116(b)" },
    { term := "national of the United States", usedIn := "18 USC §§ 112, 175, 175c, 178",
      definedAt := "18 USC § 1116(b); 8 USC § 1101(a)(22)" },
    { term := "special maritime and territorial jurisdiction of the United States",
      usedIn := "18 USC §§ 113, 114, 116(d)(6), 117, 118", definedAt := "18 USC § 7" },
    { term := "serious bodily injury", usedIn := "18 USC §§ 113(a)(6), 113(b)(2), 115(b)(1)(B)(iv)",
      definedAt := "18 USC § 1365" },
    { term := "dating partner", usedIn := "18 USC § 113", definedAt := "18 USC § 2266" },
    { term := "spouse or intimate partner", usedIn := "18 USC §§ 113, 117", definedAt := "18 USC § 2266" },
    { term := "torture", usedIn := "18 USC § 114", definedAt := "18 USC § 2340" },
    { term := "Indian country", usedIn := "18 USC § 117(a)", definedAt := "18 USC § 1151" },
    { term := "Federal law enforcement agent", usedIn := "18 USC § 118", definedAt := "undefined" },
    { term := "protective functions", usedIn := "18 USC § 118", definedAt := "22 USC §§ 2709, 4802" },
    { term := "crime of violence", usedIn := "18 USC § 119(b)(3)", definedAt := "18 USC § 16" },
    { term := "assault", usedIn := "18 USC §§ 111, 113, 115, 117", definedAt := "undefined" },
    { term := "case under title 11", usedIn := "18 USC §§ 151-157", definedAt := "title 11 (outside slice)" },
    { term := "estate of a debtor", usedIn := "18 USC §§ 152, 153", definedAt := "11 USC § 541" },
    { term := "United States Trustee", usedIn := "18 USC §§ 152, 154", definedAt := "28 USC § 581" },
    { term := "creditor", usedIn := "18 USC §§ 152(1), 155", definedAt := "11 USC § 101(10)" },
    { term := "scheme or artifice to defraud", usedIn := "18 USC § 157", definedAt := "undefined" },
    { term := "section 382 of title 10", usedIn := "18 USC § 175a",
      definedAt := "editorially flagged References-in-Text cross-reference" },
    { term := "controlled substance", usedIn := "18 USC § 175b(d)(2)(D)", definedAt := "21 USC § 802" },
    { term := "alien", usedIn := "18 USC § 175b", definedAt := "8 USC § 1101(a)(3)" },
    { term := "lawfully admitted for permanent residence", usedIn := "18 USC § 175b",
      definedAt := "8 USC § 1101(a)(20)" },
    { term := "terrorist organization", usedIn := "18 USC § 175b(d)(2)(I)",
      definedAt := "8 USC § 1182(a)(3)(B)(vi)" },
    { term := "section 6(j) of the Export Administration Act of 1979",
      usedIn := "18 USC § 175b(d)(2)(G)(i)",
      definedAt := "editorially flagged References-in-Text cross-reference" },
    { term := "select biological agent or toxin listing", usedIn := "18 USC § 175b(a)(2)",
      definedAt := "42 CFR pt. 73; 42 USC § 262a" } ]





inductive SubstantialBodilyInjuryMembership (i : Injury) (c : ComplaintText) : Prop where
  | disfigurement (h : IsTemporaryButSubstantialDisfigurement i c) :
      SubstantialBodilyInjuryMembership i c
  | lossOfFunction (h : IsTemporaryButSubstantialLossOfBodilyFunction i c) :
      SubstantialBodilyInjuryMembership i c


structure StranglingMembership (x : Conduct) (c : ComplaintText) : Prop where
  mensRea : IsIntentionalKnowingOrReckless x c
  manner  : ImpedesBreathingOrCirculationByThroatPressure x c


structure SuffocatingMembership (x : Conduct) (c : ComplaintText) : Prop where
  mensRea : IsIntentionalKnowingOrReckless x c
  manner  : ImpedesBreathingByCoveringMouthOrNose x c


inductive ImmediateFamilyMembership (p q : Person) (c : ComplaintText) : Prop where
  | closeRelative (h : IsSpouseParentSiblingChildOrInLocoParentis p q c) :
      ImmediateFamilyMembership p q c
  | householdRelative (h : IsHouseholdMemberRelatedByBloodOrMarriage p q c) :
      ImmediateFamilyMembership p q c



structure ImmediateFamilyAlias119 (p q : Person) (c : ComplaintText) : Prop where
  perSection115 : IsImmediateFamilyMemberOf p q c




inductive ProtectedFederalOfficialClass (p : Person) (c : ComplaintText) : Prop where
  | usOfficial (h : IsUnitedStatesOfficial p c) : ProtectedFederalOfficialClass p c
  | usJudge (h : IsUnitedStatesJudge p c) : ProtectedFederalOfficialClass p c
  | lawEnforcement (h : IsFederalLawEnforcementOfficer p c) : ProtectedFederalOfficialClass p c
  | section1114 (h : IsPersonDesignatedInSection1114 p c) : ProtectedFederalOfficialClass p c



structure FemaleGenitalMutilationMembership (pr : Procedure) (c : ComplaintText) : Prop where
  nonMedical : IsPerformedForNonMedicalReasons pr c
  anatomical : IsRemovalOfOrInjuryToExternalFemaleGenitalia pr c


inductive FgmEnumeratedForm (pr : Procedure) (c : ComplaintText) : Prop where
  | clitoridectomy (h : IsClitoridectomy pr c) : FgmEnumeratedForm pr c
  | labialExcision (h : IsExcisionOfLabia pr c) : FgmEnumeratedForm pr c
  | infibulation (h : IsInfibulation pr c) : FgmEnumeratedForm pr c
  | otherHarmful (h : IsOtherHarmfulGenitalProcedure pr c) : FgmEnumeratedForm pr c



inductive MedicalExceptionCase (pr : Procedure) (p : Person) (c : ComplaintText) : Prop where
  | healthNecessity (hOp : IsMedicallyNecessaryOperation pr c)
      (hLic : IsLicensedMedicalPractitioner p c) : MedicalExceptionCase pr p c
  | childbirth (hOp : IsChildbirthRelatedOperation pr c)
      (hLic : IsLicensedMedicalPractitioner p c) : MedicalExceptionCase pr p c



structure DomesticAssaultMembership (x : Conduct) (p q : Person) (c : ComplaintText) : Prop where
  assault  : IsAssault x c
  relation : IsDomesticRelationToVictim p q c



structure RestrictedPersonalInformationMembership
    (i : Information) (p : Person) (c : ComplaintText) : Prop where
  dataItem     : IsEnumeratedPersonalDataItem i c
  identifiable : IsIdentifiableToIndividual i p c


inductive CoveredPersonMembership (p : Person) (c : ComplaintText) : Prop where
  | designated1114 (h : IsPersonDesignatedInSection1114 p c) : CoveredPersonMembership p c
  | courtOfficer (h : IsCourtOfficerJurorOrWitness p c) : CoveredPersonMembership p c
  | informant (h : IsFederalInvestigationInformantOrWitness p c) : CoveredPersonMembership p c
  | stateOrLocal (h : IsStateOrLocalOfficerAssistingFederalInvestigation p c) :
      CoveredPersonMembership p c





structure DebtorMembership (p : Person) (d : Document) (c : ComplaintText) : Prop where
  petition : IsPetitionFiledUnderTitle11 d c
  concerns : PetitionConcernsPerson d p c


structure EstateAdministrationInsiderMembership
    (p : Person) (e : Estate) (c : ComplaintText) : Prop where
  access        : HasAccessToEstatePropertyOrDocuments p e c
  participation : ParticipatesInEstateAdministration p e c




inductive PartyInInterestMembership (p : Person) (c : ComplaintText) : Prop where
  | debtor (h : IsDebtor p c) : PartyInInterestMembership p c
  | creditor (h : IsCreditor p c) : PartyInInterestMembership p c
  | receiver (h : IsReceiver p c) : PartyInInterestMembership p c
  | trustee (h : IsCourtOfficerCustodianOrTrustee p c) : PartyInInterestMembership p c
  | attorney (q : Person) (h : IsAttorneyForPartyInInterest p q c) :
      PartyInInterestMembership p c


structure DocumentForFilingMembership
    (d : Document) (k : BankruptcyCase) (c : ComplaintText) : Prop where
  byDebtor  : IsPreparedForFilingByDebtor d c
  inCourt   : IsFiledInUnitedStatesBankruptcyOrDistrictCourt d c
  caseNexus : IsCaseUnderTitle11 k c




structure BankruptcyPetitionPreparerMembership
    (p : Person) (d : Document) (c : ComplaintText) : Prop where
  prepares   : PreparesDocumentForCompensation p d c
  target     : IsDocumentForFiling d c
  notCounsel : ¬ IsDebtorsAttorneyOrEmployee p c




structure BiologicalAgentMembership (a : Agent) (c : ComplaintText) : Prop where
  genus      : IsMicroorganismOrInfectiousSubstance a c
  capability : IsCapableOfCausingBiologicalHarm a c


structure ToxinMembership (t : Toxin) (c : ComplaintText) : Prop where
  toxicity : IsToxicMaterialOrProduct t c
  origin   : IsBiologicalOrSynthesizedOrigin t c



inductive DeliverySystemMembership (ds : DeliverySystem) (c : ComplaintText) : Prop where
  | designedApparatus (h : IsApparatusDesignedToDisseminate ds c) :
      DeliverySystemMembership ds c
  | vectorForm (h : IsVectorDeliverySystem ds c) : DeliverySystemMembership ds c


structure VectorMembership (v : Vector) (c : ComplaintText) : Prop where
  substrate : IsLivingOrganismOrMolecule v c
  carriage  : IsCapableOfCarryingAgentOrToxinToHost v c




structure SelectAgentMembership (a : Agent) (c : ComplaintText) : Prop where
  base       : IsBiologicalAgent a c
  listed     : IsListedSelectBiologicalAgentOrToxin a c
  notExempt  : ¬ IsExcludedOrExemptedUnderPart73 a c
  notNatural : ¬ IsNaturallyOccurringUnextracted a c


inductive RestrictedPersonMembership (p : Person) (c : ComplaintText) : Prop where
  | underIndictment (h : IsUnderIndictmentForFelony p c) : RestrictedPersonMembership p c
  | convicted (h : IsConvictedOfFelony p c) : RestrictedPersonMembership p c
  | fugitive (h : IsFugitiveFromJustice p c) : RestrictedPersonMembership p c
  | drugUser (h : IsUnlawfulUserOfControlledSubstance p c) : RestrictedPersonMembership p c
  | unlawfulAlien (h : IsAlienUnlawfullyInTheUnitedStates p c) : RestrictedPersonMembership p c
  | mentalAdjudication (h : IsAdjudicatedMentalDefectiveOrCommitted p c) :
      RestrictedPersonMembership p c
  | designatedCountryNational (hAlien : IsAlien p c)
      (hNotLpr : ¬ IsLawfullyAdmittedForPermanentResidence p c)
      (h : IsNationalOfTerrorismSupportingCountry p c) : RestrictedPersonMembership p c
  | dishonorableDischarge (h : IsDishonorablyDischarged p c) : RestrictedPersonMembership p c
  | terroristAffiliation (h : IsAffiliatedWithTerroristOrganization p c) :
      RestrictedPersonMembership p c



inductive VariolaVirusMembership (v : Virus) (c : ComplaintText) : Prop where
  | smallpoxCausing (h : CausesHumanSmallpox v c) : VariolaVirusMembership v c
  | sequenceDerivative (h : IsVariolaGeneSequenceDerivative v c) : VariolaVirusMembership v c




structure ForUseAsAWeaponMembership
    (x : Conduct) (pu : Purpose) (c : ComplaintText) : Prop where
  conduct    : IsForUseAsAWeapon x c
  notPeaceful : ¬ IsPeacefulPurpose pu c



structure PeacefulPurposeDefence (a : Agent) (pu : Purpose) (c : ComplaintText) : Prop where
  peaceful   : IsPeacefulPurpose pu c
  proportion : IsReasonableTypeAndQuantityForPurpose a pu c

end Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Ontology
