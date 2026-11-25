import Proving.USC.T18.Ch11.Reslice.Deontic.Statute
import Proving.USC.T18.Ch11.Reslice.Deontic.Predicates
import Proving.USC.T18.Ch11.Reslice.Deontic.Types
import Proving.USC.Common.Types
set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T18.Ch11.Reslice.Deontic

open Proving.USC.Common


theorem prohibition201b_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsPublicOfficialOrOfferor201 p c) (hCond : IntentToInfluenceOfficialAct201b p c) (hAct : CorruptlyExchangedThingOfValue201b p c) :
    ProhibitionViolated201b p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibition201c_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsPublicOfficialOrOfferor201 p c) (hAct : ExchangedThingOfValueForOfficialAct201c p c) :
    ProhibitionViolated201c p c :=
  ⟨⟨hAddr⟩, hAct⟩


theorem prohibition203_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsFederalOfficerOrEmployee p c) (hCond : MatterInWhichUSHasInterest203 c) (hAct : SoughtOrReceivedCompensationForRepresentation203 p c) :
    ProhibitionViolated203 p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibition204_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsMemberOfCongress p c) (hAct : PracticedBeforeFederalClaimsOrCircuitCourt204 p c) :
    ProhibitionViolated204 p c :=
  ⟨⟨hAddr⟩, hAct⟩


theorem prohibition205_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsFederalOfficerOrEmployee p c) (hCond : CoveredMatterUSInterest205 c) (hAct : ActedAsAgentOrAttorneyAgainstUS205 p c) :
    ProhibitionViolated205 p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibition207_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsFormerFederalOfficer p c) (hCond : ParticularMatterPriorParticipation207 p c) (hAct : MadeInfluenceCommunicationPostEmployment207 p c) :
    ProhibitionViolated207 p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibition208_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsFederalOfficerOrEmployee p c) (hCond : PersonalFinancialInterestKnown208 p c) (hAct : ParticipatedPersonallyAndSubstantially208 p c) :
    ProhibitionViolated208 p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibition209_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsFederalOfficerOrEmployee p c) (hAct : ReceivedSalaryFromNonUSSource209 p c) :
    ProhibitionViolated209 p c :=
  ⟨⟨hAddr⟩, hAct⟩


theorem prohibition210_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeAnyPerson p c) (hAct : OfferedValueToProcureAppointiveOffice210 p c) :
    ProhibitionViolated210 p c :=
  ⟨⟨hAddr⟩, hAct⟩


theorem prohibition211_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeAnyPerson p c) (hAct : SolicitedValueToObtainAppointiveOffice211 p c) :
    ProhibitionViolated211 p c :=
  ⟨⟨hAddr⟩, hAct⟩


theorem prohibition212_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsFinancialInstitutionInsider p c) (hAct : MadeLoanOrGratuityToExaminer212 p c) :
    ProhibitionViolated212 p c :=
  ⟨⟨hAddr⟩, hAct⟩


theorem prohibition213_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsFinancialInstitutionExaminer p c) (hAct : AcceptedLoanOrGratuityWhileExaminer213 p c) :
    ProhibitionViolated213 p c :=
  ⟨⟨hAddr⟩, hAct⟩


theorem prohibition214_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeAnyPerson p c) (hCond : FeeNotDisclosedInWriting214 c) (hAct : TookFeeForProcuringFederalReserveLoan214 p c) :
    ProhibitionViolated214 p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibition215_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsFinancialInstitutionInsiderOrOfferor215 p c) (hAct : CorruptlyExchangedValueForBankBusiness215 p c) :
    ProhibitionViolated215 p c :=
  ⟨⟨hAddr⟩, hAct⟩


theorem prohibition217_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsFederalOfficerOrEmployee p c) (hAct : AcceptedConsiderationForFarmDebtAdjustment217 p c) :
    ProhibitionViolated217 p c :=
  ⟨⟨hAddr⟩, hAct⟩


theorem prohibition219_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsPublicOfficial p c) (hAct : ActedAsUnregisteredForeignAgent219 p c) :
    ProhibitionViolated219 p c :=
  ⟨⟨hAddr⟩, hAct⟩


