





import Proving.USC.T18.Ch11.EchoReslice.Elements.Types
import Proving.USC.T18.Ch11.EchoReslice.Elements.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch11.EchoReslice.Elements

open Proving.USC.Common





inductive FederalCapacity (p : Person) (c : ComplaintText) : Prop where
  | officerOrEmployee (h : IsOfficerOrEmployeeOfUnitedStates p c) : FederalCapacity p c
  | actingForUnitedStates (h : ActsForOrOnBehalfOfUnitedStates p c) : FederalCapacity p c




structure FederalCapacityRole (p : Person) (c : ComplaintText) : Prop where
  capacity : FederalCapacity p c
  officialFunction : ActsInOfficialFunctionUnderGovernmentAuthority p c


inductive PublicOfficial201a1 (p : Person) (c : ComplaintText) : Prop where
  | congressional (h : IsMemberOfCongressDelegateOrResidentCommissioner p c) :
      PublicOfficial201a1 p c
  | federalCapacity (h : FederalCapacityRole p c) : PublicOfficial201a1 p c
  | juror (h : IsJuror p c) : PublicOfficial201a1 p c



abbrev IsPublicOfficial (p : Person) (c : ComplaintText) : Prop := PublicOfficial201a1 p c




inductive PersonSelected201a2 (p : Person) (c : ComplaintText) : Prop where
  | nominated (h : HasBeenNominatedToBePublicOfficial p c) : PersonSelected201a2 p c
  | appointed (h : HasBeenAppointedToBePublicOfficial p c) : PersonSelected201a2 p c
  | officiallyInformed (h : HasBeenOfficiallyInformedOfSelection p c) : PersonSelected201a2 p c



abbrev IsPersonSelectedToBePublicOfficial (p : Person) (c : ComplaintText) : Prop :=
  PersonSelected201a2 p c




structure OfficialAct201a3 (act : OfficialAct) (c : ComplaintText) : Prop where
  decisionOrAction : IsDecisionOrActionOnQuestionOrMatter act c
  pendingOrBringable : MatterPendingOrMayByLawBeBrought act c
  officialCapacity : WithinOfficialCapacityOrPlaceOfTrust act c


abbrev IsOfficialAct (act : OfficialAct) (c : ComplaintText) : Prop := OfficialAct201a3 act c





inductive CoveredOfficialOrSelectee (p : Person) (c : ComplaintText) : Prop where
  | official (h : IsPublicOfficial p c) : CoveredOfficialOrSelectee p c
  | selectee (h : IsPersonSelectedToBePublicOfficial p c) : CoveredOfficialOrSelectee p c




inductive CoveredOfficialSelecteeOrFormer (p : Person) (c : ComplaintText) : Prop where
  | official (h : IsPublicOfficial p c) : CoveredOfficialSelecteeOrFormer p c
  | former (h : IsFormerPublicOfficial p c) : CoveredOfficialSelecteeOrFormer p c
  | selectee (h : IsPersonSelectedToBePublicOfficial p c) : CoveredOfficialSelecteeOrFormer p c






inductive ConfersThingOfValue
    (payor : Person) (recipient : Person) (v : ThingOfValue) (c : ComplaintText) : Prop where
  | direct (h : GivesOffersOrPromisesThingOfValue payor recipient v c) :
      ConfersThingOfValue payor recipient v c
  | thirdPartyBeneficiary (h : OffersOrPromisesValueToThirdPartyBeneficiary payor recipient v c) :
      ConfersThingOfValue payor recipient v c




structure OfficialActInfluenceIntent
    (payor : Person) (official : Person) (act : OfficialAct) (c : ComplaintText) : Prop where
  qualifies : IsOfficialAct act c
  intent : IntentToInfluenceOfficialAct payor official act c



structure OfficialActInfluenceBargain
    (official : Person) (v : ThingOfValue) (act : OfficialAct) (c : ComplaintText) : Prop where
  qualifies : IsOfficialAct act c
  bargain : InReturnForBeingInfluencedInOfficialAct official v act c


structure OfficialActGratuityNexus
    (v : ThingOfValue) (official : Person) (act : OfficialAct) (c : ComplaintText) : Prop where
  qualifies : IsOfficialAct act c
  nexus : ForOrBecauseOfOfficialActPerformedOrToBePerformed v official act c




