























































import Proving.USC.T29.LMRA.Elements.Statute
import Proving.USC.T29.LMRA.Procedure.Statute
import Proving.USC.Common.Predicates

namespace Proving.USC.Reconciled.T29LMRA
open Proving.USC
open Proving.USC.Common





structure ValidSection301Suit
    (p : Person) (e : Entity) (k : T29.LMRA.Elements.LaborContract)
    (cp : T29.LMRA.Procedure.CourtProceeding) (c : ComplaintText) : Prop where
  merits : T29.LMRA.Elements.Section185 p e k c
  forum  : T29.LMRA.Procedure.ProperlyCommencedSuit cp p c

theorem validSection301Suit_intro
    {p : Person} {e : Entity} {k : T29.LMRA.Elements.LaborContract}
    {cp : T29.LMRA.Procedure.CourtProceeding} {c : ComplaintText}
    (hMerits : T29.LMRA.Elements.Section185 p e k c)
    (hForum : T29.LMRA.Procedure.ProperlyCommencedSuit cp p c)
    : ValidSection301Suit p e k cp c :=
  ⟨hMerits, hForum⟩




abbrev ValidSection302Violation
    (p : Person) (pay : T29.LMRA.Elements.Payment) (c : ComplaintText) : Prop :=
  T29.LMRA.Elements.Section186 p pay c





structure ValidSection303Suit
    (p : Person) (lo : Entity) (cp : T29.LMRA.Procedure.CourtProceeding)
    (c : ComplaintText) : Prop where
  merits : T29.LMRA.Elements.Section187 p lo c
  forum  : T29.LMRA.Procedure.SecondaryBoycottForum cp c

theorem validSection303Suit_intro
    {p : Person} {lo : Entity} {cp : T29.LMRA.Procedure.CourtProceeding}
    {c : ComplaintText}
    (hMerits : T29.LMRA.Elements.Section187 p lo c)
    (hForum : T29.LMRA.Procedure.SecondaryBoycottForum cp c)
    : ValidSection303Suit p lo cp c :=
  ⟨hMerits, hForum⟩








abbrev ValidNationalEmergencyInjunction
    (w : T29.LMRA.Elements.WorkStoppage) (c : ComplaintText) : Prop :=
  T29.LMRA.Elements.Section178 w c








inductive ValidLMRAComplaint (p : Person) (e : Entity) (c : ComplaintText) : Prop where
  | contract  (k : T29.LMRA.Elements.LaborContract)
              (cp : T29.LMRA.Procedure.CourtProceeding)
              (h : ValidSection301Suit p e k cp c) : ValidLMRAComplaint p e c
  | financial (pay : T29.LMRA.Elements.Payment)
              (h : ValidSection302Violation p pay c) : ValidLMRAComplaint p e c
  | boycott   (cp : T29.LMRA.Procedure.CourtProceeding)
              (h : ValidSection303Suit p e cp c) : ValidLMRAComplaint p e c

end Proving.USC.Reconciled.T29LMRA
