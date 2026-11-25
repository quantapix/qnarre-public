import Proving.USC.T42.Ch2Ch6.Ontology.Types
import Proving.USC.Common.Types










namespace Proving.USC.T42.Ch2Ch6.Ontology

open Proving.USC.Common (Person ComplaintText)




axiom IsChildrensBureau (b : ChildrensBureau) (c : ComplaintText) : Prop





axiom IsBureauChief (p : Person) (c : ComplaintText) : Prop




axiom IsAssistantChief (p : Person) (c : ComplaintText) : Prop





axiom IsVesselSubjectToQuarantine (v : Vessel) (c : ComplaintText) : Prop






axiom IsQuarantineWarehouse (w : Warehouse) (c : ComplaintText) : Prop

end Proving.USC.T42.Ch2Ch6.Ontology
