










import Proving.USC.Common.Types
import Proving.USC.T18.Ch77.Reslice.Ontology.Types
import Proving.USC.T18.Ch77.Reslice.Ontology.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Reslice.Ontology

open Proving.USC.Common




inductive EdgeBasis where

  | definiens


  | termContainment

  | operativeUse
  deriving Repr, DecidableEq



structure DefEdge where

  defined    : String

  dependsOn  : String

  citeDefine : String


  citeTarget : String

  basis      : EdgeBasis
  deriving Repr



def edge_coercion_dependsOn_abuseOfLegalProcess : DefEdge :=
  { defined := "coercion", dependsOn := "abuse or threatened abuse of law or legal process",
    citeDefine := "18 USC § 1591(e)(2)", citeTarget := "18 USC § 1591(e)(1)",
    basis := EdgeBasis.definiens }


def edge_coercion_dependsOn_seriousHarm : DefEdge :=
  { defined := "coercion", dependsOn := "serious harm",
    citeDefine := "18 USC § 1591(e)(2)", citeTarget := "18 USC § 1591(e)(5)",
    basis := EdgeBasis.definiens }




def edge_seriousHarm_dependsOn_commercialSexualActivity : DefEdge :=
  { defined := "serious harm", dependsOn := "commercial sexual activity",
    citeDefine := "18 USC § 1591(e)(5)", citeTarget := "",
    basis := EdgeBasis.definiens }



def edge_participation_dependsOn_violation1591a1 : DefEdge :=
  { defined := "participation in a venture", dependsOn := "violation of section 1591(a)(1)",
    citeDefine := "18 USC § 1591(e)(4)", citeTarget := "18 USC § 1591(a)(1)",
    basis := EdgeBasis.definiens }



def edge_participation_dependsOn_venture : DefEdge :=
  { defined := "participation in a venture", dependsOn := "venture",
    citeDefine := "18 USC § 1591(e)(4)", citeTarget := "18 USC § 1591(e)(6)",
    basis := EdgeBasis.termContainment }


def edge_s1591a_uses_coercion : DefEdge :=
  { defined := "18 USC § 1591(a)", dependsOn := "coercion",
    citeDefine := "18 USC § 1591(a)", citeTarget := "18 USC § 1591(e)(2)",
    basis := EdgeBasis.operativeUse }


def edge_s1591a_uses_commercialSexAct : DefEdge :=
  { defined := "18 USC § 1591(a)", dependsOn := "commercial sex act",
    citeDefine := "18 USC § 1591(a)", citeTarget := "18 USC § 1591(e)(3)",
    basis := EdgeBasis.operativeUse }


def edge_s1591a2_uses_participation : DefEdge :=
  { defined := "18 USC § 1591(a)(2)", dependsOn := "participation in a venture",
    citeDefine := "18 USC § 1591(a)(2)", citeTarget := "18 USC § 1591(e)(4)",
    basis := EdgeBasis.operativeUse }


def edge_s1591a2_uses_venture : DefEdge :=
  { defined := "18 USC § 1591(a)(2)", dependsOn := "venture",
    citeDefine := "18 USC § 1591(a)(2)", citeTarget := "18 USC § 1591(e)(6)",
    basis := EdgeBasis.operativeUse }



def edge_s1591a1_uses_smtj : DefEdge :=
  { defined := "18 USC § 1591(a)(1)",
    dependsOn := "special maritime and territorial jurisdiction of the United States",
    citeDefine := "18 USC § 1591(a)(1)", citeTarget := "",
    basis := EdgeBasis.operativeUse }


def edge_s1590a_uses_laborOrServices : DefEdge :=
  { defined := "18 USC § 1590(a)", dependsOn := "labor or services",
    citeDefine := "18 USC § 1590(a)", citeTarget := "",
    basis := EdgeBasis.operativeUse }



def edge_s1590a_uses_chapterViolation : DefEdge :=
  { defined := "18 USC § 1590(a)", dependsOn := "violation of 18 U.S.C. ch. 77",
    citeDefine := "18 USC § 1590(a)", citeTarget := "",
    basis := EdgeBasis.operativeUse }




def edge_s1592_uses_severeFormOfTrafficking : DefEdge :=
  { defined := "18 USC § 1592", dependsOn := "severe form of trafficking in persons",
    citeDefine := "18 USC § 1592(a)(3)", citeTarget := "22 USC § 7102",
    basis := EdgeBasis.operativeUse }


