





































import Proving.USC.T18.Ch31.Elements.Statute

namespace Proving.USC.Reconciled.T18Ch31
open Proving.USC
open Proving.USC.Common



structure PleadedSection659
    (defendant : Person) (prop : T18.Ch31.Elements.Property) (c : ComplaintText) : Prop where
  violation : T18.Ch31.Elements.Section659 defendant prop c

theorem pleadedSection659_intro
    {defendant : Person} {prop : T18.Ch31.Elements.Property} {c : ComplaintText}
    (hViol : T18.Ch31.Elements.Section659 defendant prop c) :
    PleadedSection659 defendant prop c :=
  ⟨hViol⟩



structure PleadedSection664
    (defendant : Person) (prop : T18.Ch31.Elements.Property)
    (plan : T18.Ch31.Elements.BenefitPlan) (c : ComplaintText) : Prop where
  violation : T18.Ch31.Elements.Section664 defendant prop plan c

theorem pleadedSection664_intro
    {defendant : Person} {prop : T18.Ch31.Elements.Property}
    {plan : T18.Ch31.Elements.BenefitPlan} {c : ComplaintText}
    (hViol : T18.Ch31.Elements.Section664 defendant prop plan c) :
    PleadedSection664 defendant prop plan c :=
  ⟨hViol⟩

end Proving.USC.Reconciled.T18Ch31
