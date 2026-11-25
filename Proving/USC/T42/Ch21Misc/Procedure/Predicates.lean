









import Proving.USC.T42.Ch21Misc.Procedure.Types

namespace Proving.USC.T42.Ch21Misc.Procedure

open Proving.USC.Common













axiom IsGovernmentOperation (e : CoveredEntity) (c : ComplaintText) : Prop





axiom IsEducationOperation (e : CoveredEntity) (c : ComplaintText) : Prop







axiom IsPrivateOperation (e : CoveredEntity) (c : ComplaintText) : Prop




axiom IsJointEntityOperation (e : CoveredEntity) (c : ComplaintText) : Prop





axiom OperativeCategoryMatched (e : CoveredEntity) (c : ComplaintText) : Prop





axiom FundingExtendedToPart (e : CoveredEntity) (c : ComplaintText) : Prop





axiom EmploysAliensOutsideAnyState (e : Entity) (c : ComplaintText) : Prop





axiom IsReligiousEntityEmployingCoreligionists (e : Entity) (c : ComplaintText) : Prop





axiom ForeignLawComplianceConflict (e : Entity) (c : ComplaintText) : Prop




axiom IsForeignPersonNotControlledByAmericanEmployer (e : Entity) (c : ComplaintText) : Prop





axiom EmployerControlsForeignCorporation (e corp : Entity) (c : ComplaintText) : Prop




axiom PracticeEngagedInByForeignCorporation (corp : Entity) (c : ComplaintText) : Prop






axiom StateLawImposesLiabilityOrPenalty (c : ComplaintText) : Prop





axiom StateLawDoesNotRequireUnlawfulPractice (c : ComplaintText) : Prop






axiom NoticePostingDutyApplies (e : Entity) (c : ComplaintText) : Prop




axiom ApprovedNoticePostedAndMaintained (e : Entity) (c : ComplaintText) : Prop



axiom WillfulFailureToPost (e : Entity) (c : ComplaintText) : Prop




axiom FineWithinHundredDollarCap (e : Entity) (c : ComplaintText) : Prop







axiom LawCreatesVeteransPreference (c : ComplaintText) : Prop







axiom VictimWasCommissionPersonnelOnOfficialDuty (victim : Person) (c : ComplaintText) : Prop





axiom KillingInViolationOfSection1114 (perp victim : Person) (c : ComplaintText) : Prop






axiom AnnualReportTransmitted (c : ComplaintText) : Prop




axiom TransmittedOnOrBeforeOctoberFirst (c : ComplaintText) : Prop






axiom ConferenceConvened (c : ComplaintText) : Prop




axiom ConvenedAsSoonAsFeasibleAfterEnactment (c : ComplaintText) : Prop





axiom RequiredParticipantsInvited (c : ComplaintText) : Prop






axiom PlanAcceptedByComplianceAgency (pl : AffirmativeActionPlan) (e : Entity) (c : ComplaintText) : Prop





axiom OfccDidNotDisapproveWithinFortyFiveDays (pl : AffirmativeActionPlan) (c : ComplaintText) : Prop




axiom AcceptanceWithinPastTwelveMonths (pl : AffirmativeActionPlan) (e : Entity) (c : ComplaintText) : Prop





axiom NoSubstantialDeviationFromPlan (pl : AffirmativeActionPlan) (e : Entity) (c : ComplaintText) : Prop





axiom ContractActionTaken (k : GovernmentContract) (e : Entity) (c : ComplaintText) : Prop





axiom FullHearingAndAdjudicationAccorded (e : Entity) (c : ComplaintText) : Prop

end Proving.USC.T42.Ch21Misc.Procedure
