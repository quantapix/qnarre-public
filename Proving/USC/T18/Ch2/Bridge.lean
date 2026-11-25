



































import Proving.USC.Common.Types
import Proving.USC.T18.Ch2.Elements.Statute
import Proving.USC.T18.Ch2.Deontic.Statute
import Proving.USC.T18.Ch2.Structure.Statute
import Proving.USC.T18.Ch2.Procedure.Statute
import Proving.USC.T18.Ch2.Ontology.Statute

namespace Proving.USC.T18.Ch2Bridge

open Proving.USC.Common









namespace S31



axiom corr_ontology_struct {a c} :
    Proving.USC.T18.Ch2.Ontology.InServiceMembership a c →
    Proving.USC.T18.Ch2.Structure.Coherent31 c


axiom corr_procedure_struct {a c} :
    Proving.USC.T18.Ch2.Procedure.InServiceWindow a c →
    Proving.USC.T18.Ch2.Structure.Coherent31 c


theorem s31_ontology_implies_structure {a c}
    (h : Proving.USC.T18.Ch2.Ontology.InServiceMembership a c) :
    Proving.USC.T18.Ch2.Structure.Coherent31 c :=
  corr_ontology_struct h


theorem s31_procedure_implies_structure {a c}
    (h : Proving.USC.T18.Ch2.Procedure.InServiceWindow a c) :
    Proving.USC.T18.Ch2.Structure.Coherent31 c :=
  corr_procedure_struct h

end S31




namespace S32

axiom corr_addr {p ac c} :
    Proving.USC.T18.Ch2.Elements.Section32a p ac c →
    Proving.USC.T18.Ch2.Deontic.AddresseeInClass p .s32 c
axiom corr_cond {p ac c} :
    Proving.USC.T18.Ch2.Elements.Section32a p ac c →
    Proving.USC.T18.Ch2.Deontic.ConditionMet (.s32) c
axiom corr_act {p ac c} :
    Proving.USC.T18.Ch2.Elements.Section32a p ac c →
    Proving.USC.T18.Ch2.Deontic.RegulatedActOccurred p .s32 c
axiom corr_struct {p ac c} :
    Proving.USC.T18.Ch2.Elements.Section32a p ac c →
    Proving.USC.T18.Ch2.Structure.Coherent32 c


theorem s32_elements_implies_deontic {p ac c}
    (h : Proving.USC.T18.Ch2.Elements.Section32a p ac c) :
    Proving.USC.T18.Ch2.Deontic.Prohibition32Violated p c :=
  ⟨⟨corr_addr h, corr_cond h⟩, corr_act h⟩


theorem s32_elements_implies_structure {p ac c}
    (h : Proving.USC.T18.Ch2.Elements.Section32a p ac c) :
    Proving.USC.T18.Ch2.Structure.Coherent32 c :=
  corr_struct h

end S32







namespace S33

axiom corr_addr {p mv c} :
    Proving.USC.T18.Ch2.Elements.Section33a p mv c →
    Proving.USC.T18.Ch2.Deontic.AddresseeInClass p .s33 c
axiom corr_cond {p mv c} :
    Proving.USC.T18.Ch2.Elements.Section33a p mv c →
    Proving.USC.T18.Ch2.Deontic.ConditionMet (.s33) c
axiom corr_act {p mv c} :
    Proving.USC.T18.Ch2.Elements.Section33a p mv c →
    Proving.USC.T18.Ch2.Deontic.RegulatedActOccurred p .s33 c

axiom corr_defs31 {p mv c} :
    Proving.USC.T18.Ch2.Elements.Section33a p mv c →
    Proving.USC.T18.Ch2.Structure.IncorporationHonored
      Proving.USC.T18.Ch2.Structure.edge_33_inc_31 c


theorem s33_elements_implies_deontic {p mv c}
    (h : Proving.USC.T18.Ch2.Elements.Section33a p mv c) :
    Proving.USC.T18.Ch2.Deontic.Prohibition33Violated p c :=
  ⟨⟨corr_addr h, corr_cond h⟩, corr_act h⟩





theorem s33_elements_implies_structure_modulo_gaps {p mv c}
    (h : Proving.USC.T18.Ch2.Elements.Section33a p mv c)
    (gap_hlrw : Proving.USC.T18.Ch2.Structure.ReferencedSectionExists
      Proving.USC.T18.Ch2.Structure.edge_33b_inc_42_10101_12 c)
    (gap_spentFuel : Proving.USC.T18.Ch2.Structure.ReferencedSectionExists
      Proving.USC.T18.Ch2.Structure.edge_33b_inc_42_10101_23 c) :
    Proving.USC.T18.Ch2.Structure.Coherent33 c :=
  ⟨corr_defs31 h, gap_hlrw, gap_spentFuel⟩

