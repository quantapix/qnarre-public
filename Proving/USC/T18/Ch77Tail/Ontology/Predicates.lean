









import Proving.USC.T18.Ch77Tail.Ontology.Types
import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch77Tail.Ontology

open Proving.USC.Common




axiom IsVessel (v : Vessel) (c : ComplaintText) : Prop



axiom IsForeignVessel (v : Vessel) (c : ComplaintText) : Prop




axiom IsSlaveTradeVessel (v : Vessel) (c : ComplaintText) : Prop





axiom HeldAsSlave (p : Person) (c : ComplaintText) : Prop





axiom IsCitizenOrResidentOfUS (p : Person) (c : ComplaintText) : Prop



axiom IsMasterFactorOrOwner (p : Person) (c : ComplaintText) : Prop



axiom IsCaptainMasterOrCommander (p : Person) (c : ComplaintText) : Prop




axiom IsMasterOwnerOrPersonInCharge (p : Person) (c : ComplaintText) : Prop




axiom IsCrewMember (p : Person) (c : ComplaintText) : Prop





axiom IsImmigrationOrIdentityDocument (d : Document) (c : ComplaintText) : Prop






axiom IsSevereFormOfTraffickingVictim (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch77Tail.Ontology
