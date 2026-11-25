












import Proving.USC.Common.Types
import Proving.USC.T42.ReligiousFreedom.Ontology.Types

namespace Proving.USC.T42.ReligiousFreedom.Ontology

open Proving.USC.Common



axiom IsIndian (x : Indian) (c : ComplaintText) : Prop





axiom IsIndianTribe (t : IndianTribe) (c : ComplaintText) : Prop






axiom IsAlaskaNativeVillage (t : IndianTribe) (c : ComplaintText) : Prop



axiom IsPracticedByIndians (r : IndianReligion) (c : ComplaintText) : Prop




axiom HasTraditionalIndianOrigin (r : IndianReligion) (cul : TraditionalIndianCulture)
    (c : ComplaintText) : Prop





axiom IsIndianReligion (r : IndianReligion) (c : ComplaintText) : Prop




axiom IsStateOrSubdivision (s : StateOrSubdivision) (c : ComplaintText) : Prop

end Proving.USC.T42.ReligiousFreedom.Ontology
