











import Proving.USC.Common.Types
import Proving.USC.T18.Ch113B.Procedure.Types
import Proving.USC.T18.Ch113B.Procedure.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Procedure

open Proving.USC.Common






inductive MilitaryForceExclusion (x : Person) (c : ComplaintText) : Prop where
  | byForeignTerroristOrganizationDesignation
      (h : DesignatedForeignTerroristOrganization x c) : MilitaryForceExclusion x c
  | bySpeciallyDesignatedGlobalTerroristDesignation
      (h : DesignatedSpeciallyDesignatedGlobalTerrorist x c) : MilitaryForceExclusion x c
  | byCourtDetermination
      (h : CourtDeterminedNotMilitaryForce x c) : MilitaryForceExclusion x c






def section2332CertificationPrecedesCommencement
    (pr : Prosecution) (cert : Certification) (c : ComplaintText) : Prop :=
  dayOfCertification cert c ≤ dayOfProsecutionCommencement pr c





structure Section2332ProsecutionAuthorized
    (pr : Prosecution) (cert : Certification) (c : ComplaintText) : Prop where
  undertaken     : ProsecutionUndertakenByUnitedStates pr c
  certified      : WrittenCertificationFiledForProsecution pr cert c
  officialOk     : CertifyingOfficialAuthorized cert c
  recitesJudgment : CertificationRecitesCoerciveIntentJudgment cert c
  timelyOrder    : section2332CertificationPrecedesCommencement pr cert c




structure Section2332ProsecutionBarred (pr : Prosecution) (c : ComplaintText) : Prop where
  undertaken   : ProsecutionUndertakenByUnitedStates pr c
  noValidCert  : ¬ ∃ cert : Certification, Section2332ProsecutionAuthorized pr cert c






inductive Section2332aJurisdiction (x : Person) (o : Offense) (c : ComplaintText) : Prop where
  | byEnumeratedCircumstance
      (h : Section2332aJurisdictionalCircumstance o c) : Section2332aJurisdiction x o c
  | byUnitedStatesNationalAbroad
      (hNat : IsNationalOfTheUnitedStates x c)
      (hOut : OffenseTakesPlaceOutsideUnitedStates o c) : Section2332aJurisdiction x o c





structure Section2332bJurisdictionOverActor
    (x : Person) (o : Offense) (c : ComplaintText) : Prop where
  actorRole    : IsPrincipalCoconspiratorOrAccessoryAfterTheFact x o c
  oneOffenderOk : Section2332bCircumstanceAppliesToAtLeastOneOffender o c


inductive Section2332bExtraterritorialJurisdiction
    (x : Person) (o : Offense) (c : ComplaintText) : Prop where
  | overSubsectionAOffense
      (h : IsOffenseUnderSection2332bSubsectionA o c) :
      Section2332bExtraterritorialJurisdiction x o c
  | overAccessoryAfterTheFact
      (h : IsAccessoryAfterTheFactUnderSection3 x o c) :
      Section2332bExtraterritorialJurisdiction x o c




def section2332bKnowledgeOfJurisdictionalBaseRequired : Prop := False



def section2332bStateProcedureOrEvidenceAdopted : Prop := False




structure Section2332bProsecutionBurden (o : Offense) (c : ComplaintText) : Prop where
  jurisdictionalBaseAlleged : JurisdictionalBaseAllegedInIndictment o c
  stateElementsIfAdopted    : OffenseBasedOnAdoptedStateLaw o c → StateLawOffenseElementsProved o c



structure Section2332bLawfulSentence
    (x : Person) (s : Sentencing) (c : ComplaintText) : Prop where
  convicted     : ConvictedOfSection2332bViolation x c
  noProbation   : ¬ ProbationImposed s c
  notConcurrent : ¬ TermOfImprisonmentRunsConcurrently s c




structure Section2332bSentencingBreach
    (x : Person) (s : Sentencing) (c : ComplaintText) : Prop where
  convicted : ConvictedOfSection2332bViolation x c
  defect    : ProbationImposed s c ∨ TermOfImprisonmentRunsConcurrently s c




