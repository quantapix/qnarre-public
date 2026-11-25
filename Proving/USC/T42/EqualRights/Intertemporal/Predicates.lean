



















import Proving.USC.Common.Types
import Proving.USC.T42.EqualRights.Intertemporal.Types

namespace Proving.USC.T42.EqualRights.Intertemporal

open Proving.USC.Common





axiom ActOccurredOnOrAfter (d : Nat) (c : ComplaintText) : Prop





axiom ActIsPostEnactment (c : ComplaintText) : Prop





axiom ActWithinSunset (d : Option Nat) (c : ComplaintText) : Prop



inductive EqualRightsProvision
  | s1981
  | s1981bc
  | s1981a
  | s1982
  deriving DecidableEq, Repr

open EffectiveWindow in




def StatutoryWindow : EqualRightsProvision → EffectiveWindow
  | .s1981   => ⟨0, none⟩
  | .s1981bc => ⟨0, none⟩
  | .s1981a  => ⟨0, none⟩
  | .s1982   => ⟨0, none⟩

end Proving.USC.T42.EqualRights.Intertemporal
