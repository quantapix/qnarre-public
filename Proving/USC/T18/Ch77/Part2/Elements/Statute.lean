import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch77.Part2.Elements.Types
import Proving.USC.T18.Ch77.Part2.Elements.Predicates

set_option autoImplicit false


























namespace Proving.USC.T18.Ch77.Part2.Elements

open Proving.USC.Common






structure SeriousHarm1591e5 (hm : Harm) (v : Person) (c : ComplaintText) : Prop where
  harm : IsHarmPhysicalOrNonphysical hm c
  sufficiency : SufficientToCompelReasonablePersonSimilarlySituated hm v c



inductive SeriousHarmOrRestraint1591e2 (hm : Harm) (v : Person) (c : ComplaintText) : Prop where
  | seriousHarm (h : SeriousHarm1591e5 hm v c)
  | physicalRestraint (h : PhysicalRestraintAgainstPerson v c)






structure AbuseOfLegalProcess1591e1 (m : CoerciveMeans) (v : Person) (c : ComplaintText) : Prop where
  useOfProcess : UsesOrThreatensUseOfLawOrLegalProcess m c
  notDesignedPurpose : ForPurposeLawWasNotDesigned m c
  pressure : ExertsPressureToCauseActionOrInaction m v c





structure Coercion1591e2A (m : CoerciveMeans) (hm : Harm) (v : Person) (c : ComplaintText) : Prop where
  threat : ThreatensConsequenceAgainstPerson m v c
  consequence : SeriousHarmOrRestraint1591e2 hm v c




structure Coercion1591e2B (m : CoerciveMeans) (hm : Harm) (v : Person) (c : ComplaintText) : Prop where
  scheme : IsSchemePlanOrPattern m c
  intent : IntendedToCauseBeliefFailureToPerformCausesConsequence m v c
  consequence : SeriousHarmOrRestraint1591e2 hm v c


inductive Coercion1591e2 (m : CoerciveMeans) (hm : Harm) (v : Person) (c : ComplaintText) : Prop where
  | threatsOfSeriousHarm (h : Coercion1591e2A m hm v c)
  | schemePlanOrPattern (h : Coercion1591e2B m hm v c)
  | abuseOfLegalProcess (h : AbuseOfLegalProcess1591e1 m v c)




inductive ProhibitedMeans1591 (m : CoerciveMeans) (hm : Harm) (v : Person) (c : ComplaintText) : Prop where
  | force (h : UsesForce m c)
  | threatsOfForce (h : UsesThreatsOfForce m c)
  | fraud (h : UsesFraud m c)
  | coercion (h : Coercion1591e2 m hm v c)





structure CommercialSexAct1591e3 (s : SexAct) (c : ComplaintText) : Prop where
  sexAct : IsSexAct s c
  consideration : AnythingOfValueGivenOrReceivedForAct s c





structure Venture1591e6 (ven : Venture) (c : ComplaintText) : Prop where
  twoOrMore : 2 ≤ individualsAssociatedInVenture ven c
  associatedInFact : IndividualsAssociatedInFact ven c



structure ParticipationInVenture1591e4 (p : Person) (ven : Venture) (c : ComplaintText) : Prop where
  conduct : AssistsSupportsOrFacilitatesViolation p ven c
  knowledge : KnowsVentureViolatesParagraphOne p ven c






inductive JurisdictionalNexus1591a1 (a : TraffickingAct) (c : ComplaintText) : Prop where
  | commerce (h : InOrAffectingInterstateOrForeignCommerce a c)
  | maritimeOrTerritorial (h : WithinSpecialMaritimeAndTerritorialJurisdiction a c)


structure Section1591a1 (p : Person) (v : Person) (a : TraffickingAct) (c : ComplaintText) : Prop where
  knowingly : ActedWithScienter p c
  jurisdiction : JurisdictionalNexus1591a1 a c
  act : PerformsEnumeratedTraffickingAct p v a c



structure Section1591a2 (p : Person) (ven : Venture) (c : ComplaintText) : Prop where
  knowingly : ActedWithScienter p c
  benefit : ReceivesBenefitOfValue p ven c
  participation : ParticipationInVenture1591e4 p ven c
  venture : Venture1591e6 ven c
  venturePredicateAct : VentureEngagedInParagraphOneAct ven c


inductive TraffickingConduct1591a (p : Person) (v : Person) (a : TraffickingAct)
    (ven : Venture) (c : ComplaintText) : Prop where
  | direct (h : Section1591a1 p v a c)
  | beneficiary (h : Section1591a2 p ven c)






inductive CulpableMentalState1591a (p : Person) (a : TraffickingAct) (c : ComplaintText) : Prop where
  | knowing (h : KnowsAggravatingFact p c)
  | recklessDisregard (h : RecklesslyDisregardsAggravatingFact p c)
      (hNotAdvertising : ¬ TraffickingActIsAdvertising a c)




