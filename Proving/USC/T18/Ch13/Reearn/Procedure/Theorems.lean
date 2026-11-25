import Proving.USC.T18.Ch13.Reearn.Procedure.Statute

set_option autoImplicit false










namespace Proving.USC.T18.Ch13.Reearn.Procedure

open Proving.USC.Common



theorem concurrentJurisdiction245_intro {c : ComplaintText}
    (hJur : StateJurisdictionAbsentSection245 c)
    (hResp : StateOrLocalProsecutionResponsibilityRetained245 c) :
    ConcurrentJurisdiction245 c :=
  ⟨hJur, hResp⟩

theorem validCertification245_intro {cert : Certification} {o : Person}
    {c : ComplaintText}
    (hWriting : CertificationInWriting245 cert c)
    (hOfficer : CertifyingOfficerAuthorized245 o c)
    (hNotDelegated : CertificationFunctionNotDelegated245 cert o c)
    (hPublic : CertifiesProsecutionInPublicInterest245 cert c)
    (hJustice : CertifiesNecessaryToSecureSubstantialJustice245 cert c) :
    ValidCertification245 cert o c :=
  ⟨hWriting, hOfficer, hNotDelegated, hPublic, hJustice⟩

theorem certificationPrecedesProsecution245_intro {cert : Certification}
    {pr : Prosecution} {c : ComplaintText}
    (h : certificationDay245 cert c ≤ prosecutionCommencementDay245 pr c) :
    CertificationPrecedesProsecution245 cert pr c :=
  h

theorem authorizedProsecution245_intro {pr : Prosecution} {cert : Certification}
    {o : Person} {c : ComplaintText}
    (hScope : OffenseDescribedInSection245 pr c)
    (hUS : ProsecutionUndertakenByUnitedStates245 pr c)
    (hCert : ValidCertification245 cert o c)
    (hOrder : CertificationPrecedesProsecution245 cert pr c) :
    AuthorizedProsecution245 pr cert o c :=
  ⟨hScope, hUS, hCert, hOrder⟩



theorem reachableStage245_investigated_intro {inv : Investigation} {pr : Prosecution}
    {cert : Certification} {o : Person} {c : ComplaintText}
    (hOpened : InvestigationOpenedByFederalAuthority245 inv c) :
    ReachableStage245 inv pr cert o c ProsecutionStage.Investigated :=
  ReachableStage245.investigated ReachableStage245.uninitiated hOpened



theorem reachableStage245_prosecuted_intro {inv : Investigation} {pr : Prosecution}
    {cert : Certification} {o : Person} {c : ComplaintText}
    (hCert : ValidCertification245 cert o c)
    (hAuth : AuthorizedProsecution245 pr cert o c) :
    ReachableStage245 inv pr cert o c ProsecutionStage.Prosecuted :=
  ReachableStage245.prosecuted (ReachableStage245.certified hCert) hAuth



theorem validCertification247_intro {cert : Certification} {o : Person}
    {c : ComplaintText}
    (hWriting : CertificationInWriting247 cert c)
    (hOfficer : CertifyingOfficerIsAttorneyGeneralOrDesignee247 o c)
    (hPublic : CertifiesProsecutionInPublicInterest247 cert c)
    (hJustice : CertifiesNecessaryToSecureSubstantialJustice247 cert c) :
    ValidCertification247 cert o c :=
  ⟨hWriting, hOfficer, hPublic, hJustice⟩

theorem authorizedProsecution247_intro {pr : Prosecution} {cert : Certification}
    {o : Person} {c : ComplaintText}
    (hScope : OffenseDescribedInSection247 pr c)
    (hUS : ProsecutionUndertakenByUnitedStates247 pr c)
    (hCert : ValidCertification247 cert o c) :
    AuthorizedProsecution247 pr cert o c :=
  ⟨hScope, hUS, hCert⟩

theorem withinSevenYearsOfOffense247_intro {ci : ChargingInstrument}
    {pr : Prosecution} {c : ComplaintText}
    (h : chargingInstrumentDay247 ci c ≤ offenseCommissionDay247 pr c + sevenYearLimitDays) :
    WithinSevenYearsOfOffense247 ci pr c :=
  h

