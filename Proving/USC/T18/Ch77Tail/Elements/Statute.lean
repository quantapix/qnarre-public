









import Proving.USC.Common.Types
import Proving.USC.T18.Ch77Tail.Elements.Types
import Proving.USC.T18.Ch77Tail.Elements.Predicates

namespace Proving.USC.T18.Ch77Tail.Elements
open Proving.USC.Common


structure Section1582 (p : Person) (v : Vessel) (c : ComplaintText) : Prop where
  prepares : PreparesOrDispatchesSlaveVessel p v c
  located  : WithinUSTerritorialJurisdiction c
  purpose  : PurposeToProcureForSlavery p c


structure Section1585 (p : Person) (victim : Person) (c : ComplaintText) : Prop where
  crew   : IsCrewOfSlaveTradeVessel p c
  act    : SeizesOrTransportsPersonAsSlave p victim c
  intent : IntentToEnslave p c


structure Section1586 (p : Person) (v : Vessel) (c : ComplaintText) : Prop where
  citizen : IsUSCitizenOrResident p c
  serves  : VoluntarilyServesOnSlaveTransportVessel p v c


structure Section1587 (p : Person) (v : Vessel) (victim : Person) (c : ComplaintText) : Prop where
  commander : IsVesselCommander p c
  located   : WithinUSTerritorialJurisdiction c
  possesses : PossessesPersonForSaleAsSlave p victim c


structure Section1588 (p : Person) (victim : Person) (c : ComplaintText) : Prop where
  charge   : IsVesselMasterOwnerOrInCharge p c
  act      : ReceivesOrCarriesPersonFromUS p victim c
  scienter : KnowledgeOrIntentToHoldOrSellAsSlave p c


inductive TraffickingDocumentNexus (p : Person) (c : ComplaintText) : Prop where
  | inCourse   (h : InCourseOfTraffickingViolation p c)
  | withIntent (h : WithIntentToCommitTraffickingViolation p c)
  | toRestrict (h : ToRestrictTraffickingVictimLiberty p c)



structure Section1592a (p : Person) (d : Document) (c : ComplaintText) : Prop where
  handles   : KnowinglyHandlesIdentityDocument p d c
  document  : DocumentIsIdentityDocOfAnother d c
  nexus     : TraffickingDocumentNexus p c
  notVictim : ¬ VictimOwnConductException p c


structure Section1592c (p : Person) (c : ComplaintText) : Prop where
  obstructs : ObstructsEnforcement p c



inductive Section1592 (p : Person) (d : Document) (c : ComplaintText) : Prop where
  | documentOffense (h : Section1592a p d c)
  | obstruction     (h : Section1592c p c)





inductive Chapter77SlaveryOffense
    (p : Person) (v : Vessel) (victim : Person) (d : Document) (c : ComplaintText) : Prop where
  | s1582 (h : Section1582 p v c)
  | s1585 (h : Section1585 p victim c)
  | s1586 (h : Section1586 p v c)
  | s1587 (h : Section1587 p v victim c)
  | s1588 (h : Section1588 p victim c)
  | s1592 (h : Section1592 p d c)

end Proving.USC.T18.Ch77Tail.Elements
