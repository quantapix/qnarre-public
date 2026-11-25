












import Proving.USC.Common.Types
import Proving.USC.T29.LMRA.Deontic.Types

namespace Proving.USC.T29.LMRA.Deontic

open Proving.USC.Common








axiom IsEmployerSidePayor (p : Person) (c : ComplaintText) : Prop





axiom PaymentActOccurred (p : Person) (t : ThingOfValue) (c : ComplaintText) : Prop





axiom IsPaymentRecipient (p : Person) (c : ComplaintText) : Prop





axiom ReceiptActOccurred (p : Person) (t : ThingOfValue) (c : ComplaintText) : Prop





axiom Section186cExemptionApplies (t : ThingOfValue) (c : ComplaintText) : Prop






axiom IsLaborOrganizationAddressee (p : Person) (c : ComplaintText) : Prop





axiom SecondaryBoycottActOccurred (p : Person) (c : ComplaintText) : Prop







axiom IsBargainingParty (p : Person) (c : ComplaintText) : Prop







axiom ReasonableEffortActOccurred (p : Person) (c : ComplaintText) : Prop






axiom IsPresidentAddressee (p : Person) (c : ComplaintText) : Prop






axiom NationalEmergencyConditionMet (d : LaborDispute) (c : ComplaintText) : Prop




axiom BoardOfInquiryAppointed (d : LaborDispute) (c : ComplaintText) : Prop









axiom InjunctionFindingsMet (d : LaborDispute) (c : ComplaintText) : Prop





axiom InjunctionIssued (d : LaborDispute) (c : ComplaintText) : Prop

end Proving.USC.T29.LMRA.Deontic
