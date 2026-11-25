import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch77.Part5.Elements.Types
import Proving.USC.T18.Ch77.Part5.Elements.Predicates

set_option autoImplicit false









namespace Proving.USC.T18.Ch77.Part5.Elements

open Proving.USC.Common





inductive TraffickingConduct1591a1 (d : Person) (act : TraffickingAct) (v : Person)
    (c : ComplaintText) : Prop where
  | recruits    (h : Recruits d act v c)
  | entices     (h : Entices d act v c)
  | harbors     (h : Harbors d act v c)
  | transports  (h : Transports d act v c)
  | provides    (h : Provides d act v c)
  | obtains     (h : Obtains d act v c)
  | advertises  (h : Advertises d act v c)
  | maintains   (h : Maintains d act v c)
  | patronizes  (h : Patronizes d act v c)
  | solicits    (h : Solicits d act v c)



abbrev PerformsTraffickingAct (d : Person) (act : TraffickingAct) (v : Person)
    (c : ComplaintText) : Prop :=
  TraffickingConduct1591a1 d act v c





inductive CommerceOrMaritimeNexus (act : TraffickingAct) (c : ComplaintText) : Prop where
  | commerce (h : InOrAffectingInterstateOrForeignCommerce act c)
  | maritime (h : WithinSpecialMaritimeAndTerritorialJurisdiction act c)


abbrev HasFederalJurisdictionalNexus (act : TraffickingAct) (c : ComplaintText) : Prop :=
  CommerceOrMaritimeNexus act c




inductive Coercion1591e2 (v : Person) (c : ComplaintText) : Prop where
  | threats (h : ThreatsOfSeriousHarmOrPhysicalRestraint v c)
  | scheme  (h : SchemeCausingBeliefOfSeriousHarmOrRestraint v c)
  | process (h : AbuseOrThreatenedAbuseOfLawOrLegalProcess v c)


abbrev IsCoercion (v : Person) (c : ComplaintText) : Prop := Coercion1591e2 v c





structure CommercialSexAct1591e3 (sx : SexAct) (c : ComplaintText) : Prop where
  sexAct : IsSexAct sx c
  value  : AnythingOfValueGivenOrReceived sx c


abbrev IsCommercialSexAct (sx : SexAct) (c : ComplaintText) : Prop :=
  CommercialSexAct1591e3 sx c





structure Venture1591e6 (ven : Venture) (c : ComplaintText) : Prop where
  group      : GroupOfTwoOrMoreIndividuals ven c
  associated : AssociatedInFact ven c


abbrev IsVenture (ven : Venture) (c : ComplaintText) : Prop := Venture1591e6 ven c





inductive ProhibitedMeans1591 (d : Person) (v : Person) (c : ComplaintText) : Prop where
  | force    (h : MeansOfForce d v c)
  | threats  (h : MeansOfThreatsOfForce d v c)
  | fraud    (h : MeansOfFraud d v c)
  | coercion (h : IsCoercion v c)


def UnderAge18 (v : Person) (c : ComplaintText) : Prop := ageOfPersonAtOffense v c < 18


def UnderAge14 (v : Person) (c : ComplaintText) : Prop := ageOfPersonAtOffense v c < 14


def AtLeast14AndUnder18 (v : Person) (c : ComplaintText) : Prop :=
  14 ≤ ageOfPersonAtOffense v c ∧ ageOfPersonAtOffense v c < 18



structure MeansRoute1591a (d : Person) (v : Person) (sx : SexAct) (c : ComplaintText) : Prop where
  means      : ProhibitedMeans1591 d v c
  commercial : IsCommercialSexAct sx c
  caused     : WillBeCausedToEngageInSexAct v sx c



structure MinorityRoute1591a (v : Person) (sx : SexAct) (c : ComplaintText) : Prop where
  minor      : UnderAge18 v c
  commercial : IsCommercialSexAct sx c
  caused     : WillBeCausedToEngageInSexAct v sx c