end S33






namespace S34



axiom corr_procedure_struct {p c} :
    Proving.USC.T18.Ch2.Procedure.DeathResultTrigger34 p c →
    Proving.USC.T18.Ch2.Structure.Coherent34 c


theorem s34_procedure_implies_structure {p c}
    (h : Proving.USC.T18.Ch2.Procedure.DeathResultTrigger34 p c) :
    Proving.USC.T18.Ch2.Structure.Coherent34 c :=
  corr_procedure_struct h

end S34




namespace S35

axiom corr_addr {p c} :
    Proving.USC.T18.Ch2.Elements.Section35a p c →
    Proving.USC.T18.Ch2.Deontic.AddresseeInClass p .s35 c
axiom corr_cond {p c} :
    Proving.USC.T18.Ch2.Elements.Section35a p c →
    Proving.USC.T18.Ch2.Deontic.ConditionMet (.s35) c
axiom corr_act {p c} :
    Proving.USC.T18.Ch2.Elements.Section35a p c →
    Proving.USC.T18.Ch2.Deontic.RegulatedActOccurred p .s35 c
axiom corr_struct {p c} :
    Proving.USC.T18.Ch2.Elements.Section35a p c →
    Proving.USC.T18.Ch2.Structure.Coherent35 c


theorem s35_elements_implies_deontic {p c}
    (h : Proving.USC.T18.Ch2.Elements.Section35a p c) :
    Proving.USC.T18.Ch2.Deontic.Prohibition35Violated p c :=
  ⟨⟨corr_addr h, corr_cond h⟩, corr_act h⟩



theorem s35_elements_implies_structure {p c}
    (h : Proving.USC.T18.Ch2.Elements.Section35a p c) :
    Proving.USC.T18.Ch2.Structure.Coherent35 c :=
  corr_struct h

end S35




namespace S36

axiom corr_addr {p c} :
    Proving.USC.T18.Ch2.Elements.Section36b p c →
    Proving.USC.T18.Ch2.Deontic.AddresseeInClass p .s36 c
axiom corr_cond {p c} :
    Proving.USC.T18.Ch2.Elements.Section36b p c →
    Proving.USC.T18.Ch2.Deontic.ConditionMet (.s36) c
axiom corr_act {p c} :
    Proving.USC.T18.Ch2.Elements.Section36b p c →
    Proving.USC.T18.Ch2.Deontic.RegulatedActOccurred p .s36 c
axiom corr_struct {p c} :
    Proving.USC.T18.Ch2.Elements.Section36b p c →
    Proving.USC.T18.Ch2.Structure.Coherent36 c


theorem s36_elements_implies_deontic {p c}
    (h : Proving.USC.T18.Ch2.Elements.Section36b p c) :
    Proving.USC.T18.Ch2.Deontic.Prohibition36Violated p c :=
  ⟨⟨corr_addr h, corr_cond h⟩, corr_act h⟩



theorem s36_elements_implies_structure {p c}
    (h : Proving.USC.T18.Ch2.Elements.Section36b p c) :
    Proving.USC.T18.Ch2.Structure.Coherent36 c :=
  corr_struct h

end S36







namespace S37

axiom corr_addr {p c} :
    Proving.USC.T18.Ch2.Elements.Section37 p c →
    Proving.USC.T18.Ch2.Deontic.AddresseeInClass p .s37 c
axiom corr_cond {p c} :
    Proving.USC.T18.Ch2.Elements.Section37 p c →
    Proving.USC.T18.Ch2.Deontic.ConditionMet (.s37) c
axiom corr_act {p c} :
    Proving.USC.T18.Ch2.Elements.Section37 p c →
    Proving.USC.T18.Ch2.Deontic.RegulatedActOccurred p .s37 c
axiom corr_struct {p c} :
    Proving.USC.T18.Ch2.Elements.Section37 p c →
    Proving.USC.T18.Ch2.Structure.Coherent37 c


theorem s37_elements_implies_deontic {p c}
    (h : Proving.USC.T18.Ch2.Elements.Section37 p c) :
    Proving.USC.T18.Ch2.Deontic.Prohibition37Violated p c :=
  ⟨⟨corr_addr h, corr_cond h⟩, corr_act h⟩