inductive MinorityMensRea1591 (p : Person) (v : Person) (a : TraffickingAct)
    (c : ComplaintText) : Prop where
  | proven (h : CulpableMentalState1591a p a c)
  | relievedByObservation (hProsecution : ProsecutedUnderParagraphOne p c)
      (hOpportunity : ReasonableOpportunityToObserve p v c)


structure MeansTheory1591a (p : Person) (v : Person) (a : TraffickingAct)
    (m : CoerciveMeans) (hm : Harm) (s : SexAct) (c : ComplaintText) : Prop where
  means : ProhibitedMeans1591 m hm v c
  causation : MeansWillBeUsedToCauseCommercialSexAct v m s c
  commerciality : CommercialSexAct1591e3 s c
  mentalState : CulpableMentalState1591a p a c



structure MinorityTheory1591a (p : Person) (v : Person) (a : TraffickingAct)
    (s : SexAct) (c : ComplaintText) : Prop where
  underEighteen : victimAgeYearsAtOffense v c < 18
  causation : WillBeCausedToEngageInCommercialSexAct v s c
  commerciality : CommercialSexAct1591e3 s c
  mentalState : MinorityMensRea1591 p v a c


inductive AggravatingFact1591a (p : Person) (v : Person) (a : TraffickingAct)
    (ven : Venture) (m : CoerciveMeans) (hm : Harm) (s : SexAct) (c : ComplaintText) : Prop where
  | byMeans (h : MeansTheory1591a p v a m hm s c)
  | byMinority (h : MinorityTheory1591a p v a s c)



structure Section1591a (p : Person) (v : Person) (a : TraffickingAct) (ven : Venture)
    (m : CoerciveMeans) (hm : Harm) (s : SexAct) (c : ComplaintText) : Prop where
  conduct : TraffickingConduct1591a p v a ven c
  aggravatingFact : AggravatingFact1591a p v a ven m hm s c





inductive EnhancedPenaltyFact1591b1 (p : Person) (v : Person) (m : CoerciveMeans)
    (c : ComplaintText) : Prop where
  | effectedByMeans (h : OffenseEffectedByProhibitedMeans p v m c)
  | underFourteen (h : victimAgeYearsAtOffense v c < 14)


structure Section1591b1 (p : Person) (v : Person) (a : TraffickingAct) (ven : Venture)
    (m : CoerciveMeans) (hm : Harm) (s : SexAct) (c : ComplaintText) : Prop where
  offense : Section1591a p v a ven m hm s c
  trigger : EnhancedPenaltyFact1591b1 p v m c




structure Section1591b2 (p : Person) (v : Person) (a : TraffickingAct) (ven : Venture)
    (m : CoerciveMeans) (hm : Harm) (s : SexAct) (c : ComplaintText) : Prop where
  offense : Section1591a p v a ven m hm s c
  notEffectedByMeans : ¬ OffenseEffectedByProhibitedMeans p v m c
  atLeastFourteen : 14 ≤ victimAgeYearsAtOffense v c
  underEighteen : victimAgeYearsAtOffense v c < 18




inductive PenaltyTier1591b (p : Person) (v : Person) (a : TraffickingAct) (ven : Venture)
    (m : CoerciveMeans) (hm : Harm) (s : SexAct) (c : ComplaintText) : Prop where
  | tierOne (h : Section1591b1 p v a ven m hm s c)
  | tierTwo (h : Section1591b2 p v a ven m hm s c)





inductive ObstructionConduct1591d (p : Person) (o : ObstructiveAct) (c : ComplaintText) : Prop where
  | obstructs (h : ObstructsEnforcement p o c)
  | attempts (h : AttemptsToObstructEnforcement p o c)
  | interferesOrPrevents (h : InterferesWithOrPreventsEnforcement p o c)


structure Section1591d (p : Person) (o : ObstructiveAct) (c : ComplaintText) : Prop where
  conduct : ObstructionConduct1591d p o c
  targetIsThisSection : EnforcementOfThisSection o c




abbrev IsSeriousHarm (hm : Harm) (v : Person) (c : ComplaintText) : Prop :=
  SeriousHarm1591e5 hm v c


abbrev IsCoercion (m : CoerciveMeans) (hm : Harm) (v : Person) (c : ComplaintText) : Prop :=
  Coercion1591e2 m hm v c



abbrev IsAbuseOfLegalProcess (m : CoerciveMeans) (v : Person) (c : ComplaintText) : Prop :=
  AbuseOfLegalProcess1591e1 m v c


abbrev IsCommercialSexAct (s : SexAct) (c : ComplaintText) : Prop :=
  CommercialSexAct1591e3 s c


abbrev IsVenture (ven : Venture) (c : ComplaintText) : Prop :=
  Venture1591e6 ven c


abbrev IsParticipationInVenture (p : Person) (ven : Venture) (c : ComplaintText) : Prop :=
  ParticipationInVenture1591e4 p ven c


abbrev IsProhibitedMeans (m : CoerciveMeans) (hm : Harm) (v : Person) (c : ComplaintText) : Prop :=
  ProhibitedMeans1591 m hm v c

end Proving.USC.T18.Ch77.Part2.Elements
