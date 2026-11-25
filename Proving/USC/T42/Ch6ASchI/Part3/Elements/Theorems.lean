






import Proving.USC.T42.Ch6ASchI.Part3.Elements.Statute

namespace Proving.USC.T42.Ch6ASchI.Part3.Elements

open Proving.USC.Common


theorem section233aExclusiveRemedy_intro {p c}
    (hInjury : ClaimIsForPersonalInjury c)
    (hFunction : InjuryFromMedicalOrRelatedFunction p c)
    (hStatus : IsPHSOfficerOrEmployee p c)
    (hScope : ActedWithinScopeOfEmployment p c) :
    Section233aExclusiveRemedy p c :=
  ⟨hInjury, hFunction, hStatus, hScope⟩


theorem section233cFederalSubstitution_intro {p c}
    (hCovered : Section233aExclusiveRemedy p c)
    (hCertified : AttorneyGeneralCertifiedScopeOfEmployment p c) :
    Section233cFederalSubstitution p c :=
  ⟨hCovered, hCertified⟩


theorem section233gDeemedEmployee_intro {e c}
    (hEntity : IsFQHCEntity e c)
    (hApproved : SecretaryApprovedDeemingApplication e c)
    (hDate : DeemedActWithinCoverageDate c) :
    Section233gDeemedEmployee e c :=
  ⟨hEntity, hApproved, hDate⟩


theorem section233p6Fault_ofContractual {p c}
    (h : FailedContractualObligation p c) : Section233p6Fault p c := .contractual h
theorem section233p6Fault_ofMisconduct {p c}
    (h : EngagedInGrossMisconduct p c) : Section233p6Fault p c := .misconduct h


theorem section233p6Recovery_intro {p c}
    (hPayment : UnitedStatesMadePayment c)
    (hCovered : IsCoveredPerson p c)
    (hFault : Section233p6Fault p c) :
    Section233p6Recovery p c :=
  ⟨hPayment, hCovered, hFault⟩


theorem section234EmergencyResponderProtection_intro {p c}
    (hMember : IsMRCOrESARVHPMember p c)
    (hResponding : RespondingToDeclaredEmergency p c)
    (hActInPeriod : ActDuringInitialPeriodRelatedToEmergency p c)
    (hInState : ActInDeclarationState p c)
    (hCapacity : ActedInResponderCapacity p c)
    (hLicense : ActWithinScopeOfLicense p c)
    (hAuth : StateAuthorizedDeployment p c) :
    Section234EmergencyResponderProtection p c :=
  ⟨hMember, hResponding, hActInPeriod, hInState, hCapacity, hLicense, hAuth⟩


theorem section238lTrigger_ofSold {e c}
    (h : SoldToUnqualifiedOrDisapprovedTransferee e c) : Section238lTrigger e c := .sold h
theorem section238lTrigger_ofCeased {e c}
    (h : CeasedCMHCUse e c) : Section238lTrigger e c := .ceased h


theorem section238lRecovery_intro {e c}
    (hFacility : IsFederallyFundedCMHCFacility e c)
    (hPeriod : WithinTwentyYearRecoveryPeriod e c)
    (hTrigger : Section238lTrigger e c) :
    Section238lRecovery e c :=
  ⟨hFacility, hPeriod, hTrigger⟩


theorem section238gUniformViolation_intro {p c}
    (hWore : WorePHSInsigniaOrUniform p c)
    (hNotOfficer : IsNotCommissionedOfficer p c)
    (hNotAuth : NotAuthorizedByRegulation p c) :
    Section238gUniformViolation p c :=
  ⟨hWore, hNotOfficer, hNotAuth⟩

end Proving.USC.T42.Ch6ASchI.Part3.Elements
