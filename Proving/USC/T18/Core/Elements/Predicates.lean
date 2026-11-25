
















import Proving.USC.T18.Core.Elements.Types

namespace Proving.USC.T18.Core.Elements

open Proving.USC.Common





axiom CulpablePersonCapableOfIntent (p : Person) (c : ComplaintText) : Prop





axiom IsEnterprise (e : Entity) (c : ComplaintText) : Prop




axiom IsRacketeeringActivity (a : Act) (c : ComplaintText) : Prop





axiom PatternOfRacketeering (acts : List Act) (c : ComplaintText) : Prop





axiom CollectionOfUnlawfulDebt (d : UnlawfulDebt) (c : ComplaintText) : Prop





axiom PersonEnterpriseDistinct (p : Person) (e : Entity) (c : ComplaintText) : Prop




axiom EmployedOrAssociated (p : Person) (e : Entity) (c : ComplaintText) : Prop





axiom ConductsOrParticipates (p : Person) (e : Entity) (c : ComplaintText) : Prop




axiom ReceivedIncomeFromPattern (p : Person) (i : Income) (c : ComplaintText) : Prop





axiom UsesOrInvestsIncomeInEnterprise (p : Person) (i : Income) (e : Entity) (c : ComplaintText) : Prop




axiom AcquiresOrMaintainsInterest (p : Person) (e : Entity) (c : ComplaintText) : Prop

end Proving.USC.T18.Core.Elements