theorem timelyChargingInstrument247_intro {ci : ChargingInstrument} {pr : Prosecution}
    {c : ComplaintText}
    (hNoncapital : NoncapitalOffense247 pr c)
    (hInstituted : IndictmentFoundOrInformationInstituted247 ci pr c)
    (hWithin : WithinSevenYearsOfOffense247 ci pr c) :
    TimelyChargingInstrument247 ci pr c :=
  ⟨hNoncapital, hInstituted, hWithin⟩

theorem timeBarred247_intro {ci : ChargingInstrument} {pr : Prosecution}
    {c : ComplaintText}
    (hNoncapital : NoncapitalOffense247 pr c)
    (hLate : ¬ WithinSevenYearsOfOffense247 ci pr c) :
    TimeBarred247 ci pr c :=
  ⟨hNoncapital, hLate⟩

theorem prosecutionPermitted247_intro {ci : ChargingInstrument} {pr : Prosecution}
    {cert : Certification} {o : Person} {c : ComplaintText}
    (hAuth : AuthorizedProsecution247 pr cert o c)
    (hTimely : TimelyChargingInstrument247 ci pr c) :
    ProsecutionPermitted247 ci pr cert o c :=
  ⟨hAuth, hTimely⟩



theorem privateStanding248_intro {p : Person} {c : ComplaintText}
    (h : PlaintiffProvidesOrObtainsReproductiveHealthServices248 p c) :
    PrivateStanding248 p c :=
  PrivateStanding248.reproductiveServices h

theorem privateStanding248_religiousExercise_intro {p : Person} {c : ComplaintText}
    (h : PlaintiffExercisingReligiousFreedomAtPlaceOfWorship248 p c) :
    PrivateStanding248 p c :=
  PrivateStanding248.religiousExercise h

theorem privateStanding248_worshipEntity_intro {p : Person} {c : ComplaintText}
    (h : PlaintiffEntityOwnsOrOperatesPlaceOfWorship248 p c) :
    PrivateStanding248 p c :=
  PrivateStanding248.worshipEntity h

theorem privateCivilAction248_intro {act : CivilAction} {p : Person} {d : Person}
    {c : ComplaintText}
    (hConduct : ConductProhibitedBySubsectionA248 d c)
    (hAggrieved : PersonAggrievedByProhibitedConduct248 p c)
    (hStanding : PrivateStanding248 p c)
    (hCommenced : CivilActionCommenced248 act p c)
    (hNoExemption : ¬ ParentOrGuardianActivityDirectedExclusivelyAtMinor248 d c) :
    PrivateCivilAction248 act p d c :=
  ⟨hConduct, hAggrieved, hStanding, hCommenced, hNoExemption⟩

theorem attorneyGeneralCivilAction248_intro {act : CivilAction} {ct : DistrictCourt}
    {d : Person} {c : ComplaintText}
    (hConduct : ConductProhibitedBySubsectionA248 d c)
    (hCause : AttorneyGeneralHasReasonableCause248 c)
    (hForum : CommencedInAppropriateDistrictCourt248 act ct c)
    (hNoExemption : ¬ ParentOrGuardianActivityDirectedExclusivelyAtMinor248 d c) :
    AttorneyGeneralCivilAction248 act ct d c :=
  ⟨hConduct, hCause, hForum, hNoExemption⟩

theorem stateAttorneyGeneralCivilAction248_intro {act : CivilAction}
    {ct : DistrictCourt} {d : Person} {c : ComplaintText}
    (hConduct : ConductProhibitedBySubsectionA248 d c)
    (hCause : StateAttorneyGeneralHasReasonableCause248 c)
    (hName : ActionBroughtInNameOfStateAsParensPatriae248 act c)
    (hResidents : OnBehalfOfNaturalPersonsResidingInState248 act c)
    (hForum : CommencedInAppropriateDistrictCourt248 act ct c)
    (hNoExemption : ¬ ParentOrGuardianActivityDirectedExclusivelyAtMinor248 d c) :
    StateAttorneyGeneralCivilAction248 act ct d c :=
  ⟨hConduct, hCause, hName, hResidents, hForum, hNoExemption⟩

