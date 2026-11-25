

















import Proving.USC.T18.Prohibited.Deontic.Types
import Proving.USC.Common.Types

namespace Proving.USC.T18.Prohibited.Deontic

open Proving.USC.Common








axiom ReceivedPatternIncome (p : Person) (c : ComplaintText) : Prop




axiom ParticipatedAsPrincipal (p : Person) (c : ComplaintText) : Prop





axiom UsedOrInvestedIncome (p : Person) (e : Entity) (c : ComplaintText) : Prop







axiom AcquiredOrMaintainedInterest (p : Person) (e : Entity) (c : ComplaintText) : Prop







axiom EmployedByEnterprise (p : Person) (e : Entity) (c : ComplaintText) : Prop



axiom AssociatedWithEnterprise (p : Person) (e : Entity) (c : ComplaintText) : Prop





axiom ConductedAffairsThroughPattern (p : Person) (e : Entity) (c : ComplaintText) : Prop







axiom EnterpriseAffectsCommerce (e : Entity) (c : ComplaintText) : Prop






axiom ConspiredToViolate (p : Person) (ag : Agreement) (c : ComplaintText) : Prop

end Proving.USC.T18.Prohibited.Deontic