theorem prohibition220_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeAnyPerson p c) (hCond : HealthProgramInterstateCommerce220 c) (hAct : KnowinglyPaidOrSolicitedReferralRemuneration220 p c) :
    ProhibitionViolated220 p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibition224_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeAnyPerson p c) (hCond : SchemeInInterstateCommerce224 c) (hAct : SchemeToBribeSportingContest224 p c) :
    ProhibitionViolated224 p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibition225_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeAnyPerson p c) (hCond : ReceivedFiveMillionOver24Months225 p c) (hAct : OrganizedContinuingFinancialCrimesEnterprise225 p c) :
    ProhibitionViolated225 p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibition226_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeAnyPerson p c) (hCond : TerrorismPurposeAffectingSeaport226 p c) (hAct : KnowinglyCorruptBriberyAffectingPortSecurity226 p c) :
    ProhibitionViolated226 p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibition227_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsCoveredGovernmentPerson p c) (hCond : PartisanPoliticalBasis227 p c) (hAct : UsedOfficialActToInfluencePrivateEmployment227 p c) :
    ProhibitionViolated227 p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem obligation208d2_breached_intro {p : Person} {c : ComplaintText}
    (hObl : ObligorIsOfficeOfGovernmentEthics p c) (hNot : ¬ IssuedUniformWaiverRegulations208d2 p c) :
    ObligationBreached208d2 p c :=
  ⟨⟨hObl⟩, hNot⟩


theorem obligation215d_breached_intro {p : Person} {c : ComplaintText}
    (hObl : ObligorIsFinancialRegulatoryAgency p c) (hNot : ¬ EstablishedAndPublishedComplianceGuidelines215d p c) :
    ObligationBreached215d p c :=
  ⟨⟨hObl⟩, hNot⟩


theorem obligation207k5_breached_intro {p : Person} {c : ComplaintText}
    (hObl : ObligorIsSection207WaiverRecipient p c) (hNot : ¬ FiledSemiannualWaiverActivityReport207k5 p c) :
    ObligationBreached207k5 p c :=
  ⟨⟨hObl⟩, hNot⟩


theorem power216b_exercisable_intro {p : Person} {c : ComplaintText}
    (hHolder : PowerHolderIsAttorneyGeneral p c) (hTrig : OffenseConductPresent216 p c) :
    PowerExercisable216b p c :=
  ⟨hHolder, hTrig⟩


theorem power216c_exercisable_intro {p : Person} {c : ComplaintText}
    (hHolder : PowerHolderIsAttorneyGeneral p c) (hTrig : OffenseConductPresent216 p c) :
    PowerExercisable216c p c :=
  ⟨hHolder, hTrig⟩


theorem power218_exercisable_intro {p : Person} {c : ComplaintText}
    (hHolder : PowerHolderIsPresidentOrAgencyHead p c) (hTrig : FinalConvictionForChapterViolation218 p c) :
    PowerExercisable218 p c :=
  ⟨hHolder, hTrig⟩


theorem power212b_exercisable_intro {p : Person} {c : ComplaintText}
    (hHolder : PowerHolderIsFinancialRegulatoryAgency p c) :
    PowerExercisable212b p c :=
  ⟨hHolder⟩


theorem power220c_exercisable_intro {p : Person} {c : ComplaintText}
    (hHolder : PowerHolderIsAttorneyGeneral p c) :
    PowerExercisable220c p c :=
  ⟨hHolder⟩


theorem power207k1_exercisable_intro {p : Person} {c : ComplaintText}
    (hHolder : PowerHolderIsPresident p c) (hTrig : PublicInterestAndCriticalNeed207k1 p c) :
    PowerExercisable207k1 p c :=
  ⟨hHolder, hTrig⟩


theorem permission201d_applies_intro {p : Person} {c : ComplaintText}
    (hExc : WitnessFeesAndCostsPermitted201d p c) :
    PermissionApplies201d p c :=
  ⟨hExc⟩


theorem permission206_applies_intro {p : Person} {c : ComplaintText}
    (hExc : RetiredUniformedOfficerExempt206 p c) :
    PermissionApplies206 p c :=
  ⟨hExc⟩


theorem permission208b_applies_intro {p : Person} {c : ComplaintText}
    (hExc : FinancialInterestExemptionApplies208b p c) :
    PermissionApplies208b p c :=
  ⟨hExc⟩


theorem permission209b_applies_intro {p : Person} {c : ComplaintText}
    (hExc : BonaFideBenefitPlanPermitted209b p c) :
    PermissionApplies209b p c :=
  ⟨hExc⟩


theorem permission207j_applies_intro {p : Person} {c : ComplaintText}
    (hExc : OfficialDutyActivityExempt207j p c) :
    PermissionApplies207j p c :=
  ⟨hExc⟩

end Proving.USC.T18.Ch11.Reslice.Deontic