inductive CircumstanceEstablished1591a (d : Person) (act : TraffickingAct) (v : Person)
    (sx : SexAct) (c : ComplaintText) : Prop where
  | knowingMeans
      (hk : KnowsOfProhibitedCircumstance d v c)
      (h : MeansRoute1591a d v sx c)
  | recklessMeans
      (hr : RecklesslyDisregardsProhibitedCircumstance d v c)
      (hna : ¬ ViolatingActIsAdvertising act c)
      (h : MeansRoute1591a d v sx c)
  | knowingMinority
      (hk : KnowsOfProhibitedCircumstance d v c)
      (h : MinorityRoute1591a v sx c)
  | recklessMinority
      (hr : RecklesslyDisregardsProhibitedCircumstance d v c)
      (hna : ¬ ViolatingActIsAdvertising act c)
      (h : MinorityRoute1591a v sx c)




inductive CircumstanceEstablished1591a1 (d : Person) (act : TraffickingAct) (v : Person)
    (sx : SexAct) (c : ComplaintText) : Prop where
  | general (h : CircumstanceEstablished1591a d act v sx c)
  | observedMinority
      (hObs : HadReasonableOpportunityToObservePerson d v c)
      (h : MinorityRoute1591a v sx c)




structure Section1591a1 (d : Person) (act : TraffickingAct) (v : Person) (sx : SexAct)
    (c : ComplaintText) : Prop where
  knowingly    : ActedWithScienter d c
  conduct      : PerformsTraffickingAct d act v c
  nexus        : HasFederalJurisdictionalNexus act c
  circumstance : CircumstanceEstablished1591a1 d act v sx c


structure Section1591a2 (d : Person) (ven : Venture) (act : TraffickingAct) (v : Person)
    (sx : SexAct) (c : ComplaintText) : Prop where
  knowingly        : ActedWithScienter d c
  benefit          : BenefitsFinanciallyOrReceivesAnythingOfValue d ven c
  participation    : ParticipatesInVenture d ven c
  venture          : IsVenture ven c
  ventureViolation : VentureEngagedInAct1591a1 ven act c
  circumstance     : CircumstanceEstablished1591a d act v sx c


inductive Violation1591a (d : Person) (ven : Venture) (act : TraffickingAct) (v : Person)
    (sx : SexAct) (c : ComplaintText) : Prop where
  | conductRoute (h : Section1591a1 d act v sx c)
  | benefitRoute (h : Section1591a2 d ven act v sx c)





inductive PenaltyTier1591b1 (d : Person) (ven : Venture) (act : TraffickingAct) (v : Person)
    (sx : SexAct) (c : ComplaintText) : Prop where
  | byMeans (hv : Violation1591a d ven act v sx c) (h : OffenseEffectedByProhibitedMeans d v c)
  | underFourteen (hv : Violation1591a d ven act v sx c) (h : UnderAge14 v c)



structure PenaltyTier1591b2 (d : Person) (ven : Venture) (act : TraffickingAct) (v : Person)
    (sx : SexAct) (c : ComplaintText) : Prop where
  violation   : Violation1591a d ven act v sx c
  notEffected : ¬ OffenseEffectedByProhibitedMeans d v c
  ageBand     : AtLeast14AndUnder18 v c





inductive ObstructiveConduct1591d (d : Person) (oa : ObstructiveAct) (c : ComplaintText) : Prop where
  | obstructs  (h : ObstructsEnforcement d oa c)
  | attempts   (h : AttemptsToObstructEnforcement d oa c)
  | interferes (h : InterferesWithOrPreventsEnforcement d oa c)


abbrev ObstructsEnforcementOfSection1591 (d : Person) (oa : ObstructiveAct)
    (c : ComplaintText) : Prop :=
  ObstructiveConduct1591d d oa c


structure Section1591d (d : Person) (oa : ObstructiveAct) (c : ComplaintText) : Prop where
  conduct : ObstructsEnforcementOfSection1591 d oa c

end Proving.USC.T18.Ch77.Part5.Elements
