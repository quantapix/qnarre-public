








import Proving.USC.T18.Ch47.Procedure.Types
import Proving.USC.T18.Ch47.Procedure.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch47.Procedure

open Proving.USC.Common







def Section1028Circumstance (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop :=
  DocumentIsUnitedStatesOrSpecialEventIssued d pr c ∨
  OffenseIsDefraudUnitedStatesPossession d pr c ∨
  AffectsInterstateOrForeignCommerce d pr c ∨
  TransportedInTheMail d pr c



def Section1029ExtraterritorialReach (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop :=
  ConductOutsideUnitedStatesJurisdiction d pr c ∧
  AccessDeviceControlledByUnitedStatesEntity d pr c



def Section1029JurisdictionalBasis (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop :=
  AffectsInterstateOrForeignCommerce d pr c ∨ Section1029ExtraterritorialReach d pr c










def WithinOneYearPeriod (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop :=
  AggregationPeriodEndDay d pr c ≤ AggregationPeriodStartDay d pr c + 365



def AggregateValueThresholdMet (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop :=
  100000 ≤ AggregateValueObtainedCents d pr c



def OneYearThousandDollarWindow (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop :=
  WithinOneYearPeriod d pr c ∧ AggregateValueThresholdMet d pr c


def MoreThanFiveDocuments (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop :=
  5 < DocumentsProducedOrTransferredCount d pr c



def PriorConvictionFinalBeforeOffense (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop :=
  PriorConvictionUnderThisSectionExists d pr c ∧
  PriorConvictionFinalDay d pr c ≤ OffenseCommencementDay d pr c




def OffenseAfterPriorConviction (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop :=
  PriorConvictionUnderThisSectionExists d pr c ∧
  PriorConvictionEntryDay d pr c ≤ OffenseCommencementDay d pr c










def Tier20Ground1028 (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop :=
  FacilitatesDrugTraffickingCrime d pr c ∨
  InConnectionWithCrimeOfViolence d pr c ∨
  PriorConvictionFinalBeforeOffense d pr c


def Tier15Ground1028 (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop :=
  ProductionOrTransferOfUnitedStatesOrIdentityDocument d pr c ∨
  MoreThanFiveDocuments d pr c ∨
  OffenseUnderParagraphFive d pr c ∨
  (OffenseUnderParagraphSeven d pr c ∧ OneYearThousandDollarWindow d pr c)


def Tier5Ground1028 (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop :=
  AnyOtherProductionTransferOrUse d pr c ∨
  OffenseUnderParagraphThree d pr c ∨
  OffenseUnderParagraphSeven d pr c


def maxImprisonmentYears1028 : PenaltyTier1028 → Nat
  | .thirtyYears  => 30
  | .twentyYears  => 20
  | .fifteenYears => 15
  | .fiveYears    => 5
  | .oneYear      => 1



inductive TierAssigned1028 (d : Person) (pr : Prosecution) (c : ComplaintText) :
    PenaltyTier1028 → Prop where

  | thirty (h : FacilitatesDomesticOrInternationalTerrorism d pr c) :
      TierAssigned1028 d pr c .thirtyYears

  | twenty (hNot30 : ¬ FacilitatesDomesticOrInternationalTerrorism d pr c)
           (h : Tier20Ground1028 d pr c) :
      TierAssigned1028 d pr c .twentyYears

  | fifteen (hNot30 : ¬ FacilitatesDomesticOrInternationalTerrorism d pr c)
            (hNot20 : ¬ Tier20Ground1028 d pr c)
            (h : Tier15Ground1028 d pr c) :
      TierAssigned1028 d pr c .fifteenYears

  | five (hNot30 : ¬ FacilitatesDomesticOrInternationalTerrorism d pr c)
         (hNot20 : ¬ Tier20Ground1028 d pr c)
         (hNot15 : ¬ Tier15Ground1028 d pr c)
         (h : Tier5Ground1028 d pr c) :
      TierAssigned1028 d pr c .fiveYears

  | one (hNot30 : ¬ FacilitatesDomesticOrInternationalTerrorism d pr c)
        (hNot20 : ¬ Tier20Ground1028 d pr c)
        (hNot15 : ¬ Tier15Ground1028 d pr c)
        (hNot5 : ¬ Tier5Ground1028 d pr c) :
      TierAssigned1028 d pr c .oneYear




def maxImprisonmentYears1029 : PenaltyTier1029 → Nat
  | .twentyYears  => 20
  | .fifteenYears => 15
  | .tenYears     => 10




def conspiracyMaxImprisonmentMonths1029 (t : PenaltyTier1029) : Nat :=
  maxImprisonmentYears1029 t * 12 / 2



inductive TierAssigned1029 (d : Person) (pr : Prosecution) (c : ComplaintText) :
    PenaltyTier1029 → Prop where

  | twenty (h : OffenseAfterPriorConviction d pr c) :
      TierAssigned1029 d pr c .twentyYears

  | fifteen (hNoPrior : ¬ OffenseAfterPriorConviction d pr c)
            (h : OffenseUnderHigherPenaltyParagraph1029 d pr c) :
      TierAssigned1029 d pr c .fifteenYears

  | ten (hNoPrior : ¬ OffenseAfterPriorConviction d pr c)
        (h : OffenseUnderStandardPenaltyParagraph1029 d pr c) :
      TierAssigned1029 d pr c .tenYears







def Section1029g2DefenseEstablished (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop :=
  ChargedUnderSubsectionA9 d pr c ∧
  ¬ ChargedConductIsProducingOrTrafficking d pr c ∧
  ResearchOrDevelopmentLawfulPurpose d pr c ∧
  DefendantEstablishedByPreponderance d pr c







structure ProsecutionCognizable1028
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop where
  circumstance : Section1028Circumstance d pr c
  charged : ChargeInstituted d pr c
  noExemption : ¬ LawfullyAuthorizedInvestigativeActivity d pr c



structure ProsecutionCognizable1029
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop where
  jurisdiction : Section1029JurisdictionalBasis d pr c
  charged : ChargeInstituted d pr c
  noExemption : ¬ LawfullyAuthorizedInvestigativeActivity d pr c




structure ConvictionSustainable1029A9
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop where
  cognizable : ProsecutionCognizable1029 d pr c
  countA9 : ChargedUnderSubsectionA9 d pr c
  noCarrierException : ¬ CarrierProtectivePurposeConduct d pr c
  noDefense : ¬ Section1029g2DefenseEstablished d pr c
  convicted : ConvictionEntered d pr c





structure MandatoryForfeiture1028
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop where
  convicted : ConvictionEntered d pr c
  ordered : ForfeitureAndDestructionOrdered d pr c
  procedure : ForfeitureProcedureFollowedSection413 d pr c



structure InvestigationAuthorized1029
    (a : Agency) (pr : Prosecution) (c : ComplaintText) : Prop where
  authority : AgencyHasInvestigativeAuthority a pr c
  agreement : TreasuryAttorneyGeneralAgreementInEffect a pr c



structure ConspiracyLiability1029
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop where
  conspiracy : ConspiracyOfTwoOrMore d pr c
  overtAct : OvertActInFurtherance d pr c




inductive InchoateLiability1028 (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop where
  | attempt (h : AttemptedOffense d pr c) : InchoateLiability1028 d pr c
  | conspiracy (h : ConspiracyOfTwoOrMore d pr c) : InchoateLiability1028 d pr c




structure Transition where
  source : Stage
  target : Stage
  guard : Prop


def circumstanceStep1028 (d : Person) (pr : Prosecution) (c : ComplaintText) : Transition :=
  { source := .Conduct, target := .CircumstanceEstablished
    guard := Section1028Circumstance d pr c }


def jurisdictionStep1029 (d : Person) (pr : Prosecution) (c : ComplaintText) : Transition :=
  { source := .Conduct, target := .CircumstanceEstablished
    guard := Section1029JurisdictionalBasis d pr c }



def exemptionStep (d : Person) (pr : Prosecution) (c : ComplaintText) : Transition :=
  { source := .Conduct, target := .Exempt
    guard := LawfullyAuthorizedInvestigativeActivity d pr c }


def chargeStep (d : Person) (pr : Prosecution) (c : ComplaintText) : Transition :=
  { source := .CircumstanceEstablished, target := .Charged
    guard := ChargeInstituted d pr c ∧ ¬ LawfullyAuthorizedInvestigativeActivity d pr c }


def convictionStep (d : Person) (pr : Prosecution) (c : ComplaintText) : Transition :=
  { source := .Charged, target := .Convicted, guard := ConvictionEntered d pr c }


def forfeitureStep (d : Person) (pr : Prosecution) (c : ComplaintText) : Transition :=
  { source := .Convicted, target := .ForfeitureOrdered
    guard := MandatoryForfeiture1028 d pr c }



inductive Reachable1028 (d : Person) (pr : Prosecution) (c : ComplaintText) : Stage → Prop where
  | start : Reachable1028 d pr c .Conduct
  | exempt (h : Reachable1028 d pr c .Conduct)
           (g : LawfullyAuthorizedInvestigativeActivity d pr c) :
      Reachable1028 d pr c .Exempt
  | circumstance (h : Reachable1028 d pr c .Conduct)
                 (g : Section1028Circumstance d pr c) :
      Reachable1028 d pr c .CircumstanceEstablished
  | charge (h : Reachable1028 d pr c .CircumstanceEstablished)
           (g : ChargeInstituted d pr c)
           (esc : ¬ LawfullyAuthorizedInvestigativeActivity d pr c) :
      Reachable1028 d pr c .Charged
  | convict (h : Reachable1028 d pr c .Charged) (g : ConvictionEntered d pr c) :
      Reachable1028 d pr c .Convicted
  | sentence (h : Reachable1028 d pr c .Convicted) (t : PenaltyTier1028)
             (g : TierAssigned1028 d pr c t) :
      Reachable1028 d pr c .Sentenced
  | forfeit (h : Reachable1028 d pr c .Convicted) (g : MandatoryForfeiture1028 d pr c) :
      Reachable1028 d pr c .ForfeitureOrdered

end Proving.USC.T18.Ch47.Procedure
