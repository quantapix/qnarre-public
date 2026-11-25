
















import Proving.USC.T42.Deontic.Predicates

namespace Proving.USC.T42.Deontic

open Proving.USC.Common




structure Prohibition1981 (p : Person) (k : Contract) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass1981 p k c
  condition : ConditionMet1981 p k c


def ProhibitionViolated1981 (p : Person) (k : Contract) (c : ComplaintText) : Prop :=
  Prohibition1981 p k c ∧ RegulatedActOccurred1981 p k c





structure Permission1981a (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass1981a p c
  condition : ConditionMet1981a p c


def PermissionExercisable1981a (p : Person) (c : ComplaintText) : Prop :=
  Permission1981a p c





structure Obligation1983 (p : Person) (r : SecuredRight) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass1983 p c
  condition : ConditionMet1983 p r c




def Obligation1983Triggered (p : Person) (r : SecuredRight) (c : ComplaintText) : Prop :=
  Obligation1983 p r c ∧ RegulatedActOccurred1983 p r c





structure Prohibition1985 (a : Agreement) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass1985 a c
  condition : ConditionMet1985 a c


def ProhibitionViolated1985 (a : Agreement) (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1985 a c ∧ RegulatedActOccurred1985 a p c





structure Obligation1986 (p : Person) (a : Agreement) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass1986 p a c
  condition : ConditionMet1986 p a c



def Obligation1986Breached (p : Person) (a : Agreement) (c : ComplaintText) : Prop :=
  Obligation1986 p a c ∧ ¬ RegulatedActOccurred1986 p a c




structure Prohibition2000d (p : Person) (prog : Program) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass2000d p prog c
  condition : ConditionMet2000d prog c



def ProhibitionViolated2000d (p : Person) (prog : Program) (c : ComplaintText) : Prop :=
  Prohibition2000d p prog c ∧ RegulatedActOccurred2000d p prog c




structure Power2000d1 (e : Entity) (prog : Program) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass2000d1 e prog c
  condition : ConditionMet2000d1 e prog c



def Power2000d1Exercised (e : Entity) (prog : Program) (c : ComplaintText) : Prop :=
  Power2000d1 e prog c ∧ RegulatedActOccurred2000d1 e prog c





structure Prohibition2000d7 (e : Entity) (t : Time) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass2000d7 e c
  condition : ConditionMet2000d7 e t c



def ProhibitionViolated2000d7 (e : Entity) (t : Time) (c : ComplaintText) : Prop :=
  Prohibition2000d7 e t c ∧ RegulatedActOccurred2000d7 e c






inductive CivilRightsNormEngaged (c : ComplaintText) : Prop
  | s1981   (p : Person) (k : Contract)      (h : ProhibitionViolated1981 p k c)
  | s1981a  (p : Person)                     (h : PermissionExercisable1981a p c)
  | s1983   (p : Person) (r : SecuredRight)  (h : Obligation1983Triggered p r c)
  | s1985   (a : Agreement) (p : Person)     (h : ProhibitionViolated1985 a p c)
  | s1986   (p : Person) (a : Agreement)     (h : Obligation1986Breached p a c)
  | s2000d  (p : Person) (prog : Program)    (h : ProhibitionViolated2000d p prog c)
  | s2000d7 (e : Entity) (t : Time)          (h : ProhibitionViolated2000d7 e t c)

end Proving.USC.T42.Deontic
