








import Proving.USC.T18.Ch77TailCompletion.Elements.Predicates
import Proving.USC.Common.Predicates

namespace Proving.USC.T18.Ch77TailCompletion.Elements

open Proving.USC.Common




structure Section1583Kidnap (p v : Person) (c : ComplaintText) : Prop where
  conduct : KidnapsOrCarriesAway p v c
  intent  : IntentToHoldOrSellAsSlave p c


structure Section1583Entice (p v : Person) (c : ComplaintText) : Prop where
  conduct : EnticesToVesselOrPlace p v c
  intent  : IntentToMakeHeldOrSentAbroadAsSlave p c


inductive Section1583 (p v : Person) (c : ComplaintText) : Prop where
  | kidnap   (h : Section1583Kidnap p v c)
  | entice   (h : Section1583Entice p v c)
  | obstruct (h : ObstructsEnforcement p c)




inductive Section1584Act (p v : Person) (c : ComplaintText) : Prop where
  | holds  (h : HoldsToInvoluntaryServitude p v c)
  | sells  (h : SellsIntoInvoluntaryServitude p v c)
  | brings (h : BringsHeldPersonIntoUS p v c)


structure Section1584 (p v : Person) (c : ComplaintText) : Prop where
  scienter : ActedWithScienter p c
  act      : Section1584Act p v c


inductive Section1584Liability (p v : Person) (c : ComplaintText) : Prop where
  | substantive (h : Section1584 p v c)
  | obstruct    (h : ObstructsEnforcement p c)





structure Section1593Restitution (d v : Person) (c : ComplaintText) : Prop where
  offense : OffenseUnderChapter d c
  victim  : IsChapterVictim v c
  losses  : LossesAttributableToOffense v c





structure Section1593A (p : Person) (e : Entity) (c : ComplaintText) : Prop where
  benefits : KnowinglyBenefitsFromVenture p c
  venture  : VentureViolatedChapter e c
  scienter : KnewOrRecklessDisregardOfVentureViolation p c




structure Section1594Attempt (p : Person) (c : ComplaintText) : Prop where
  intent : IntentToCommitChapterOffense p c
  step   : SubstantialStepTaken p c
  target : TargetsCoveredChapterOffense c


structure Section1594Conspiracy (p : Person) (ag : Agreement) (c : ComplaintText) : Prop where
  agreement : AgreementAmongTwoOrMore ag c
  intent    : IntentToCommitChapterOffense p c
  target    : TargetsCoveredChapterOffense c


inductive Section1594 (p : Person) (ag : Agreement) (c : ComplaintText) : Prop where
  | attempt    (h : Section1594Attempt p c)
  | conspiracy (h : Section1594Conspiracy p ag c)





structure Chapter77CivilStanding (v : Person) (c : ComplaintText) : Prop where
  victim       : IsChapterVictim v c
  injury       : InjuredByViolation v c
  causation    : ProximateCause v c
  limitations  : WithinLimitationsPeriod1595 v c
  federalNexus : FederalJurisdictionalNexus c



structure Section1595Beneficiary (p : Person) (e : Entity) (c : ComplaintText) : Prop where
  benefits : KnowinglyBenefitsFromVenture p c
  venture  : VentureViolatedChapter e c
  scienter : KnewOrShouldHaveKnownOfViolation p c


inductive Section1595Liability (p : Person) (e : Entity) (c : ComplaintText) : Prop where
  | perpetrator (h : DefendantPerpetratedViolation p c)
  | beneficiary (h : Section1595Beneficiary p e c)


structure ValidChapter77CivilClaim (v p : Person) (e : Entity) (c : ComplaintText) : Prop where
  standing  : Chapter77CivilStanding v c
  liability : Section1595Liability p e c


structure Section1595dParensPatriae (p : Person) (c : ComplaintText) : Prop where
  stateAG      : IsStateAttorneyGeneral p c
  belief       : ReasonToBelieveResidentsAffected p c
  target1591   : TargetsSection1591Violation c
  federalNexus : FederalJurisdictionalNexus c





structure Section1595AInjunction (p : Person) (c : ComplaintText) : Prop where
  attorneyGeneral  : IsAttorneyGeneral p c
  conduct          : PersonEngagedOrAboutToEngageInViolation p c
  coveredViolation : ConductConstitutesCoveredViolation c
  injury           : ThreatenedContinuingOrSubstantialInjury c




inductive Section1596Nexus (p : Person) (c : ComplaintText) : Prop where
  | national (h : OffenderIsNationalOrLPR p c)
  | present  (h : OffenderPresentInUS p c)



structure Section1596Jurisdiction (p : Person) (c : ComplaintText) : Prop where
  offense   : IsCoveredTraffickingOffense c
  nexus     : Section1596Nexus p c
  notBarred : ¬ ForeignProsecutionBarApplies p c




inductive Section1597Purpose (p : Person) (c : ComplaintText) : Prop where
  | inCourse      (h : InCourseOfForcedLaborOffense p c)
  | withIntent    (h : WithIntentToCommitForcedLaborOffense p c)
  | restrictLabor (h : ToRestrictLaborWithoutAuthority p c)



structure Section1597 (p : Person) (doc : ImmigrationDocument) (c : ComplaintText) : Prop where
  scienter : ActedWithScienter p c
  conduct  : TampersWithImmigrationDocument p doc c
  object   : IsAnothersImmigrationDocument doc c
  purpose  : Section1597Purpose p c


inductive Section1597Liability (p : Person) (doc : ImmigrationDocument) (c : ComplaintText) : Prop where
  | substantive (h : Section1597 p doc c)
  | obstruct    (h : ObstructsEnforcement p c)

end Proving.USC.T18.Ch77TailCompletion.Elements
