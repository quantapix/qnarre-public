








import Proving.USC.T42.Ch6ASchI.Part3.Elements.Predicates

namespace Proving.USC.T42.Ch6ASchI.Part3.Elements

open Proving.USC.Common







structure Section233aExclusiveRemedy (p : Person) (c : ComplaintText) : Prop where
  personalInjury  : ClaimIsForPersonalInjury c
  medicalFunction : InjuryFromMedicalOrRelatedFunction p c
  phsStatus       : IsPHSOfficerOrEmployee p c
  withinScope     : ActedWithinScopeOfEmployment p c







structure Section233cFederalSubstitution (p : Person) (c : ComplaintText) : Prop where
  covered   : Section233aExclusiveRemedy p c
  certified : AttorneyGeneralCertifiedScopeOfEmployment p c







structure Section233gDeemedEmployee (e : Entity) (c : ComplaintText) : Prop where
  fundedEntity : IsFQHCEntity e c
  approved     : SecretaryApprovedDeemingApplication e c
  withinDate   : DeemedActWithinCoverageDate c






inductive Section233p6Fault (p : Person) (c : ComplaintText) : Prop where
  | contractual (h : FailedContractualObligation p c)
  | misconduct  (h : EngagedInGrossMisconduct p c)




structure Section233p6Recovery (p : Person) (c : ComplaintText) : Prop where
  payment       : UnitedStatesMadePayment c
  coveredPerson : IsCoveredPerson p c
  fault         : Section233p6Fault p c








structure Section234EmergencyResponderProtection (p : Person) (c : ComplaintText) : Prop where
  member          : IsMRCOrESARVHPMember p c
  responding      : RespondingToDeclaredEmergency p c
  actInPeriod     : ActDuringInitialPeriodRelatedToEmergency p c
  inDeclState     : ActInDeclarationState p c
  inCapacity      : ActedInResponderCapacity p c
  withinLicense   : ActWithinScopeOfLicense p c
  stateAuthorized : StateAuthorizedDeployment p c





inductive Section238lTrigger (e : Entity) (c : ComplaintText) : Prop where
  | sold   (h : SoldToUnqualifiedOrDisapprovedTransferee e c)
  | ceased (h : CeasedCMHCUse e c)





structure Section238lRecovery (e : Entity) (c : ComplaintText) : Prop where
  fundedFacility : IsFederallyFundedCMHCFacility e c
  withinPeriod   : WithinTwentyYearRecoveryPeriod e c
  trigger        : Section238lTrigger e c






structure Section238gUniformViolation (p : Person) (c : ComplaintText) : Prop where
  wore          : WorePHSInsigniaOrUniform p c
  notOfficer    : IsNotCommissionedOfficer p c
  notAuthorized : NotAuthorizedByRegulation p c

end Proving.USC.T42.Ch6ASchI.Part3.Elements
