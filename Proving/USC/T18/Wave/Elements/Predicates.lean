















import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Wave.Elements.Types

namespace Proving.USC.T18.Wave.Elements

open Proving.USC.Common





axiom CulpablePersonCapableOfIntent (p : Person) (c : ComplaintText) : Prop





axiom IsEnterprise (e : Entity) (c : ComplaintText) : Prop





axiom PatternOfRacketeering (acts : List Act) (c : ComplaintText) : Prop





axiom CollectionOfUnlawfulDebt (acts : List Act) (c : ComplaintText) : Prop





axiom IncomeDerivedFromPattern (inc : Income) (acts : List Act) (c : ComplaintText) : Prop





axiom InvestedIncomeInEnterprise (inc : Income) (e : Entity) (i : Interest) (c : ComplaintText) : Prop





axiom AcquiredOrMaintainedInterest (p : Person) (e : Entity) (i : Interest) (acts : List Act) (c : ComplaintText) : Prop




axiom PersonEnterpriseDistinct (p : Person) (e : Entity) (c : ComplaintText) : Prop



axiom EmployedOrAssociated (p : Person) (e : Entity) (c : ComplaintText) : Prop





axiom ConductsOrParticipates (p : Person) (e : Entity) (c : ComplaintText) : Prop



axiom InjuredInBusinessOrProperty (p : Person) (c : ComplaintText) : Prop






axiom NotSecuritiesFraudBarred (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T18.Wave.Elements
