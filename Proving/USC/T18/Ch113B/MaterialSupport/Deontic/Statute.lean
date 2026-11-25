import Proving.USC.T18.Ch113B.MaterialSupport.Deontic.Predicates


















set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.MaterialSupport.Deontic

open Proving.USC.Common



def modalityOf : ClauseId → Modality
  | .s2339a => .prohibition
  | .s2339b => .permission
  | .s2339Aa => .prohibition
  | .s2339Ab => .definition
  | .s2339Ba1 => .prohibition
  | .s2339Ba2 => .obligation
  | .s2339Bb => .obligation
  | .s2339Bc => .power
  | .s2339Bd => .definition
  | .s2339Be1 => .obligation
  | .s2339Be2 => .obligation
  | .s2339Be3Referral => .obligation
  | .s2339Be3Notify => .obligation
  | .s2339Be3Remedial => .permission
  | .s2339Bf1A => .power
  | .s2339Bf1B => .obligation
  | .s2339Bf2B => .obligation
  | .s2339Bf3C => .obligation
  | .s2339Bf5Bii => .obligation
  | .s2339Bf5Biii => .obligation
  | .s2339Bg => .definition
  | .s2339Bh => .prohibition
  | .s2339Bi => .prohibition
  | .s2339Bj1 => .prohibition
  | .s2339Bj2 => .prohibition
  | .s2339Ca1 => .prohibition
  | .s2339Cb => .definition
  | .s2339Cc => .prohibition
  | .s2339Cd => .definition
  | .s2339Ce => .definition
  | .s2339Cf => .obligation
  | .s2339Da => .prohibition
  | .s2339Db => .definition
  | .s2339Dc => .definition






structure Prohibition2339 (p w : Person) (o : Offense) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass2339 p c
  enumerated : IsEnumeratedOffense2339 o c
  condition : ConditionMet2339 p w o c


def Prohibition2339Violated (p w : Person) (o : Offense) (c : ComplaintText) : Prop :=
  Prohibition2339 p w o c ∧ RegulatedActOccurred2339 p w c



structure Permission2339b (p : Person) (d : JudicialDistrict) (o : Offense)
    (c : ComplaintText) : Prop where
  addressee : IsProsecutingAuthority p c
  condition : VenuePermittedDistrict2339b d o c






inductive MaterialSupportRoute2339A (m : MaterialSupport) (c : ComplaintText) : Prop where

  | general (h : IsMaterialSupportOrResources2339A m c)

  | training (h : IsTraining2339A m c)

  | expertAdvice (h : IsExpertAdviceOrAssistance2339A m c)


structure Prohibition2339A (p : Person) (m : MaterialSupport) (o : Offense)
    (c : ComplaintText) : Prop where
  addressee : AddresseeInClass2339A p c
  object : MaterialSupportRoute2339A m c
  enumerated : IsEnumeratedOffense2339A o c
  condition : ConditionMet2339A p m o c


def Prohibition2339AViolated (p : Person) (m : MaterialSupport) (o : Offense)
    (c : ComplaintText) : Prop :=
  Prohibition2339A p m o c ∧ RegulatedActOccurred2339A p m c






def JurisdictionalNexusCh113B (p : Person) (o : Offense) (c : ComplaintText) : Prop :=
  IsNationalOrLawfulPermanentResident p c
  ∨ IsStatelessPersonHabituallyResidentInUS p c
  ∨ BroughtIntoOrFoundInTheUnitedStates p c
  ∨ OffenseOccursInWholeOrPartInTheUnitedStates o c
  ∨ OffenseAffectsInterstateOrForeignCommerce o c
  ∨ AidsAbetsOrConspiresWithJurisdictionalOffender p o c


def JurisdictionExists2339B (p : Person) (o : Offense) (c : ComplaintText) : Prop :=
  JurisdictionalNexusCh113B p o c


def JurisdictionExists2339D (p : Person) (o : Offense) (c : ComplaintText) : Prop :=
  JurisdictionalNexusCh113B p o c





