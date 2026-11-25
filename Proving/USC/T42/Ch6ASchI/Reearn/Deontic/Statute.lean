




















import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T42.Ch6ASchI.Reearn.Deontic.Types
import Proving.USC.T42.Ch6ASchI.Reearn.Deontic.Predicates

set_option autoImplicit false

namespace Proving.USC.T42.Ch6ASchI.Reearn.Deontic

open Proving.USC.Common





structure Prohibition201 (pm : Payment) (c : ComplaintText) : Prop where

  described : PaymentIsHemophiliaSettlementPayment pm c

  condition : DeterminingMedicaidOrSsiEligibility pm c



def Prohibition201Violated (pm : Payment) (c : ComplaintText) : Prop :=
  Prohibition201 pm c ∧ PaymentCountedAsIncomeOrResource pm c

def modalityOf201 : Modality := .prohibition





def Obligation203AssignmentBreached (c : ComplaintText) : Prop :=
  ¬ SecretaryAssignedServiceFunctions c

def modalityOf203Assignment : Modality := .obligation




structure Prohibition203DivisionChange (c : ComplaintText) : Prop where


  act : DivisionEstablishedAbolishedOrTransferred c



def Prohibition203DivisionChangeViolated (c : ComplaintText) : Prop :=
  Prohibition203DivisionChange c ∧ ¬ SecretaryApprovedDivisionChange c

def modalityOf203DivisionChange : Modality := .prohibition





structure Obligation204a2Citizenship (p : Person) (cc : CorpsComponent)
    (c : ComplaintText) : Prop where

  addressee : IsAppointedCommissionedOfficer p cc c


def Obligation204a2CitizenshipBreached (p : Person) (cc : CorpsComponent)
    (c : ComplaintText) : Prop :=
  Obligation204a2Citizenship p cc c ∧ ¬ IsCitizenOfUnitedStates p c

def modalityOf204a2 : Modality := .obligation




structure Obligation204c2ReadyReserve (cc : CorpsComponent) (c : ComplaintText)
    : Prop where

  addressee : IsReadyReserveCorps cc c


def Obligation204c2ReadyReserveBreached (cc : CorpsComponent) (c : ComplaintText)
    : Prop :=
  Obligation204c2ReadyReserve cc c ∧
    (¬ ReadyReserveParticipatedInRoutineTraining c ∨
     ¬ ReadyReserveAvailableForInvoluntaryCall c)

def modalityOf204c2 : Modality := .obligation




def Obligation204aA1Breached (c : ComplaintText) : Prop :=
  ¬ ReadinessRequirementsEstablished c

def modalityOf204aA1 : Modality := .obligation



def Obligation204aA2Breached (p : Person) (c : ComplaintText) : Prop :=
  ¬ AnnualReadinessDeterminationMade p c

def modalityOf204aA2 : Modality := .obligation





structure Obligation204aA3MemberReadiness (p : Person) (c : ComplaintText) : Prop where


  requirementsExist : ReadinessRequirementsEstablished c




def Obligation204aA3Breached (p : Person) (c : ComplaintText) : Prop :=
  Obligation204aA3MemberReadiness p c ∧
    (¬ MemberMeetsReadinessRequirements p c ∨ ¬ MemberCompliedWithDeploymentOrders p c) ∧
    ¬ ReadinessRequirementWaived p c

def modalityOf204aA3 : Modality := .obligation



def Power204aA4Waiver (p : Person) (c : ComplaintText) : Prop :=
  ReadinessRequirementWaived p c ∧ WaiverRegulationsPromulgated c

def modalityOf204aA4 : Modality := .power


def Obligation204aA4BBreached (c : ComplaintText) : Prop :=
  ¬ WaiverRegulationsPromulgated c

def modalityOf204aA4B : Modality := .obligation



def Obligation204aB1Breached (c : ComplaintText) : Prop :=
  ¬ CorpsOrganizedIntoRapidDeploymentUnits c

def modalityOf204aB1 : Modality := .obligation



def modalityOf204aA5 : Modality := .definition






structure Obligation205Qualifications (p : Person) (c : ComplaintText) : Prop where

  appointed : AppointedSurgeonGeneralWithSenateConsent p c


def Obligation205QualificationsBreached (p : Person) (c : ComplaintText) : Prop :=
  Obligation205Qualifications p c ∧
    (¬ IsMemberOfRegularCorps p c ∨ ¬ HasPublicHealthTrainingOrExperience p c)

def modalityOf205Qualifications : Modality := .obligation



def Obligation205ReversionBreached (p : Person) (c : ComplaintText) : Prop :=
  SurgeonGeneralTermExpiredWithoutReappointment p c ∧
    ¬ RevertedToFormerGradeOnExpiration p c

