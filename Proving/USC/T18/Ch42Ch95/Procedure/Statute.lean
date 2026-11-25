









import Proving.USC.T18.Ch42Ch95.Procedure.Types
import Proving.USC.T18.Ch42Ch95.Procedure.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch42Ch95.Procedure

open Proving.USC.Common






structure Transition (S : Type) where
  source : S
  target : S
  guard  : Prop







def RateExceedsStatutoryThreshold (pr : Prosecution) (c : ComplaintText) : Prop :=
  annualInterestRatePercent pr c > extortionateRateThresholdPercent



def OutstandingCreditExceedsThreshold (pr : Prosecution) (c : ComplaintText) : Prop :=
  outstandingCreditTotalDollars pr c > outstandingCreditThresholdDollars




def TransactionValueExceedsThreshold (pr : Prosecution) (c : ComplaintText) : Prop :=
  transactionValueDollars pr c > extraterritorialValueThresholdDollars






def ChargeNotBeforeOffense (pr : Prosecution) (c : ComplaintText) : Prop :=
  offenseCommittedDay pr c ≤ chargingInstrumentDay pr c



noncomputable def daysFromOffenseToCharge (pr : Prosecution) (c : ComplaintText) : Nat :=
  chargingInstrumentDay pr c - offenseCommittedDay pr c




def WithinSevenYearWindow (pr : Prosecution) (c : ComplaintText) : Prop :=
  ChargeNotBeforeOffense pr c ∧ daysFromOffenseToCharge pr c ≤ sevenYearWindowDays







def SevenYearBarHasRun (pr : Prosecution) (c : ComplaintText) : Prop :=
  SuaIsForeignNationOffense pr c ∧ ¬ WithinSevenYearWindow pr c







structure PrimaFacieShowing892b (pr : Prosecution) (c : ComplaintText) : Prop where

  inProsecution : ProsecutionUnderSection892 pr c

  unenforceable : RepaymentUnenforceableInDebtorJurisdiction pr c

  rateExceeds : RateExceedsStatutoryThreshold pr c

  debtorBelief : DebtorReasonablyBelievedExtortionateHistory pr c

  outstandingExceeds : OutstandingCreditExceedsThreshold pr c



structure ReputationEvidenceAdmitted892c (pr : Prosecution) (c : ComplaintText) : Prop where

  inProsecution : ProsecutionUnderSection892 pr c

  predicateEvidence : EvidenceOf892b1Or892b2Introduced pr c

  noDirectEvidence : DirectEvidenceOfDebtorBeliefUnavailable pr c

  communityBound : DebtorWasMemberOfCommunityAtExtension pr c

  courtAllowed : CourtAllowedCreditorReputationEvidence pr c






structure ImplicitThreatEvidence894b (pr : Prosecution) (c : ComplaintText) : Prop where

  inProsecution : ProsecutionUnderSection894 pr c


  purpose : ImplicitThreatAllegedAsMeansOfCollection pr c

  historyEvidence : EvidenceOfKnownExtortionateCollectionHistory pr c





structure ReputationEvidenceAdmitted894c (pr : Prosecution) (c : ComplaintText) : Prop where

  inProsecution : ProsecutionUnderSection894 pr c


  predicateEvidence : EvidenceOf892bCircumstancesAtExtension pr c

  noDirectEvidence : DirectEvidenceOfDebtorBeliefUnavailable pr c


  communicationShown : CommunicationShownEmployedAsCollectionMeans pr c


  communityBound : ThreatTargetWasMemberOfCommunityAtCollection pr c

  courtAllowed : CourtAllowedDefendantReputationEvidence pr c





structure LiquorInvestigationSupervised1952c (inv : Investigation) (c : ComplaintText) : Prop where

  underSection : InvestigationUnderSection1952 inv c

  involvesLiquor : InvestigationInvolvesLiquor inv c


  supervised : ConductedUnderAttorneyGeneralSupervision inv c






structure Section1952ProsecutionAvailable (pr : Prosecution) (c : ComplaintText) : Prop where

  notExcluded : ¬ SavingsPromotionRaffleByInsuredInstitution pr c






structure TimelyCharge1956j (pr : Prosecution) (c : ComplaintText) : Prop where

  underSection : ProsecutionUnderSection1956Or1957 pr c


  foreignSua : SuaIsForeignNationOffense pr c

  charged : ChargingInstrumentReturned pr c

  timely : WithinSevenYearWindow pr c