inductive BriberyIntent201b1
    (payor : Person) (official : Person) (act : OfficialAct) (c : ComplaintText) : Prop where
  | influenceOfficialAct (h : OfficialActInfluenceIntent payor official act c) :
      BriberyIntent201b1 payor official act c
  | fraudOnUnitedStates (h : IntentToInduceFraudOnTheUnitedStates payor official c) :
      BriberyIntent201b1 payor official act c
  | violationOfLawfulDuty (h : IntentToInduceViolationOfLawfulDuty payor official c) :
      BriberyIntent201b1 payor official act c


inductive BriberyReturn201b2
    (official : Person) (v : ThingOfValue) (act : OfficialAct) (c : ComplaintText) : Prop where
  | influencedInOfficialAct (h : OfficialActInfluenceBargain official v act c) :
      BriberyReturn201b2 official v act c
  | allowFraudOnUnitedStates (h : InReturnForBeingInfluencedToAllowFraudOnTheUnitedStates official v c) :
      BriberyReturn201b2 official v act c
  | violationOfOfficialDuty (h : InReturnForBeingInducedToViolateOfficialDuty official v c) :
      BriberyReturn201b2 official v act c


inductive WitnessBriberyIntent201b3
    (payor : Person) (witness : Person) (pr : Proceeding) (c : ComplaintText) : Prop where
  | influenceTestimony (h : IntentToInfluenceTestimony payor witness pr c) :
      WitnessBriberyIntent201b3 payor witness pr c
  | induceAbsence (h : IntentToInduceWitnessAbsence payor witness pr c) :
      WitnessBriberyIntent201b3 payor witness pr c


inductive WitnessBriberyReturn201b4
    (witness : Person) (v : ThingOfValue) (pr : Proceeding) (c : ComplaintText) : Prop where
  | influencedInTestimony (h : InReturnForBeingInfluencedInTestimony witness v pr c) :
      WitnessBriberyReturn201b4 witness v pr c
  | absentedFromProceeding (h : InReturnForAbsentingFromProceeding witness v pr c) :
      WitnessBriberyReturn201b4 witness v pr c


inductive WitnessGratuityNexus
    (v : ThingOfValue) (witness : Person) (pr : Proceeding) (c : ComplaintText) : Prop where
  | testimony (h : ForOrBecauseOfTestimonyGivenOrToBeGiven v witness pr c) :
      WitnessGratuityNexus v witness pr c
  | absence (h : ForOrBecauseOfAbsenceFromProceeding v witness pr c) :
      WitnessGratuityNexus v witness pr c






structure WitnessInQualifyingProceeding
    (witness : Person) (pr : Proceeding) (c : ComplaintText) : Prop where
  qualifyingProceeding : IsQualifyingFederalProceeding pr c
  testifies : TestifiesUnderOathAsWitness witness pr c





inductive WitnessFeeException201d
    (v : ThingOfValue) (pr : Proceeding) (c : ComplaintText) : Prop where
  | statutoryWitnessFee (h : IsWitnessFeeProvidedByLaw v c) : WitnessFeeException201d v pr c
  | travelSubsistenceOrLostTime (h : IsReasonableTravelSubsistenceOrLostTimePayment v pr c) :
      WitnessFeeException201d v pr c
  | expertWitnessFee (h : IsReasonableExpertWitnessFee v pr c) : WitnessFeeException201d v pr c


abbrev WithinWitnessFeeException
    (v : ThingOfValue) (pr : Proceeding) (c : ComplaintText) : Prop :=
  WitnessFeeException201d v pr c




structure Section201b1
    (payor : Person) (official : Person) (v : ThingOfValue) (act : OfficialAct)
    (c : ComplaintText) : Prop where
  corruptly : ActsCorruptly payor c
  thingOfValue : ThingHasValue v c
  conferral : ConfersThingOfValue payor official v c
  recipientStatus : CoveredOfficialOrSelectee official c
  intent : BriberyIntent201b1 payor official act c


structure Section201b2
    (official : Person) (v : ThingOfValue) (act : OfficialAct) (c : ComplaintText) : Prop where
  officialStatus : CoveredOfficialOrSelectee official c
  corruptly : ActsCorruptly official c
  thingOfValue : ThingHasValue v c
  solicitation : DemandsSeeksReceivesAcceptsOrAgreesToAcceptThingOfValue official v c
  bargain : BriberyReturn201b2 official v act c



structure Section201b3
    (payor : Person) (witness : Person) (v : ThingOfValue) (pr : Proceeding)
    (c : ComplaintText) : Prop where
  corruptly : ActsCorruptly payor c
  thingOfValue : ThingHasValue v c
  conferral : ConfersThingOfValue payor witness v c
  witnessStatus : WitnessInQualifyingProceeding witness pr c
  intent : WitnessBriberyIntent201b3 payor witness pr c
  notExcepted : ¬ WithinWitnessFeeException v pr c



