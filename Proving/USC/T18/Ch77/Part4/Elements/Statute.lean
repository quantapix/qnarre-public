import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch77.Part4.Elements.Types
import Proving.USC.T18.Ch77.Part4.Elements.Predicates

set_option autoImplicit false















namespace Proving.USC.T18.Ch77.Part4.Elements

open Proving.USC.Common






structure AbuseOfLegalProcess1591e1 (d : Person) (v : Person) (c : ComplaintText) : Prop where
  usesProcess : UsesOrThreatensLegalProcess d v c
  purposeNotDesigned : UsesLegalProcessForPurposeNotDesigned d v c
  toExertPressure : ExertsPressureToCauseOrPreventAction d v c



abbrev AbuseOrThreatenedAbuseOfLawOrLegalProcess
    (d : Person) (v : Person) (c : ComplaintText) : Prop :=
  AbuseOfLegalProcess1591e1 d v c







structure SeriousHarm1591e5 (v : Person) (c : ComplaintText) : Prop where
  harm : HarmThreatenedOrInflicted v c
  compelsReasonablePerson : SufficientlySeriousToCompelReasonablePerson v c






inductive Coercion1591e2 (d : Person) (v : Person) (c : ComplaintText) : Prop where

  | threatsOfSeriousHarm
      (h : ThreatensSeriousHarmToAnyPerson d v c) (hs : SeriousHarm1591e5 v c)

  | physicalRestraint (h : ThreatensOrUsesPhysicalRestraint d v c)


  | schemePlanOrPattern
      (h : EmploysSchemeCausingBeliefOfSeriousHarm d v c) (hs : SeriousHarm1591e5 v c)

  | abuseOfLegalProcess (h : AbuseOrThreatenedAbuseOfLawOrLegalProcess d v c)


abbrev IsCoercion (d : Person) (v : Person) (c : ComplaintText) : Prop :=
  Coercion1591e2 d v c






inductive MeansOfCompulsion1591 (d : Person) (v : Person) (c : ComplaintText) : Prop where
  | force (h : UsesForce d v c)
  | threatsOfForce (h : ThreatensForce d v c)
  | fraud (h : UsesFraud d v c)
  | coercion (h : IsCoercion d v c)






structure Venture1591e6 (ven : Venture) (c : ComplaintText) : Prop where
  twoOrMoreIndividuals : 2 ≤ ventureMemberCount ven c
  associatedInFact : MembersAssociatedInFact ven c


abbrev IsVenture (ven : Venture) (c : ComplaintText) : Prop := Venture1591e6 ven c




abbrev VictimUnderEighteen (v : Person) (c : ComplaintText) : Prop :=
  victimAgeYearsAtOffense v c < 18


abbrev VictimUnderFourteen (v : Person) (c : ComplaintText) : Prop :=
  victimAgeYearsAtOffense v c < 14



abbrev VictimAtLeastFourteenAndUnderEighteen (v : Person) (c : ComplaintText) : Prop :=
  14 ≤ victimAgeYearsAtOffense v c ∧ victimAgeYearsAtOffense v c < 18





inductive JurisdictionalNexus1591a1 (act : TraffickingAct) (c : ComplaintText) : Prop where
  | commerce (h : InOrAffectingInterstateOrForeignCommerce act c)
  | maritimeTerritorial (h : WithinSpecialMaritimeAndTerritorialJurisdiction act c)



structure ParagraphOneConduct
    (d : Person) (act : TraffickingAct) (v : Person) (c : ComplaintText) : Prop where
  jurisdiction : JurisdictionalNexus1591a1 act c
  traffickingAct : PerformsProhibitedTraffickingAct d act v c





structure ParagraphTwoConduct
    (d : Person) (ven : Venture) (act : TraffickingAct) (c : ComplaintText) : Prop where
  benefit : BenefitsFinanciallyOrReceivesValue d ven c
  venture : IsVenture ven c
  participation : ParticipatesInVenture d ven c
  venturePredicateAct : VentureEngagedInParagraphOneAct ven act c