theorem s37_elements_implies_structure {p c}
    (h : Proving.USC.T18.Ch2.Elements.Section37 p c) :
    Proving.USC.T18.Ch2.Structure.Coherent37 c :=
  corr_struct h

end S37




namespace S38

axiom corr_addr {p c} :
    Proving.USC.T18.Ch2.Elements.Section38a p c →
    Proving.USC.T18.Ch2.Deontic.AddresseeInClass p .s38 c
axiom corr_cond {p c} :
    Proving.USC.T18.Ch2.Elements.Section38a p c →
    Proving.USC.T18.Ch2.Deontic.ConditionMet (.s38) c
axiom corr_act {p c} :
    Proving.USC.T18.Ch2.Elements.Section38a p c →
    Proving.USC.T18.Ch2.Deontic.RegulatedActOccurred p .s38 c
axiom corr_struct {p c} :
    Proving.USC.T18.Ch2.Elements.Section38a p c →
    Proving.USC.T18.Ch2.Structure.Coherent38 c


theorem s38_elements_implies_deontic {p c}
    (h : Proving.USC.T18.Ch2.Elements.Section38a p c) :
    Proving.USC.T18.Ch2.Deontic.Prohibition38Violated p c :=
  ⟨⟨corr_addr h, corr_cond h⟩, corr_act h⟩


theorem s38_elements_implies_structure {p c}
    (h : Proving.USC.T18.Ch2.Elements.Section38a p c) :
    Proving.USC.T18.Ch2.Structure.Coherent38 c :=
  corr_struct h

end S38





namespace S39

axiom corr_addr {p c} :
    Proving.USC.T18.Ch2.Elements.Section39a1 p c →
    Proving.USC.T18.Ch2.Deontic.AddresseeInClass p .s39a1 c
axiom corr_cond {p c} :
    Proving.USC.T18.Ch2.Elements.Section39a1 p c →
    Proving.USC.T18.Ch2.Deontic.ConditionMet (.s39a1) c
axiom corr_act {p c} :
    Proving.USC.T18.Ch2.Elements.Section39a1 p c →
    Proving.USC.T18.Ch2.Deontic.RegulatedActOccurred p .s39a1 c

axiom corr_procedure {p c} :
    Proving.USC.T18.Ch2.Elements.Section39a1 p c →
    Proving.USC.T18.Ch2.Procedure.AffectsInterstateOrForeignCommerce c


theorem s39_elements_implies_deontic {p c}
    (h : Proving.USC.T18.Ch2.Elements.Section39a1 p c) :
    Proving.USC.T18.Ch2.Deontic.Prohibition39a1Violated p c :=
  ⟨⟨corr_addr h, corr_cond h⟩, corr_act h⟩


theorem s39_elements_implies_procedure {p c}
    (h : Proving.USC.T18.Ch2.Elements.Section39a1 p c) :
    Proving.USC.T18.Ch2.Procedure.AffectsInterstateOrForeignCommerce c :=
  corr_procedure h

end S39







namespace S39A

axiom corr_addr {p c} :
    Proving.USC.T18.Ch2.Elements.Section39A p c →
    Proving.USC.T18.Ch2.Deontic.AddresseeInClass p .s39A c

axiom corr_cond {p c} :
    Proving.USC.T18.Ch2.Elements.Section39A p c →
    (Proving.USC.T18.Ch2.Procedure.ExceptionApplies39A c → False) →
    Proving.USC.T18.Ch2.Deontic.ConditionMet (.s39A) c
axiom corr_act {p c} :
    Proving.USC.T18.Ch2.Elements.Section39A p c →
    Proving.USC.T18.Ch2.Deontic.RegulatedActOccurred p .s39A c
axiom corr_struct {p c} :
    Proving.USC.T18.Ch2.Elements.Section39A p c →
    Proving.USC.T18.Ch2.Structure.Coherent39A c





theorem s39A_elements_implies_deontic_modulo_gaps {p c}
    (h : Proving.USC.T18.Ch2.Elements.Section39A p c)
    (gap_no_carveout : Proving.USC.T18.Ch2.Procedure.ExceptionApplies39A c → False) :
    Proving.USC.T18.Ch2.Deontic.Prohibition39AViolated p c :=
  ⟨⟨corr_addr h, corr_cond h gap_no_carveout⟩, corr_act h⟩


theorem s39A_elements_implies_structure {p c}
    (h : Proving.USC.T18.Ch2.Elements.Section39A p c) :
    Proving.USC.T18.Ch2.Structure.Coherent39A c :=
  corr_struct h

