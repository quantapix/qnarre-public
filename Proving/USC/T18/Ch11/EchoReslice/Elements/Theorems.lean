




import Proving.USC.T18.Ch11.EchoReslice.Elements.Types
import Proving.USC.T18.Ch11.EchoReslice.Elements.Predicates
import Proving.USC.T18.Ch11.EchoReslice.Elements.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch11.EchoReslice.Elements

open Proving.USC.Common



theorem federalCapacity_intro_officerOrEmployee {p : Person} {c : ComplaintText}
    (h : IsOfficerOrEmployeeOfUnitedStates p c) : FederalCapacity p c :=
  .officerOrEmployee h

theorem federalCapacity_intro_actingForUnitedStates {p : Person} {c : ComplaintText}
    (h : ActsForOrOnBehalfOfUnitedStates p c) : FederalCapacity p c :=
  .actingForUnitedStates h

theorem federalCapacityRole_intro {p : Person} {c : ComplaintText}
    (hCap : FederalCapacity p c)
    (hFn : ActsInOfficialFunctionUnderGovernmentAuthority p c) : FederalCapacityRole p c :=
  ⟨hCap, hFn⟩

theorem publicOfficial201a1_intro_congressional {p : Person} {c : ComplaintText}
    (h : IsMemberOfCongressDelegateOrResidentCommissioner p c) : PublicOfficial201a1 p c :=
  .congressional h

theorem publicOfficial201a1_intro_federalCapacity {p : Person} {c : ComplaintText}
    (h : FederalCapacityRole p c) : PublicOfficial201a1 p c :=
  .federalCapacity h

theorem publicOfficial201a1_intro_juror {p : Person} {c : ComplaintText}
    (h : IsJuror p c) : PublicOfficial201a1 p c :=
  .juror h



theorem personSelected201a2_intro_nominated {p : Person} {c : ComplaintText}
    (h : HasBeenNominatedToBePublicOfficial p c) : PersonSelected201a2 p c :=
  .nominated h

theorem personSelected201a2_intro_appointed {p : Person} {c : ComplaintText}
    (h : HasBeenAppointedToBePublicOfficial p c) : PersonSelected201a2 p c :=
  .appointed h

theorem personSelected201a2_intro_officiallyInformed {p : Person} {c : ComplaintText}
    (h : HasBeenOfficiallyInformedOfSelection p c) : PersonSelected201a2 p c :=
  .officiallyInformed h



theorem officialAct201a3_intro {act : OfficialAct} {c : ComplaintText}
    (hDecision : IsDecisionOrActionOnQuestionOrMatter act c)
    (hPending : MatterPendingOrMayByLawBeBrought act c)
    (hCapacity : WithinOfficialCapacityOrPlaceOfTrust act c) : OfficialAct201a3 act c :=
  ⟨hDecision, hPending, hCapacity⟩



theorem coveredOfficialOrSelectee_intro_official {p : Person} {c : ComplaintText}
    (h : IsPublicOfficial p c) : CoveredOfficialOrSelectee p c :=
  .official h

theorem coveredOfficialOrSelectee_intro_selectee {p : Person} {c : ComplaintText}
    (h : IsPersonSelectedToBePublicOfficial p c) : CoveredOfficialOrSelectee p c :=
  .selectee h

theorem coveredOfficialSelecteeOrFormer_intro_official {p : Person} {c : ComplaintText}
    (h : IsPublicOfficial p c) : CoveredOfficialSelecteeOrFormer p c :=
  .official h

theorem coveredOfficialSelecteeOrFormer_intro_former {p : Person} {c : ComplaintText}
    (h : IsFormerPublicOfficial p c) : CoveredOfficialSelecteeOrFormer p c :=
  .former h

theorem coveredOfficialSelecteeOrFormer_intro_selectee {p : Person} {c : ComplaintText}
    (h : IsPersonSelectedToBePublicOfficial p c) : CoveredOfficialSelecteeOrFormer p c :=
  .selectee h



theorem confersThingOfValue_intro_direct
    {payor recipient : Person} {v : ThingOfValue} {c : ComplaintText}
    (h : GivesOffersOrPromisesThingOfValue payor recipient v c) :
    ConfersThingOfValue payor recipient v c :=
  .direct h

theorem confersThingOfValue_intro_thirdPartyBeneficiary
    {payor recipient : Person} {v : ThingOfValue} {c : ComplaintText}
    (h : OffersOrPromisesValueToThirdPartyBeneficiary payor recipient v c) :
    ConfersThingOfValue payor recipient v c :=
  .thirdPartyBeneficiary h



