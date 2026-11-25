import Proving.USC.T18.Ch96.Deontic.Predicates

set_option autoImplicit false











namespace Proving.USC.T18.Ch96.Deontic

open Proving.USC.Common



def IsObligation (n : NormId) : Prop := n.modality = Modality.Obligation
def IsProhibition (n : NormId) : Prop := n.modality = Modality.Prohibition
def IsPermission (n : NormId) : Prop := n.modality = Modality.Permission
def IsPower (n : NormId) : Prop := n.modality = Modality.Power

instance (n : NormId) : Decidable (IsObligation n) := by
  unfold IsObligation; infer_instance
instance (n : NormId) : Decidable (IsProhibition n) := by
  unfold IsProhibition; infer_instance
instance (n : NormId) : Decidable (IsPermission n) := by
  unfold IsPermission; infer_instance
instance (n : NormId) : Decidable (IsPower n) := by
  unfold IsPower; infer_instance




structure NormApplies (n : NormId) (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass n p c
  condition : ConditionMet n c




def ProhibitionViolated (n : NormId) (p : Person) (c : ComplaintText) : Prop :=
  NormApplies n p c ∧ RegulatedActOccurred n p c




def ObligationBreached (n : NormId) (p : Person) (c : ComplaintText) : Prop :=
  NormApplies n p c ∧ ¬ RegulatedActOccurred n p c



def PermissionExercisable (n : NormId) (p : Person) (c : ComplaintText) : Prop :=
  NormApplies n p c



def PowerExercisable (n : NormId) (p : Person) (c : ComplaintText) : Prop :=
  NormApplies n p c



def ProhibitionViolatedWF (n : NormId) (p : Person) (c : ComplaintText) : Prop :=
  IsProhibition n ∧ ProhibitionViolated n p c



def ObligationBreachedWF (n : NormId) (p : Person) (c : ComplaintText) : Prop :=
  IsObligation n ∧ ObligationBreached n p c





def Prohibition1962aViolated (p : Person) (c : ComplaintText) : Prop :=
  ProhibitionViolated NormId.s1962a p c



def Prohibition1962bViolated (p : Person) (c : ComplaintText) : Prop :=
  ProhibitionViolated NormId.s1962b p c




def Prohibition1962cViolated (p : Person) (c : ComplaintText) : Prop :=
  ProhibitionViolated NormId.s1962c p c


def Prohibition1962dViolated (p : Person) (c : ComplaintText) : Prop :=
  ProhibitionViolated NormId.s1962d p c

end Proving.USC.T18.Ch96.Deontic