def edge_s1592a3_uses_laborOrServices : DefEdge :=
  { defined := "18 USC § 1592(a)(3)", dependsOn := "labor or services",
    citeDefine := "18 USC § 1592(a)(3)", citeTarget := "",
    basis := EdgeBasis.operativeUse }


def defDag : List DefEdge :=
  [ edge_coercion_dependsOn_abuseOfLegalProcess,
    edge_coercion_dependsOn_seriousHarm,
    edge_seriousHarm_dependsOn_commercialSexualActivity,
    edge_participation_dependsOn_violation1591a1,
    edge_participation_dependsOn_venture,
    edge_s1591a_uses_coercion,
    edge_s1591a_uses_commercialSexAct,
    edge_s1591a2_uses_participation,
    edge_s1591a2_uses_venture,
    edge_s1591a1_uses_smtj,
    edge_s1590a_uses_laborOrServices,
    edge_s1590a_uses_chapterViolation,
    edge_s1592_uses_severeFormOfTrafficking,
    edge_s1592a3_uses_laborOrServices ]


structure DanglingTerm where

  term      : String

  citeUse   : String


  citeDefinedElsewhere : String
  deriving Repr


def danglingTerms : List DanglingTerm :=
  [ { term := "commercial sexual activity", citeUse := "18 USC § 1591(e)(5)",
      citeDefinedElsewhere := "" },
    { term := "special maritime and territorial jurisdiction of the United States",
      citeUse := "18 USC § 1591(a)(1)", citeDefinedElsewhere := "18 USC § 7" },
    { term := "labor or services", citeUse := "18 USC § 1590(a)",
      citeDefinedElsewhere := "" },
    { term := "peonage, slavery, involuntary servitude, or forced labor",
      citeUse := "18 USC § 1590 (heading)", citeDefinedElsewhere := "" },
    { term := "severe form of trafficking in persons", citeUse := "18 USC § 1592(a)(3)",
      citeDefinedElsewhere := "22 USC § 7102" },
    { term := "passport or other immigration document", citeUse := "18 USC § 1592(a)",
      citeDefinedElsewhere := "" },
    { term := "government identification document", citeUse := "18 USC § 1592(a)",
      citeDefinedElsewhere := "" },
    { term := "force", citeUse := "18 USC § 1591(a)", citeDefinedElsewhere := "" },
    { term := "fraud", citeUse := "18 USC § 1591(a)", citeDefinedElsewhere := "" },
    { term := "sex act", citeUse := "18 USC § 1591(e)(3)", citeDefinedElsewhere := "" } ]






structure AbuseOfLegalProcessMembership
    (u : LegalProcessUse) (p : Person) (c : ComplaintText) : Prop where
  abuse : IsAbuseOrThreatenedAbuseOfLawOrLegalProcess u c
  useOfLegalProcess : IsUseOrThreatenedUseOfLawOrLegalProcess u c
  purposeNotDesigned : ForPurposeForWhichLawNotDesigned u c
  pressureToAct : ExertsPressureToCauseActionOrInaction u p c



inductive CoercionMembership (m : CoerciveMeans) (c : ComplaintText) : Prop where

  | threatOfSeriousHarm (h : Harm)
      (serious : IsSeriousHarm h c) (threat : ThreatensSeriousHarm m h c)

  | threatOfPhysicalRestraint (p : Person)
      (threat : ThreatensPhysicalRestraint m p c)

  | schemeCausingBeliefOfSeriousHarm (h : Harm)
      (serious : IsSeriousHarm h c) (scheme : IsSchemeCausingBeliefOfSeriousHarm m h c)

  | schemeCausingBeliefOfPhysicalRestraint (p : Person)
      (scheme : IsSchemeCausingBeliefOfPhysicalRestraint m p c)

  | abuseOfLegalProcess (u : LegalProcessUse)
      (abuse : IsAbuseOrThreatenedAbuseOfLawOrLegalProcess u c)
      (isMeans : EmployedAsCoerciveMeans u m c)




structure CoercionTerm (m : CoerciveMeans) (c : ComplaintText) : Prop where
  coercion : IsCoercion m c
  case : CoercionMembership m c



structure CommercialSexActMembership (s : SexAct) (c : ComplaintText) : Prop where
  commercialSexAct : IsCommercialSexAct s c
  sexAct : IsSexAct s c
  valueExchanged : AnythingOfValueGivenOrReceivedOnAccountOfAct s c




structure VentureMembership (v : Venture) (c : ComplaintText) : Prop where
  venture : IsVenture v c
  twoOrMoreIndividuals : IsGroupOfTwoOrMoreIndividuals v c
  associatedInFact : IsAssociatedInFact v c





