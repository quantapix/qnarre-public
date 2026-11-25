















import Proving.USC.T18.Ch73.Reslice.Ontology.Types
import Proving.USC.T18.Ch73.Reslice.Ontology.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch73.Reslice.Ontology

open Proving.USC.Common






inductive OfficialProceedingMembership (p : Proceeding) (c : ComplaintText) : Prop where
  | federalCourtOrGrandJury :
      IsProceedingBeforeFederalCourtOrGrandJury p c → OfficialProceedingMembership p c
  | congress :
      IsProceedingBeforeCongress p c → OfficialProceedingMembership p c
  | authorizedFederalAgency :
      IsProceedingBeforeAuthorizedFederalAgency p c → OfficialProceedingMembership p c
  | insuranceRegulatory :
      IsInsuranceRegulatoryProceedingAffectingCommerce p c → OfficialProceedingMembership p c


abbrev IsOfficialProceeding (p : Proceeding) (c : ComplaintText) : Prop :=
  OfficialProceedingMembership p c




inductive PhysicalForceMembership (f : ForceAct) (c : ComplaintText) : Prop where
  | physicalAction : IsPhysicalActionAgainstAnother f c → PhysicalForceMembership f c
  | confinement    : IsConfinement f c → PhysicalForceMembership f c


abbrev IsPhysicalForce (f : ForceAct) (c : ComplaintText) : Prop :=
  PhysicalForceMembership f c



inductive MisleadingConductMembership (cd : Conduct) (c : ComplaintText) : Prop where
  | falseStatement :
      IsKnowinglyFalseStatement cd c → MisleadingConductMembership cd c
  | omissionOrConcealment :
      IsIntentionalOmissionOrConcealmentCreatingFalseImpression cd c →
      MisleadingConductMembership cd c
  | falseWriting :
      IsKnowingInvitationOfRelianceOnFalseWriting cd c → MisleadingConductMembership cd c
  | misleadingObject :
      IsKnowingInvitationOfRelianceOnMisleadingObject cd c → MisleadingConductMembership cd c
  | trickSchemeOrDevice :
      IsKnowingUseOfTrickSchemeOrDevice cd c → MisleadingConductMembership cd c


abbrev IsMisleadingConduct (cd : Conduct) (c : ComplaintText) : Prop :=
  MisleadingConductMembership cd c



inductive LawEnforcementFunction (p : Person) (c : ComplaintText) : Prop where
  | enforcementAuthority :
      IsAuthorizedToEngageInOrSuperviseOffenseEnforcement p c → LawEnforcementFunction p c
  | probationOrPretrialOfficer :
      IsProbationOrPretrialServicesOfficer p c → LawEnforcementFunction p c



structure LawEnforcementOfficerMembership (p : Person) (c : ComplaintText) : Prop where
  federalStatus : IsFederalOfficerEmployeeOrAuthorizedAgent p c
  function      : LawEnforcementFunction p c



abbrev IsLawEnforcementOfficer (p : Person) (c : ComplaintText) : Prop :=
  LawEnforcementOfficerMembership p c



inductive BodilyInjuryMembership (i : Injury) (c : ComplaintText) : Prop where
  | cutAbrasionBruiseBurnOrDisfigurement :
      IsCutAbrasionBruiseBurnOrDisfigurement i c → BodilyInjuryMembership i c
  | physicalPain : IsPhysicalPain i c → BodilyInjuryMembership i c
  | illness      : IsIllness i c → BodilyInjuryMembership i c
  | impairment   : IsImpairmentOfBodilyOrMentalFunction i c → BodilyInjuryMembership i c
  | otherInjury  : IsOtherInjuryToTheBody i c → BodilyInjuryMembership i c


abbrev IsBodilyInjury (i : Injury) (c : ComplaintText) : Prop :=
  BodilyInjuryMembership i c






structure CorruptlyPersuadesMembership (cd : Conduct) (c : ComplaintText) : Prop where
  persuades              : IsCorruptlyPersuades cd c
  notStatelessMisleading : ¬ WouldBeMisleadingConductButForStateOfMind cd c


abbrev IsCorruptlyPersuadesTerm (cd : Conduct) (c : ComplaintText) : Prop :=
  CorruptlyPersuadesMembership cd c



