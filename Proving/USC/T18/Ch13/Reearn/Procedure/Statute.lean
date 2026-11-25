import Proving.USC.T18.Ch13.Reearn.Procedure.Predicates

set_option autoImplicit false














namespace Proving.USC.T18.Ch13.Reearn.Procedure

open Proving.USC.Common







structure ConcurrentJurisdiction245 (c : ComplaintText) : Prop where
  stateJurisdictionUnimpaired : StateJurisdictionAbsentSection245 c
  stateResponsibilityRetained : StateOrLocalProsecutionResponsibilityRetained245 c






structure ValidCertification245 (cert : Certification) (o : Person)
    (c : ComplaintText) : Prop where
  inWriting : CertificationInWriting245 cert c
  officerAuthorized : CertifyingOfficerAuthorized245 o c
  functionNotDelegated : CertificationFunctionNotDelegated245 cert o c
  publicInterest : CertifiesProsecutionInPublicInterest245 cert c
  substantialJustice : CertifiesNecessaryToSecureSubstantialJustice245 cert c




def CertificationPrecedesProsecution245 (cert : Certification) (pr : Prosecution)
    (c : ComplaintText) : Prop :=
  certificationDay245 cert c ≤ prosecutionCommencementDay245 pr c




structure AuthorizedProsecution245 (pr : Prosecution) (cert : Certification)
    (o : Person) (c : ComplaintText) : Prop where
  offenseInScope : OffenseDescribedInSection245 pr c
  undertakenByUnitedStates : ProsecutionUndertakenByUnitedStates245 pr c
  certification : ValidCertification245 cert o c
  certificationFirst : CertificationPrecedesProsecution245 cert pr c









inductive ReachableStage245 (inv : Investigation) (pr : Prosecution)
    (cert : Certification) (o : Person) (c : ComplaintText) :
    ProsecutionStage → Prop where
  | uninitiated :
      ReachableStage245 inv pr cert o c ProsecutionStage.Uninitiated
  | investigated
      (prev : ReachableStage245 inv pr cert o c ProsecutionStage.Uninitiated)
      (opened : InvestigationOpenedByFederalAuthority245 inv c) :
      ReachableStage245 inv pr cert o c ProsecutionStage.Investigated
  | certified (valid : ValidCertification245 cert o c) :
      ReachableStage245 inv pr cert o c ProsecutionStage.Certified
  | prosecuted
      (prev : ReachableStage245 inv pr cert o c ProsecutionStage.Certified)
      (authorized : AuthorizedProsecution245 pr cert o c) :
      ReachableStage245 inv pr cert o c ProsecutionStage.Prosecuted






structure ValidCertification247 (cert : Certification) (o : Person)
    (c : ComplaintText) : Prop where
  inWriting : CertificationInWriting247 cert c
  officerIsAttorneyGeneralOrDesignee : CertifyingOfficerIsAttorneyGeneralOrDesignee247 o c
  publicInterest : CertifiesProsecutionInPublicInterest247 cert c
  substantialJustice : CertifiesNecessaryToSecureSubstantialJustice247 cert c



structure AuthorizedProsecution247 (pr : Prosecution) (cert : Certification)
    (o : Person) (c : ComplaintText) : Prop where
  offenseInScope : OffenseDescribedInSection247 pr c
  undertakenByUnitedStates : ProsecutionUndertakenByUnitedStates247 pr c
  certification : ValidCertification247 cert o c







def sevenYearLimitDays : Nat := 2557




def WithinSevenYearsOfOffense247 (ci : ChargingInstrument) (pr : Prosecution)
    (c : ComplaintText) : Prop :=
  chargingInstrumentDay247 ci c ≤ offenseCommissionDay247 pr c + sevenYearLimitDays





def TimeBarred247 (ci : ChargingInstrument) (pr : Prosecution)
    (c : ComplaintText) : Prop :=
  NoncapitalOffense247 pr c ∧ ¬ WithinSevenYearsOfOffense247 ci pr c



structure TimelyChargingInstrument247 (ci : ChargingInstrument) (pr : Prosecution)
    (c : ComplaintText) : Prop where
  noncapital : NoncapitalOffense247 pr c
  instituted : IndictmentFoundOrInformationInstituted247 ci pr c
  withinPeriod : WithinSevenYearsOfOffense247 ci pr c



structure ProsecutionPermitted247 (ci : ChargingInstrument) (pr : Prosecution)
    (cert : Certification) (o : Person) (c : ComplaintText) : Prop where
  authorized : AuthorizedProsecution247 pr cert o c
  timely : TimelyChargingInstrument247 ci pr c