structure Section201b4
    (witness : Person) (v : ThingOfValue) (pr : Proceeding) (c : ComplaintText) : Prop where
  corruptly : ActsCorruptly witness c
  thingOfValue : ThingHasValue v c
  solicitation : DemandsSeeksReceivesAcceptsOrAgreesToAcceptThingOfValue witness v c
  witnessStatus : WitnessInQualifyingProceeding witness pr c
  bargain : WitnessBriberyReturn201b4 witness v pr c
  notExcepted : ¬ WithinWitnessFeeException v pr c




structure Section201c1A
    (payor : Person) (official : Person) (v : ThingOfValue) (act : OfficialAct)
    (c : ComplaintText) : Prop where
  notAuthorizedByLaw : ¬ AuthorizedByLawForProperDischargeOfOfficialDuty v official c
  thingOfValue : ThingHasValue v c
  conferral : GivesOffersOrPromisesThingOfValue payor official v c
  recipientStatus : CoveredOfficialSelecteeOrFormer official c
  nexus : OfficialActGratuityNexus v official act c


structure Section201c1B
    (official : Person) (v : ThingOfValue) (act : OfficialAct) (c : ComplaintText) : Prop where
  officialStatus : CoveredOfficialSelecteeOrFormer official c
  notAuthorizedByLaw : ¬ AuthorizedByLawForProperDischargeOfOfficialDuty v official c
  thingOfValue : ThingHasValue v c
  solicitation : DemandsSeeksOrAcceptsThingOfValuePersonally official v c
  nexus : OfficialActGratuityNexus v official act c



structure Section201c2
    (payor : Person) (witness : Person) (v : ThingOfValue) (pr : Proceeding)
    (c : ComplaintText) : Prop where
  thingOfValue : ThingHasValue v c
  conferral : GivesOffersOrPromisesThingOfValue payor witness v c
  witnessStatus : WitnessInQualifyingProceeding witness pr c
  nexus : WitnessGratuityNexus v witness pr c
  notExcepted : ¬ WithinWitnessFeeException v pr c



structure Section201c3
    (witness : Person) (v : ThingOfValue) (pr : Proceeding) (c : ComplaintText) : Prop where
  thingOfValue : ThingHasValue v c
  solicitation : DemandsSeeksOrAcceptsThingOfValuePersonally witness v c
  witnessStatus : WitnessInQualifyingProceeding witness pr c
  nexus : WitnessGratuityNexus v witness pr c
  notExcepted : ¬ WithinWitnessFeeException v pr c




inductive BriberyUnderSection201b (c : ComplaintText) : Prop where
  | officialPayor (payor official : Person) (v : ThingOfValue) (act : OfficialAct)
      (h : Section201b1 payor official v act c) : BriberyUnderSection201b c
  | officialPayee (official : Person) (v : ThingOfValue) (act : OfficialAct)
      (h : Section201b2 official v act c) : BriberyUnderSection201b c
  | witnessPayor (payor witness : Person) (v : ThingOfValue) (pr : Proceeding)
      (h : Section201b3 payor witness v pr c) : BriberyUnderSection201b c
  | witnessPayee (witness : Person) (v : ThingOfValue) (pr : Proceeding)
      (h : Section201b4 witness v pr c) : BriberyUnderSection201b c


inductive GratuityUnderSection201c (c : ComplaintText) : Prop where
  | officialPayor (payor official : Person) (v : ThingOfValue) (act : OfficialAct)
      (h : Section201c1A payor official v act c) : GratuityUnderSection201c c
  | officialPayee (official : Person) (v : ThingOfValue) (act : OfficialAct)
      (h : Section201c1B official v act c) : GratuityUnderSection201c c
  | witnessPayor (payor witness : Person) (v : ThingOfValue) (pr : Proceeding)
      (h : Section201c2 payor witness v pr c) : GratuityUnderSection201c c
  | witnessPayee (witness : Person) (v : ThingOfValue) (pr : Proceeding)
      (h : Section201c3 witness v pr c) : GratuityUnderSection201c c




inductive ViolatesSection201 (c : ComplaintText) : Prop where
  | bribery (h : BriberyUnderSection201b c) : ViolatesSection201 c
  | gratuity (h : GratuityUnderSection201c c) : ViolatesSection201 c

end Proving.USC.T18.Ch11.EchoReslice.Elements
