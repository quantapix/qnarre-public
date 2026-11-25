







import Proving.USC.T18.Ch42.Procedure.Predicates

namespace Proving.USC.T18.Ch42.Procedure

open Proving.USC.Common







def RateExceeds45 (c : ComplaintText) : Prop := InterestRatePercent c > 45



def OutstandingExceeds100 (c : ComplaintText) : Prop := OutstandingCreditDollars c > 100





def Penalty892 : Sanction := { kind := .Imprisonment, bound := 20, dir := .Ceiling }


def Penalty893Imprisonment : Sanction := { kind := .Imprisonment, bound := 20, dir := .Ceiling }




def Penalty893FineMultiplier : Sanction := { kind := .Multiplier, bound := 2, dir := .Ceiling }


def Penalty894 : Sanction := { kind := .Imprisonment, bound := 20, dir := .Ceiling }





structure Transition where
  fromState : State
  toState   : State
  guard     : Prop









structure PrimaFacieExtortionate892 (c : ComplaintText) : Prop where
  prosecution : ProsecutionUnderSection892 c
  factor1     : RepaymentUnenforceableByCivilProcess c
  factor2     : RateExceeds45 c
  factor3     : DebtorBelievedCreditorExtortionate c
  factor4     : OutstandingExceeds100 c



def primaFacie892_transition (c : ComplaintText) : Transition :=
  { fromState := .Charged, toState := .PrimaFacieEstablished,
    guard := PrimaFacieExtortionate892 c }










structure ReputationEvidenceAdmissible892 (c : ComplaintText) : Prop where
  prosecution         : ProsecutionUnderSection892 c
  factor1or2          : RepaymentUnenforceableByCivilProcess c ∨ RateExceeds45 c
  directEvUnavailable : DirectEvidenceOfDebtorBeliefUnavailable c


def reputation892_transition (c : ComplaintText) : Transition :=
  { fromState := .PrimaFacieEstablished, toState := .ReputationAdmissible,
    guard := ReputationEvidenceAdmissible892 c }







structure ImplicitThreatEvidence894 (c : ComplaintText) : Prop where
  prosecution : ProsecutionUnderSection894 c
  priorKnown  : PriorExtortionateCollectionKnownToVictim c






structure ReputationEvidenceAdmissible894 (c : ComplaintText) : Prop where
  prosecution         : ProsecutionUnderSection894 c
  factor1or2          : RepaymentUnenforceableByCivilProcess c ∨ RateExceeds45 c
  directEvUnavailable : DirectEvidenceOfDebtorBeliefUnavailable c

end Proving.USC.T18.Ch42.Procedure
