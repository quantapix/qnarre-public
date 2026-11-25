









import Proving.USC.Common.Types
import Proving.USC.T29.SelfOrgRep.Deontic.Types
import Proving.USC.T29.SelfOrgRep.Deontic.Predicates

namespace Proving.USC.T29.SelfOrgRep.Deontic

open Proving.USC.Common









structure Permission157 (p : Person) (c : ComplaintText) : Prop where
  addressee : IsEmployeeAddressee p c



def Permission157Granted (p : Person) (c : ComplaintText) : Prop :=
  Permission157 p c ∧ ProtectedConcertedAct p c



def RefrainRightExercisable (p : Person) (c : ComplaintText) : Prop :=
  IsEmployeeAddressee p c ∧ RefrainAct p c ∧ ¬ UnionSecurityException p c





structure Obligation159a (lo : LaborOrganization) (u : BargainingUnit) (c : ComplaintText) : Prop where
  condition : MajorityDesignated lo u c




def Obligation159aSatisfied (lo : LaborOrganization) (u : BargainingUnit) (c : ComplaintText) : Prop :=
  Obligation159a lo u c ∧ TreatedAsExclusiveRep lo u c



def Obligation159aBreached (lo : LaborOrganization) (u : BargainingUnit) (c : ComplaintText) : Prop :=
  Obligation159a lo u c ∧ ¬ TreatedAsExclusiveRep lo u c




structure Obligation159b (u : BargainingUnit) (c : ComplaintText) : Prop where
  condition : UnitQuestionPresented u c



def Obligation159bSatisfied (u : BargainingUnit) (c : ComplaintText) : Prop :=
  Obligation159b u c ∧ BoardDecidedUnit u c



def Obligation159bBreached (u : BargainingUnit) (c : ComplaintText) : Prop :=
  Obligation159b u c ∧ ¬ BoardDecidedUnit u c





structure Prohibition159b3 (lo : LaborOrganization) (u : BargainingUnit) (c : ComplaintText) : Prop where

  addressee : UnitQuestionPresented u c



def Prohibition159b3Violated (lo : LaborOrganization) (u : BargainingUnit) (c : ComplaintText) : Prop :=
  Prohibition159b3 lo u c ∧ MixedGuardCertification lo u c





structure ProhibitionElectionBar (u : BargainingUnit) (c : ComplaintText) : Prop where
  condition : PriorValidElectionWithinYear u c




def ProhibitionElectionBarViolated (e : Election) (u : BargainingUnit) (c : ComplaintText) : Prop :=
  ProhibitionElectionBar u c ∧ ElectionDirected e u c

end Proving.USC.T29.SelfOrgRep.Deontic
