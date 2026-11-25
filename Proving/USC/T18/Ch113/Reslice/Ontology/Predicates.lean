import Proving.USC.T18.Ch113.Reslice.Ontology.Types
import Proving.USC.Common.Types
set_option autoImplicit false
namespace Proving.USC.T18.Ch113.Reslice.Ontology
open Proving.USC.Common








axiom IsState (j : Jurisdiction) (c : ComplaintText) : Prop





axiom IsVeteransMemorialObject (o : MemorialObject) (c : ComplaintText) : Prop




axiom IsCounterfeitLabel (l : Label) (c : ComplaintText) : Prop




axiom IsIllicitLabel (l : Label) (c : ComplaintText) : Prop




axiom IsDocumentationOrPackaging (p : Packaging) (c : ComplaintText) : Prop




axiom IsCounterfeitDocumentationOrPackaging (p : Packaging) (c : ComplaintText) : Prop




axiom IsCounterfeitMark (m : Mark) (c : ComplaintText) : Prop



axiom IsFinancialGain (g : Gain) (c : ComplaintText) : Prop




axiom IsCounterfeitMilitaryGoodOrService (g : GoodOrService) (c : ComplaintText) : Prop





axiom IsTraffic (act : Conduct) (c : ComplaintText) : Prop



axiom IsDrug (d : Drug) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch113.Reslice.Ontology
