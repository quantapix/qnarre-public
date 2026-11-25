







import Proving.USC.T18.Ch113.Deontic.Predicates

namespace Proving.USC.T18.Ch113.Deontic

open Proving.USC.Common






structure Prohibition2312 (p : Person) (v : Conveyance) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass2312 p c
  condition : ConditionMet2312 p v c



def ProhibitionViolated2312 (p : Person) (v : Conveyance) (c : ComplaintText) : Prop :=
  Prohibition2312 p v c ∧ RegulatedActOccurred2312 p v c






structure Prohibition2313 (p : Person) (v : Conveyance) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass2313 p c
  condition : ConditionMet2313 p v c



def ProhibitionViolated2313 (p : Person) (v : Conveyance) (c : ComplaintText) : Prop :=
  Prohibition2313 p v c ∧ RegulatedActOccurred2313 p v c

end Proving.USC.T18.Ch113.Deontic