structure CorruptlyMembership (cd : Conduct) (c : ComplaintText) : Prop where
  corruptly       : IsCorruptlyUnderSection1505 cd c
  improperPurpose : IsImproperPurposeActing cd c



abbrev IsCorruptlyTerm1505 (cd : Conduct) (c : ComplaintText) : Prop :=
  CorruptlyMembership cd c





structure LawfulRepresentationCarveOut
    (cd : Conduct) (p : Proceeding) (c : ComplaintText) : Prop where
  services   : IsLawfulBonaFideLegalRepresentationService cd c
  nexus      : IsInConnectionWithOrAnticipationOfProceeding cd p c
  proceeding : IsOfficialProceeding p c





structure Section1512a2TermUse
    (f : ForceAct) (p : Proceeding) (c : ComplaintText) : Prop where
  forceTerm : PhysicalForceMembership f c
  forumTerm : IsOfficialProceeding p c




structure Section1512bTermUse
    (cd : Conduct) (p : Proceeding) (c : ComplaintText) : Prop where
  conductTerm : CorruptlyPersuadesMembership cd c ∨ MisleadingConductMembership cd c
  forumTerm   : IsOfficialProceeding p c




structure Section1512b2ObjectTermUse
    (o : EvidentiaryObject) (p : Proceeding) (c : ComplaintText) : Prop where
  objectTerm : IsRecordDocumentOrOtherObject o c
  forumTerm  : IsOfficialProceeding p c





structure Section1512cTermUse
    (cd : Conduct) (p : Proceeding) (c : ComplaintText) : Prop where
  corruptlyTerm : IsCorruptlyAsUsedInSection1512 cd c
  forumTerm     : IsOfficialProceeding p c




structure Section1512dTermUse
    (p : Proceeding) (r : Person) (c : ComplaintText) : Prop where
  forumTerm     : IsOfficialProceeding p c
  recipientTerm : LawEnforcementOfficerMembership r c ∨ IsJudgeOfTheUnitedStates r c





structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String



structure DefScopeRule where
  term  : String
  rule  : String
  cite  : String



structure DanglingTerm where
  term   : String
  usedAt : String
  note   : String


def edge_officialProceeding_federalForum : DefEdge :=
  { defined := "official proceeding", dependsOn := "judge or court of the United States",
    citeDefine := "18 USC § 1515(a)(1)(A)" }


def edge_officialProceeding_federalAgency : DefEdge :=
  { defined := "official proceeding", dependsOn := "Federal Government agency authorized by law",
    citeDefine := "18 USC § 1515(a)(1)(C)" }


def edge_officialProceeding_businessOfInsurance : DefEdge :=
  { defined := "official proceeding", dependsOn := "business of insurance affecting interstate commerce",
    citeDefine := "18 USC § 1515(a)(1)(D)" }


def edge_physicalForce_confinement : DefEdge :=
  { defined := "physical force", dependsOn := "confinement",
    citeDefine := "18 USC § 1515(a)(2)" }


def edge_misleadingConduct_materialFact : DefEdge :=
  { defined := "misleading conduct", dependsOn := "material fact",
    citeDefine := "18 USC § 1515(a)(3)(B)" }


def edge_misleadingConduct_intentToMislead : DefEdge :=
  { defined := "misleading conduct", dependsOn := "intent to mislead",
    citeDefine := "18 USC § 1515(a)(3)(C)–(E)" }


def edge_lawEnforcementOfficer_offense : DefEdge :=
  { defined := "law enforcement officer", dependsOn := "offense",
    citeDefine := "18 USC § 1515(a)(4)(A)" }


def edge_lawEnforcementOfficer_probationOfficer : DefEdge :=
  { defined := "law enforcement officer", dependsOn := "probation or pretrial services officer",
    citeDefine := "18 USC § 1515(a)(4)(B)" }



def edge_corruptlyPersuades_misleadingConduct : DefEdge :=
  { defined := "corruptly persuades", dependsOn := "misleading conduct",
    citeDefine := "18 USC § 1515(a)(6)" }


def edge_corruptlyPersuades_stateOfMind : DefEdge :=
  { defined := "corruptly persuades", dependsOn := "state of mind",
    citeDefine := "18 USC § 1515(a)(6)" }


def edge_corruptly1505_improperPurpose : DefEdge :=
  { defined := "corruptly (as used in § 1505)", dependsOn := "improper purpose",
    citeDefine := "18 USC § 1515(b)" }


