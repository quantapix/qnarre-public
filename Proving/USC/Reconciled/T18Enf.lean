










































































import Proving.USC.T18.Enf.Elements.Statute
import Proving.USC.T18.Enf.Ontology.Statute
import Proving.USC.T18.Enf.Bridge

namespace Proving.USC.Reconciled

open Proving.USC.Common








structure EnforcementT18 (p : Person) (prop : Proving.USC.T18.Enf.Elements.Property)
    (c : ComplaintText) : Prop where

  civil      : Proving.USC.T18.Enf.Elements.ValidCivilRicoComplaint p c

  forfeiture : Proving.USC.T18.Enf.Elements.Section1963 p prop c


theorem enforcementT18_intro
    {p : Person} {prop : Proving.USC.T18.Enf.Elements.Property} {c : ComplaintText}
    (hCivil : Proving.USC.T18.Enf.Elements.ValidCivilRicoComplaint p c)
    (hForf  : Proving.USC.T18.Enf.Elements.Section1963 p prop c) :
    EnforcementT18 p prop c :=
  ⟨hCivil, hForf⟩

end Proving.USC.Reconciled
