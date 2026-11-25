import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch13.Reearn.Procedure.Types

set_option autoImplicit false











namespace Proving.USC.T18.Ch13.Reearn.Procedure

open Proving.USC.Common







axiom StateJurisdictionAbsentSection245 (c : ComplaintText) : Prop





axiom StateOrLocalProsecutionResponsibilityRetained245 (c : ComplaintText) : Prop






axiom OffenseDescribedInSection245 (pr : Prosecution) (c : ComplaintText) : Prop




axiom ProsecutionUndertakenByUnitedStates245 (pr : Prosecution) (c : ComplaintText) : Prop



axiom CertificationInWriting245 (cert : Certification) (c : ComplaintText) : Prop





axiom CertifyingOfficerAuthorized245 (o : Person) (c : ComplaintText) : Prop





axiom CertificationFunctionNotDelegated245 (cert : Certification) (o : Person)
    (c : ComplaintText) : Prop




axiom CertifiesProsecutionInPublicInterest245 (cert : Certification)
    (c : ComplaintText) : Prop




axiom CertifiesNecessaryToSecureSubstantialJustice245 (cert : Certification)
    (c : ComplaintText) : Prop




axiom certificationDay245 (cert : Certification) (c : ComplaintText) : Nat




axiom prosecutionCommencementDay245 (pr : Prosecution) (c : ComplaintText) : Nat







axiom InvestigationOpenedByFederalAuthority245 (inv : Investigation)
    (c : ComplaintText) : Prop





axiom OffenseDescribedInSection247 (pr : Prosecution) (c : ComplaintText) : Prop



axiom ProsecutionUndertakenByUnitedStates247 (pr : Prosecution) (c : ComplaintText) : Prop



axiom CertificationInWriting247 (cert : Certification) (c : ComplaintText) : Prop




axiom CertifyingOfficerIsAttorneyGeneralOrDesignee247 (o : Person)
    (c : ComplaintText) : Prop




axiom CertifiesProsecutionInPublicInterest247 (cert : Certification)
    (c : ComplaintText) : Prop




axiom CertifiesNecessaryToSecureSubstantialJustice247 (cert : Certification)
    (c : ComplaintText) : Prop







axiom NoncapitalOffense247 (pr : Prosecution) (c : ComplaintText) : Prop




axiom IndictmentFoundOrInformationInstituted247 (ci : ChargingInstrument)
    (pr : Prosecution) (c : ComplaintText) : Prop




axiom offenseCommissionDay247 (pr : Prosecution) (c : ComplaintText) : Nat




axiom chargingInstrumentDay247 (ci : ChargingInstrument) (c : ComplaintText) : Nat








axiom ConductProhibitedBySubsectionA248 (d : Person) (c : ComplaintText) : Prop





axiom ParentOrGuardianActivityDirectedExclusivelyAtMinor248 (d : Person)
    (c : ComplaintText) : Prop



axiom PriorConvictionUnderSection248 (conv : Conviction) (d : Person)
    (c : ComplaintText) : Prop




axiom priorConvictionDay248 (conv : Conviction) (c : ComplaintText) : Nat




axiom instantOffenseDay248 (pr : Prosecution) (c : ComplaintText) : Nat






axiom PersonAggrievedByProhibitedConduct248 (p : Person) (c : ComplaintText) : Prop




axiom CivilActionCommenced248 (act : CivilAction) (p : Person) (c : ComplaintText) : Prop






axiom PlaintiffProvidesOrObtainsReproductiveHealthServices248 (p : Person)
    (c : ComplaintText) : Prop






axiom PlaintiffExercisingReligiousFreedomAtPlaceOfWorship248 (p : Person)
    (c : ComplaintText) : Prop




axiom PlaintiffEntityOwnsOrOperatesPlaceOfWorship248 (p : Person)
    (c : ComplaintText) : Prop




axiom StatutoryDamagesElected248 (act : CivilAction) (c : ComplaintText) : Prop




axiom electionDay248 (act : CivilAction) (c : ComplaintText) : Nat




axiom finalJudgmentDay248 (act : CivilAction) (c : ComplaintText) : Nat



axiom FinalJudgmentRendered248 (act : CivilAction) (c : ComplaintText) : Prop







axiom AttorneyGeneralHasReasonableCause248 (c : ComplaintText) : Prop





axiom StateAttorneyGeneralHasReasonableCause248 (c : ComplaintText) : Prop




axiom CommencedInAppropriateDistrictCourt248 (act : CivilAction) (ct : DistrictCourt)
    (c : ComplaintText) : Prop




axiom ActionBroughtInNameOfStateAsParensPatriae248 (act : CivilAction)
    (c : ComplaintText) : Prop




axiom OnBehalfOfNaturalPersonsResidingInState248 (act : CivilAction)
    (c : ComplaintText) : Prop






axiom StateOrLocalPenaltiesOrRemediesAvailable248 (c : ComplaintText) : Prop

end Proving.USC.T18.Ch13.Reearn.Procedure
