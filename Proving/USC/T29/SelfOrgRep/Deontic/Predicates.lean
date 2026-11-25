











import Proving.USC.Common.Types
import Proving.USC.T29.SelfOrgRep.Deontic.Types

namespace Proving.USC.T29.SelfOrgRep.Deontic

open Proving.USC.Common







axiom IsEmployeeAddressee (p : Person) (c : ComplaintText) : Prop






axiom ProtectedConcertedAct (p : Person) (c : ComplaintText) : Prop




axiom RefrainAct (p : Person) (c : ComplaintText) : Prop






axiom UnionSecurityException (p : Person) (c : ComplaintText) : Prop







axiom MajorityDesignated (lo : LaborOrganization) (u : BargainingUnit) (c : ComplaintText) : Prop






axiom TreatedAsExclusiveRep (lo : LaborOrganization) (u : BargainingUnit) (c : ComplaintText) : Prop









axiom UnitQuestionPresented (u : BargainingUnit) (c : ComplaintText) : Prop




axiom BoardDecidedUnit (u : BargainingUnit) (c : ComplaintText) : Prop





axiom MixedGuardCertification (lo : LaborOrganization) (u : BargainingUnit) (c : ComplaintText) : Prop







axiom PriorValidElectionWithinYear (u : BargainingUnit) (c : ComplaintText) : Prop





axiom ElectionDirected (e : Election) (u : BargainingUnit) (c : ComplaintText) : Prop

end Proving.USC.T29.SelfOrgRep.Deontic
