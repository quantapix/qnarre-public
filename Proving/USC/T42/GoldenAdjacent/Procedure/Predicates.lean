












import Proving.USC.T42.GoldenAdjacent.Procedure.Types

namespace Proving.USC.T42.GoldenAdjacent.Procedure

open Proving.USC.Common





axiom IsEnforcementProceeding (pr : Proceeding) (c : ComplaintText) : Prop




axiom JurisdictionExercised (pr : Proceeding) (c : ComplaintText) : Prop




axiom Adjudicated (pr : Proceeding) (c : ComplaintText) : Prop




axiom IsPrevailingParty (p : Person) (pr : Proceeding) (c : ComplaintText) : Prop



axiom FeeRequested (p : Person) (fr : FeeRequest) (c : ComplaintText) : Prop




axiom FeeIsReasonable (fr : FeeRequest) (c : ComplaintText) : Prop






axiom JudicialOfficerBarInapplicable (p : Person) (pr : Proceeding) (c : ComplaintText) : Prop

end Proving.USC.T42.GoldenAdjacent.Procedure
