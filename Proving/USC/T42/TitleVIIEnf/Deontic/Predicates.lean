










import Proving.USC.T42.TitleVIIEnf.Deontic.Types
import Proving.USC.Common.Types

namespace Proving.USC.T42.TitleVIIEnf.Deontic

open Proving.USC.Common






axiom ChargeFiled (c : ComplaintText) : Prop




axiom CommissionServedAndInvestigated (com : Commission) (c : ComplaintText) : Prop






axiom ChargeTimelyFiled (c : ComplaintText) : Prop








axiom DisclosureAddresseeInClass (p : Person) (c : ComplaintText) : Prop





axiom MadeProtectedInfoPublic (p : Person) (c : ComplaintText) : Prop






axiom IsCoveredRecordKeeper (e : Entity) (c : ComplaintText) : Prop




axiom RecordsMaintained (e : Entity) (c : ComplaintText) : Prop






axiom IsCoveredFederalAgency (a : FederalAgency) (c : ComplaintText) : Prop




axiom PersonnelActionTaken (a : FederalAgency) (c : ComplaintText) : Prop




axiom PersonnelActionDiscriminatory (a : FederalAgency) (c : ComplaintText) : Prop










axiom CommissionPowerExercised (com : Commission) (c : ComplaintText) : Prop







axiom AgReasonableCausePattern (c : ComplaintText) : Prop

end Proving.USC.T42.TitleVIIEnf.Deontic
