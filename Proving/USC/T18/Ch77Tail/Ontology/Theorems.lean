








import Proving.USC.T18.Ch77Tail.Ontology.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch77Tail.Ontology

open Proving.USC.Common



theorem slaveTradeVesselMembership_intro {v c}
    (hV : IsVessel v c) (hT : IsSlaveTradeVessel v c)
    : SlaveTradeVesselMembership v c := ⟨hV, hT⟩



theorem documentOffenseObjectMembership_intro {d p c}
    (hD : IsImmigrationOrIdentityDocument d c) (hVic : IsSevereFormOfTraffickingVictim p c)
    : DocumentOffenseObjectMembership d p c := ⟨hD, hVic⟩


theorem vesselSlaveTradeRole_intro_masterFactorOwner {p c}
    (h : IsMasterFactorOrOwner p c) : VesselSlaveTradeRole p c :=
  .masterFactorOwner h


theorem vesselSlaveTradeRole_intro_captainMasterCmdr {p c}
    (h : IsCaptainMasterOrCommander p c) : VesselSlaveTradeRole p c :=
  .captainMasterCmdr h


theorem vesselSlaveTradeRole_intro_masterOwnerInCharge {p c}
    (h : IsMasterOwnerOrPersonInCharge p c) : VesselSlaveTradeRole p c :=
  .masterOwnerInCharge h


theorem vesselSlaveTradeRole_intro_crewMember {p c}
    (h : IsCrewMember p c) : VesselSlaveTradeRole p c :=
  .crewMember h

end Proving.USC.T18.Ch77Tail.Ontology