def section2332bAttorneyGeneralPrimaryInvestigativeResponsibility
    (o : Offense) (c : ComplaintText) : Prop :=
  IsFederalCrimeOfTerrorism o c ∨ IsSection2332bfEnumeratedViolation o c



structure Section2332bTreasuryAssistanceDuty (o : Offense) (c : ComplaintText) : Prop where
  agResponsibility : section2332bAttorneyGeneralPrimaryInvestigativeResponsibility o c
  agRequested      : AttorneyGeneralRequestedTreasuryAssistance o c




def section2332bSecretServiceSavingsClause : Prop :=
  ∀ (o : Offense) (c : ComplaintText), ¬ SecretServiceAuthorityDisplaced o c






def section2332dDesignationInForceAtTransaction
    (x : Person) (s : ForeignState) (c : ComplaintText) : Prop :=
  dayOfCountryDesignation s c ≤ dayOfFinancialTransaction x s c




structure Section2332dRegulatoryException
    (r : Regulation) (x : Person) (s : ForeignState) (c : ComplaintText) : Prop where
  issued     : TreasuryRegulationIssued r c
  consulted  : TreasurySecretaryConsultedSecretaryOfState r c
  authorizes : TransactionAuthorizedByTreasuryRegulation r x s c






structure Section2332dProsecutionPredicate
    (x : Person) (s : ForeignState) (c : ComplaintText) : Prop where
  usPerson          : IsUnitedStatesPerson x c
  countryDesignated : CountryDesignatedAsSupportingInternationalTerrorism s c
  designationInForce : section2332dDesignationInForceAtTransaction x s c
  noException       : ¬ ∃ r : Regulation, Section2332dRegulatoryException r x s c






structure Section2332eValidAssistanceRequest
    (r : AssistanceRequest) (c : ComplaintText) : Prop where
  requester : RequestMadeByAttorneyGeneral r c ∨ RequestMadeByDelegatedJusticeOfficial r c
  purpose   : RequestSupportsSection2332aEnforcement r c
  emergency : EmergencySituationInvolvingWeaponOfMassDestruction c





def section2332fJurisdiction (o : Offense) (c : ComplaintText) : Prop :=
  (OffenseTakesPlaceInUnitedStates o c ∧ Section2332fDomesticNexusCircumstance o c) ∨
  (OffenseTakesPlaceOutsideUnitedStates o c ∧ Section2332fForeignNexusCircumstance o c)


def section2332fInapplicable (o : Offense) (c : ComplaintText) : Prop :=
  ArmedForcesActivityDuringArmedConflict o c ∨
  MilitaryForcesOfStateOfficialDuties o c ∨
  Section2332fWhollyDomesticWithoutCommerceEffect o c



structure Section2332fSectionApplies (o : Offense) (c : ComplaintText) : Prop where
  jurisdiction : section2332fJurisdiction o c
  notBarred    : ¬ section2332fInapplicable o c





def section2332gAuthorizationException (o : Offense) (c : ComplaintText) : Prop :=
  Section2332gConductUnderUnitedStatesOrStateAuthority o c ∨
  Section2332gConductPursuantToGovernmentContract o c



structure Section2332gSectionApplies (o : Offense) (c : ComplaintText) : Prop where
  jurisdiction : Section2332gJurisdictionalCircumstance o c
  notExcepted  : ¬ section2332gAuthorizationException o c



def section2332gBaseSentenceLawful (s : Sentencing) (c : ComplaintText) : Prop :=
  fineImposedDollars s c ≤ 2000000 ∧
  (LifeImprisonmentImposed s c ∨ 25 ≤ yearsOfImprisonmentImposed s c)



def section2332gEnhancedSentenceLawful (s : Sentencing) (c : ComplaintText) : Prop :=
  fineImposedDollars s c ≤ 2000000 ∧
  (LifeImprisonmentImposed s c ∨ 30 ≤ yearsOfImprisonmentImposed s c)



