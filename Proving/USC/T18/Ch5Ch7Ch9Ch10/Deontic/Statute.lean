import Proving.USC.T18.Ch5Ch7Ch9Ch10.Deontic.Predicates
















namespace Proving.USC.T18.Ch5Ch7Ch9Ch10.Deontic

open Proving.USC.Common




def modalityOf : Provision → Modality
  | .s151 | .s178              => .definition
  | .s158                      => .obligation
  | .s175a | .s176 | .s177     => .power
  | _                          => .prohibition




structure ProhibitionNorm (prov : Provision) (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass prov p c
  condition : ConditionMet prov c


def ProhibitionViolated (prov : Provision) (p : Person) (c : ComplaintText) : Prop :=
  ProhibitionNorm prov p c ∧ RegulatedActOccurred prov p c




structure ObligationNorm (prov : Provision) (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass prov p c
  condition : ConditionMet prov c


def ObligationBreached (prov : Provision) (p : Person) (c : ComplaintText) : Prop :=
  ObligationNorm prov p c ∧ ¬ RegulatedActOccurred prov p c




structure PowerNorm (prov : Provision) (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass prov p c
  condition : ConditionMet prov c


def PowerExercised (prov : Provision) (p : Person) (c : ComplaintText) : Prop :=
  PowerNorm prov p c ∧ RegulatedActOccurred prov p c






abbrev ProhibitionViolated81   := ProhibitionViolated Provision.s81
abbrev ProhibitionViolated111  := ProhibitionViolated Provision.s111
abbrev ProhibitionViolated112  := ProhibitionViolated Provision.s112
abbrev ProhibitionViolated113  := ProhibitionViolated Provision.s113
abbrev ProhibitionViolated114  := ProhibitionViolated Provision.s114
abbrev ProhibitionViolated115  := ProhibitionViolated Provision.s115
abbrev ProhibitionViolated116  := ProhibitionViolated Provision.s116
abbrev ProhibitionViolated117  := ProhibitionViolated Provision.s117
abbrev ProhibitionViolated118  := ProhibitionViolated Provision.s118
abbrev ProhibitionViolated119  := ProhibitionViolated Provision.s119
abbrev ProhibitionViolated152  := ProhibitionViolated Provision.s152
abbrev ProhibitionViolated153  := ProhibitionViolated Provision.s153
abbrev ProhibitionViolated154  := ProhibitionViolated Provision.s154
abbrev ProhibitionViolated155  := ProhibitionViolated Provision.s155
abbrev ProhibitionViolated156  := ProhibitionViolated Provision.s156
abbrev ProhibitionViolated157  := ProhibitionViolated Provision.s157
abbrev ProhibitionViolated175  := ProhibitionViolated Provision.s175
abbrev ProhibitionViolated175b := ProhibitionViolated Provision.s175b
abbrev ProhibitionViolated175c := ProhibitionViolated Provision.s175c

abbrev ObligationBreached158   := ObligationBreached Provision.s158

abbrev PowerExercised175a      := PowerExercised Provision.s175a
abbrev PowerExercised176       := PowerExercised Provision.s176
abbrev PowerExercised177       := PowerExercised Provision.s177

end Proving.USC.T18.Ch5Ch7Ch9Ch10.Deontic
