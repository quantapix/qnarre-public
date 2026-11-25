












































import Proving.USC.T18.Ch117.Elements.Statute
import Proving.USC.T18.Ch117.Procedure.Statute

namespace Proving.USC.Reconciled.T18Ch117

open Proving.USC.T18.Ch117
open Proving.USC.Common




abbrev MannAct2421a := @Elements.Section2421a

abbrev MannAct2421A_a := @Elements.Section2421A_a

abbrev MannAct2421A_b := @Elements.Section2421A_b

abbrev MannAct2421A_c := @Elements.Section2421A_c

abbrev MannAct2422a := @Elements.Section2422a

abbrev MannAct2422b := @Elements.Section2422b

abbrev MannAct2423a := @Elements.Section2423a

abbrev MannAct2423b := @Elements.Section2423b

abbrev MannAct2423c := @Elements.Section2423c

abbrev MannAct2423e := @Elements.Section2423e

abbrev IllicitSexualConduct := @Elements.IllicitSexualConduct

abbrev MannAct2424a := @Elements.Section2424a

abbrev MannAct2425 := @Elements.Section2425







inductive MannActPredicateOffense (p v : Person) (c : ComplaintText) : Prop where
  | s2421a (h : Elements.Section2421a p v c) : MannActPredicateOffense p v c
  | s2422a (h : Elements.Section2422a p v c) : MannActPredicateOffense p v c
  | s2422b (h : Elements.Section2422b p v c) : MannActPredicateOffense p v c
  | s2423a (h : Elements.Section2423a p v c) : MannActPredicateOffense p v c
  | s2423b (h : Elements.Section2423b p c)   : MannActPredicateOffense p v c
  | s2423c (h : Elements.Section2423c p c)   : MannActPredicateOffense p v c
  | s2423e (h : Elements.Section2423e p v c) : MannActPredicateOffense p v c
  | s2424a (h : Elements.Section2424a p v c) : MannActPredicateOffense p v c

end Proving.USC.Reconciled.T18Ch117
