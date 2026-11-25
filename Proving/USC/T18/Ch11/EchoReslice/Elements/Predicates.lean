





import Proving.USC.T18.Ch11.EchoReslice.Elements.Types
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch11.EchoReslice.Elements

open Proving.USC.Common






axiom IsMemberOfCongressDelegateOrResidentCommissioner (p : Person) (c : ComplaintText) : Prop





axiom IsOfficerOrEmployeeOfUnitedStates (p : Person) (c : ComplaintText) : Prop





axiom ActsForOrOnBehalfOfUnitedStates (p : Person) (c : ComplaintText) : Prop





axiom ActsInOfficialFunctionUnderGovernmentAuthority (p : Person) (c : ComplaintText) : Prop



axiom IsJuror (p : Person) (c : ComplaintText) : Prop





axiom HasBeenNominatedToBePublicOfficial (p : Person) (c : ComplaintText) : Prop



axiom HasBeenAppointedToBePublicOfficial (p : Person) (c : ComplaintText) : Prop




axiom HasBeenOfficiallyInformedOfSelection (p : Person) (c : ComplaintText) : Prop






axiom IsFormerPublicOfficial (p : Person) (c : ComplaintText) : Prop






axiom IsDecisionOrActionOnQuestionOrMatter (act : OfficialAct) (c : ComplaintText) : Prop





axiom MatterPendingOrMayByLawBeBrought (act : OfficialAct) (c : ComplaintText) : Prop




axiom WithinOfficialCapacityOrPlaceOfTrust (act : OfficialAct) (c : ComplaintText) : Prop







axiom ActsCorruptly (p : Person) (c : ComplaintText) : Prop



axiom ThingHasValue (v : ThingOfValue) (c : ComplaintText) : Prop




axiom GivesOffersOrPromisesThingOfValue
    (payor : Person) (recipient : Person) (v : ThingOfValue) (c : ComplaintText) : Prop





axiom OffersOrPromisesValueToThirdPartyBeneficiary
    (payor : Person) (recipient : Person) (v : ThingOfValue) (c : ComplaintText) : Prop





axiom DemandsSeeksReceivesAcceptsOrAgreesToAcceptThingOfValue
    (payee : Person) (v : ThingOfValue) (c : ComplaintText) : Prop






axiom DemandsSeeksOrAcceptsThingOfValuePersonally
    (payee : Person) (v : ThingOfValue) (c : ComplaintText) : Prop





axiom IntentToInfluenceOfficialAct
    (payor : Person) (official : Person) (act : OfficialAct) (c : ComplaintText) : Prop





axiom IntentToInduceFraudOnTheUnitedStates
    (payor : Person) (official : Person) (c : ComplaintText) : Prop




axiom IntentToInduceViolationOfLawfulDuty
    (payor : Person) (official : Person) (c : ComplaintText) : Prop







axiom InReturnForBeingInfluencedInOfficialAct
    (official : Person) (v : ThingOfValue) (act : OfficialAct) (c : ComplaintText) : Prop





axiom InReturnForBeingInfluencedToAllowFraudOnTheUnitedStates
    (official : Person) (v : ThingOfValue) (c : ComplaintText) : Prop




axiom InReturnForBeingInducedToViolateOfficialDuty
    (official : Person) (v : ThingOfValue) (c : ComplaintText) : Prop






axiom IntentToInfluenceTestimony
    (payor : Person) (witness : Person) (pr : Proceeding) (c : ComplaintText) : Prop




axiom IntentToInduceWitnessAbsence
    (payor : Person) (witness : Person) (pr : Proceeding) (c : ComplaintText) : Prop





axiom InReturnForBeingInfluencedInTestimony
    (witness : Person) (v : ThingOfValue) (pr : Proceeding) (c : ComplaintText) : Prop



axiom InReturnForAbsentingFromProceeding
    (witness : Person) (v : ThingOfValue) (pr : Proceeding) (c : ComplaintText) : Prop








axiom IsQualifyingFederalProceeding (pr : Proceeding) (c : ComplaintText) : Prop




axiom TestifiesUnderOathAsWitness
    (witness : Person) (pr : Proceeding) (c : ComplaintText) : Prop







axiom ForOrBecauseOfOfficialActPerformedOrToBePerformed
    (v : ThingOfValue) (official : Person) (act : OfficialAct) (c : ComplaintText) : Prop




axiom ForOrBecauseOfTestimonyGivenOrToBeGiven
    (v : ThingOfValue) (witness : Person) (pr : Proceeding) (c : ComplaintText) : Prop




axiom ForOrBecauseOfAbsenceFromProceeding
    (v : ThingOfValue) (witness : Person) (pr : Proceeding) (c : ComplaintText) : Prop







axiom AuthorizedByLawForProperDischargeOfOfficialDuty
    (v : ThingOfValue) (official : Person) (c : ComplaintText) : Prop






axiom IsWitnessFeeProvidedByLaw (v : ThingOfValue) (c : ComplaintText) : Prop






axiom IsReasonableTravelSubsistenceOrLostTimePayment
    (v : ThingOfValue) (pr : Proceeding) (c : ComplaintText) : Prop





axiom IsReasonableExpertWitnessFee
    (v : ThingOfValue) (pr : Proceeding) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch11.EchoReslice.Elements