def modalityOf205Reversion : Modality := .obligation





def Obligation206aDeputyBreached (c : ComplaintText) : Prop :=
  ¬ DeputySurgeonGeneralAssigned c

def modalityOf206a : Modality := .obligation



def Obligation206bAssistantsBreached (c : ComplaintText) : Prop :=
  ¬ EightAssistantSurgeonsGeneralAssigned c

def modalityOf206b : Modality := .obligation




def Obligation206dActingBreached (c : ComplaintText) : Prop :=
  ¬ ActingSurgeonGeneralDesignated c

def modalityOf206d : Modality := .obligation




def Prohibition206c2CapViolated (c : ComplaintText) : Prop :=
  100 * temporaryAssistantSurgeonGeneralPositions c > activeDutyOfficerCapBase c

def modalityOf206c2 : Modality := .prohibition





def Obligation207bSuffixBreached (c : ComplaintText) : Prop :=
  ¬ ReadyReserveTitlesCarryReserveSuffix c

def modalityOf207b : Modality := .obligation



def Obligation207dMaximaBreached (c : ComplaintText) : Prop :=
  ¬ GradeMaximaPrescribedByRegulation c

def modalityOf207dMaxima : Modality := .obligation




def Prohibition207dAppropriationLimitViolated (c : ComplaintText) : Prop :=
  PrescribedMaximumExceedsAppropriationLimit c

def modalityOf207dAppropriationLimit : Modality := .prohibition



def Prohibition207dNoForcedSeparationViolated (c : ComplaintText) : Prop :=
  MaximaRequireSeparationOrGradeReduction c

def modalityOf207dNoForcedSeparation : Modality := .prohibition





structure Prohibition209a1Examination (p : Person) (g : Grade) (c : ComplaintText)
    : Prop where

  act : OriginalAppointmentMade p g c

  condition : IsGradeAboveJuniorAssistant g c


def Prohibition209a1ExaminationViolated (p : Person) (g : Grade) (c : ComplaintText)
    : Prop :=
  Prohibition209a1Examination p g c ∧ ¬ PromotionExaminationPassed p c

def modalityOf209a1 : Modality := .prohibition




structure Prohibition209a3AgeFortyFour (p : Person) (c : ComplaintText) : Prop where

  condition : HasAttainedAgeFortyFour p c



def Prohibition209a3AgeFortyFourViolated (p : Person) (g : Grade)
    (c : ComplaintText) : Prop :=
  Prohibition209a3AgeFortyFour p c ∧
    (OriginalAppointmentMade p g c ∨ CalledToActiveDutyExceedingOneYear p c) ∧
    ¬ AgeFortyFourExceptionApplies p c

def modalityOf209a3 : Modality := .prohibition




def Permission209e1Reappointment (p : Person) (c : ComplaintText) : Prop :=
  IsFormerRegularCorpsOfficer p c ∧ FiledWithinStatutoryPeriod p c ∧
    MeetsReappointmentStandards p c

def modalityOf209e1 : Modality := .permission







def Permission209fgAlienEmployment (p : Person) (c : ComplaintText) : Prop :=
  EmployedAsSpecialConsultantOrFellow p c ∧ ¬ OtherActProhibitsAlienEmployment p c

def modalityOf209fg : Modality := .permission





def Permission209dOsteopath (p : Person) (c : ComplaintText) : Prop :=
  IsOsteopathyGraduateFromRecognizedCollege p c

def modalityOf209d : Modality := .permission






def Permission210bPurchase (p : Person) (c : ComplaintText) : Prop :=
  IsOnActiveDutyOrEntitledToRetiredPay p c

def modalityOf210b : Modality := .permission



def Prohibition210cRateCapViolated (c : ComplaintText) : Prop :=
  councilMemberDailyCompensationRate c > gs18DailyEquivalentRate c

def modalityOf210c : Modality := .prohibition



def Prohibition210gPositionCapViolated (c : ComplaintText) : Prop :=
  positionsEstablishedUnderSection210g c > 179

def modalityOf210g : Modality := .prohibition






def Permission210_1aLeave (p : Person) (r : Regulation) (c : ComplaintText) : Prop :=
  TakenInAccordanceWithRegulations r c ∧ LeaveGrantedWithoutPayDeduction p c

def modalityOf210_1a : Modality := .permission



def Prohibition210_1bLeaveCapViolated (c : ComplaintText) : Prop :=
  accumulatedAnnualLeaveDaysAuthorized c > 120

def modalityOf210_1b : Modality := .prohibition





def Obligation210bACategoriesBreached (c : ComplaintText) : Prop :=
  ¬ ProfessionalCategoriesEstablishedByRegulation c

def modalityOf210bA : Modality := .obligation