def PersonnelProsecutionBar2339Bh (p : Person) (g : Organization) (c : ComplaintText) : Prop :=
  ProsecutionRestsOnPersonnelTheory2339Bh p c
    ∧ ¬ ProvidedPersonnelUnderOrganizationDirectionOrControl2339Bh p g c




def ApprovedProvisionProsecutionBar2339Bj (p : Person) (m : MaterialSupport)
    (c : ComplaintText) : Prop :=
  ProsecutionRestsOnPersonnelTrainingOrExpertAdviceTheory2339Bj p c
    ∧ SecretaryOfStateApprovedWithAttorneyGeneralConcurrence2339Bj p m c



def ProsecutionBarred2339B (p : Person) (m : MaterialSupport) (g : Organization)
    (c : ComplaintText) : Prop :=
  PersonnelProsecutionBar2339Bh p g c ∨ ApprovedProvisionProsecutionBar2339Bj p m c




structure Prohibition2339Ba1 (p : Person) (m : MaterialSupport) (g : Organization)
    (o : Offense) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass2339Ba1 p c
  organization : IsForeignTerroristOrganization2339B g c
  object : MaterialSupportRoute2339A m c
  scienter : ConditionMet2339Ba1 p g c
  jurisdiction : JurisdictionExists2339B p o c



def Prohibition2339Ba1Violated (p : Person) (m : MaterialSupport) (g : Organization)
    (o : Offense) (c : ComplaintText) : Prop :=
  Prohibition2339Ba1 p m g o c
    ∧ RegulatedActOccurred2339Ba1 p m g c
    ∧ ¬ ProsecutionBarred2339B p m g c




structure Obligation2339Ba2 (f : FinancialInstitution) (u : Funds) (g : Organization)
    (c : ComplaintText) : Prop where
  addressee : AddresseeInClass2339Ba2 f c
  organization : IsForeignTerroristOrganization2339B g c
  funds : IsFunds2339B u c
  condition : ConditionMet2339Ba2 f u g c


def Obligation2339Ba2Performed (f : FinancialInstitution) (u : Funds)
    (c : ComplaintText) : Prop :=
  RetainedPossessionOrControl2339Ba2A f u c ∧ ReportedToSecretary2339Ba2B f u c



def Obligation2339Ba2Breached (f : FinancialInstitution) (u : Funds) (g : Organization)
    (c : ComplaintText) : Prop :=
  Obligation2339Ba2 f u g c
    ∧ ¬ SecretaryAuthorizationApplies2339Ba2 f u c
    ∧ ¬ Obligation2339Ba2Performed f u c


def CivilPenaltyLiability2339Bb (f : FinancialInstitution) (u : Funds) (g : Organization)
    (c : ComplaintText) : Prop :=
  Obligation2339Ba2Breached f u g c ∧ KnowinglyFailedToComply2339Bb f u c




noncomputable def civilPenaltyFloor2339Bb (f : FinancialInstitution) (u : Funds)
    (c : ComplaintText) : Nat :=
  max 50000 (2 * amountRequiredToBeRetained2339Bb f u c)





structure Power2339Bc (a s d : Person) (c : ComplaintText) : Prop where
  holder : IsAttorneyGeneral a c
  observer : IsAttorneyGeneral s c ∨ IsSecretaryOfTheTreasury2339B s c
  condition : AppearsEngagedOrAboutToEngageInViolation2339Bc s d c


def Power2339BcExercised (a s d : Person) (c : ComplaintText) : Prop :=
  Power2339Bc a s d c ∧ CivilInjunctionActionInitiated2339Bc a d c




structure Obligation2339Be1 (a : Person) (c : ComplaintText) : Prop where
  addressee : IsAttorneyGeneral a c
  condition : PossibleViolationUnderInvestigation2339Be1 c


def Obligation2339Be1Breached (a : Person) (c : ComplaintText) : Prop :=
  Obligation2339Be1 a c ∧ ¬ InvestigationConducted2339Be1 a c