theorem civilEnforcementAction248_intro {act : CivilAction} {ct : DistrictCourt}
    {p : Person} {d : Person} {c : ComplaintText}
    (h : PrivateCivilAction248 act p d c) :
    CivilEnforcementAction248 act ct p d c :=
  CivilEnforcementAction248.privateAction h

theorem civilEnforcementAction248_attorneyGeneral_intro {act : CivilAction}
    {ct : DistrictCourt} {p : Person} {d : Person} {c : ComplaintText}
    (h : AttorneyGeneralCivilAction248 act ct d c) :
    CivilEnforcementAction248 act ct p d c :=
  CivilEnforcementAction248.attorneyGeneral h

theorem civilEnforcementAction248_stateAttorneyGeneral_intro {act : CivilAction}
    {ct : DistrictCourt} {p : Person} {d : Person} {c : ComplaintText}
    (h : StateAttorneyGeneralCivilAction248 act ct d c) :
    CivilEnforcementAction248 act ct p d c :=
  CivilEnforcementAction248.stateAttorneyGeneral h

theorem electionBeforeFinalJudgment248_intro {act : CivilAction} {c : ComplaintText}
    (h : electionDay248 act c < finalJudgmentDay248 act c) :
    ElectionBeforeFinalJudgment248 act c :=
  h

theorem timelyStatutoryDamagesElection248_intro {act : CivilAction} {p : Person}
    {d : Person} {c : ComplaintText}
    (hAction : PrivateCivilAction248 act p d c)
    (hElected : StatutoryDamagesElected248 act c)
    (hBefore : ElectionBeforeFinalJudgment248 act c) :
    TimelyStatutoryDamagesElection248 act p d c :=
  ⟨hAction, hElected, hBefore⟩

theorem reachableCivilStage248_commenced_intro {act : CivilAction}
    {ct : DistrictCourt} {p : Person} {d : Person} {c : ComplaintText}
    (hAggrieved : PersonAggrievedByProhibitedConduct248 p c)
    (hAction : CivilEnforcementAction248 act ct p d c) :
    ReachableCivilStage248 act ct p d c CivilStage.Commenced :=
  ReachableCivilStage248.commenced (ReachableCivilStage248.aggrieved hAggrieved) hAction

theorem reachableCivilStage248_judgmentRendered_intro {act : CivilAction}
    {ct : DistrictCourt} {p : Person} {d : Person} {c : ComplaintText}
    (hAggrieved : PersonAggrievedByProhibitedConduct248 p c)
    (hAction : CivilEnforcementAction248 act ct p d c)
    (hJudgment : FinalJudgmentRendered248 act c) :
    ReachableCivilStage248 act ct p d c CivilStage.JudgmentRendered :=
  ReachableCivilStage248.judgmentRendered
    (ReachableCivilStage248.commenced (ReachableCivilStage248.aggrieved hAggrieved) hAction)
    hJudgment

theorem priorConvictionPrecedesInstantOffense248_intro {conv : Conviction}
    {pr : Prosecution} {c : ComplaintText}
    (h : priorConvictionDay248 conv c ≤ instantOffenseDay248 pr c) :
    PriorConvictionPrecedesInstantOffense248 conv pr c :=
  h

theorem subsequentOffense248_intro {conv : Conviction} {pr : Prosecution}
    {d : Person} {c : ComplaintText}
    (hViolation : ConductProhibitedBySubsectionA248 d c)
    (hPrior : PriorConvictionUnderSection248 conv d c)
    (hOrder : PriorConvictionPrecedesInstantOffense248 conv pr c) :
    SubsequentOffense248 conv pr d c :=
  ⟨hViolation, hPrior, hOrder⟩

theorem nonExclusiveRemedies248_intro {act : CivilAction} {ct : DistrictCourt}
    {p : Person} {d : Person} {c : ComplaintText}
    (hFederal : CivilEnforcementAction248 act ct p d c)
    (hStateLocal : StateOrLocalPenaltiesOrRemediesAvailable248 c) :
    NonExclusiveRemedies248 act ct p d c :=
  ⟨hFederal, hStateLocal⟩

end Proving.USC.T18.Ch13.Reearn.Procedure
