import Proving.USC.T42.Ch6ASchI.Part2.Elements.Types

set_option autoImplicit false









namespace Proving.USC.T42.Ch6ASchI.Part2.Elements
open Proving.USC.Common





axiom IsRegularCorpsCommissionedOfficer (o : Officer) (c : ComplaintText) : Prop




axiom HoldsPermanentRankInPromotableGrade (o : Officer) (c : ComplaintText) : Prop




axiom FoundQualifiedForPromotion (o : Officer) (c : ComplaintText) : Prop




axiom YearsOfServiceAboveJuniorAssistant (o : Officer) (c : ComplaintText) : Nat




axiom RequiredYearsForNextGrade (o : Officer) (c : ComplaintText) : Nat





axiom IsMedicalOfficerRegularCorps (o : Officer) (c : ComplaintText) : Prop




axiom AppointedToAssistantGradeContinuousService (o : Officer) (c : ComplaintText) : Prop




axiom CompletedMedicalInternshipAtAppointment (o : Officer) (c : ComplaintText) : Prop




axiom ReceivedSimilarInternshipCreditUnderOtherLaw (o : Officer) (c : ComplaintText) : Prop





axiom AppliedForRetirement (o : Officer) (c : ComplaintText) : Prop




axiom AgeInYears (o : Officer) (c : ComplaintText) : Nat




axiom YearsOfActiveService (o : Officer) (c : ComplaintText) : Nat






axiom IsCommissionedOfficerOrSurvivingBeneficiary (o : Officer) (c : ComplaintText) : Prop



axiom ServicePerformedInTimeOfWar (o : Officer) (c : ComplaintText) : Prop




axiom ServicePerformedOnMilitaryDetail (o : Officer) (c : ComplaintText) : Prop




axiom ServicePerformedWhilePartOfMilitaryForces (o : Officer) (c : ComplaintText) : Prop






axiom BenefitWithinEnumeratedTitle10Provisions (b : Benefit) (c : ComplaintText) : Prop





axiom ReleasedFromActiveServiceForRetirement (o : Officer) (c : ComplaintText) : Prop




axiom PreviouslyPresentedUnitedStatesFlag (o : Officer) (c : ComplaintText) : Prop





axiom RequestByExecutiveDepartmentHead (d : Detail) (c : ComplaintText) : Prop




axiom DetailAgreementBetweenSecretaryAndDeptHead (d : Detail) (c : ComplaintText) : Prop






axiom RegulationRelatesToMedicalAppointmentQualifications (r : Regulation) (c : ComplaintText) : Prop




axiom RegulationGivesPreferenceToSchoolOfMedicine (r : Regulation) (c : ComplaintText) : Prop





axiom TimeOfWar (c : ComplaintText) : Prop




axiom EmergencyInvolvingNationalDefenseProclaimed (c : ComplaintText) : Prop




axiom ExecutiveOrderDeclaringCorpsMilitaryService (c : ComplaintText) : Prop






axiom IsAppointedAdvisoryCouncilMember (m : CouncilMember) (c : ComplaintText) : Prop




axiom IsNotRegularFullTimeFederalEmployee (m : CouncilMember) (c : ComplaintText) : Prop




axiom EngagedOnAdvisoryCouncilBusiness (m : CouncilMember) (c : ComplaintText) : Prop






axiom IsAppointmentToCoveredAdvisoryCommittee (a : Appointment) (c : ComplaintText) : Prop




axiom ConsideredPoliticalAffiliationInAppointment (a : Appointment) (c : ComplaintText) : Prop

end Proving.USC.T42.Ch6ASchI.Part2.Elements
