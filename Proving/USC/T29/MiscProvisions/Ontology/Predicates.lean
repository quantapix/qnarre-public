











import Proving.USC.T29.MiscProvisions.Ontology.Types
import Proving.USC.Common.Types

namespace Proving.USC.T29.MiscProvisions.Ontology

open Proving.USC.Common




axiom IsSupervisor (s : Supervisor) (c : ComplaintText) : Prop





axiom StateLawProhibitsUnionSecurity (p : Person) (c : ComplaintText) : Prop





axiom LaborDisputeBelowJurisdictionThreshold (e : Entity) (c : ComplaintText) : Prop





axiom IsValidatedBoardAction (a : BoardAction) (c : ComplaintText) : Prop





axiom IsBonaFideReligiousBody (b : ReligiousBody) (c : ComplaintText) : Prop






axiom IsReligiousObjectorEmployee (p : Person) (c : ComplaintText) : Prop





axiom IsCharitableFund (f : CharitableFund) (c : ComplaintText) : Prop

end Proving.USC.T29.MiscProvisions.Ontology