end S39A




namespace S39B

axiom corr_addr {p c} :
    Proving.USC.T18.Ch2.Elements.Section39Ba p c →
    Proving.USC.T18.Ch2.Deontic.AddresseeInClass p .s39B c
axiom corr_cond {p c} :
    Proving.USC.T18.Ch2.Elements.Section39Ba p c →
    Proving.USC.T18.Ch2.Deontic.ConditionMet (.s39B) c
axiom corr_act {p c} :
    Proving.USC.T18.Ch2.Elements.Section39Ba p c →
    Proving.USC.T18.Ch2.Deontic.RegulatedActOccurred p .s39B c

axiom corr_struct {p c} :
    Proving.USC.T18.Ch2.Elements.Section39Ba p c →
    Proving.USC.T18.Ch2.Structure.Coherent39B c


theorem s39B_elements_implies_deontic {p c}
    (h : Proving.USC.T18.Ch2.Elements.Section39Ba p c) :
    Proving.USC.T18.Ch2.Deontic.Prohibition39BViolated p c :=
  ⟨⟨corr_addr h, corr_cond h⟩, corr_act h⟩


theorem s39B_elements_implies_structure {p c}
    (h : Proving.USC.T18.Ch2.Elements.Section39Ba p c) :
    Proving.USC.T18.Ch2.Structure.Coherent39B c :=
  corr_struct h

end S39B






namespace S40

axiom corr_addr {p c} :
    Proving.USC.T18.Ch2.Elements.Section40b p c →
    Proving.USC.T18.Ch2.Deontic.AddresseeInClass p .s40stop c
axiom corr_cond {p c} :
    Proving.USC.T18.Ch2.Elements.Section40b p c →
    Proving.USC.T18.Ch2.Deontic.ConditionMet (.s40stop) c

axiom corr_notact {p c} :
    Proving.USC.T18.Ch2.Elements.Section40b p c →
    (Proving.USC.T18.Ch2.Deontic.RegulatedActOccurred p .s40stop c → False)
axiom corr_struct {p c} :
    Proving.USC.T18.Ch2.Elements.Section40b p c →
    Proving.USC.T18.Ch2.Structure.Coherent40 c



theorem s40_elements_implies_deontic {p c}
    (h : Proving.USC.T18.Ch2.Elements.Section40b p c) :
    Proving.USC.T18.Ch2.Deontic.Obligation40stopBreached p c :=
  ⟨⟨corr_addr h, corr_cond h⟩, corr_notact h⟩



theorem s40_elements_implies_structure {p c}
    (h : Proving.USC.T18.Ch2.Elements.Section40b p c) :
    Proving.USC.T18.Ch2.Structure.Coherent40 c :=
  corr_struct h

end S40







namespace S40A

axiom corr_addr {p c} :
    Proving.USC.T18.Ch2.Elements.Section40Aa p c →
    Proving.USC.T18.Ch2.Deontic.AddresseeInClass p .s40A c
axiom corr_cond {p c} :
    Proving.USC.T18.Ch2.Elements.Section40Aa p c →
    (Proving.USC.T18.Ch2.Procedure.GovernmentOperationException40A c → False) →
    Proving.USC.T18.Ch2.Deontic.ConditionMet (.s40A) c
axiom corr_act {p c} :
    Proving.USC.T18.Ch2.Elements.Section40Aa p c →
    Proving.USC.T18.Ch2.Deontic.RegulatedActOccurred p .s40A c
axiom corr_struct {p c} :
    Proving.USC.T18.Ch2.Elements.Section40Aa p c →
    Proving.USC.T18.Ch2.Structure.Coherent40A c




theorem s40A_elements_implies_deontic_modulo_gaps {p c}
    (h : Proving.USC.T18.Ch2.Elements.Section40Aa p c)
    (gap_no_gov_exception :
      Proving.USC.T18.Ch2.Procedure.GovernmentOperationException40A c → False) :
    Proving.USC.T18.Ch2.Deontic.Prohibition40AViolated p c :=
  ⟨⟨corr_addr h, corr_cond h gap_no_gov_exception⟩, corr_act h⟩


theorem s40A_elements_implies_structure {p c}
    (h : Proving.USC.T18.Ch2.Elements.Section40Aa p c) :
    Proving.USC.T18.Ch2.Structure.Coherent40A c :=
  corr_struct h

end S40A

end Proving.USC.T18.Ch2Bridge
