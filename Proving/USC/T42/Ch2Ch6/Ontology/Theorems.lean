import Proving.USC.T42.Ch2Ch6.Ontology.Types
import Proving.USC.T42.Ch2Ch6.Ontology.Predicates
import Proving.USC.T42.Ch2Ch6.Ontology.Statute
import Proving.USC.Common.Types







namespace Proving.USC.T42.Ch2Ch6.Ontology

open Proving.USC.Common (Person ComplaintText)


theorem childrensBureauDef_intro {b : ChildrensBureau} {c : ComplaintText}
    (h : IsChildrensBureau b c) : ChildrensBureauDef b c := ⟨h⟩


theorem bureauChiefMembership_intro {p : Person} {b : ChildrensBureau} {c : ComplaintText}
    (hBureau : IsChildrensBureau b c) (hChief : IsBureauChief p c)
    : BureauChiefMembership p b c := ⟨hBureau, hChief⟩


theorem assistantChiefMembership_intro {p : Person} {b : ChildrensBureau} {c : ComplaintText}
    (hBureau : IsChildrensBureau b c) (hAssistant : IsAssistantChief p c)
    : AssistantChiefMembership p b c := ⟨hBureau, hAssistant⟩



theorem quarantineWarehouseMembership_intro
    {w : Warehouse} {v : Vessel} {c : ComplaintText}
    (hVessel : IsVesselSubjectToQuarantine v c) (hWarehouse : IsQuarantineWarehouse w c)
    : QuarantineWarehouseMembership w v c := ⟨hVessel, hWarehouse⟩


theorem rentalCap_boundary : WithinRentalCap bureauQuartersRentalCapUSD :=
  Nat.le_refl _


theorem rentalCap_example : WithinRentalCap 1500 := by
  show (1500 : Nat) ≤ 2000
  decide

end Proving.USC.T42.Ch2Ch6.Ontology
