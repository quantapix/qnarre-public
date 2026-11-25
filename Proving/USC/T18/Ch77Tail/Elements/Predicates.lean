








import Proving.USC.Common.Types
import Proving.USC.T18.Ch77Tail.Elements.Types

namespace Proving.USC.T18.Ch77Tail.Elements
open Proving.USC.Common






axiom WithinUSTerritorialJurisdiction (c : ComplaintText) : Prop




axiom IsUSCitizenOrResident (p : Person) (c : ComplaintText) : Prop






axiom PreparesOrDispatchesSlaveVessel (p : Person) (v : Vessel) (c : ComplaintText) : Prop





axiom PurposeToProcureForSlavery (p : Person) (c : ComplaintText) : Prop







axiom IsCrewOfSlaveTradeVessel (p : Person) (c : ComplaintText) : Prop





axiom SeizesOrTransportsPersonAsSlave (p : Person) (victim : Person) (c : ComplaintText) : Prop




axiom IntentToEnslave (p : Person) (c : ComplaintText) : Prop






axiom VoluntarilyServesOnSlaveTransportVessel (p : Person) (v : Vessel) (c : ComplaintText) : Prop





axiom IsVesselCommander (p : Person) (c : ComplaintText) : Prop




axiom PossessesPersonForSaleAsSlave (p : Person) (victim : Person) (c : ComplaintText) : Prop





axiom IsVesselMasterOwnerOrInCharge (p : Person) (c : ComplaintText) : Prop




axiom ReceivesOrCarriesPersonFromUS (p : Person) (victim : Person) (c : ComplaintText) : Prop




axiom KnowledgeOrIntentToHoldOrSellAsSlave (p : Person) (c : ComplaintText) : Prop






axiom KnowinglyHandlesIdentityDocument (p : Person) (d : Document) (c : ComplaintText) : Prop




axiom DocumentIsIdentityDocOfAnother (d : Document) (c : ComplaintText) : Prop




axiom InCourseOfTraffickingViolation (p : Person) (c : ComplaintText) : Prop




axiom WithIntentToCommitTraffickingViolation (p : Person) (c : ComplaintText) : Prop






axiom ToRestrictTraffickingVictimLiberty (p : Person) (c : ComplaintText) : Prop






axiom VictimOwnConductException (p : Person) (c : ComplaintText) : Prop




axiom ObstructsEnforcement (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch77Tail.Elements
