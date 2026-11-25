

















































import Proving.USC.T18.Ch71.Elements.Statute

namespace Proving.USC.Reconciled.T18Ch71
open Proving.USC
open Proving.USC.Common






inductive ValidObscenityOffense
    (p : Person) (m : T18.Ch71.Elements.Matter) (c : ComplaintText) : Prop where
  | mailing      (h : T18.Ch71.Elements.Section1461 p m c)
  | importation  (h : T18.Ch71.Elements.Section1462 p m c)
  | wrapper      (h : T18.Ch71.Elements.Section1463 p m c)
  | broadcast    (h : T18.Ch71.Elements.Section1464 p m c)
  | distribution (h : T18.Ch71.Elements.Section1465 p m c)


theorem validObscenityOffense_ofMailing
    {p : Person} {m : T18.Ch71.Elements.Matter} {c : ComplaintText}
    (h : T18.Ch71.Elements.Section1461 p m c) : ValidObscenityOffense p m c :=
  .mailing h


theorem validObscenityOffense_ofImportation
    {p : Person} {m : T18.Ch71.Elements.Matter} {c : ComplaintText}
    (h : T18.Ch71.Elements.Section1462 p m c) : ValidObscenityOffense p m c :=
  .importation h


theorem validObscenityOffense_ofWrapper
    {p : Person} {m : T18.Ch71.Elements.Matter} {c : ComplaintText}
    (h : T18.Ch71.Elements.Section1463 p m c) : ValidObscenityOffense p m c :=
  .wrapper h


theorem validObscenityOffense_ofBroadcast
    {p : Person} {m : T18.Ch71.Elements.Matter} {c : ComplaintText}
    (h : T18.Ch71.Elements.Section1464 p m c) : ValidObscenityOffense p m c :=
  .broadcast h


theorem validObscenityOffense_ofDistribution
    {p : Person} {m : T18.Ch71.Elements.Matter} {c : ComplaintText}
    (h : T18.Ch71.Elements.Section1465 p m c) : ValidObscenityOffense p m c :=
  .distribution h

end Proving.USC.Reconciled.T18Ch71