structure Section2332gDeathResultSentence
    (o : Offense) (s : Sentencing) (c : ComplaintText) : Prop where
  deathResulted : DeathResultedFromViolation o c
  lifeImposed   : LifeImprisonmentImposed s c
  fineWithinCap : fineImposedDollars s c ≤ 2000000





def section2332hAuthorizationException (o : Offense) (c : ComplaintText) : Prop :=
  Section2332hConductUnderUnitedStatesAuthority o c ∨
  Section2332hConductPursuantToUnitedStatesContract o c



structure Section2332hSectionApplies (o : Offense) (c : ComplaintText) : Prop where
  jurisdiction : Section2332hJurisdictionalCircumstance o c
  notExcepted  : ¬ section2332hAuthorizationException o c



def section2332hBaseSentenceLawful (s : Sentencing) (c : ComplaintText) : Prop :=
  fineImposedDollars s c ≤ 2000000 ∧
  (LifeImprisonmentImposed s c ∨ 25 ≤ yearsOfImprisonmentImposed s c)


def section2332hEnhancedSentenceLawful (s : Sentencing) (c : ComplaintText) : Prop :=
  fineImposedDollars s c ≤ 2000000 ∧
  (LifeImprisonmentImposed s c ∨ 30 ≤ yearsOfImprisonmentImposed s c)



structure Section2332hDeathResultSentence
    (o : Offense) (s : Sentencing) (c : ComplaintText) : Prop where
  deathResulted : DeathResultedFromViolation o c
  lifeImposed   : LifeImprisonmentImposed s c
  fineWithinCap : fineImposedDollars s c ≤ 2000000




def section2332iInapplicable (o : Offense) (c : ComplaintText) : Prop :=
  ArmedForcesActivityDuringArmedConflict o c ∨ MilitaryForcesOfStateOfficialDuties o c



structure Section2332iSectionApplies (o : Offense) (c : ComplaintText) : Prop where
  jurisdiction : Section2332iJurisdictionalCircumstance o c
  notBarred    : ¬ section2332iInapplicable o c




def section2332iSentenceLawful (s : Sentencing) (c : ComplaintText) : Prop :=
  fineImposedDollars s c ≤ 2000000 ∧
  (LifeImprisonmentImposed s c ∨ 1 ≤ yearsOfImprisonmentImposed s c)





inductive Section2333Standing (x : Person) (c : ComplaintText) : Prop where
  | asInjuredNational
      (hNat : IsNationalOfTheUnitedStates x c)
      (hAcc : Section2333ClaimAccrued x c) : Section2333Standing x c
  | asEstateSurvivorOrHeir
      (h : IsEstateSurvivorOrHeirOfInjuredNational x c) : Section2333Standing x c


structure Section2333ActionProperlyCommenced
    (x : Person) (a : CivilAction) (c : ComplaintText) : Prop where
  standing  : Section2333Standing x c
  commenced : CivilActionCommenced a x c
  forum     : FiledInAppropriateDistrictCourt a c



noncomputable def section2333TrebleAward (a : CivilAction) (c : ComplaintText) : Nat :=
  3 * damagesSustainedDollars a c




structure Section2333JudgmentConforms (a : CivilAction) (c : ComplaintText) : Prop where
  amountCorrect :
    judgmentAmountEnteredDollars a c = section2333TrebleAward a c + costOfSuitDollars a c



def section2333CivilActionIsSubsequent
    (j : CriminalJudgment) (a : CivilAction) (c : ComplaintText) : Prop :=
  dayOfCriminalJudgment j c ≤ dayOfCivilActionCommencement a c




structure Section2333UnitedStatesJudgmentEstoppel
    (x : Person) (j : CriminalJudgment) (a : CivilAction) (c : ComplaintText) : Prop where
  finalForUnitedStates : FinalJudgmentForUnitedStatesInCriminalProceeding j c
  enumeratedOffense    : CriminalProceedingUnderSection2333bEnumeratedOffense j c
  sameDefendant        : SameDefendantInCriminalAndCivilProceeding x j a c
  subsequent           : section2333CivilActionIsSubsequent j a c