inductive Conduct1591a
    (d : Person) (ven : Venture) (act : TraffickingAct) (v : Person)
    (c : ComplaintText) : Prop where
  | paragraphOne (h : ParagraphOneConduct d act v c)
  | paragraphTwo (h : ParagraphTwoConduct d ven act c)







inductive MensReaAsToMeans
    (d : Person) (act : TraffickingAct) (v : Person) (c : ComplaintText) : Prop where
  | knowing (h : KnowsMeansWillBeUsed d v c)
  | reckless
      (h : RecklesslyDisregardsMeansWillBeUsed d v c)
      (hNotAdvertising : ¬ ViolationActIsAdvertising act c)






inductive MensReaAsToAge
    (d : Person) (act : TraffickingAct) (v : Person) (c : ComplaintText) : Prop where
  | knowing
      (hUnder18 : VictimUnderEighteen v c)
      (hCaused : WillBeCausedToEngageInCommercialSexAct v c)
      (h : KnowsVictimUnderageAndWillBeCaused d v c)
  | reckless
      (hUnder18 : VictimUnderEighteen v c)
      (hCaused : WillBeCausedToEngageInCommercialSexAct v c)
      (h : RecklesslyDisregardsVictimUnderageAndWillBeCaused d v c)
      (hNotAdvertising : ¬ ViolationActIsAdvertising act c)


  | reasonableOpportunityToObserve
      (hUnder18 : VictimUnderEighteen v c)
      (hCaused : WillBeCausedToEngageInCommercialSexAct v c)
      (hConduct : ParagraphOneConduct d act v c)
      (h : HadReasonableOpportunityToObserve d v c)


inductive MensRea1591a
    (d : Person) (act : TraffickingAct) (v : Person) (c : ComplaintText) : Prop where
  | means (h : MensReaAsToMeans d act v c)
  | age (h : MensReaAsToAge d act v c)







structure Section1591a
    (d : Person) (ven : Venture) (act : TraffickingAct) (v : Person)
    (c : ComplaintText) : Prop where
  knowingly : ActedWithScienter d c
  conduct : Conduct1591a d ven act v c
  mensRea : MensRea1591a d act v c





structure EffectedByMeans1591b1 (d : Person) (v : Person) (c : ComplaintText) : Prop where
  means : MeansOfCompulsion1591 d v c
  effected : OffenseEffectedByThoseMeans d v c


inductive Aggravator1591b1
    (d : Person) (act : TraffickingAct) (v : Person) (c : ComplaintText) : Prop where
  | effectedByMeans (h : EffectedByMeans1591b1 d v c)
  | victimUnderFourteen
      (hAge : VictimUnderFourteen v c)
      (hSubject : VictimSubjectOfEnumeratedActUnderSubsectionB d act v c)



structure Section1591b1
    (d : Person) (ven : Venture) (act : TraffickingAct) (v : Person)
    (c : ComplaintText) : Prop where
  offense : Section1591a d ven act v c
  aggravator : Aggravator1591b1 d act v c





structure Section1591b2
    (d : Person) (ven : Venture) (act : TraffickingAct) (v : Person)
    (c : ComplaintText) : Prop where
  offense : Section1591a d ven act v c
  notSoEffected : ¬ EffectedByMeans1591b1 d v c
  ageBand : VictimAtLeastFourteenAndUnderEighteen v c
  subjectOfEnumeratedAct : VictimSubjectOfEnumeratedActUnderSubsectionB d act v c




inductive ObstructiveConduct1591d
    (d : Person) (oact : ObstructionAct) (c : ComplaintText) : Prop where
  | obstructs (h : ObstructsEnforcement d oact c)
  | attemptsToObstruct (h : AttemptsToObstructEnforcement d oact c)
  | interferesOrPrevents (h : InterferesWithOrPreventsEnforcement d oact c)



structure Section1591d
    (d : Person) (oact : ObstructionAct) (c : ComplaintText) : Prop where
  conduct : ObstructiveConduct1591d d oact c
  targetsSection1591 : TargetsEnforcementOfSection1591 oact c

end Proving.USC.T18.Ch77.Part4.Elements