structure ExtraterritorialJurisdiction1956f (pr : Prosecution) (c : ComplaintText) : Prop where


  actorNexus : ConductByUnitedStatesCitizen pr c ∨ ConductOccursInPartInUnitedStates pr c

  valueNexus : TransactionValueExceedsThreshold pr c



inductive VenueProper1956i (pr : Prosecution) (d : District) (c : ComplaintText) : Prop where

  | transactionDistrict
      (h : TransactionConductedInDistrict pr d c)



  | suaTransferDistrict
      (hSua : UnderlyingSuaProsecutableInDistrict pr d c)
      (hTransfer : DefendantParticipatedInTransferFromDistrict pr d c)


  | inchoateFurtherance
      (hInchoate : IsAttemptOrConspiracyOffense pr c)
      (hAct : ActInFurtheranceOccurredInDistrict pr d c)


  | continuingTransaction
      (h : PortionOfContinuingTransactionInDistrict pr d c)





inductive Reachable1956 (pr : Prosecution) (c : ComplaintText) :
    ProsecutionState → Prop where

  | start
      (h : ProsecutionUnderSection1956Or1957 pr c)
      : Reachable1956 pr c ProsecutionState.Uncharged

  | charge
      (hPrev : Reachable1956 pr c ProsecutionState.Uncharged)
      (hTimely : TimelyCharge1956j pr c)
      : Reachable1956 pr c ProsecutionState.Charged


  | layVenue {d : District}
      (hPrev : Reachable1956 pr c ProsecutionState.Charged)
      (hVenue : VenueProper1956i pr d c)
      : Reachable1956 pr c ProsecutionState.VenueLaid


  | timeBar
      (hPrev : Reachable1956 pr c ProsecutionState.Uncharged)
      (hBar : SevenYearBarHasRun pr c)
      : Reachable1956 pr c ProsecutionState.TimeBarred


noncomputable def chargeTransition1956j (pr : Prosecution) (c : ComplaintText) :
    Transition ProsecutionState :=
  { source := ProsecutionState.Uncharged
    target := ProsecutionState.Charged
    guard  := TimelyCharge1956j pr c }


noncomputable def timeBarTransition1956j (pr : Prosecution) (c : ComplaintText) :
    Transition ProsecutionState :=
  { source := ProsecutionState.Uncharged
    target := ProsecutionState.TimeBarred
    guard  := SevenYearBarHasRun pr c }





inductive ForeignPersonJurisdictionBasis1956b2
    (p : Person) (ca : CivilPenaltyAction) (c : ComplaintText) : Prop where

  | usTransactionOffense (h : ForeignPersonOffenseInvolvingUsTransaction p ca c)

  | convertedForfeitedProperty (h : ForeignPersonConvertedForfeitedUsProperty p ca c)

  | maintainsUsAccount (h : ForeignInstitutionMaintainsUsBankAccount p ca c)





structure PersonalJurisdictionOverForeignPerson1956b2
    (p : Person) (ca : CivilPenaltyAction) (c : ComplaintText) : Prop where

  actionFiled : CivilPenaltyActionFiled ca c

  foreignPerson : DefendantIsForeignPerson p ca c


  served : ServiceOfProcessMadeOnForeignPerson p ca c

  basis : ForeignPersonJurisdictionBasis1956b2 p ca c




structure AssetsSecured1956b3 (ca : CivilPenaltyAction) (c : ComplaintText) : Prop where

  actionFiled : CivilPenaltyActionFiled ca c

  restrainingOrder : CourtIssuedPretrialRestrainingOrder ca c




structure FederalReceiverAppointment1956b4
    (ra : ReceivershipApplication) (c : ComplaintText) : Prop where


  application : ReceiverApplicationByAuthorizedOfficial ra c


  properCourt : AppointingCourtHasJurisdictionOverDefendant ra c

  appointed : FederalReceiverAppointed ra c






structure NonJusticeInvestigationAuthorized1956e
    (inv : Investigation) (c : ComplaintText) : Prop where


  nonJustice : InvestigatingComponentIsNonJustice inv c

  directed : InvestigationDirectedByNamedOfficer inv c


  agreement : InteragencyInvestigativeAgreementInEffect inv c




structure RegulatorNotified1956g (n : RegulatoryNotification) (c : ComplaintText) : Prop where

  trigger : FinancialInstitutionFoundGuilty n c

  noticeGiven : AttorneyGeneralGaveWrittenNotice n c

end Proving.USC.T18.Ch42Ch95.Procedure