structure Obligation2339Be2 (a : Person) (c : ComplaintText) : Prop where
  addressee : IsAttorneyGeneral a c
  condition : InvestigationRelatesToFinancialInstitutionComplianceOrPenalty2339Be2 c


def Obligation2339Be2Breached (a : Person) (c : ComplaintText) : Prop :=
  Obligation2339Be2 a c ∧ ¬ CoordinatedWithSecretary2339Be2 a c



structure Obligation2339Be3Referral (c : ComplaintText) : Prop where
  condition : CriminalViolationEvidenceArose2339Be3 c


def Obligation2339Be3ReferralBreached (c : ComplaintText) : Prop :=
  Obligation2339Be3Referral c ∧ ¬ EvidenceReferredImmediatelyToAttorneyGeneral2339Be3 c


structure Obligation2339Be3Notify (a : Person) (c : ComplaintText) : Prop where
  addressee : IsAttorneyGeneral a c
  condition : CriminalViolationEvidenceArose2339Be3 c


def Obligation2339Be3NotifyBreached (a : Person) (c : ComplaintText) : Prop :=
  Obligation2339Be3Notify a c ∧ ¬ SecretaryTimelyNotifiedOfActionOnReferral2339Be3 a c


def Permission2339Be3RemedialExercised (a : Person) (c : ComplaintText) : Prop :=
  IsAttorneyGeneral a c ∧ ReferredToSecretaryForRemedialAction2339Be3 a c




structure Power2339Bf1A (r : CivilProceeding) (q : ClassifiedInfoRequest)
    (c : ComplaintText) : Prop where
  proceeding : IsCivilProceedingUnderSection2339B r c
  request : ExParteWrittenRequestByUnitedStates2339Bf1 r q c
  condition : SufficientShowingMade2339Bf1 r q c


def Power2339Bf1AExercised (r : CivilProceeding) (q : ClassifiedInfoRequest)
    (c : ComplaintText) : Prop :=
  Power2339Bf1A r q c ∧ CourtAuthorizedRedactionOrSubstitution2339Bf1 r q c


structure Obligation2339Bf1B (r : CivilProceeding) (q : ClassifiedInfoRequest)
    (c : ComplaintText) : Prop where
  proceeding : IsCivilProceedingUnderSection2339B r c
  condition : RequestGranted2339Bf1 r q c


def Obligation2339Bf1BBreached (r : CivilProceeding) (q : ClassifiedInfoRequest)
    (c : ComplaintText) : Prop :=
  Obligation2339Bf1B r q c ∧ ¬ DocumentsSealedAndPreserved2339Bf1B r q c


structure Obligation2339Bf2B (r : CivilProceeding) (q : ClassifiedInfoRequest)
    (c : ComplaintText) : Prop where
  proceeding : IsCivilProceedingUnderSection2339B r c
  condition : SubstituteSufficientToPrepareDefense2339Bf2 r q c


def Obligation2339Bf2BBreached (r : CivilProceeding) (q : ClassifiedInfoRequest)
    (c : ComplaintText) : Prop :=
  Obligation2339Bf2B r q c ∧ ¬ CourtGrantedSubstitutionRequest2339Bf2 r q c



structure Obligation2339Bf3C (r : CivilProceeding) (c : ComplaintText) : Prop where
  proceeding : IsCivilProceedingUnderSection2339B r c
  condition : DefendantSeeksToIntroduceClassifiedInformation2339Bf3 r c


def Obligation2339Bf3CBreached (r : CivilProceeding) (c : ComplaintText) : Prop :=
  Obligation2339Bf3C r c ∧ ¬ DefendantEstablishedRelevanceAndMateriality2339Bf3 r c


def NoticeOfAppealTimely2339Bf5 (r : CivilProceeding) (c : ComplaintText) : Prop :=
  daysFromPretrialOrderToNoticeOfAppeal2339Bf5 r c ≤ 14