structure ParticipationInAVentureMembership
    (a : Assistance) (v : Venture) (c : ComplaintText) : Prop where
  participation : IsParticipationInAVenture a c
  ventureTerm : VentureMembership v c
  knowingAssistance : KnowinglyAssistsSupportsOrFacilitates a v c
  targetViolation : IsViolationOfSection1591a1 v c





structure SeriousHarmMembership (h : Harm) (p : Person) (c : ComplaintText) : Prop where
  seriousHarm : IsSeriousHarm h c
  harm : IsHarmPhysicalOrNonphysical h c
  sufficientlySerious : IsSufficientlySeriousUnderAllCircumstances h c
  compels : CompelsReasonablePersonToPerformCommercialSexualActivity h p c



inductive DocumentKind (d : IdentificationDocument) (c : ComplaintText) : Prop where
  | passportOrImmigration (h : IsPassportOrOtherImmigrationDocument d c)
  | governmentIdentification (h : IsGovernmentIdentificationDocument d c)



structure IdentificationDocumentMembership
    (d : IdentificationDocument) (p : Person) (c : ComplaintText) : Prop where
  kind : DocumentKind d c
  actualOrPurported : IsActualOrPurportedDocument d c
  ofAnotherPerson : IsDocumentOfAnotherPerson d p c




structure Section1590aTermInventory
    (p : Person) (l : LaborOrServices) (c : ComplaintText) : Prop where
  personObtained : IsPersonRecruitedHarboredTransportedProvidedOrObtained p c
  laborOrServices : IsLaborOrServices l c
  chapterPredicate : IsChapter77Violation c




structure Section1590AggravatedClass
    (p : Person) (l : LaborOrServices) (c : ComplaintText) : Prop where
  base : Section1590aTermInventory p l c
  aggravator : IsSection1590AggravatedViolationClass c



structure Section1591aTermInventory
    (p : Person) (s : SexAct) (c : ComplaintText) : Prop where
  person : IsPersonRecruitedEnticedHarboredOrSolicited p c
  commercialSexAct : CommercialSexActMembership s c
  jurisdictionalTerm : AffectsInterstateOrForeignCommerceOrIsWithinSMTJ c




inductive Section1591VictimOrMeansClass
    (p : Person) (m : CoerciveMeans) (c : ComplaintText) : Prop where
  | byForceOrThreatOfForce (h : UsesForceOrThreatOfForce m c)
  | byFraud (h : UsesFraud m c)
  | byCoercion (h : CoercionTerm m c)
  | byMinority (h : HasNotAttainedAge18 p c)




inductive Section1591bAgeGradingClass (p : Person) (c : ComplaintText) : Prop where
  | underFourteen (h : HasNotAttainedAge14 p c)
  | fourteenThroughSeventeen
      (atLeast14 : ¬ HasNotAttainedAge14 p c) (under18 : HasNotAttainedAge18 p c)



inductive Section1592aNexus
    (d : IdentificationDocument) (p : Person) (c : ComplaintText) : Prop where

  | inCourseOfEnumeratedViolation (h : IsInCourseOfEnumeratedChapter77Violation c)

  | withIntentToViolate (h : HasIntentToViolateEnumeratedChapter77Section c)


  | toRestrictLibertyOfTraffickingVictim
      (restrict : RestrictsLibertyToMoveOrTravel d p c)
      (noAuthority : WithoutLawfulAuthority c)
      (maintain : InOrderToMaintainLaborOrServices p c)
      (victim : IsVictimOfSevereFormOfTraffickingInPersons p c)


structure Section1592aTermInventory
    (d : IdentificationDocument) (p : Person) (c : ComplaintText) : Prop where
  document : IdentificationDocumentMembership d p c
  nexus : Section1592aNexus d p c







structure Section1592bVictimExemptionClass (p : Person) (c : ComplaintText) : Prop where
  victim : IsVictimOfSevereFormOfTraffickingInPersons p c
  conductIncidental : IsConductCausedByOrIncidentToTrafficking p c




inductive EnforcementObstructionMembership (a : ObstructiveAct) (c : ComplaintText) : Prop where
  | obstructs (h : ObstructsEnforcement a c)
  | attemptsToObstruct (h : AttemptsToObstructEnforcement a c)
  | interferesWith (h : InterferesWithEnforcement a c)
  | prevents (h : PreventsEnforcement a c)

end Proving.USC.T18.Ch77.Reslice.Ontology
