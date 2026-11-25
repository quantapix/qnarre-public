











import Proving.USC.T18.Ch71.Reslice.Ontology.Types
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch71.Reslice.Ontology

open Proving.USC.Common





axiom IsObsceneMatter (m : ObsceneMatter) (c : ComplaintText) : Prop






axiom IsIndecentArticle (a : IndecentArticle) (c : ComplaintText) : Prop






axiom IsInteractiveComputerService (e : Entity) (c : ComplaintText) : Prop




axiom IsCommonCarrier (e : Entity) (c : ComplaintText) : Prop






axiom InInterstateOrForeignCommerce (e : Entity) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch71.Reslice.Ontology
