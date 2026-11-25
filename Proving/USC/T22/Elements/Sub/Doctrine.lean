













import Proving.USC.Common.Tactic
import Proving.USC.T22.Elements.Sub.Types
import Proving.USC.T22.Elements.Sub.Predicates
import Proving.USC.T22.Elements.Sub.Statute

namespace Proving.USC.T22.Elements.Sub

open Proving.USC.Common


@[grind →] theorem prohibitsAndPunishes_intro {g c}
    (hProh : ProhibitsSevereFormsTrafficking g c)
    (hPun : PunishesActsOfTrafficking g c) : ProhibitsAndPunishes g c :=
  ⟨hProh, hPun⟩


example {g c} (hProh : ProhibitsSevereFormsTrafficking g c)
    (hPun : PunishesActsOfTrafficking g c) : CriminalizesSevereTrafficking g c := by
  prove_element

end Proving.USC.T22.Elements.Sub