def edge_legalRepresentationCarveOut_officialProceeding : DefEdge :=
  { defined := "lawful, bona fide, legal representation services (carve-out)",
    dependsOn := "official proceeding", citeDefine := "18 USC § 1515(c)" }


def edge_use_s1512a2 : DefEdge :=
  { defined := "18 USC § 1512(a)(2) (using section)",
    dependsOn := "physical force; official proceeding; law enforcement officer; judge of the United States",
    citeDefine := "18 USC § 1515(a)" }


def edge_use_s1512b : DefEdge :=
  { defined := "18 USC § 1512(b) (using section)",
    dependsOn := "corruptly persuades; misleading conduct; official proceeding; law enforcement officer; judge of the United States",
    citeDefine := "18 USC § 1515(a)" }


def edge_use_s1512c : DefEdge :=
  { defined := "18 USC § 1512(c) (using section)",
    dependsOn := "corruptly (UNDEFINED for § 1512); official proceeding; record, document, or other object",
    citeDefine := "18 USC § 1515(a)" }


def edge_use_s1512d : DefEdge :=
  { defined := "18 USC § 1512(d) (using section)",
    dependsOn := "official proceeding; law enforcement officer; judge of the United States",
    citeDefine := "18 USC § 1515(a)" }


def scope_officialProceeding_pendencyImmaterial : DefScopeRule :=
  { term := "official proceeding",
    rule := "need not be pending or about to be instituted at the time of the offense",
    cite := "18 USC § 1512(f)(1)" }



def scope_object_admissibilityImmaterial : DefScopeRule :=
  { term := "the testimony, or the record, document, or other object",
    rule := "need not be admissible in evidence or free of a claim of privilege",
    cite := "18 USC § 1512(f)(2)" }



def scope_officialProceeding_noMensReaAsToFederalCharacter : DefScopeRule :=
  { term := "official proceeding",
    rule := "no state of mind need be proved as to the forum's federal character",
    cite := "18 USC § 1512(g)(1)" }


def scope_lawEnforcementOfficer_noMensReaAsToFederalCharacter : DefScopeRule :=
  { term := "law enforcement officer; judge of the United States",
    rule := "no state of mind need be proved as to the federal character of the officer or judge",
    cite := "18 USC § 1512(g)(2)" }


def dangling_corruptly_s1512 : DanglingTerm :=
  { term := "corruptly",
    usedAt := "18 USC § 1512(c)",
    note := "§ 1515(b) defines the term only 'as used in section 1505'; § 1515(a) does not define it. No definition reaches § 1512(c) within this slice." }


def dangling_judgeOfTheUnitedStates : DanglingTerm :=
  { term := "judge of the United States",
    usedAt := "18 USC § 1512(a)(1)(C), (a)(2)(C), (b)(3), (d)(2)",
    note := "Undefined in §§ 1512/1515; the general definition lies outside this slice." }


def dangling_recordDocumentOrOtherObject : DanglingTerm :=
  { term := "record, document, or other object",
    usedAt := "18 USC § 1512(a)(1)(B), (a)(2)(B), (b)(2), (c)(1), (f)(2)",
    note := "Used pervasively and expressly qualified by § 1512(f)(2), yet never defined." }


def dangling_intimidationThreatHarassment : DanglingTerm :=
  { term := "intimidation; threatens; intentionally harasses",
    usedAt := "18 USC § 1512(b), (d)",
    note := "Sit beside the DEFINED conduct terms in the same sentence yet receive no § 1515 definition." }


def dangling_federalOffense : DanglingTerm :=
  { term := "Federal offense",
    usedAt := "18 USC § 1512(a)(1)(C), (b)(3), (d)(2), (d)(3)",
    note := "Undefined in §§ 1512/1515; § 1515(a)(4)(A)'s bare 'offense' is likewise undefined." }


def dangling_bodilyInjury_unusedInSlice : DanglingTerm :=
  { term := "bodily injury",
    usedAt := "(not used in § 1512 or § 1515 as enacted)",
    note := "Defined at § 1515(a)(5) for §§ 1512/1513/1515, but the enacted text of § 1512 and § 1515 never uses it — its only use-site (§ 1513) lies outside this slice. An orphan definition, not a dangling use." }

end Proving.USC.T18.Ch73.Reslice.Ontology
