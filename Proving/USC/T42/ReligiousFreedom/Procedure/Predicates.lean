
























import Proving.USC.T42.ReligiousFreedom.Procedure.Types

namespace Proving.USC.T42.ReligiousFreedom.Procedure

open Proving.USC.Common








axiom RegulationProposed (r : Regulation) (c : ComplaintText) : Prop








axiom ConsultationHeld (r : Regulation) (c : ComplaintText) : Prop







axiom RfraBalanceSurvived (r : Regulation) (c : ComplaintText) : Prop












axiom PolicyActEpochDay (d : Nat) (c : ComplaintText) : Prop








axiom InPlacementProcess (p : Person) (c : ComplaintText) : Prop







axiom PlacementNoncomplianceOccurred (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T42.ReligiousFreedom.Procedure
