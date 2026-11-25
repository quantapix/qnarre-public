












import Proving.USC.T42.Ch6ASchI.Part3.Elements.Types

namespace Proving.USC.T42.Ch6ASchI.Part3.Elements

open Proving.USC.Common






axiom ClaimIsForPersonalInjury (c : ComplaintText) : Prop





axiom InjuryFromMedicalOrRelatedFunction (p : Person) (c : ComplaintText) : Prop




axiom IsPHSOfficerOrEmployee (p : Person) (c : ComplaintText) : Prop






axiom ActedWithinScopeOfEmployment (p : Person) (c : ComplaintText) : Prop









axiom AttorneyGeneralCertifiedScopeOfEmployment (p : Person) (c : ComplaintText) : Prop







axiom IsFQHCEntity (e : Entity) (c : ComplaintText) : Prop






axiom SecretaryApprovedDeemingApplication (e : Entity) (c : ComplaintText) : Prop






axiom DeemedActWithinCoverageDate (c : ComplaintText) : Prop







axiom UnitedStatesMadePayment (c : ComplaintText) : Prop





axiom IsCoveredPerson (p : Person) (c : ComplaintText) : Prop





axiom FailedContractualObligation (p : Person) (c : ComplaintText) : Prop





axiom EngagedInGrossMisconduct (p : Person) (c : ComplaintText) : Prop








axiom IsMRCOrESARVHPMember (p : Person) (c : ComplaintText) : Prop






axiom RespondingToDeclaredEmergency (p : Person) (c : ComplaintText) : Prop





axiom ActDuringInitialPeriodRelatedToEmergency (p : Person) (c : ComplaintText) : Prop




axiom ActInDeclarationState (p : Person) (c : ComplaintText) : Prop





axiom ActedInResponderCapacity (p : Person) (c : ComplaintText) : Prop






axiom ActWithinScopeOfLicense (p : Person) (c : ComplaintText) : Prop






axiom StateAuthorizedDeployment (p : Person) (c : ComplaintText) : Prop







axiom IsFederallyFundedCMHCFacility (e : Entity) (c : ComplaintText) : Prop







axiom WithinTwentyYearRecoveryPeriod (e : Entity) (c : ComplaintText) : Prop






axiom SoldToUnqualifiedOrDisapprovedTransferee (e : Entity) (c : ComplaintText) : Prop





axiom CeasedCMHCUse (e : Entity) (c : ComplaintText) : Prop







axiom WorePHSInsigniaOrUniform (p : Person) (c : ComplaintText) : Prop




axiom IsNotCommissionedOfficer (p : Person) (c : ComplaintText) : Prop






axiom NotAuthorizedByRegulation (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T42.Ch6ASchI.Part3.Elements