structure Obligation2339Bf5Bii (r : CivilProceeding) (c : ComplaintText) : Prop where
  proceeding : IsCivilProceedingUnderSection2339B r c
  condition : PretrialOrderAppealed2339Bf5 r c



def Obligation2339Bf5BiiBreached (r : CivilProceeding) (c : ComplaintText) : Prop :=
  Obligation2339Bf5Bii r c
    ∧ (¬ NoticeOfAppealTimely2339Bf5 r c ∨ TrialCommencedBeforeAppealResolved2339Bf5 r c)


def ArgumentHeardWithinFourDays2339Bf5 (r : CivilProceeding) (c : ComplaintText) : Prop :=
  daysFromAdjournmentToArgument2339Bf5 r c ≤ 4


def DecisionRenderedWithinFourDays2339Bf5 (r : CivilProceeding) (c : ComplaintText) : Prop :=
  daysFromArgumentToDecision2339Bf5 r c ≤ 4


structure Obligation2339Bf5Biii (r : CivilProceeding) (c : ComplaintText) : Prop where
  proceeding : IsCivilProceedingUnderSection2339B r c
  condition : AppealTakenDuringTrial2339Bf5 r c



def Obligation2339Bf5BiiiPerformed (r : CivilProceeding) (c : ComplaintText) : Prop :=
  TrialAdjournedUntilAppealResolved2339Bf5 r c
    ∧ AppealExpeditedByCourtOfAppeals2339Bf5 r c
    ∧ ArgumentHeardWithinFourDays2339Bf5 r c
    ∧ DecisionRenderedWithinFourDays2339Bf5 r c


def Obligation2339Bf5BiiiBreached (r : CivilProceeding) (c : ComplaintText) : Prop :=
  Obligation2339Bf5Biii r c ∧ ¬ Obligation2339Bf5BiiiPerformed r c




structure Prohibition2339Bi (p : Person) (c : ComplaintText) : Prop where
  addressee : IsAuthorityConstruingOrApplyingSection2339Bi p c


def Prohibition2339BiViolated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition2339Bi p c ∧ ConstructionAbridgesFirstAmendmentRights2339Bi p c


structure Prohibition2339Bj2 (p : Person) (m : MaterialSupport) (c : ComplaintText) : Prop where
  addressee : IsSecretaryOfState2339Bj p c
  condition : MaterialSupportMayBeUsedToCarryOutTerroristActivity2339Bj m c


def Prohibition2339Bj2Violated (p : Person) (m : MaterialSupport) (c : ComplaintText) : Prop :=
  Prohibition2339Bj2 p m c ∧ ApprovalOfProvisionGranted2339Bj p m c




inductive PredicateAct2339C (o : Offense) (c : ComplaintText) : Prop where

  | treatyOffense (h : IsTreatyOffense2339Ca1A o c)

  | intimidationOrCompulsion (h : IsIntimidationOrCompulsionAct2339Ca1B o c)




def JurisdictionExists2339C (p : Person) (o : Offense) (c : ComplaintText) : Prop :=
  (OffenseTakesPlaceInTheUnitedStates2339Cb o c ∧ ForeignNexusCircumstance2339Cb1 p o c)
  ∨ (¬ OffenseTakesPlaceInTheUnitedStates2339Cb o c
      ∧ ExtraterritorialNexusCircumstance2339Cb2 p o c)
  ∨ CommittedOnUnitedStatesVesselOrAircraft2339Cb o c
  ∨ DirectedAtCompellingTheUnitedStates2339Cb5 o c


structure Prohibition2339Ca1 (p : Person) (u : Funds) (o : Offense)
    (c : ComplaintText) : Prop where
  addressee : AddresseeInClass2339Ca1 p c
  predicateAct : PredicateAct2339C o c
  condition : ConditionMet2339Ca1 p u o c
  jurisdiction : JurisdictionExists2339C p o c



def Prohibition2339Ca1Violated (p : Person) (u : Funds) (o : Offense)
    (c : ComplaintText) : Prop :=
  Prohibition2339Ca1 p u o c ∧ RegulatedActOccurred2339Ca1 p u c



