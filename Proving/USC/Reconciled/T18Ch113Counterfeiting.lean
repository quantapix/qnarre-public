




































import Proving.USC.T18.Ch113.Counterfeiting.Elements.Statute

namespace Proving.USC.Reconciled.T18Ch113Counterfeiting
open Proving.USC.Common
open Proving.USC.T18.Ch113.Counterfeiting


abbrev ValidSection2318Offense := Elements.Section2318Offense


abbrev ValidSection2318CivilClaim := Elements.Section2318CivilClaim


abbrev ValidSection2319Offense := Elements.Section2319Offense


abbrev ValidSection2320Offense := Elements.Section2320Offense




inductive ValidChapter113Claim (p : Person) (c : ComplaintText) : Prop where
  | s2318 (l : Elements.Label) (w : Elements.Work) :
      Elements.Section2318Offense p l w c → ValidChapter113Claim p c
  | s2319 (w : Elements.Work) :
      Elements.Section2319Offense p w c → ValidChapter113Claim p c
  | s2320 (m : Elements.Mark) (g : Elements.Goods) :
      Elements.Section2320Offense p m g c → ValidChapter113Claim p c

theorem validChapter113Claim_s2318 {p c} (l w) (h : Elements.Section2318Offense p l w c) :
    ValidChapter113Claim p c := .s2318 l w h
theorem validChapter113Claim_s2319 {p c} (w) (h : Elements.Section2319Offense p w c) :
    ValidChapter113Claim p c := .s2319 w h
theorem validChapter113Claim_s2320 {p c} (m g) (h : Elements.Section2320Offense p m g c) :
    ValidChapter113Claim p c := .s2320 m g h

end Proving.USC.Reconciled.T18Ch113Counterfeiting
