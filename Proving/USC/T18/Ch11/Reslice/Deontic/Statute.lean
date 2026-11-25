import Proving.USC.T18.Ch11.Reslice.Deontic.Predicates
import Proving.USC.T18.Ch11.Reslice.Deontic.Types
import Proving.USC.Common.Types
set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T18.Ch11.Reslice.Deontic

open Proving.USC.Common


structure Prohibition201b (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsPublicOfficialOrOfferor201 p c
  condition : IntentToInfluenceOfficialAct201b p c



def ProhibitionViolated201b (p : Person) (c : ComplaintText) : Prop :=
  Prohibition201b p c ∧ CorruptlyExchangedThingOfValue201b p c


structure Prohibition201c (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsPublicOfficialOrOfferor201 p c



def ProhibitionViolated201c (p : Person) (c : ComplaintText) : Prop :=
  Prohibition201c p c ∧ ExchangedThingOfValueForOfficialAct201c p c


structure Prohibition203 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsFederalOfficerOrEmployee p c
  condition : MatterInWhichUSHasInterest203 c



def ProhibitionViolated203 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition203 p c ∧ SoughtOrReceivedCompensationForRepresentation203 p c


structure Prohibition204 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsMemberOfCongress p c



def ProhibitionViolated204 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition204 p c ∧ PracticedBeforeFederalClaimsOrCircuitCourt204 p c


structure Prohibition205 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsFederalOfficerOrEmployee p c
  condition : CoveredMatterUSInterest205 c



def ProhibitionViolated205 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition205 p c ∧ ActedAsAgentOrAttorneyAgainstUS205 p c


structure Prohibition207 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsFormerFederalOfficer p c
  condition : ParticularMatterPriorParticipation207 p c



def ProhibitionViolated207 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition207 p c ∧ MadeInfluenceCommunicationPostEmployment207 p c


structure Prohibition208 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsFederalOfficerOrEmployee p c
  condition : PersonalFinancialInterestKnown208 p c



def ProhibitionViolated208 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition208 p c ∧ ParticipatedPersonallyAndSubstantially208 p c


structure Prohibition209 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsFederalOfficerOrEmployee p c



def ProhibitionViolated209 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition209 p c ∧ ReceivedSalaryFromNonUSSource209 p c


structure Prohibition210 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeAnyPerson p c



def ProhibitionViolated210 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition210 p c ∧ OfferedValueToProcureAppointiveOffice210 p c


structure Prohibition211 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeAnyPerson p c



def ProhibitionViolated211 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition211 p c ∧ SolicitedValueToObtainAppointiveOffice211 p c


structure Prohibition212 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsFinancialInstitutionInsider p c



def ProhibitionViolated212 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition212 p c ∧ MadeLoanOrGratuityToExaminer212 p c


structure Prohibition213 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsFinancialInstitutionExaminer p c



def ProhibitionViolated213 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition213 p c ∧ AcceptedLoanOrGratuityWhileExaminer213 p c


structure Prohibition214 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeAnyPerson p c
  condition : FeeNotDisclosedInWriting214 c



def ProhibitionViolated214 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition214 p c ∧ TookFeeForProcuringFederalReserveLoan214 p c


structure Prohibition215 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsFinancialInstitutionInsiderOrOfferor215 p c



def ProhibitionViolated215 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition215 p c ∧ CorruptlyExchangedValueForBankBusiness215 p c


structure Prohibition217 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsFederalOfficerOrEmployee p c



def ProhibitionViolated217 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition217 p c ∧ AcceptedConsiderationForFarmDebtAdjustment217 p c


structure Prohibition219 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsPublicOfficial p c



def ProhibitionViolated219 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition219 p c ∧ ActedAsUnregisteredForeignAgent219 p c


structure Prohibition220 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeAnyPerson p c
  condition : HealthProgramInterstateCommerce220 c



def ProhibitionViolated220 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition220 p c ∧ KnowinglyPaidOrSolicitedReferralRemuneration220 p c


structure Prohibition224 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeAnyPerson p c
  condition : SchemeInInterstateCommerce224 c



def ProhibitionViolated224 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition224 p c ∧ SchemeToBribeSportingContest224 p c


structure Prohibition225 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeAnyPerson p c
  condition : ReceivedFiveMillionOver24Months225 p c



def ProhibitionViolated225 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition225 p c ∧ OrganizedContinuingFinancialCrimesEnterprise225 p c


structure Prohibition226 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeAnyPerson p c
  condition : TerrorismPurposeAffectingSeaport226 p c



def ProhibitionViolated226 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition226 p c ∧ KnowinglyCorruptBriberyAffectingPortSecurity226 p c


structure Prohibition227 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsCoveredGovernmentPerson p c
  condition : PartisanPoliticalBasis227 p c



def ProhibitionViolated227 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition227 p c ∧ UsedOfficialActToInfluencePrivateEmployment227 p c


structure Obligation208d2 (p : Person) (c : ComplaintText) : Prop where
  obligor : ObligorIsOfficeOfGovernmentEthics p c



def ObligationBreached208d2 (p : Person) (c : ComplaintText) : Prop :=
  Obligation208d2 p c ∧ ¬ IssuedUniformWaiverRegulations208d2 p c


structure Obligation215d (p : Person) (c : ComplaintText) : Prop where
  obligor : ObligorIsFinancialRegulatoryAgency p c



def ObligationBreached215d (p : Person) (c : ComplaintText) : Prop :=
  Obligation215d p c ∧ ¬ EstablishedAndPublishedComplianceGuidelines215d p c


structure Obligation207k5 (p : Person) (c : ComplaintText) : Prop where
  obligor : ObligorIsSection207WaiverRecipient p c



def ObligationBreached207k5 (p : Person) (c : ComplaintText) : Prop :=
  Obligation207k5 p c ∧ ¬ FiledSemiannualWaiverActivityReport207k5 p c


structure Power216b (p : Person) (c : ComplaintText) : Prop where
  holder : PowerHolderIsAttorneyGeneral p c
  trigger : OffenseConductPresent216 p c


def PowerExercisable216b (p : Person) (c : ComplaintText) : Prop :=
  Power216b p c


structure Power216c (p : Person) (c : ComplaintText) : Prop where
  holder : PowerHolderIsAttorneyGeneral p c
  trigger : OffenseConductPresent216 p c


def PowerExercisable216c (p : Person) (c : ComplaintText) : Prop :=
  Power216c p c


structure Power218 (p : Person) (c : ComplaintText) : Prop where
  holder : PowerHolderIsPresidentOrAgencyHead p c
  trigger : FinalConvictionForChapterViolation218 p c


def PowerExercisable218 (p : Person) (c : ComplaintText) : Prop :=
  Power218 p c


structure Power212b (p : Person) (c : ComplaintText) : Prop where
  holder : PowerHolderIsFinancialRegulatoryAgency p c


def PowerExercisable212b (p : Person) (c : ComplaintText) : Prop :=
  Power212b p c


structure Power220c (p : Person) (c : ComplaintText) : Prop where
  holder : PowerHolderIsAttorneyGeneral p c


def PowerExercisable220c (p : Person) (c : ComplaintText) : Prop :=
  Power220c p c


structure Power207k1 (p : Person) (c : ComplaintText) : Prop where
  holder : PowerHolderIsPresident p c
  trigger : PublicInterestAndCriticalNeed207k1 p c


def PowerExercisable207k1 (p : Person) (c : ComplaintText) : Prop :=
  Power207k1 p c


structure Permission201d (p : Person) (c : ComplaintText) : Prop where
  exception : WitnessFeesAndCostsPermitted201d p c


def PermissionApplies201d (p : Person) (c : ComplaintText) : Prop :=
  Permission201d p c


structure Permission206 (p : Person) (c : ComplaintText) : Prop where
  exception : RetiredUniformedOfficerExempt206 p c


def PermissionApplies206 (p : Person) (c : ComplaintText) : Prop :=
  Permission206 p c


structure Permission208b (p : Person) (c : ComplaintText) : Prop where
  exception : FinancialInterestExemptionApplies208b p c


def PermissionApplies208b (p : Person) (c : ComplaintText) : Prop :=
  Permission208b p c


structure Permission209b (p : Person) (c : ComplaintText) : Prop where
  exception : BonaFideBenefitPlanPermitted209b p c


def PermissionApplies209b (p : Person) (c : ComplaintText) : Prop :=
  Permission209b p c


structure Permission207j (p : Person) (c : ComplaintText) : Prop where
  exception : OfficialDutyActivityExempt207j p c


def PermissionApplies207j (p : Person) (c : ComplaintText) : Prop :=
  Permission207j p c

end Proving.USC.T18.Ch11.Reslice.Deontic