theorem officialActInfluenceIntent_intro
    {payor official : Person} {act : OfficialAct} {c : ComplaintText}
    (hAct : IsOfficialAct act c)
    (hIntent : IntentToInfluenceOfficialAct payor official act c) :
    OfficialActInfluenceIntent payor official act c :=
  ⟨hAct, hIntent⟩

theorem officialActInfluenceBargain_intro
    {official : Person} {v : ThingOfValue} {act : OfficialAct} {c : ComplaintText}
    (hAct : IsOfficialAct act c)
    (hBargain : InReturnForBeingInfluencedInOfficialAct official v act c) :
    OfficialActInfluenceBargain official v act c :=
  ⟨hAct, hBargain⟩

theorem officialActGratuityNexus_intro
    {v : ThingOfValue} {official : Person} {act : OfficialAct} {c : ComplaintText}
    (hAct : IsOfficialAct act c)
    (hNexus : ForOrBecauseOfOfficialActPerformedOrToBePerformed v official act c) :
    OfficialActGratuityNexus v official act c :=
  ⟨hAct, hNexus⟩



theorem briberyIntent201b1_intro_influenceOfficialAct
    {payor official : Person} {act : OfficialAct} {c : ComplaintText}
    (h : OfficialActInfluenceIntent payor official act c) :
    BriberyIntent201b1 payor official act c :=
  .influenceOfficialAct h

theorem briberyIntent201b1_intro_fraudOnUnitedStates
    {payor official : Person} {act : OfficialAct} {c : ComplaintText}
    (h : IntentToInduceFraudOnTheUnitedStates payor official c) :
    BriberyIntent201b1 payor official act c :=
  .fraudOnUnitedStates h

theorem briberyIntent201b1_intro_violationOfLawfulDuty
    {payor official : Person} {act : OfficialAct} {c : ComplaintText}
    (h : IntentToInduceViolationOfLawfulDuty payor official c) :
    BriberyIntent201b1 payor official act c :=
  .violationOfLawfulDuty h

theorem briberyReturn201b2_intro_influencedInOfficialAct
    {official : Person} {v : ThingOfValue} {act : OfficialAct} {c : ComplaintText}
    (h : OfficialActInfluenceBargain official v act c) : BriberyReturn201b2 official v act c :=
  .influencedInOfficialAct h

theorem briberyReturn201b2_intro_allowFraudOnUnitedStates
    {official : Person} {v : ThingOfValue} {act : OfficialAct} {c : ComplaintText}
    (h : InReturnForBeingInfluencedToAllowFraudOnTheUnitedStates official v c) :
    BriberyReturn201b2 official v act c :=
  .allowFraudOnUnitedStates h

theorem briberyReturn201b2_intro_violationOfOfficialDuty
    {official : Person} {v : ThingOfValue} {act : OfficialAct} {c : ComplaintText}
    (h : InReturnForBeingInducedToViolateOfficialDuty official v c) :
    BriberyReturn201b2 official v act c :=
  .violationOfOfficialDuty h

theorem witnessBriberyIntent201b3_intro_influenceTestimony
    {payor witness : Person} {pr : Proceeding} {c : ComplaintText}
    (h : IntentToInfluenceTestimony payor witness pr c) :
    WitnessBriberyIntent201b3 payor witness pr c :=
  .influenceTestimony h

theorem witnessBriberyIntent201b3_intro_induceAbsence
    {payor witness : Person} {pr : Proceeding} {c : ComplaintText}
    (h : IntentToInduceWitnessAbsence payor witness pr c) :
    WitnessBriberyIntent201b3 payor witness pr c :=
  .induceAbsence h

theorem witnessBriberyReturn201b4_intro_influencedInTestimony
    {witness : Person} {v : ThingOfValue} {pr : Proceeding} {c : ComplaintText}
    (h : InReturnForBeingInfluencedInTestimony witness v pr c) :
    WitnessBriberyReturn201b4 witness v pr c :=
  .influencedInTestimony h

theorem witnessBriberyReturn201b4_intro_absentedFromProceeding
    {witness : Person} {v : ThingOfValue} {pr : Proceeding} {c : ComplaintText}
    (h : InReturnForAbsentingFromProceeding witness v pr c) :
    WitnessBriberyReturn201b4 witness v pr c :=
  .absentedFromProceeding h

theorem witnessGratuityNexus_intro_testimony
    {v : ThingOfValue} {witness : Person} {pr : Proceeding} {c : ComplaintText}
    (h : ForOrBecauseOfTestimonyGivenOrToBeGiven v witness pr c) :
    WitnessGratuityNexus v witness pr c :=
  .testimony h

