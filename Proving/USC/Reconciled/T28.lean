









































































import Proving.USC.T28.Elements.Theorems
import Proving.USC.T28.Deontic.Theorems
import Proving.USC.T28.Ontology.Theorems
import Proving.USC.T28.Procedure.Theorems
import Proving.USC.T28.Structure.Theorems
import Proving.USC.T28.Bridge

namespace Proving.USC.Reconciled




abbrev T28_s1343_jurisdiction := Proving.USC.T28.Deontic.Power1343a




abbrev T28_s1343_jurisdiction_elements :=
  Proving.USC.T28.Elements.Section1343Jurisdiction





abbrev T28_s1343_grounded := Proving.USC.T28.Structure.Grounded1343





abbrev T28_s1746_declaration := Proving.USC.T28.Deontic.UnswornDeclarationEffective1746



abbrev T28_s1746_declaration_procedure :=
  Proving.USC.T28.Procedure.ValidUnswornDeclaration1746



abbrev T28_s1746_declaration_ontology :=
  Proving.USC.T28.Ontology.UnswornDeclarationDef



abbrev T28_s1746_grounded := Proving.USC.T28.Structure.Grounded1746




def T28_s1343_deontic_discharge : Prop :=
  (∀ {ct : Proving.USC.T28.Deontic.Court} {p a c},
      Proving.USC.T28.Deontic.Power1343a ct p a c →
      Proving.USC.T28.Ontology.Section1343Jurisdiction
        (Proving.USC.T28.Bridge.actDO a) p c)
  ∧ (∀ {ct : Proving.USC.T28.Deontic.Court} {p a c},
      Proving.USC.T28.Deontic.Power1343a ct p a c →
      Proving.USC.T28.Procedure.Section1343Jurisdiction
        (Proving.USC.T28.Bridge.actDP a) c)

theorem T28_s1343_deontic_agreement : T28_s1343_deontic_discharge :=
  ⟨fun h => Proving.USC.T28.Bridge.s1343_deontic_implies_ontology h,
   fun h => Proving.USC.T28.Bridge.s1343_deontic_implies_procedure h⟩




def T28_s1746_deontic_discharge : Prop :=
  (∀ {p m d c},
      Proving.USC.T28.Deontic.UnswornDeclarationEffective1746 p m d c →
      Proving.USC.T28.Elements.Section1746Declaration
        (Proving.USC.T28.Bridge.declDE d) c)
  ∧ (∀ {p m d c},
      Proving.USC.T28.Deontic.UnswornDeclarationEffective1746 p m d c →
      Proving.USC.T28.Ontology.UnswornDeclarationDef
        (Proving.USC.T28.Bridge.declDO d) c)
  ∧ (∀ {p m d c},
      Proving.USC.T28.Deontic.UnswornDeclarationEffective1746 p m d c →
      Proving.USC.T28.Procedure.ValidUnswornDeclaration1746
        (Proving.USC.T28.Bridge.declDP d) c)
  ∧ (∀ {p m d c},
      Proving.USC.T28.Deontic.UnswornDeclarationEffective1746 p m d c →
      Proving.USC.T28.Structure.Grounded1746 c)

theorem T28_s1746_deontic_agreement : T28_s1746_deontic_discharge :=
  ⟨fun h => Proving.USC.T28.Bridge.s1746_deontic_implies_elements h,
   fun h => Proving.USC.T28.Bridge.s1746_deontic_implies_ontology h,
   fun h => Proving.USC.T28.Bridge.s1746_deontic_implies_procedure h,
   fun h => Proving.USC.T28.Bridge.s1746_deontic_implies_structure h⟩

end Proving.USC.Reconciled
