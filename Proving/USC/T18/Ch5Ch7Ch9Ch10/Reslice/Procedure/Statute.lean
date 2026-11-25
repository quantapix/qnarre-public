




import Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Procedure.Types
import Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Procedure.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Procedure

open Proving.USC.Common





def Section111ReachUnlimitedByLocus (c : ComplaintText) : Prop :=
  ConductOccurredOutsideUnitedStates c ∨ WithinUnitedStates c


def Section115ReachUnlimitedByLocus (c : ComplaintText) : Prop :=
  ConductOccurredOutsideUnitedStates c ∨ WithinUnitedStates c




inductive Section112JurisdictionBasis (c : ComplaintText) : Prop where
  | usRepresentativeVictim : VictimIsUnitedStatesRepresentative c → Section112JurisdictionBasis c
  | offenderIsNational : OffenderIsNationalOfUnitedStates c → Section112JurisdictionBasis c
  | offenderFoundHere : OffenderFoundInUnitedStates c → Section112JurisdictionBasis c


structure Section112JurisdictionAbroad (c : ComplaintText) : Prop where
  victimAbroad : VictimIsInternationallyProtectedPersonAbroad c
  abroad : ConductOccurredOutsideUnitedStates c
  basis : Section112JurisdictionBasis c



structure Section112AssistanceRequest (c : ComplaintText) : Prop where
  enforcement : EnforcementOfSection112Underway c
  requested : AttorneyGeneralRequestedAgencyAssistance c



structure Section112ApplicationPermitted (c : ComplaintText) : Prop where
  noAbridgment : ¬ ApplicationWouldAbridgeFirstAmendmentRights c



inductive Section116Circumstance (c : ComplaintText) : Prop where
  | travel : TraveledInInterstateOrForeignCommerce c → Section116Circumstance c
  | instrumentality : UsedInstrumentalityOfInterstateCommerce c → Section116Circumstance c
  | payment : PaymentMadeThroughInterstateCommerce c → Section116Circumstance c
  | communication : TransmittedCommunicationInInterstateCommerce c → Section116Circumstance c
  | object : ObjectTraveledInInterstateCommerce c → Section116Circumstance c
  | maritime : WithinSpecialMaritimeAndTerritorialJurisdiction c → Section116Circumstance c
  | affectsCommerce : ConductAffectedInterstateOrForeignCommerce c → Section116Circumstance c



structure Section116ProsecutionUnbarred (c : ComplaintText) : Prop where
  circumstance : Section116Circumstance c
  noMedicalException : ¬ MedicalNecessityExceptionApplies c


inductive Section117Locus (c : ComplaintText) : Prop where
  | maritime : WithinSpecialMaritimeAndTerritorialJurisdiction c → Section117Locus c
  | indianCountry : WithinIndianCountry c → Section117Locus c




def TwoPriorOccasionsEstablished (p : Person) (c : ComplaintText) : Prop :=
  2 ≤ PriorQualifyingConvictionOccasions p c



structure Section117HabitualPredicate (p : Person) (c : ComplaintText) : Prop where
  locus : Section117Locus c
  occasions : TwoPriorOccasionsEstablished p c
  final : PriorConvictionsAreFinal p c
  prior : PriorConvictionsPrecedeInstantOffense p c



structure Section115NonInterference (c : ComplaintText) : Prop where
  unimpaired : SecretServiceProtectiveAuthorityUnimpaired c



inductive Section118Locus (c : ComplaintText) : Prop where
  | inUnitedStates : WithinUnitedStates c → Section118Locus c
  | maritime : WithinSpecialMaritimeAndTerritorialJurisdiction c → Section118Locus c



structure Section118ProtectiveSetting (c : ComplaintText) : Prop where
  locus : Section118Locus c
  authorized : ProtectiveFunctionAuthorized c



structure Section119CoveredRole (p : Person) (c : ComplaintText) : Prop where
  role : CoveredPersonAdjudicativeRole p c





def IsDebtor (p : Person) (pr : Proceeding) : Prop :=
  PetitionFiledUnderTitle11 pr ∧ PetitionConcernsPerson p pr



def ConductAfterFiling (pr : Proceeding) (c : ComplaintText) : Prop :=
  PetitionFilingDay pr < ConductDay c



def ConductPrecedesFiling (pr : Proceeding) (c : ComplaintText) : Prop :=
  ConductDay c < PetitionFilingDay pr


structure PostFilingPosture (p : Person) (pr : Proceeding) (c : ComplaintText) : Prop where
  debtor : IsDebtor p pr
  after : ConductAfterFiling pr c


structure ContemplationPosture (p : Person) (pr : Proceeding) (c : ComplaintText) : Prop where
  filed : PetitionFiledUnderTitle11 pr
  before : ConductPrecedesFiling pr c



structure CourtOfficerPosture (p : Person) (pr : Proceeding) : Prop where
  filed : PetitionFiledUnderTitle11 pr
  officer : CourtOfficerChargedWithCustody p pr



