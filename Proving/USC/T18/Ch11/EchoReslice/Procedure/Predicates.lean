








import Proving.USC.T18.Ch11.EchoReslice.Procedure.Types
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch11.EchoReslice.Procedure

open Proving.USC.Common







axiom HoldsEnumeratedFederalPosition (p : Person) (c : ComplaintText) : Prop






axiom ServesInFederalOfficialFunction (p : Person) (c : ComplaintText) : Prop





axiom HasQualifiedForOffice (p : Person) (c : ComplaintText) : Prop




axiom NominatedOrAppointedToOffice (p : Person) (c : ComplaintText) : Prop





axiom OfficiallyInformedOfForthcomingSelection (p : Person) (c : ComplaintText) : Prop




axiom OfficialServiceEnded (p : Person) (c : ComplaintText) : Prop






axiom MatterPendingBeforeOfficial (m : Matter) (p : Person) (c : ComplaintText) : Prop





axiom MatterMayByLawBeBroughtBeforeOfficial (m : Matter) (p : Person) (c : ComplaintText) : Prop



axiom DecisionOrActionOnMatter (a : OfficialAct) (m : Matter) (c : ComplaintText) : Prop




axiom ActTakenInOfficialCapacityOrPlaceOfTrust (a : OfficialAct) (p : Person) (c : ComplaintText) : Prop






axiom CorruptlyGivesOffersOrPromises (t : Transfer) (payor : Person) (c : ComplaintText) : Prop





axiom CorruptlyDemandsSeeksReceivesOrAccepts (t : Transfer) (recipient : Person) (c : ComplaintText) : Prop





axiom GivesOffersOrPromises (t : Transfer) (payor : Person) (c : ComplaintText) : Prop





axiom DemandsSeeksReceivesOrAccepts (t : Transfer) (recipient : Person) (c : ComplaintText) : Prop





axiom ValueDirectedToOfficialOrDesignee (t : Transfer) (beneficiary : Person) (c : ComplaintText) : Prop







axiom ObjectIsFraudOnUnitedStates (t : Transfer) (c : ComplaintText) : Prop





axiom ObjectIsActInViolationOfLawfulDuty (t : Transfer) (c : ComplaintText) : Prop





axiom ProceedingIsTrialHearingOrOtherProceeding (pr : Proceeding) (c : ComplaintText) : Prop



axiom ProceedingHeldBeforeForum (pr : Proceeding) (f : Forum) (c : ComplaintText) : Prop



axiom ForumIsCourt (f : Forum) (c : ComplaintText) : Prop




axiom ForumIsCongressionalCommittee (f : Forum) (c : ComplaintText) : Prop





axiom ForumAuthorizedToHearEvidenceOrTakeTestimony (f : Forum) (c : ComplaintText) : Prop




axiom TestimonyGivenOrToBeGivenUnderOath (w : Person) (pr : Proceeding) (c : ComplaintText) : Prop





axiom WitnessAbsentedFromProceeding (w : Person) (pr : Proceeding) (c : ComplaintText) : Prop







axiom AuthorizedByLawForProperDischargeOfDuty (t : Transfer) (c : ComplaintText) : Prop




axiom PaymentIsStatutoryWitnessFee (t : Transfer) (c : ComplaintText) : Prop




axiom PayorIsPartyOnWhoseBehalfWitnessCalled (t : Transfer) (w : Person) (pr : Proceeding) (c : ComplaintText) : Prop





axiom WitnessQualifiedAsExpert (w : Person) (pr : Proceeding) (c : ComplaintText) : Prop







axiom ConvictionEntered (pros : Prosecution) (c : ComplaintText) : Prop




axiom SentenceImposed (s : Sentence) (pros : Prosecution) (c : ComplaintText) : Prop






axiom DisqualificationOrdered (p : Person) (pros : Prosecution) (c : ComplaintText) : Prop





axiom ChargedUnderObstructionSection (pros : Prosecution) (c : ComplaintText) : Prop










axiom dayOfTransfer (t : Transfer) (c : ComplaintText) : Nat




axiom dayOfOfficialAct (a : OfficialAct) (c : ComplaintText) : Nat



axiom amountTransferredCents (t : Transfer) (c : ComplaintText) : Nat




axiom monetaryEquivalentOfThingOfValueCents (t : Transfer) (c : ComplaintText) : Nat




axiom statutoryWitnessFeeCents (w : Person) (pr : Proceeding) (c : ComplaintText) : Nat




axiom reasonableTravelAndSubsistenceCents (w : Person) (pr : Proceeding) (c : ComplaintText) : Nat




axiom reasonableValueOfTimeLostCents (w : Person) (pr : Proceeding) (c : ComplaintText) : Nat





axiom reasonableExpertPreparationFeeCents (w : Person) (pr : Proceeding) (c : ComplaintText) : Nat





axiom fineUnderThisTitleCapCents (pros : Prosecution) (c : ComplaintText) : Nat



axiom imposedFineCents (s : Sentence) (c : ComplaintText) : Nat




axiom imposedImprisonmentMonths (s : Sentence) (c : ComplaintText) : Nat

end Proving.USC.T18.Ch11.EchoReslice.Procedure
