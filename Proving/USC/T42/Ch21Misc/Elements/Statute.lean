import Proving.USC.Common.Types
import Proving.USC.T42.Ch21Misc.Elements.Types
import Proving.USC.T42.Ch21Misc.Elements.Predicates






namespace Proving.USC.T42.Ch21Misc.Elements
open Proving.USC.Common





inductive ProgramOrActivity (e : Entity) (c : ComplaintText) : Prop where

  | stateLocal
      (instrumentality : IsStateOrLocalInstrumentality e c)
      (assistance : ReceivesFederalFinancialAssistance e c) : ProgramOrActivity e c

  | education
      (educational : IsEducationalEntity e c)
      (assistance : ReceivesFederalFinancialAssistance e c) : ProgramOrActivity e c


  | privateOrganization
      (organization : IsCoveredPrivateOrganization e c)
      (assistance : ReceivesFederalFinancialAssistance e c) : ProgramOrActivity e c

  | separateFacility
      (facility : IsPlantOrSeparateFacility e c)
      (assistance : ReceivesFederalFinancialAssistance e c) : ProgramOrActivity e c

  | jointEntity
      (joint : IsJointlyEstablishedEntity e c)
      (assistance : ReceivesFederalFinancialAssistance e c) : ProgramOrActivity e c



structure Section2000e1Overcome (e : Entity) (p : Person) (c : ComplaintText) : Prop where

  notAlienAbroad : ¬ EmploysAliensOutsideUS e p c

  notReligiousEmployment : ¬ ReligiousEntityReligionBasedEmployment e p c

  notForeignLawConflict : ¬ ForeignWorkplaceLawConflict e p c

  notForeignPersonOps : ¬ ForeignPersonNotAmericanControlled e c




structure Section2000e1c1Attribution (e corp : Entity) (pr : EmploymentPractice) (c : ComplaintText) : Prop where
  controls : ControlsForeignCorporation e corp c
  prohibitedPractice : EngagedInProhibitedPractice corp pr c




structure Section2000e7Preserved (l : Law) (c : ComplaintText) : Prop where
  imposesLiability : StateLawImposesLiability l c
  notUnlawfulMandate : ¬ StateLawRequiresOrPermitsUnlawfulPractice l c


structure Section2000e10a (e : Entity) (c : ComplaintText) : Prop where
  coveredEntity : IsCoveredPostingEntity e c
  failedToPost : FailedToPostRequiredNotice e c



structure Section2000e10b (e : Entity) (c : ComplaintText) : Prop where
  violation : Section2000e10a e c
  willful : ActedWithScienter e c



structure Section2000e11Preserved (l : Law) (c : ComplaintText) : Prop where
  veteransPreference : CreatesVeteransPreference l c




structure Section2000e13Offense (d v : Person) (c : ComplaintText) : Prop where
  commissionPersonnel : IsCommissionPersonnel v c
  killing : KillsInViolationOf1114 d v c
  officialFunctionNexus : EngagedInOrOnAccountOfOfficialDuties v c



structure Section2000e14Compliance (e : Entity) (c : ComplaintText) : Prop where
  coordination : DevelopsCoordinationPolicies e c
  annualReport : TransmitsAnnualReport e c



structure Section2000e15Compliance (p : Person) (c : ComplaintText) : Prop where
  convenes : ConvenesLeadershipConferences p c
  invites : InvitesEnumeratedParticipants p c




structure Section2000e17Violation (e : Entity) (k : GovContract) (pl : AffirmativeActionPlan) (c : ComplaintText) : Prop where
  planAccepted : HasAcceptedAffirmativeActionPlan e pl c
  sameFacility : PlanForSameFacility pl c
  withinTwelveMonths : AcceptedWithinTwelveMonths pl c

  deemedAccepted : PlanDeemedAccepted pl c

  noSubstantialDeviation : ¬ SubstantialDeviationFromPlan e pl c
  actionTaken : ContractActionTaken k e c
  noFullHearing : ¬ AccordedFullHearing e k c

end Proving.USC.T42.Ch21Misc.Elements