structure Section154PartyInspectionDuty (p : Person) (pr : Proceeding) : Prop where
  posture : CourtOfficerPosture p pr
  directed : CourtDirectedInspection pr


structure Section154TrusteeInspectionDuty (p : Person) (pr : Proceeding) : Prop where
  posture : CourtOfficerPosture p pr
  requested : UnitedStatesTrusteeSoughtInspection pr



inductive Section154Duty (p : Person) (pr : Proceeding) : Prop where
  | party : Section154PartyInspectionDuty p pr → Section154Duty p pr
  | trustee : Section154TrusteeInspectionDuty p pr → Section154Duty p pr


structure Section154ForfeitureGuard (p : Person) (pr : Proceeding) : Prop where
  duty : Section154Duty p pr
  refused : ¬ InspectionOpportunityAfforded p pr


def section154OfficeTransition (p : Person) (pr : Proceeding) :
    GuardedTransition OfficeState :=
  { source := OfficeState.Held
    target := OfficeState.Vacant
    guard := Section154ForfeitureGuard p pr }


structure Section155Posture (p : Person) (pr : Proceeding) : Prop where
  pending : CaseOrReceivershipPending pr
  party : PartyInInterest p pr




structure Section156DismissalTrigger (p : Person) (pr : Proceeding)
    (c : ComplaintText) : Prop where
  preparer : BankruptcyPetitionPreparer p c
  document : DocumentForFilingPrepared p c
  dismissed : CaseOrRelatedProceedingDismissed pr
  causation : DismissalCausedByPreparerDisregard p pr


def section156CaseTransition (p : Person) (pr : Proceeding) (c : ComplaintText) :
    GuardedTransition CaseState :=
  { source := CaseState.Pending
    target := CaseState.Dismissed
    guard := Section156DismissalTrigger p pr c }



inductive Section157Act (p : Person) (pr : Proceeding) : Prop where
  | filesPetition : PetitionFiledByRespondent p pr → Section157Act p pr
  | filesDocument : DocumentFiledInProceeding p pr → Section157Act p pr
  | representation : RepresentationMadeConcerningProceeding p pr → Section157Act p pr



inductive Section157Setting (pr : Proceeding) : Prop where
  | real : PetitionFiledUnderTitle11 pr → Section157Setting pr
  | falselyAsserted : ProceedingFalselyAssertedPending pr → Section157Setting pr


structure Section157Posture (p : Person) (pr : Proceeding) : Prop where
  act : Section157Act p pr
  setting : Section157Setting pr



structure Section158DesignationProgram (c : ComplaintText) : Prop where
  designated : AttorneyGeneralDesignationMade c
  usAttorneys : UnitedStatesAttorneyDesignated c
  fbiAgents : FbiAgentDesignated c
  section3057 : Section3057ResponsibilityAssigned c



structure Section158Referral (pr : Proceeding) (c : ComplaintText) : Prop where
  program : Section158DesignationProgram c
  procedures : ReferralProceduresEstablished c
  referred : CaseReferredUnderSection158 pr





inductive Section175aRequester (c : ComplaintText) : Prop where
  | attorneyGeneral : AttorneyGeneralRequestedMilitaryAssistance c → Section175aRequester c
  | delegate : RequestMadeByDelegatedJusticeOfficial c → Section175aRequester c


structure Section175aAssistanceRequest (c : ComplaintText) : Prop where
  requester : Section175aRequester c
  supportsEnforcement : RequestSupportsSection175Enforcement c
  emergency : EmergencyInvolvingBiologicalWeapon c



def PunishableExceedingOneYear (p : Person) (c : ComplaintText) : Prop :=
  12 < MaximumAuthorizedImprisonmentMonths p c




inductive RestrictedPersonStatus (p : Person) (c : ComplaintText) : Prop where
  | underIndictment :
      UnderIndictment p c → PunishableExceedingOneYear p c → RestrictedPersonStatus p c
  | convicted :
      ConvictedInAnyCourt p c → PunishableExceedingOneYear p c → RestrictedPersonStatus p c
  | fugitive : FugitiveFromJustice p c → RestrictedPersonStatus p c
  | mentalAdjudication :
      AdjudicatedMentalDefectiveOrCommitted p c → RestrictedPersonStatus p c
  | dishonorableDischarge : DishonorablyDischarged p c → RestrictedPersonStatus p c



structure Section175bProhibitionApplicable (p : Person) (c : ComplaintText) : Prop where
  restricted : RestrictedPersonStatus p c
  commerce : ConductAffectedInterstateOrForeignCommerce c
  notAuthorized : ¬ DulyAuthorizedGovernmentActivity c



structure Section175bRegistrationCompliance (p : Person) (c : ComplaintText) : Prop where
  registered : RequiredRegistrationObtained p c



structure Section175bTransferCompliance (p : Person) (c : ComplaintText) : Prop where
  transfereeRegistered : TransfereeRegisteredAsRequired p c