structure Section2333ForeignJudgmentEstoppel
    (x : Person) (j : CriminalJudgment) (a : CivilAction) (c : ComplaintText) : Prop where
  finalForForeignState : FinalJudgmentForForeignStateInCriminalProceeding j c
  fullFaithAndCredit   : JudgmentAccordedFullFaithAndCredit j c
  sameDefendant        : SameDefendantInCriminalAndCivilProceeding x j a c
  subsequent           : section2333CivilActionIsSubsequent j a c






def section2333DesignationInForceAtActDate
    (d : Designation) (a : CivilAction) (c : ComplaintText) : Prop :=
  dayDesignationTookEffect d c ≤ dayOfActOfInternationalTerrorism a c ∧
  dayOfActOfInternationalTerrorism a c ≤ dayDesignationCeasedToBeInForce d c


inductive Section2333SecondaryTheory (x : Person) (a : CivilAction) (c : ComplaintText) : Prop where
  | aidingAndAbetting
      (h : KnowinglyProvidedSubstantialAssistance x a c) : Section2333SecondaryTheory x a c
  | conspiracy
      (h : ConspiredWithPersonWhoCommittedAct x a c) : Section2333SecondaryTheory x a c




structure Section2333SecondaryLiabilityAvailable
    (x : Person) (org : Person) (d : Designation) (a : CivilAction) (c : ComplaintText) : Prop where
  orgDesignated      : DesignatedForeignTerroristOrganization org c
  designationInForce : section2333DesignationInForceAtActDate d a c
  actByOrganization  : ActCommittedPlannedOrAuthorizedByOrganization org a c
  theory             : Section2333SecondaryTheory x a c





structure Section2333BlockedAssetAvailable
    (x : Person) (a : CivilAction) (as_ : Asset) (c : ComplaintText) : Prop where
  judgmentObtained : ObtainedJudgmentAgainstTerroristParty x a c
  partyAsset       : IsAssetOfTerroristParty as_ a c
  seizedOrFrozen   : AssetSeizedOrFrozenUnderKingpinAct as_ c




def section2332CertificationStep (cert : Certification) (c : ComplaintText) : Transition :=
  { source := State.UnderInvestigation, target := State.Certified,
    guard := CertifyingOfficialAuthorized cert c ∧
             CertificationRecitesCoerciveIntentJudgment cert c }


def section2332CommencementStep
    (pr : Prosecution) (cert : Certification) (c : ComplaintText) : Transition :=
  { source := State.Certified, target := State.ProsecutionCommenced,
    guard := Section2332ProsecutionAuthorized pr cert c }


def section2332bSentencingStep
    (x : Person) (s : Sentencing) (c : ComplaintText) : Transition :=
  { source := State.Convicted, target := State.Sentenced,
    guard := Section2332bLawfulSentence x s c }


def section2333FilingStep (x : Person) (a : CivilAction) (c : ComplaintText) : Transition :=
  { source := State.InjuryAccrued, target := State.CivilActionFiled,
    guard := Section2333ActionProperlyCommenced x a c }


def section2333JudgmentStep (a : CivilAction) (c : ComplaintText) : Transition :=
  { source := State.CivilActionFiled, target := State.CivilJudgmentEntered,
    guard := Section2333JudgmentConforms a c }


def section2333ExecutionStep
    (x : Person) (a : CivilAction) (as_ : Asset) (c : ComplaintText) : Transition :=
  { source := State.CivilJudgmentEntered, target := State.BlockedAssetsAttached,
    guard := Section2333BlockedAssetAvailable x a as_ c }



inductive Reaches : State → State → Prop where
  | refl (s : State) : Reaches s s
  | step {s u : State} (tr : Transition)
      (hSrc : tr.source = s) (hGuard : tr.guard)
      (rest : Reaches tr.target u) : Reaches s u

end Proving.USC.T18.Ch113B.Procedure
