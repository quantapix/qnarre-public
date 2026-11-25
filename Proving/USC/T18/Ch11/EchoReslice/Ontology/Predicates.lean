







import Proving.USC.T18.Ch11.EchoReslice.Ontology.Types
import Proving.USC.Common.Types

set_option autoImplicit false

open Proving.USC.Common (Person Entity ComplaintText Time)

namespace Proving.USC.T18.Ch11.EchoReslice.Ontology







axiom IsMemberOfCongress (p : Person) (c : ComplaintText) : Prop



axiom IsDelegateToCongress (p : Person) (c : ComplaintText) : Prop



axiom IsResidentCommissioner (p : Person) (c : ComplaintText) : Prop





axiom HasQualifiedForOffice (p : Person) (c : ComplaintText) : Prop








axiom IsOfficerOfTheUnitedStates (p : Person) (c : ComplaintText) : Prop




axiom IsEmployeeOfTheUnitedStates (p : Person) (c : ComplaintText) : Prop





axiom ActsForOrOnBehalfOfTheUnitedStates (p : Person) (c : ComplaintText) : Prop



axiom IsTheUnitedStates (g : GovernmentUnit) (c : ComplaintText) : Prop



axiom IsDepartmentOfGovernment (g : GovernmentUnit) (c : ComplaintText) : Prop



axiom IsAgencyOfGovernment (g : GovernmentUnit) (c : ComplaintText) : Prop



axiom IsBranchOfGovernment (g : GovernmentUnit) (c : ComplaintText) : Prop





axiom IsDistrictOfColumbiaUnit (g : GovernmentUnit) (c : ComplaintText) : Prop



axiom IsOfficialFunction (f : OfficialFunction) (c : ComplaintText) : Prop



axiom ActsInOfficialFunction (p : Person) (f : OfficialFunction)
    (c : ComplaintText) : Prop




axiom ActsUnderOrByAuthorityOfGovernmentUnit (p : Person) (g : GovernmentUnit)
    (c : ComplaintText) : Prop








axiom IsJuror (p : Person) (c : ComplaintText) : Prop








axiom IsPublicOfficialPost (o : Office) (c : ComplaintText) : Prop



axiom IsNominationEvent (s : SelectionEvent) (c : ComplaintText) : Prop



axiom IsAppointmentEvent (s : SelectionEvent) (c : ComplaintText) : Prop





axiom IsOfficialInformingOfProspectiveSelection (s : SelectionEvent)
    (c : ComplaintText) : Prop



axiom SelectionEventNamesPerson (s : SelectionEvent) (p : Person)
    (c : ComplaintText) : Prop



axiom SelectionEventTargetsPost (s : SelectionEvent) (o : Office)
    (c : ComplaintText) : Prop







axiom IsDecision (a : DecisionOrAction) (c : ComplaintText) : Prop



axiom IsAction (a : DecisionOrAction) (c : ComplaintText) : Prop



axiom IsQuestionMatter (m : Matter) (c : ComplaintText) : Prop



axiom IsMatterProper (m : Matter) (c : ComplaintText) : Prop



axiom IsCauseMatter (m : Matter) (c : ComplaintText) : Prop



axiom IsSuitMatter (m : Matter) (c : ComplaintText) : Prop




axiom IsProceedingMatter (m : Matter) (c : ComplaintText) : Prop



axiom IsControversyMatter (m : Matter) (c : ComplaintText) : Prop



axiom DecisionOrActionOnMatter (a : DecisionOrAction) (m : Matter)
    (c : ComplaintText) : Prop




axiom MayAtAnyTimeBePendingBeforeOfficial (m : Matter) (p : Person)
    (c : ComplaintText) : Prop




axiom MayByLawBeBroughtBeforeOfficial (m : Matter) (p : Person)
    (c : ComplaintText) : Prop




axiom ActsInOfficialCapacity (p : Person) (c : ComplaintText) : Prop




axiom ActsInPlaceOfTrustOrProfit (p : Person) (c : ComplaintText) : Prop





