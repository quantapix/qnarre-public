









import Proving.USC.T18.Ch77TailCompletion.Procedure.Types
import Proving.USC.T18.Ch77TailCompletion.Procedure.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch77TailCompletion.Procedure

open Proving.USC.Common





inductive Step : State → State → Prop
  | accrueToFile  : Step .Accrued .Filed
  | fileToStay    : Step .Filed .Stayed
  | stayToFile    : Step .Stayed .Filed
  | fileToAdjudge : Step .Filed .Adjudicated
  | accrueToBar   : Step .Accrued .TimeBarred


inductive Reachable : State → Prop
  | start : Reachable .Accrued
  | step  {a b} : Reachable a → Step a b → Reachable b



structure Transition where
  src   : State
  dst   : State
  guard : Prop


def fileTransition (p : Person) (c : ComplaintText) : Transition :=
  { src := .Accrued, dst := .Filed, guard := CivilActionCommenced p c }


def stayTransition (p : Person) (c : ComplaintText) : Transition :=
  { src := .Filed, dst := .Stayed, guard := CriminalActionPending p c }




def tenYearsDays : Nat := 3650




def WithinTenYearWindow (arose majority commenced : Nat) : Prop :=
  commenced ≤ Nat.max arose majority + tenYearsDays

instance (a m c : Nat) : Decidable (WithinTenYearWindow a m c) :=
  inferInstanceAs (Decidable (c ≤ Nat.max a m + tenYearsDays))






structure TimelyCommencement (p : Person) (c : ComplaintText) where
  arose     : Nat
  majority  : Nat
  commenced : Nat
  isVictim  : IsChapterVictim p c
  filed     : CivilActionCommenced p c
  aroseFact : CauseOfActionAroseOn arose c
  majFact   : VictimMajorityDateOn majority c
  filedOn   : CommencementDateOn commenced c
  inWindow  : WithinTenYearWindow arose majority commenced



structure MandatoryStayDue (p : Person) (c : ComplaintText) : Prop where
  filed           : CivilActionCommenced p c
  criminalPending : CriminalActionPending p c


structure ParensPatriaeAction (p : Person) (c : ComplaintText) : Prop where
  interest : StateHasParensPatriaeInterest p c
  filed    : CivilActionCommenced p c



structure TimelyInjunctionProceeding (p : Person) (c : ComplaintText) : Prop where
  imminent  : ImminentOrOngoingViolation p c
  expedited : ExpeditedHearingHeld p c


structure SealingDuty (p : Person) (c : ComplaintText) : Prop where
  sealed : ActionSealedPendingIndictment p c




structure ProsecutionPermitted (p : Person) (c : ComplaintText) : Prop where
  jurisdiction : ExtraterritorialJurisdictionExists p c
  notBarred    : ¬ ForeignProsecutionPending p c ∨ AGApprovalToProsecute p c


structure RestitutionMandate (p : Person) (c : ComplaintText) : Prop where
  ordered : MandatoryRestitutionOrdered p c


structure ForfeitureMandate (p : Person) (c : ComplaintText) : Prop where
  forfeiture : ForfeitureOrderedAtSentencing p c

end Proving.USC.T18.Ch77TailCompletion.Procedure
