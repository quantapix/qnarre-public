





import Proving.USC.T18.Ch11.EchoReslice.Deontic.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch11.EchoReslice.Deontic

open Proving.USC.Common (Person ComplaintText)





axiom IsPublicOfficial (p : Person) (c : ComplaintText) : Prop




axiom IsPersonSelectedToBePublicOfficial (p : Person) (c : ComplaintText) : Prop




axiom IsFormerPublicOfficial (p : Person) (c : ComplaintText) : Prop



axiom IsOfficialAct (a : OfficialAct) (c : ComplaintText) : Prop






axiom AddresseeWhoever (p : Person) (c : ComplaintText) : Prop








axiom GivesOffersOrPromisesThingOfValue
    (giver recipient : Person) (v : ThingOfValue) (c : ComplaintText) : Prop





axiom DemandsSeeksReceivesOrAcceptsThingOfValue
    (taker : Person) (v : ThingOfValue) (c : ComplaintText) : Prop





axiom ReceivesThingOfValuePersonally
    (taker : Person) (v : ThingOfValue) (c : ComplaintText) : Prop





axiom ActsCorruptly (p : Person) (c : ComplaintText) : Prop





axiom IntentToInfluenceOfficialAct
    (giver : Person) (a : OfficialAct) (c : ComplaintText) : Prop





axiom IntentToInfluenceCommissionOfFraudOnUnitedStates
    (giver recipient : Person) (c : ComplaintText) : Prop




axiom IntentToInduceViolationOfLawfulDuty
    (giver recipient : Person) (c : ComplaintText) : Prop






axiom InReturnForBeingInfluencedInOfficialAct
    (taker : Person) (a : OfficialAct) (c : ComplaintText) : Prop





axiom InReturnForBeingInfluencedToCommitFraudOnUnitedStates
    (taker : Person) (c : ComplaintText) : Prop




axiom InReturnForBeingInducedToViolateOfficialDuty
    (taker : Person) (c : ComplaintText) : Prop









axiom IsWitnessInFederalProceeding
    (w : Person) (pr : Proceeding) (c : ComplaintText) : Prop




axiom IntentToInfluenceTestimony
    (giver w : Person) (pr : Proceeding) (c : ComplaintText) : Prop




axiom IntentToInduceAbsenceFromProceeding
    (giver w : Person) (pr : Proceeding) (c : ComplaintText) : Prop




axiom InReturnForBeingInfluencedInTestimony
    (taker : Person) (pr : Proceeding) (c : ComplaintText) : Prop




axiom InReturnForAbsentingFromProceeding
    (taker : Person) (pr : Proceeding) (c : ComplaintText) : Prop






axiom OtherwiseThanAsProvidedByLawForProperDischargeOfOfficialDuty
    (v : ThingOfValue) (c : ComplaintText) : Prop






axiom ForOrBecauseOfOfficialActPerformedOrToBePerformed
    (v : ThingOfValue) (a : OfficialAct) (c : ComplaintText) : Prop





axiom ForOrBecauseOfTestimonyOrAbsence
    (v : ThingOfValue) (pr : Proceeding) (c : ComplaintText) : Prop











axiom WitnessFeeOrExpenseExemptionApplies
    (v : ThingOfValue) (pr : Proceeding) (c : ComplaintText) : Prop






axiom ConvictedUnderSubsectionB (p : Person) (c : ComplaintText) : Prop




axiom ConvictedUnderSubsectionC (p : Person) (c : ComplaintText) : Prop




axiom FineOrImprisonmentImposed (p : Person) (c : ComplaintText) : Prop




axiom IsOfficeOfHonorTrustOrProfitUnderUnitedStates
    (o : Office) (c : ComplaintText) : Prop




axiom DisqualificationFromOfficeImposed
    (p : Person) (o : Office) (c : ComplaintText) : Prop




axiom monetaryEquivalentOfThingOfValue (v : ThingOfValue) (c : ComplaintText) : Nat




axiom fineImposed (p : Person) (c : ComplaintText) : Nat





axiom titleEighteenFineCap (p : Person) (c : ComplaintText) : Nat




axiom monthsOfImprisonmentImposed (p : Person) (c : ComplaintText) : Nat






axiom PunishedUnderThisSection (p : Person) (c : ComplaintText) : Prop




axiom PunishedUnderSection1503Or1504Or1505 (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch11.EchoReslice.Deontic
