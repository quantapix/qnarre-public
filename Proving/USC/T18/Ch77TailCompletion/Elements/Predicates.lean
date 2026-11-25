










import Proving.USC.T18.Ch77TailCompletion.Elements.Types

namespace Proving.USC.T18.Ch77TailCompletion.Elements

open Proving.USC.Common





axiom KidnapsOrCarriesAway (p v : Person) (c : ComplaintText) : Prop




axiom IntentToHoldOrSellAsSlave (p : Person) (c : ComplaintText) : Prop




axiom EnticesToVesselOrPlace (p v : Person) (c : ComplaintText) : Prop




axiom IntentToMakeHeldOrSentAbroadAsSlave (p : Person) (c : ComplaintText) : Prop




axiom ObstructsEnforcement (p : Person) (c : ComplaintText) : Prop





axiom HoldsToInvoluntaryServitude (p v : Person) (c : ComplaintText) : Prop




axiom SellsIntoInvoluntaryServitude (p v : Person) (c : ComplaintText) : Prop




axiom BringsHeldPersonIntoUS (p v : Person) (c : ComplaintText) : Prop






axiom OffenseUnderChapter (p : Person) (c : ComplaintText) : Prop




axiom IsChapterVictim (v : Person) (c : ComplaintText) : Prop




axiom LossesAttributableToOffense (v : Person) (c : ComplaintText) : Prop






axiom KnowinglyBenefitsFromVenture (p : Person) (c : ComplaintText) : Prop




axiom VentureViolatedChapter (e : Entity) (c : ComplaintText) : Prop




axiom KnewOrRecklessDisregardOfVentureViolation (p : Person) (c : ComplaintText) : Prop





axiom IntentToCommitChapterOffense (p : Person) (c : ComplaintText) : Prop




axiom SubstantialStepTaken (p : Person) (c : ComplaintText) : Prop




axiom TargetsCoveredChapterOffense (c : ComplaintText) : Prop






axiom DefendantPerpetratedViolation (p : Person) (c : ComplaintText) : Prop




axiom KnewOrShouldHaveKnownOfViolation (p : Person) (c : ComplaintText) : Prop




axiom InjuredByViolation (v : Person) (c : ComplaintText) : Prop




axiom WithinLimitationsPeriod1595 (v : Person) (c : ComplaintText) : Prop




axiom IsStateAttorneyGeneral (p : Person) (c : ComplaintText) : Prop




axiom ReasonToBelieveResidentsAffected (p : Person) (c : ComplaintText) : Prop



axiom TargetsSection1591Violation (c : ComplaintText) : Prop






axiom IsAttorneyGeneral (p : Person) (c : ComplaintText) : Prop




axiom PersonEngagedOrAboutToEngageInViolation (p : Person) (c : ComplaintText) : Prop




axiom ConductConstitutesCoveredViolation (c : ComplaintText) : Prop




axiom ThreatenedContinuingOrSubstantialInjury (c : ComplaintText) : Prop






axiom IsCoveredTraffickingOffense (c : ComplaintText) : Prop




axiom OffenderIsNationalOrLPR (p : Person) (c : ComplaintText) : Prop




axiom OffenderPresentInUS (p : Person) (c : ComplaintText) : Prop





axiom ForeignProsecutionBarApplies (p : Person) (c : ComplaintText) : Prop






axiom TampersWithImmigrationDocument (p : Person) (doc : ImmigrationDocument) (c : ComplaintText) : Prop




axiom IsAnothersImmigrationDocument (doc : ImmigrationDocument) (c : ComplaintText) : Prop




axiom InCourseOfForcedLaborOffense (p : Person) (c : ComplaintText) : Prop




axiom WithIntentToCommitForcedLaborOffense (p : Person) (c : ComplaintText) : Prop




axiom ToRestrictLaborWithoutAuthority (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch77TailCompletion.Elements
