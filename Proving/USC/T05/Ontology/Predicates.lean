










import Proving.USC.T05.Ontology.Types
import Proving.USC.Common.Types

namespace Proving.USC.T05.Ontology

open Proving.USC.Common






axiom IsAgency (e : Entity) (c : ComplaintText) : Prop





axiom IsPerson (p : Person) (c : ComplaintText) : Prop




axiom IsParty (x : Party) (c : ComplaintText) : Prop




axiom IsRule (r : Rule) (c : ComplaintText) : Prop




axiom IsRuleMaking (rm : RuleMaking) (c : ComplaintText) : Prop




axiom IsOrder (o : Order) (c : ComplaintText) : Prop




axiom IsAdjudication (a : Adjudication) (c : ComplaintText) : Prop




axiom IsLicense (l : License) (c : ComplaintText) : Prop




axiom IsLicensing (l : Licensing) (c : ComplaintText) : Prop




axiom IsApaSanction (s : ApaSanction) (c : ComplaintText) : Prop




axiom IsRelief (r : Relief) (c : ComplaintText) : Prop




axiom IsAgencyProceeding (ap : AgencyProceeding) (c : ComplaintText) : Prop




axiom IsAgencyAction (aa : AgencyAction) (c : ComplaintText) : Prop




axiom IsExParteCommunication (x : ExParteCommunication) (c : ComplaintText) : Prop

end Proving.USC.T05.Ontology
