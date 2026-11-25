




































import Proving.USC.T18.Ch25.Elements.Theorems

namespace Proving.USC.Reconciled.T18Ch25
open Proving.USC.Common



export Proving.USC.T18.Ch25.Elements
  (Section0471 Section0472 Section0473 ValidCounterfeitingCharge)




abbrev ValidCh25CounterfeitingCharge
    (p : Person) (i : Proving.USC.T18.Ch25.Elements.Instrument) (c : ComplaintText) : Prop :=
  Proving.USC.T18.Ch25.Elements.ValidCounterfeitingCharge p i c


theorem validCh25_of_s471
    {p i c} (h : Proving.USC.T18.Ch25.Elements.Section0471 p i c) :
    ValidCh25CounterfeitingCharge p i c := .viaMaking h


theorem validCh25_of_s472
    {p i c} (h : Proving.USC.T18.Ch25.Elements.Section0472 p i c) :
    ValidCh25CounterfeitingCharge p i c := .viaUttering h


theorem validCh25_of_s473
    {p i c} (h : Proving.USC.T18.Ch25.Elements.Section0473 p i c) :
    ValidCh25CounterfeitingCharge p i c := .viaDealing h

end Proving.USC.Reconciled.T18Ch25