def AddresseeInClass2339Cc (p : Person) (c : ComplaintText) : Prop :=
  IsInTheUnitedStates p c
  ∨ (¬ IsInTheUnitedStates p c ∧ IsUnitedStatesNationalOrDomesticLegalEntity p c)


structure Prohibition2339Cc (p : Person) (m : MaterialSupport) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass2339Cc p c
  condition : ConditionMet2339Cc p m c


def Prohibition2339CcViolated (p : Person) (m : MaterialSupport) (c : ComplaintText) : Prop :=
  Prohibition2339Cc p m c ∧ RegulatedActOccurred2339Cc p m c


structure Obligation2339Cf (l : LegalEntity) (p : Person) (c : ComplaintText) : Prop where
  addressee : IsDomesticLegalEntity2339Cf l c
  condition : ManagerCommittedSubsectionAOffense2339Cf l p c



def Obligation2339CfDischarged (l : LegalEntity) (c : ComplaintText) : Prop :=
  10000 ≤ sumPaidToUnitedStates2339Cf l c


def Obligation2339CfBreached (l : LegalEntity) (p : Person) (c : ComplaintText) : Prop :=
  Obligation2339Cf l p c ∧ ¬ Obligation2339CfDischarged l c




structure Prohibition2339D (p : Person) (t : MilitaryTraining) (g : Organization)
    (o : Offense) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass2339D p c
  training : IsMilitaryTypeTraining2339D t c
  designated : OrganizationDesignatedAtTimeOfTraining2339D g t c
  scienter : ConditionMet2339D p g c
  jurisdiction : JurisdictionExists2339D p o c


def Prohibition2339DViolated (p : Person) (t : MilitaryTraining) (g : Organization)
    (o : Offense) (c : ComplaintText) : Prop :=
  Prohibition2339D p t g o c ∧ RegulatedActOccurred2339D p t g c





inductive Ch113BProhibitionViolated (c : ComplaintText) : Prop where

  | harboring (p w : Person) (o : Offense) (h : Prohibition2339Violated p w o c)

  | supportToTerrorists (p : Person) (m : MaterialSupport) (o : Offense)
      (h : Prohibition2339AViolated p m o c)

  | supportToOrganization (p : Person) (m : MaterialSupport) (g : Organization) (o : Offense)
      (h : Prohibition2339Ba1Violated p m g o c)

  | financing (p : Person) (u : Funds) (o : Offense) (h : Prohibition2339Ca1Violated p u o c)

  | concealment (p : Person) (m : MaterialSupport) (h : Prohibition2339CcViolated p m c)

  | militaryTraining (p : Person) (t : MilitaryTraining) (g : Organization) (o : Offense)
      (h : Prohibition2339DViolated p t g o c)



inductive Ch113BObligationBreached (c : ComplaintText) : Prop where

  | retainAndReport (f : FinancialInstitution) (u : Funds) (g : Organization)
      (h : Obligation2339Ba2Breached f u g c)

  | investigate (a : Person) (h : Obligation2339Be1Breached a c)

  | coordinate (a : Person) (h : Obligation2339Be2Breached a c)

  | refer (h : Obligation2339Be3ReferralBreached c)

  | notify (a : Person) (h : Obligation2339Be3NotifyBreached a c)

  | seal (r : CivilProceeding) (q : ClassifiedInfoRequest) (h : Obligation2339Bf1BBreached r q c)

  | grantSubstitution (r : CivilProceeding) (q : ClassifiedInfoRequest)
      (h : Obligation2339Bf2BBreached r q c)

  | pretrialAppeal (r : CivilProceeding) (h : Obligation2339Bf5BiiBreached r c)

  | midtrialAppeal (r : CivilProceeding) (h : Obligation2339Bf5BiiiBreached r c)

  | entityLiability (l : LegalEntity) (p : Person) (h : Obligation2339CfBreached l p c)

end Proving.USC.T18.Ch113B.MaterialSupport.Deontic
