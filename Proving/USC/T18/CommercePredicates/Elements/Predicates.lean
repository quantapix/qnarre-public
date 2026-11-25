









import Proving.USC.Common.Types
import Proving.USC.T18.CommercePredicates.Elements.Types

namespace Proving.USC.T18.CommercePredicates.Elements

open Proving.USC.Common















axiom TraveledInInterstateCommerce (p : Person) (c : ComplaintText) : Prop





axiom UsedInterstateCommerceFacility (f : CommerceFacility) (c : ComplaintText) : Prop





axiom IntentThatMurderCommitted (p : Person) (c : ComplaintText) : Prop






axiom AsConsiderationForPecuniaryValue (p : Person) (c : ComplaintText) : Prop





axiom ConspiredToCommitMurderForHire (p : Person) (c : ComplaintText) : Prop















axiom KnowinglyConductsMTB (p : Person) (b : MoneyTransmittingBusiness) (c : ComplaintText) : Prop






axiom IsMoneyTransmittingBusiness (b : MoneyTransmittingBusiness) (c : ComplaintText) : Prop






axiom OperatedWithoutStateLicense (b : MoneyTransmittingBusiness) (c : ComplaintText) : Prop




axiom FailsSection5330Registration (b : MoneyTransmittingBusiness) (c : ComplaintText) : Prop





axiom InvolvesCriminallyDerivedFunds (b : MoneyTransmittingBusiness) (c : ComplaintText) : Prop

end Proving.USC.T18.CommercePredicates.Elements
