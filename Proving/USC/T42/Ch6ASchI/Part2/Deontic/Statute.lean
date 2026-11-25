import Proving.USC.T42.Ch6ASchI.Part2.Deontic.Predicates









namespace Proving.USC.T42.Ch6ASchI.Part2.Deontic

open Proving.USC.Common




def AttainedRetirementAge212 (o : Officer) (c : ComplaintText) : Prop :=
  officerAgeYears212 o c ≥ 64


def CompletedThirtyYearsService212 (o : Officer) (c : ComplaintText) : Prop :=
  yearsActiveService212 o c ≥ 30



def QualifyingActiveService213 (o : Officer) (c : ComplaintText) : Prop :=
  ServedInTimeOfWar213 o c ∨ ServedOnDetailWithArmedForces213 o c ∨
    ServedWhileServiceInMilitaryForces213 o c





structure Obligation211 (o : Officer) (c : ComplaintText) : Prop where
  addressee : AddresseeQualifiedOfficer211 o c
  condition : CompletedRequiredServiceYears211 o c



def Obligation211Breached (o : Officer) (c : ComplaintText) : Prop :=
  Obligation211 o c ∧ ¬ PermanentPromotionGiven211 o c



structure Prohibition211 (o : Officer) (c : ComplaintText) : Prop where
  addressee : AddresseeOfficerRegularCorps211 o c
  condition : LacksOneYearInNextLowerGrade211 o c


def Prohibition211Violated (o : Officer) (c : ComplaintText) : Prop :=
  Prohibition211 o c ∧ PromotedToRestrictedOrDirectorGrade211 o c





structure Obligation211c (o : Officer) (c : ComplaintText) : Prop where
  addressee : AddresseeQualifyingMedicalOfficer211c o c
  condition : NoSimilarCreditReceived211c o c


def Obligation211cBreached (o : Officer) (c : ComplaintText) : Prop :=
  Obligation211c o c ∧ ¬ OneYearPromotionCreditGiven211c o c





structure Obligation212 (o : Officer) (c : ComplaintText) : Prop where
  addressee : AddresseeOfficerRegularCorps212 o c
  age : AttainedRetirementAge212 o c
  application : AppliedForRetirement212 o c


def Obligation212Breached (o : Officer) (c : ComplaintText) : Prop :=
  Obligation212 o c ∧ ¬ RetiredOnApplication212 o c



structure Power212 (o : Officer) (c : ComplaintText) : Prop where
  addressee : AddresseeOfficerRegularCorps212 o c
  thirtyYears : CompletedThirtyYearsService212 o c





structure Obligation213 (o : Officer) (c : ComplaintText) : Prop where
  addressee : AddresseeCommissionedOfficer213 o c
  service : QualifyingActiveService213 o c


def Obligation213Breached (o : Officer) (c : ComplaintText) : Prop :=
  Obligation213 o c ∧ ¬ MilitaryBenefitsAccorded213 o c



structure Power213Ribbons (c : ComplaintText) : Prop where
  authority : PresidentAuthorizedRibbonConditions213 c





structure Obligation213a (o : Officer) (c : ComplaintText) : Prop where
  beneficiary : AddresseeCommissionedOfficer213a o c


def Obligation213aBreached (o : Officer) (c : ComplaintText) : Prop :=
  Obligation213a o c ∧ ¬ Title10RightsAccorded213a o c





structure Obligation214 (o : Officer) (c : ComplaintText) : Prop where
  released : AddresseeReleasedForRetirement214 o c
  notPrevious : ¬ PreviouslyPresentedFlag214 o c


def Obligation214Breached (o : Officer) (c : ComplaintText) : Prop :=
  Obligation214 o c ∧ ¬ FlagPresented214 o c





structure Power215 (c : ComplaintText) : Prop where
  request : RequestByExecutiveDepartmentHead215 c


def Power215Exercised (o : Officer) (c : ComplaintText) : Prop :=
  Power215 c ∧ PersonnelDetailed215 o c





structure Obligation216 (c : ComplaintText) : Prop where
  matter : RegulatoryMatterUnderTitle216 c


def Obligation216Breached (c : ComplaintText) : Prop :=
  Obligation216 c ∧ ¬ PresidentPrescribedRegulations216 c



structure Prohibition216 (r : Regulation) (c : ComplaintText) : Prop where
  domain : RelatesToMedicalOfficerQualifications216 r c


def Prohibition216Violated (r : Regulation) (c : ComplaintText) : Prop :=
  Prohibition216 r c ∧ GivesPreferenceToSchoolOfMedicine216 r c





structure Power217 (c : ComplaintText) : Prop where
  trigger : InTimeOfWarOrEmergencyProclaimed217 c


def Power217Exercised (c : ComplaintText) : Prop :=
  Power217 c ∧ PresidentDeclaredCorpsMilitaryService217 c





structure Power217a (a : AdvisoryCommittee) (c : ComplaintText) : Prop where
  purpose : ForPurposeOfAdvisingSecretary217a c


def Power217aExercised (a : AdvisoryCommittee) (c : ComplaintText) : Prop :=
  Power217a a c ∧ SecretaryAppointedAdvisoryCouncil217a a c





structure Prohibition217a1 (a : AdvisoryCommittee) (c : ComplaintText) : Prop where
  covered : AppointmentToCoveredAdvisoryCommittee217a1 a c


def Prohibition217a1Violated (a : AdvisoryCommittee) (c : ComplaintText) : Prop :=
  Prohibition217a1 a c ∧ ConsideredPoliticalAffiliation217a1 a c



def obligation211Modality : Modality := Modality.obligation
def prohibition211Modality : Modality := Modality.prohibition
def obligation211cModality : Modality := Modality.obligation
def obligation212Modality : Modality := Modality.obligation
def power212Modality : Modality := Modality.power
def obligation213Modality : Modality := Modality.obligation
def power213RibbonsModality : Modality := Modality.power
def obligation213aModality : Modality := Modality.obligation
def obligation214Modality : Modality := Modality.obligation
def power215Modality : Modality := Modality.power
def obligation216Modality : Modality := Modality.obligation
def prohibition216Modality : Modality := Modality.prohibition
def power217Modality : Modality := Modality.power
def power217aModality : Modality := Modality.power
def prohibition217a1Modality : Modality := Modality.prohibition

end Proving.USC.T42.Ch6ASchI.Part2.Deontic
