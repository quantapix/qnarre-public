import Proving.USC.T42.Ch6ASchI.Part2.Elements.Predicates

set_option autoImplicit false












namespace Proving.USC.T42.Ch6ASchI.Part2.Elements
open Proving.USC.Common




def MeetsLengthOfServiceRequirement (o : Officer) (c : ComplaintText) : Prop :=
  YearsOfServiceAboveJuniorAssistant o c ≥ RequiredYearsForNextGrade o c


def AttainedRetirementAge (o : Officer) (c : ComplaintText) : Prop :=
  AgeInYears o c ≥ 64


def CompletedThirtyYearsActiveService (o : Officer) (c : ComplaintText) : Prop :=
  YearsOfActiveService o c ≥ 30






structure Section211d2Promotion (o : Officer) (c : ComplaintText) : Prop where
  officer : IsRegularCorpsCommissionedOfficer o c
  promotableGrade : HoldsPermanentRankInPromotableGrade o c
  qualified : FoundQualifiedForPromotion o c
  meetsService : MeetsLengthOfServiceRequirement o c






structure Section211cInternshipCredit (o : Officer) (c : ComplaintText) : Prop where
  medicalOfficer : IsMedicalOfficerRegularCorps o c
  appointed : AppointedToAssistantGradeContinuousService o c
  internship : CompletedMedicalInternshipAtAppointment o c
  noOtherCredit : ¬ ReceivedSimilarInternshipCreditUnderOtherLaw o c





inductive RetirementOnApplication (o : Officer) (c : ComplaintText) : Prop where
  | byAge (applied : AppliedForRetirement o c) (officer : IsRegularCorpsCommissionedOfficer o c)
      (age : AttainedRetirementAge o c)
  | byService (applied : AppliedForRetirement o c) (officer : IsRegularCorpsCommissionedOfficer o c)
      (service : CompletedThirtyYearsActiveService o c)





inductive QualifyingMilitaryServiceCircumstance (o : Officer) (c : ComplaintText) : Prop where
  | war (h : ServicePerformedInTimeOfWar o c)
  | detail (h : ServicePerformedOnMilitaryDetail o c)
  | militaryForces (h : ServicePerformedWhilePartOfMilitaryForces o c)





structure Section213MilitaryBenefit (o : Officer) (c : ComplaintText) : Prop where
  officerOrBeneficiary : IsCommissionedOfficerOrSurvivingBeneficiary o c
  circumstance : QualifyingMilitaryServiceCircumstance o c





structure Section213aRightsEntitlement (o : Officer) (b : Benefit) (c : ComplaintText) : Prop where
  officerOrBeneficiary : IsCommissionedOfficerOrSurvivingBeneficiary o c
  enumerated : BenefitWithinEnumeratedTitle10Provisions b c





structure Section214FlagPresentation (o : Officer) (c : ComplaintText) : Prop where
  released : ReleasedFromActiveServiceForRetirement o c
  notPreviouslyPresented : ¬ PreviouslyPresentedUnitedStatesFlag o c





structure Section215aDetailAuthority (d : Detail) (c : ComplaintText) : Prop where
  request : RequestByExecutiveDepartmentHead d c
  agreement : DetailAgreementBetweenSecretaryAndDeptHead d c





structure Section216cCompliantRegulation (r : Regulation) (c : ComplaintText) : Prop where
  qualificationRegulation : RegulationRelatesToMedicalAppointmentQualifications r c
  noPreference : ¬ RegulationGivesPreferenceToSchoolOfMedicine r c





inductive WarOrNationalDefenseEmergency (c : ComplaintText) : Prop where
  | war (h : TimeOfWar c)
  | emergency (h : EmergencyInvolvingNationalDefenseProclaimed c)



structure Section217MilitaryServiceDeclaration (c : ComplaintText) : Prop where
  trigger : WarOrNationalDefenseEmergency c
  executiveOrder : ExecutiveOrderDeclaringCorpsMilitaryService c





structure Section217aMemberCompensation (m : CouncilMember) (c : ComplaintText) : Prop where
  member : IsAppointedAdvisoryCouncilMember m c
  notFullTime : IsNotRegularFullTimeFederalEmployee m c
  engaged : EngagedOnAdvisoryCouncilBusiness m c





structure Section217a1CompliantAppointment (a : Appointment) (c : ComplaintText) : Prop where
  covered : IsAppointmentToCoveredAdvisoryCommittee a c
  apolitical : ¬ ConsideredPoliticalAffiliationInAppointment a c

end Proving.USC.T42.Ch6ASchI.Part2.Elements