inductive PrivateStanding248 (p : Person) (c : ComplaintText) : Prop where
  | reproductiveServices
      (h : PlaintiffProvidesOrObtainsReproductiveHealthServices248 p c) :
      PrivateStanding248 p c
  | religiousExercise
      (h : PlaintiffExercisingReligiousFreedomAtPlaceOfWorship248 p c) :
      PrivateStanding248 p c
  | worshipEntity
      (h : PlaintiffEntityOwnsOrOperatesPlaceOfWorship248 p c) :
      PrivateStanding248 p c





structure PrivateCivilAction248 (act : CivilAction) (p : Person) (d : Person)
    (c : ComplaintText) : Prop where
  prohibitedConduct : ConductProhibitedBySubsectionA248 d c
  aggrieved : PersonAggrievedByProhibitedConduct248 p c
  standing : PrivateStanding248 p c
  commenced : CivilActionCommenced248 act p c
  noParentalExemption : ¬ ParentOrGuardianActivityDirectedExclusivelyAtMinor248 d c



structure AttorneyGeneralCivilAction248 (act : CivilAction) (ct : DistrictCourt)
    (d : Person) (c : ComplaintText) : Prop where
  prohibitedConduct : ConductProhibitedBySubsectionA248 d c
  reasonableCause : AttorneyGeneralHasReasonableCause248 c
  properForum : CommencedInAppropriateDistrictCourt248 act ct c
  noParentalExemption : ¬ ParentOrGuardianActivityDirectedExclusivelyAtMinor248 d c



structure StateAttorneyGeneralCivilAction248 (act : CivilAction) (ct : DistrictCourt)
    (d : Person) (c : ComplaintText) : Prop where
  prohibitedConduct : ConductProhibitedBySubsectionA248 d c
  reasonableCause : StateAttorneyGeneralHasReasonableCause248 c
  inNameOfState : ActionBroughtInNameOfStateAsParensPatriae248 act c
  onBehalfOfResidents : OnBehalfOfNaturalPersonsResidingInState248 act c
  properForum : CommencedInAppropriateDistrictCourt248 act ct c
  noParentalExemption : ¬ ParentOrGuardianActivityDirectedExclusivelyAtMinor248 d c



inductive CivilEnforcementAction248 (act : CivilAction) (ct : DistrictCourt)
    (p : Person) (d : Person) (c : ComplaintText) : Prop where
  | privateAction (h : PrivateCivilAction248 act p d c) :
      CivilEnforcementAction248 act ct p d c
  | attorneyGeneral (h : AttorneyGeneralCivilAction248 act ct d c) :
      CivilEnforcementAction248 act ct p d c
  | stateAttorneyGeneral (h : StateAttorneyGeneralCivilAction248 act ct d c) :
      CivilEnforcementAction248 act ct p d c




def ElectionBeforeFinalJudgment248 (act : CivilAction) (c : ComplaintText) : Prop :=
  electionDay248 act c < finalJudgmentDay248 act c



structure TimelyStatutoryDamagesElection248 (act : CivilAction) (p : Person)
    (d : Person) (c : ComplaintText) : Prop where
  action : PrivateCivilAction248 act p d c
  elected : StatutoryDamagesElected248 act c
  beforeFinalJudgment : ElectionBeforeFinalJudgment248 act c


inductive ReachableCivilStage248 (act : CivilAction) (ct : DistrictCourt)
    (p : Person) (d : Person) (c : ComplaintText) : CivilStage → Prop where
  | aggrieved (h : PersonAggrievedByProhibitedConduct248 p c) :
      ReachableCivilStage248 act ct p d c CivilStage.Aggrieved
  | commenced (prev : ReachableCivilStage248 act ct p d c CivilStage.Aggrieved)
      (h : CivilEnforcementAction248 act ct p d c) :
      ReachableCivilStage248 act ct p d c CivilStage.Commenced
  | judgmentRendered (prev : ReachableCivilStage248 act ct p d c CivilStage.Commenced)
      (h : FinalJudgmentRendered248 act c) :
      ReachableCivilStage248 act ct p d c CivilStage.JudgmentRendered






def PriorConvictionPrecedesInstantOffense248 (conv : Conviction) (pr : Prosecution)
    (c : ComplaintText) : Prop :=
  priorConvictionDay248 conv c ≤ instantOffenseDay248 pr c



structure SubsequentOffense248 (conv : Conviction) (pr : Prosecution) (d : Person)
    (c : ComplaintText) : Prop where
  instantViolation : ConductProhibitedBySubsectionA248 d c
  priorConviction : PriorConvictionUnderSection248 conv d c
  convictionFirst : PriorConvictionPrecedesInstantOffense248 conv pr c






structure NonExclusiveRemedies248 (act : CivilAction) (ct : DistrictCourt)
    (p : Person) (d : Person) (c : ComplaintText) : Prop where
  federalAction : CivilEnforcementAction248 act ct p d c
  stateOrLocalAvailable : StateOrLocalPenaltiesOrRemediesAvailable248 c

end Proving.USC.T18.Ch13.Reearn.Procedure
