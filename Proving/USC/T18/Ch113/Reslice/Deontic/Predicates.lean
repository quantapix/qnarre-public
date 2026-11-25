








import Proving.USC.Common.Types
import Proving.USC.T18.Ch113.Reslice.Deontic.Types

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T18.Ch113.Reslice.Deontic

open Proving.USC.Common






axiom AddresseeAnyPerson (p : Person) (c : ComplaintText) : Prop




axiom EngagedInInterstateCommerce (c : ComplaintText) : Prop






axiom RegulatedActOccurred2315 (p : Person) (c : ComplaintText) : Prop





axiom ConditionMet2315 (p : Person) (c : ComplaintText) : Prop






axiom RegulatedActOccurred2318 (p : Person) (c : ComplaintText) : Prop






axiom ConditionMet2318 (p : Person) (c : ComplaintText) : Prop





axiom AddresseeCopyrightOwner (p : Person) (c : ComplaintText) : Prop




axiom PermissionCondition2318e (p : Person) (c : ComplaintText) : Prop




axiom PermittedActCivilAction2318e (p : Person) (c : ComplaintText) : Prop







axiom RegulatedActOccurred2320 (p : Person) (c : ComplaintText) : Prop





axiom ConditionMet2320 (p : Person) (c : ComplaintText) : Prop





axiom AddresseeAttorneyGeneral (p : Person) (c : ComplaintText) : Prop





axiom ObligationCondition2320h (c : ComplaintText) : Prop




axiom ObligatedActReportAccounting2320h (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch113.Reslice.Deontic