theorem witnessGratuityNexus_intro_absence
    {v : ThingOfValue} {witness : Person} {pr : Proceeding} {c : ComplaintText}
    (h : ForOrBecauseOfAbsenceFromProceeding v witness pr c) :
    WitnessGratuityNexus v witness pr c :=
  .absence h



theorem witnessInQualifyingProceeding_intro
    {witness : Person} {pr : Proceeding} {c : ComplaintText}
    (hProceeding : IsQualifyingFederalProceeding pr c)
    (hTestifies : TestifiesUnderOathAsWitness witness pr c) :
    WitnessInQualifyingProceeding witness pr c :=
  ⟨hProceeding, hTestifies⟩



theorem witnessFeeException201d_intro_statutoryWitnessFee
    {v : ThingOfValue} {pr : Proceeding} {c : ComplaintText}
    (h : IsWitnessFeeProvidedByLaw v c) : WitnessFeeException201d v pr c :=
  .statutoryWitnessFee h

theorem witnessFeeException201d_intro_travelSubsistenceOrLostTime
    {v : ThingOfValue} {pr : Proceeding} {c : ComplaintText}
    (h : IsReasonableTravelSubsistenceOrLostTimePayment v pr c) :
    WitnessFeeException201d v pr c :=
  .travelSubsistenceOrLostTime h

theorem witnessFeeException201d_intro_expertWitnessFee
    {v : ThingOfValue} {pr : Proceeding} {c : ComplaintText}
    (h : IsReasonableExpertWitnessFee v pr c) : WitnessFeeException201d v pr c :=
  .expertWitnessFee h



theorem section201b1_intro
    {payor official : Person} {v : ThingOfValue} {act : OfficialAct} {c : ComplaintText}
    (hCorrupt : ActsCorruptly payor c)
    (hValue : ThingHasValue v c)
    (hConferral : ConfersThingOfValue payor official v c)
    (hStatus : CoveredOfficialOrSelectee official c)
    (hIntent : BriberyIntent201b1 payor official act c) :
    Section201b1 payor official v act c :=
  ⟨hCorrupt, hValue, hConferral, hStatus, hIntent⟩

theorem section201b2_intro
    {official : Person} {v : ThingOfValue} {act : OfficialAct} {c : ComplaintText}
    (hStatus : CoveredOfficialOrSelectee official c)
    (hCorrupt : ActsCorruptly official c)
    (hValue : ThingHasValue v c)
    (hSolicit : DemandsSeeksReceivesAcceptsOrAgreesToAcceptThingOfValue official v c)
    (hBargain : BriberyReturn201b2 official v act c) :
    Section201b2 official v act c :=
  ⟨hStatus, hCorrupt, hValue, hSolicit, hBargain⟩

theorem section201b3_intro
    {payor witness : Person} {v : ThingOfValue} {pr : Proceeding} {c : ComplaintText}
    (hCorrupt : ActsCorruptly payor c)
    (hValue : ThingHasValue v c)
    (hConferral : ConfersThingOfValue payor witness v c)
    (hWitness : WitnessInQualifyingProceeding witness pr c)
    (hIntent : WitnessBriberyIntent201b3 payor witness pr c)
    (hNotExcepted : ¬ WithinWitnessFeeException v pr c) :
    Section201b3 payor witness v pr c :=
  ⟨hCorrupt, hValue, hConferral, hWitness, hIntent, hNotExcepted⟩

theorem section201b4_intro
    {witness : Person} {v : ThingOfValue} {pr : Proceeding} {c : ComplaintText}
    (hCorrupt : ActsCorruptly witness c)
    (hValue : ThingHasValue v c)
    (hSolicit : DemandsSeeksReceivesAcceptsOrAgreesToAcceptThingOfValue witness v c)
    (hWitness : WitnessInQualifyingProceeding witness pr c)
    (hBargain : WitnessBriberyReturn201b4 witness v pr c)
    (hNotExcepted : ¬ WithinWitnessFeeException v pr c) :
    Section201b4 witness v pr c :=
  ⟨hCorrupt, hValue, hSolicit, hWitness, hBargain, hNotExcepted⟩



theorem section201c1A_intro
    {payor official : Person} {v : ThingOfValue} {act : OfficialAct} {c : ComplaintText}
    (hNotAuthorized : ¬ AuthorizedByLawForProperDischargeOfOfficialDuty v official c)
    (hValue : ThingHasValue v c)
    (hConferral : GivesOffersOrPromisesThingOfValue payor official v c)
    (hStatus : CoveredOfficialSelecteeOrFormer official c)
    (hNexus : OfficialActGratuityNexus v official act c) :
    Section201c1A payor official v act c :=
  ⟨hNotAuthorized, hValue, hConferral, hStatus, hNexus⟩