axiom PerformedOrToBePerformedAt (a : DecisionOrAction) (t : Time)
    (c : ComplaintText) : Prop








axiom IsAnythingOfValue (v : ThingOfValue) (c : ComplaintText) : Prop





axiom monetaryEquivalentOfThingOfValue (v : ThingOfValue)
    (c : ComplaintText) : Nat




axiom ActsCorruptly (p : Person) (c : ComplaintText) : Prop





axiom IsFormerPublicOfficial (p : Person) (c : ComplaintText) : Prop




axiom IsLawfulDutyOfOfficial (d : Duty) (p : Person) (c : ComplaintText) : Prop






axiom IsOfficialDutyOfOfficial (d : Duty) (p : Person)
    (c : ComplaintText) : Prop




axiom IsFraudOnTheUnitedStates (f : Fraud) (c : ComplaintText) : Prop





axiom IsBeneficiaryEntity (e : Entity) (c : ComplaintText) : Prop



axiom IsOfficeOfHonor (o : Office) (c : ComplaintText) : Prop



axiom IsOfficeOfTrust (o : Office) (c : ComplaintText) : Prop




axiom IsOfficeOfProfit (o : Office) (c : ComplaintText) : Prop




axiom IsUnderTheUnitedStates (o : Office) (c : ComplaintText) : Prop





axiom ProvidedByLawForProperDischargeOfOfficialDuty (v : ThingOfValue)
    (c : ComplaintText) : Prop








axiom IsCourt (t : Tribunal) (c : ComplaintText) : Prop




axiom IsCommitteeOfEitherHouseOrBothHouses (t : Tribunal)
    (c : ComplaintText) : Prop



axiom IsAgencyBody (t : Tribunal) (c : ComplaintText) : Prop



axiom IsCommissionBody (t : Tribunal) (c : ComplaintText) : Prop




axiom IsOfficerBody (t : Tribunal) (c : ComplaintText) : Prop




axiom AuthorizedByLawsOfUnitedStatesToHearEvidence (t : Tribunal)
    (c : ComplaintText) : Prop




axiom AuthorizedByLawsOfUnitedStatesToTakeTestimony (t : Tribunal)
    (c : ComplaintText) : Prop



axiom IsTrial (pr : Proceeding) (c : ComplaintText) : Prop



axiom IsHearing (pr : Proceeding) (c : ComplaintText) : Prop




axiom IsOtherProceeding (pr : Proceeding) (c : ComplaintText) : Prop



axiom ProceedingHeldBeforeTribunal (pr : Proceeding) (t : Tribunal)
    (c : ComplaintText) : Prop




axiom IsWitnessUponProceeding (p : Person) (pr : Proceeding)
    (c : ComplaintText) : Prop




axiom AbsentsSelfFromProceeding (p : Person) (pr : Proceeding)
    (c : ComplaintText) : Prop



axiom IsTestimonyOfWitness (tst : Testimony) (p : Person)
    (c : ComplaintText) : Prop



axiom GivenUnderOath (tst : Testimony) (c : ComplaintText) : Prop



axiom GivenUnderAffirmation (tst : Testimony) (c : ComplaintText) : Prop








axiom IsWitnessFeeProvidedByLaw (v : ThingOfValue) (c : ComplaintText) : Prop




axiom IsReasonableCostOfTravelAndSubsistence (v : ThingOfValue)
    (c : ComplaintText) : Prop



axiom IsReasonableValueOfTimeLostInAttendance (v : ThingOfValue)
    (c : ComplaintText) : Prop




axiom IsExpertWitness (p : Person) (c : ComplaintText) : Prop




axiom IsReasonableFeeForPreparationOfExpertOpinion (v : ThingOfValue)
    (c : ComplaintText) : Prop





axiom IsPartyUponWhoseBehalfWitnessIsCalled (payer : Person) (w : Person)
    (c : ComplaintText) : Prop

end Proving.USC.T18.Ch11.EchoReslice.Ontology
