







import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch77.Reslice.Ontology.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Reslice.Ontology

open Proving.USC.Common






axiom IsAbuseOrThreatenedAbuseOfLawOrLegalProcess
  (u : LegalProcessUse) (c : ComplaintText) : Prop




axiom IsUseOrThreatenedUseOfLawOrLegalProcess
  (u : LegalProcessUse) (c : ComplaintText) : Prop




axiom ForPurposeForWhichLawNotDesigned
  (u : LegalProcessUse) (c : ComplaintText) : Prop




axiom ExertsPressureToCauseActionOrInaction
  (u : LegalProcessUse) (p : Person) (c : ComplaintText) : Prop





axiom IsCoercion (m : CoerciveMeans) (c : ComplaintText) : Prop




axiom ThreatensSeriousHarm
  (m : CoerciveMeans) (h : Harm) (c : ComplaintText) : Prop




axiom ThreatensPhysicalRestraint
  (m : CoerciveMeans) (p : Person) (c : ComplaintText) : Prop





axiom IsSchemeCausingBeliefOfSeriousHarm
  (m : CoerciveMeans) (h : Harm) (c : ComplaintText) : Prop





axiom IsSchemeCausingBeliefOfPhysicalRestraint
  (m : CoerciveMeans) (p : Person) (c : ComplaintText) : Prop





axiom EmployedAsCoerciveMeans
  (u : LegalProcessUse) (m : CoerciveMeans) (c : ComplaintText) : Prop





axiom IsCommercialSexAct (s : SexAct) (c : ComplaintText) : Prop



axiom IsSexAct (s : SexAct) (c : ComplaintText) : Prop




axiom AnythingOfValueGivenOrReceivedOnAccountOfAct
  (s : SexAct) (c : ComplaintText) : Prop






axiom IsParticipationInAVenture (a : Assistance) (c : ComplaintText) : Prop




axiom KnowinglyAssistsSupportsOrFacilitates
  (a : Assistance) (v : Venture) (c : ComplaintText) : Prop




axiom IsViolationOfSection1591a1 (v : Venture) (c : ComplaintText) : Prop





axiom IsSeriousHarm (h : Harm) (c : ComplaintText) : Prop




axiom IsHarmPhysicalOrNonphysical (h : Harm) (c : ComplaintText) : Prop




axiom IsSufficientlySeriousUnderAllCircumstances
  (h : Harm) (c : ComplaintText) : Prop






axiom CompelsReasonablePersonToPerformCommercialSexualActivity
  (h : Harm) (p : Person) (c : ComplaintText) : Prop







axiom IsVenture (v : Venture) (c : ComplaintText) : Prop




axiom IsGroupOfTwoOrMoreIndividuals (v : Venture) (c : ComplaintText) : Prop




axiom IsAssociatedInFact (v : Venture) (c : ComplaintText) : Prop







axiom IsPersonRecruitedEnticedHarboredOrSolicited
  (p : Person) (c : ComplaintText) : Prop





axiom AffectsInterstateOrForeignCommerceOrIsWithinSMTJ
  (c : ComplaintText) : Prop




axiom UsesForceOrThreatOfForce (m : CoerciveMeans) (c : ComplaintText) : Prop



axiom UsesFraud (m : CoerciveMeans) (c : ComplaintText) : Prop




axiom HasNotAttainedAge18 (p : Person) (c : ComplaintText) : Prop




axiom HasNotAttainedAge14 (p : Person) (c : ComplaintText) : Prop





axiom ageAtTimeOfOffense (p : Person) (c : ComplaintText) : Nat




axiom hasNotAttainedAge18_iff :
  ∀ (p : Person) (c : ComplaintText),
    HasNotAttainedAge18 p c ↔ ageAtTimeOfOffense p c < 18



axiom hasNotAttainedAge14_iff :
  ∀ (p : Person) (c : ComplaintText),
    HasNotAttainedAge14 p c ↔ ageAtTimeOfOffense p c < 14






axiom IsLaborOrServices (l : LaborOrServices) (c : ComplaintText) : Prop




axiom IsPersonRecruitedHarboredTransportedProvidedOrObtained
  (p : Person) (c : ComplaintText) : Prop





axiom IsChapter77Violation (c : ComplaintText) : Prop





axiom IsSection1590AggravatedViolationClass (c : ComplaintText) : Prop





axiom IsPassportOrOtherImmigrationDocument
  (d : IdentificationDocument) (c : ComplaintText) : Prop




axiom IsGovernmentIdentificationDocument
  (d : IdentificationDocument) (c : ComplaintText) : Prop




axiom IsActualOrPurportedDocument
  (d : IdentificationDocument) (c : ComplaintText) : Prop



axiom IsDocumentOfAnotherPerson
  (d : IdentificationDocument) (p : Person) (c : ComplaintText) : Prop





axiom IsInCourseOfEnumeratedChapter77Violation (c : ComplaintText) : Prop





axiom HasIntentToViolateEnumeratedChapter77Section (c : ComplaintText) : Prop




axiom RestrictsLibertyToMoveOrTravel
  (d : IdentificationDocument) (p : Person) (c : ComplaintText) : Prop




axiom InOrderToMaintainLaborOrServices (p : Person) (c : ComplaintText) : Prop



axiom WithoutLawfulAuthority (c : ComplaintText) : Prop






axiom IsVictimOfSevereFormOfTraffickingInPersons
  (p : Person) (c : ComplaintText) : Prop




axiom IsConductCausedByOrIncidentToTrafficking
  (p : Person) (c : ComplaintText) : Prop






axiom ObstructsEnforcement (a : ObstructiveAct) (c : ComplaintText) : Prop




axiom AttemptsToObstructEnforcement (a : ObstructiveAct) (c : ComplaintText) : Prop




axiom InterferesWithEnforcement (a : ObstructiveAct) (c : ComplaintText) : Prop




axiom PreventsEnforcement (a : ObstructiveAct) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch77.Reslice.Ontology