theorem section201c1B_intro
    {official : Person} {v : ThingOfValue} {act : OfficialAct} {c : ComplaintText}
    (hStatus : CoveredOfficialSelecteeOrFormer official c)
    (hNotAuthorized : ¬ AuthorizedByLawForProperDischargeOfOfficialDuty v official c)
    (hValue : ThingHasValue v c)
    (hSolicit : DemandsSeeksOrAcceptsThingOfValuePersonally official v c)
    (hNexus : OfficialActGratuityNexus v official act c) :
    Section201c1B official v act c :=
  ⟨hStatus, hNotAuthorized, hValue, hSolicit, hNexus⟩

theorem section201c2_intro
    {payor witness : Person} {v : ThingOfValue} {pr : Proceeding} {c : ComplaintText}
    (hValue : ThingHasValue v c)
    (hConferral : GivesOffersOrPromisesThingOfValue payor witness v c)
    (hWitness : WitnessInQualifyingProceeding witness pr c)
    (hNexus : WitnessGratuityNexus v witness pr c)
    (hNotExcepted : ¬ WithinWitnessFeeException v pr c) :
    Section201c2 payor witness v pr c :=
  ⟨hValue, hConferral, hWitness, hNexus, hNotExcepted⟩

theorem section201c3_intro
    {witness : Person} {v : ThingOfValue} {pr : Proceeding} {c : ComplaintText}
    (hValue : ThingHasValue v c)
    (hSolicit : DemandsSeeksOrAcceptsThingOfValuePersonally witness v c)
    (hWitness : WitnessInQualifyingProceeding witness pr c)
    (hNexus : WitnessGratuityNexus v witness pr c)
    (hNotExcepted : ¬ WithinWitnessFeeException v pr c) :
    Section201c3 witness v pr c :=
  ⟨hValue, hSolicit, hWitness, hNexus, hNotExcepted⟩



theorem briberyUnderSection201b_intro_officialPayor
    {payor official : Person} {v : ThingOfValue} {act : OfficialAct} {c : ComplaintText}
    (h : Section201b1 payor official v act c) : BriberyUnderSection201b c :=
  .officialPayor payor official v act h

theorem briberyUnderSection201b_intro_officialPayee
    {official : Person} {v : ThingOfValue} {act : OfficialAct} {c : ComplaintText}
    (h : Section201b2 official v act c) : BriberyUnderSection201b c :=
  .officialPayee official v act h

theorem briberyUnderSection201b_intro_witnessPayor
    {payor witness : Person} {v : ThingOfValue} {pr : Proceeding} {c : ComplaintText}
    (h : Section201b3 payor witness v pr c) : BriberyUnderSection201b c :=
  .witnessPayor payor witness v pr h

theorem briberyUnderSection201b_intro_witnessPayee
    {witness : Person} {v : ThingOfValue} {pr : Proceeding} {c : ComplaintText}
    (h : Section201b4 witness v pr c) : BriberyUnderSection201b c :=
  .witnessPayee witness v pr h

theorem gratuityUnderSection201c_intro_officialPayor
    {payor official : Person} {v : ThingOfValue} {act : OfficialAct} {c : ComplaintText}
    (h : Section201c1A payor official v act c) : GratuityUnderSection201c c :=
  .officialPayor payor official v act h

theorem gratuityUnderSection201c_intro_officialPayee
    {official : Person} {v : ThingOfValue} {act : OfficialAct} {c : ComplaintText}
    (h : Section201c1B official v act c) : GratuityUnderSection201c c :=
  .officialPayee official v act h

theorem gratuityUnderSection201c_intro_witnessPayor
    {payor witness : Person} {v : ThingOfValue} {pr : Proceeding} {c : ComplaintText}
    (h : Section201c2 payor witness v pr c) : GratuityUnderSection201c c :=
  .witnessPayor payor witness v pr h

theorem gratuityUnderSection201c_intro_witnessPayee
    {witness : Person} {v : ThingOfValue} {pr : Proceeding} {c : ComplaintText}
    (h : Section201c3 witness v pr c) : GratuityUnderSection201c c :=
  .witnessPayee witness v pr h

theorem violatesSection201_intro_bribery {c : ComplaintText}
    (h : BriberyUnderSection201b c) : ViolatesSection201 c :=
  .bribery h

theorem violatesSection201_intro_gratuity {c : ComplaintText}
    (h : GratuityUnderSection201c c) : ViolatesSection201 c :=
  .gratuity h

end Proving.USC.T18.Ch11.EchoReslice.Elements