inductive Section175cJurisdiction (c : ComplaintText) : Prop where
  | commerce : ConductAffectedInterstateOrForeignCommerce c → Section175cJurisdiction c
  | abroadByNational :
      ConductOccurredOutsideUnitedStates c → OffenderIsNationalOfUnitedStates c →
      Section175cJurisdiction c
  | againstNationalAbroad :
      ConductOccurredOutsideUnitedStates c → VictimIsNationalOfUnitedStates c →
      Section175cJurisdiction c
  | againstUsProperty : OffenseAgainstUnitedStatesProperty c → Section175cJurisdiction c
  | derivative :
      AidedOrConspiredWithPersonUnderJurisdiction c → Section175cJurisdiction c



structure Section175cProhibitionApplicable (c : ComplaintText) : Prop where
  jurisdiction : Section175cJurisdiction c
  notHhsAuthorized : ¬ ConductUnderHealthSecretaryAuthority c



def Section175cBaseSentenceInRange (p : Person) (c : ComplaintText) : Prop :=
  ImposedFineDollars p c ≤ 2000000 ∧ 25 ≤ ImposedImprisonmentYears p c


def Section175cEnhancedSentenceInRange (p : Person) (c : ComplaintText) : Prop :=
  ImposedFineDollars p c ≤ 2000000 ∧ 30 ≤ ImposedImprisonmentYears p c


inductive SeizableItem (s : Seizure) : Prop where
  | pertainsToProhibitedConduct : ItemPertainsToProhibitedConduct s → SeizableItem s
  | lacksPeacefulJustification : ItemLacksApparentPeacefulJustification s → SeizableItem s



inductive SeizureAuthority (s : Seizure) : Prop where
  | warrant : SeizureWarrantIssued s → SeizureAuthority s
  | exigent : ExigentCircumstancesExisted s → ProbableCauseExisted s → SeizureAuthority s


structure LawfulSeizure (s : Seizure) : Prop where
  item : SeizableItem s
  authority : SeizureAuthority s



structure ForfeitureSequenceProper (s : Seizure) : Prop where
  seizureBeforeNotice : SeizureDay s ≤ NoticeDay s
  noticeBeforeHearing : NoticeDay s ≤ HearingDay s
  hearingBeforeForfeiture : HearingDay s ≤ ForfeitureDay s




structure ForfeitureEntitlement (s : Seizure) : Prop where
  notice : NoticeToPotentialClaimantsGiven s
  hearing : OpportunityForHearingAfforded s
  burden : GovernmentCarriedBurdenByPreponderance s
  customs : CustomsForfeitureProceduresFollowed s
  sequence : ForfeitureSequenceProper s



structure Section176cDefense (s : Seizure) : Prop where
  peaceful : PeacefulPurposeShown s
  reasonable : TypeAndQuantityReasonable s



structure ForfeitureOnUnjustifiedItemProper (s : Seizure) : Prop where
  ground : ItemLacksApparentPeacefulJustification s
  entitlement : ForfeitureEntitlement s
  noDefense : ¬ Section176cDefense s



structure LawfulDisposition (s : Seizure) : Prop where
  entitlement : ForfeitureEntitlement s
  ordered : AttorneyGeneralOrderedDisposition s



inductive SeizureReachable (s : Seizure) : SeizureState → SeizureState → Prop where
  | seize : LawfulSeizure s → SeizureReachable s SeizureState.Subject SeizureState.Seized
  | notice :
      NoticeToPotentialClaimantsGiven s →
      SeizureReachable s SeizureState.Seized SeizureState.NoticeGiven
  | hearing :
      OpportunityForHearingAfforded s →
      SeizureReachable s SeizureState.NoticeGiven SeizureState.HearingHeld
  | forfeit :
      ForfeitureEntitlement s →
      SeizureReachable s SeizureState.HearingHeld SeizureState.Forfeited
  | destroy :
      LawfulDisposition s →
      SeizureReachable s SeizureState.Forfeited SeizureState.Destroyed
  | trans {a b d : SeizureState} :
      SeizureReachable s a b → SeizureReachable s b d → SeizureReachable s a d


inductive InjunctionGround (c : ComplaintText) : Prop where
  | prohibitedConduct : ConductProhibitedUnderSection175Shown c → InjunctionGround c
  | inchoateConduct : InchoateSection175ConductShown c → InjunctionGround c
  | unjustifiedQuantity : UnjustifiedTypeOrQuantityShown c → InjunctionGround c



structure Section177Defense (c : ComplaintText) : Prop where
  peaceful : EnjoinedConductPeacefulPurpose c
  reasonable : EnjoinedItemTypeAndQuantityReasonable c


structure Section177InjunctionAction (c : ComplaintText) : Prop where
  action : UnitedStatesCommencedCivilAction c
  ground : InjunctionGround c



structure Section177InjunctionOnQuantity (c : ComplaintText) : Prop where
  action : UnitedStatesCommencedCivilAction c
  ground : UnjustifiedTypeOrQuantityShown c
  noDefense : ¬ Section177Defense c

end Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Procedure