def Obligation210bBAssignmentBreached (p : Person) (c : ComplaintText) : Prop :=
  ProfessionalCategoriesEstablishedByRegulation c ∧
    ¬ OfficerAssignedToProfessionalCategory p c

def modalityOf210bBAssignment : Modality := .obligation




structure Prohibition210bBReassignment (p : Person) (c : ComplaintText) : Prop where

  act : CategoryAssignmentChanged p c


def Prohibition210bBReassignmentViolated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition210bBReassignment p c ∧ ¬ ReassignmentFindingSupportsChange p c

def modalityOf210bBReassignment : Modality := .prohibition



def Obligation210bCMaximaBreached (c : ComplaintText) : Prop :=
  ¬ CategoryGradeMaximaDetermined c

def modalityOf210bC : Modality := .obligation





structure Prohibition211aUnexaminedPromotion (p : Person) (g : Grade)
    (c : ComplaintText) : Prop where

  act : PermanentPromotionMade p g c


def Prohibition211aUnexaminedPromotionViolated (p : Person) (g : Grade)
    (c : ComplaintText) : Prop :=
  Prohibition211aUnexaminedPromotion p g c ∧ ¬ PromotionExaminationPassed p c

def modalityOf211a : Modality := .prohibition




structure Prohibition211eRestrictedGrade (p : Person) (g : Grade)
    (c : ComplaintText) : Prop where

  act : PermanentPromotionMade p g c

  condition : IsRestrictedOrDirectorGrade g c


def Prohibition211eRestrictedGradeViolated (p : Person) (g : Grade)
    (c : ComplaintText) : Prop :=
  Prohibition211eRestrictedGrade p g c ∧ ¬ HasOneYearInNextLowerGrade p c

def modalityOf211e : Modality := .prohibition




structure Obligation211gSeparation (p : Person) (c : ComplaintText) : Prop where

  condition : TwiceExaminedAndNotPromoted p c



def Obligation211gSeparationBreached (p : Person) (c : ComplaintText) : Prop :=
  Obligation211gSeparation p c ∧ ¬ FailureForPhysicalDisability p c ∧
    ¬ SeparatedFromService p c

def modalityOf211g : Modality := .obligation







structure Obligation211cCredit (p : Person) (c : ComplaintText) : Prop where


  condition : CompletedMedicalInternshipAtAppointment p c


def Obligation211cCreditBreached (p : Person) (c : ComplaintText) : Prop :=
  Obligation211cCredit p c ∧ ¬ SimilarInternshipCreditUnderOtherLaw p c ∧
    ¬ OneYearPromotionCreditGranted p c

def modalityOf211c : Modality := .obligation











def Permission212a1Retirement (p : Person) (c : ComplaintText) : Prop :=
  AttainedAgeSixtyFour p c ∧ AppliedForRetirement p c

def modalityOf212a1Permission : Modality := .permission



def Obligation212a1RetireBreached (p : Person) (c : ComplaintText) : Prop :=
  Permission212a1Retirement p c ∧ ¬ RetiredOnOrAfterFirstDayOfFollowingMonth p c

def modalityOf212a1Obligation : Modality := .obligation



def Prohibition212a4dPayCapViolated (p : Person) (c : ComplaintText) : Prop :=
  retiredPayPercentOfBasicPay p c > 75

def modalityOf212a4d : Modality := .prohibition


def modalityOf212d : Modality := .definition







def Permission213aMilitaryBenefits (p : Person) (c : ComplaintText) : Prop :=
  PerformedQualifyingActiveService p c ∧
    ¬ BenefitClaimedIsRetiredPayOrUniformAllowance p c

def modalityOf213a : Modality := .permission







def Permission213aTitle10Rights (p : Person) (c : ComplaintText) : Prop :=
  IsOfficerOrSurvivingBeneficiary p c ∧
    ¬ OrderedToActiveDutyForTrainingOverThirtyDays p c

def modalityOf213aTitle10 : Modality := .permission



def Obligation213aBAuthorityBreached (c : ComplaintText) : Prop :=
  ¬ Title10AuthorityExercisedByHhsSecretary c

def modalityOf213aB : Modality := .obligation






structure Obligation214aFlag (p : Person) (c : ComplaintText) : Prop where

  condition : ReleasedFromActiveServiceForRetirement p c


def Obligation214aFlagBreached (p : Person) (c : ComplaintText) : Prop :=
  Obligation214aFlag p c ∧ ¬ PreviouslyPresentedRetirementFlag p c ∧
    ¬ UnitedStatesFlagPresented p c

def modalityOf214a : Modality := .obligation



def Prohibition214cNoCostViolated (p : Person) (c : ComplaintText) : Prop :=
  FlagPresentedAtCostToRecipient p c

def modalityOf214c : Modality := .prohibition





