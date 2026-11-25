

















import Proving.USC.T18.Obstruction.Deontic.Types
import Proving.USC.T18.Obstruction.Deontic.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T18.Obstruction.Deontic

open Proving.USC.Common





structure Prohibition1503 (p : Person) (op : OfficialProceeding) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass1503 p c
  condition : ConditionMet1503 op c



def Prohibition1503Violated (p : Person) (op : OfficialProceeding) (c : ComplaintText) : Prop :=
  Prohibition1503 p op c ∧ RegulatedActOccurred1503 p op c






structure Prohibition1512 (p : Person) (op : OfficialProceeding) (c : ComplaintText) : Prop where
  addressee  : AddresseeInClass1512 p c
  condition  : ConditionMet1512 op c
  noDefense  : ¬ LawfulTruthfulDefense1512 p c



def Prohibition1512Violated (p : Person) (op : OfficialProceeding) (c : ComplaintText) : Prop :=
  Prohibition1512 p op c ∧ RegulatedActOccurred1512 p op c





structure Prohibition1513 (p : Person) (op : OfficialProceeding) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass1513 p c
  condition : ConditionMet1513 op c



def Prohibition1513Violated (p : Person) (op : OfficialProceeding) (c : ComplaintText) : Prop :=
  Prohibition1513 p op c ∧ RegulatedActOccurred1513 p op c





inductive ObstructionViolated (p : Person) (op : OfficialProceeding) (c : ComplaintText) : Prop
  | influencingOfficerOrJuror : Prohibition1503Violated p op c → ObstructionViolated p op c
  | witnessTampering          : Prohibition1512Violated p op c → ObstructionViolated p op c
  | witnessRetaliation        : Prohibition1513Violated p op c → ObstructionViolated p op c

end Proving.USC.T18.Obstruction.Deontic