def Power215aDetail (c : ComplaintText) : Prop :=
  ExecutiveDepartmentHeadRequestedDetail c

def modalityOf215a : Modality := .power





structure Obligation215dPay (p : Person) (c : ComplaintText) : Prop where

  addressee : IsDetailedUnderSection215 p c



def Obligation215dPayBreached (p : Person) (c : ComplaintText) : Prop :=
  Obligation215dPay p c ∧ ¬ PlacedOnLeaveWithoutPayAndPaidByHost p c ∧
    ¬ DetailedPersonnelPaidFromServiceAppropriations p c

def modalityOf215d : Modality := .obligation






structure Prohibition215eSoleAuthority (p : Person) (c : ComplaintText) : Prop where

  act : DeployedByOtherThanSecretary p c


  condition : IsUrgentOrEmergencyPublicHealthCareNeed c


def Prohibition215eSoleAuthorityViolated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition215eSoleAuthority p c ∧ ¬ DeploymentAuthorityExclusionApplies p c

def modalityOf215e : Modality := .prohibition






def Power217Declaration (c : ComplaintText) : Prop :=
  (IsTimeOfWar c ∨ PresidentialEmergencyProclaimed c) ∧
    CommissionedCorpsDeclaredMilitaryService c

def modalityOf217Declaration : Modality := .power



def Obligation217UcmjBreached (c : ComplaintText) : Prop :=
  Power217Declaration c ∧ ¬ CorpsSubjectToUniformCodeOfMilitaryJustice c

def modalityOf217Ucmj : Modality := .obligation





def Power217aAppointment (ab : AdvisoryBody) (c : ComplaintText) : Prop :=
  AdvisoryBodyAppointedBySecretary ab c

def modalityOf217aA : Modality := .power




structure Obligation217aBCompensation (p : Person) (ab : AdvisoryBody)
    (c : ComplaintText) : Prop where

  appointed : AdvisoryBodyAppointedBySecretary ab c

  addressee : IsMemberOfAdvisoryBody p ab c


def Obligation217aBCompensationBreached (p : Person) (ab : AdvisoryBody)
    (c : ComplaintText) : Prop :=
  Obligation217aBCompensation p ab c ∧ ¬ IsRegularFullTimeFederalEmployee p c ∧
    ¬ AdvisoryMemberCompensatedUnderSection210c p c

def modalityOf217aB : Modality := .obligation






structure Prohibition217a1PoliticalAffiliation (p : Person) (c : ComplaintText)
    : Prop where

  condition : IsAppointmentToCoveredAdvisoryCommittee p c


def Prohibition217a1PoliticalAffiliationViolated (p : Person) (c : ComplaintText)
    : Prop :=
  Prohibition217a1PoliticalAffiliation p c ∧ PoliticalAffiliationConsidered p c

def modalityOf217a1 : Modality := .prohibition







inductive Ch6ASchIDeonticTransgression (p : Person) (c : ComplaintText) : Prop where

  | divisionChange (h : Prohibition203DivisionChangeViolated c)

  | readinessBreach (h : Obligation204aA3Breached p c)

  | deploymentUnits (h : Obligation204aB1Breached c)

  | surgeonGeneralQualifications (h : Obligation205QualificationsBreached p c)

  | temporaryPositionCap (h : Prohibition206c2CapViolated c)

  | appropriationLimit (h : Prohibition207dAppropriationLimitViolated c)

  | unexaminedAppointment (g : Grade)
      (h : Prohibition209a1ExaminationViolated p g c)

  | ageFortyFour (g : Grade) (h : Prohibition209a3AgeFortyFourViolated p g c)

  | positionCap (h : Prohibition210gPositionCapViolated c)

  | leaveCap (h : Prohibition210_1bLeaveCapViolated c)

  | reassignment (h : Prohibition210bBReassignmentViolated p c)

  | restrictedGrade (g : Grade) (h : Prohibition211eRestrictedGradeViolated p g c)

  | separation (h : Obligation211gSeparationBreached p c)

  | internshipCredit (h : Obligation211cCreditBreached p c)

  | retirement (h : Obligation212a1RetireBreached p c)

  | retiredPayCap (h : Prohibition212a4dPayCapViolated p c)

  | flagNotPresented (h : Obligation214aFlagBreached p c)

  | flagAtCost (h : Prohibition214cNoCostViolated p c)

  | detailPay (h : Obligation215dPayBreached p c)

  | deploymentAuthority (h : Prohibition215eSoleAuthorityViolated p c)

  | advisoryCompensation (ab : AdvisoryBody)
      (h : Obligation217aBCompensationBreached p ab c)

  | politicalAffiliation (h : Prohibition217a1PoliticalAffiliationViolated p c)

end Proving.USC.T42.Ch6ASchI.Reearn.Deontic
