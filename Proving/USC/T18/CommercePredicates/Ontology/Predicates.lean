









import Proving.USC.T18.CommercePredicates.Ontology.Types
import Proving.USC.Common.Types

namespace Proving.USC.T18.CommercePredicates.Ontology

open Proving.USC.Common





axiom IsPecuniaryValue (v : PecuniaryValue) (c : ComplaintText) : Prop




axiom IsCommerceFacility (f : CommerceFacility) (c : ComplaintText) : Prop





axiom IsState1958 (s : GeoState) (c : ComplaintText) : Prop





axiom IsState1960 (s : GeoState) (c : ComplaintText) : Prop





axiom IsMoneyTransmitting (m : MoneyTransmitting) (c : ComplaintText) : Prop






axiom IsMoneyTransmittingBusiness (b : MoneyTransmittingBusiness) (c : ComplaintText) : Prop





axiom LacksStateLicense (b : MoneyTransmittingBusiness) (c : ComplaintText) : Prop





axiom FailsFederalRegistration (b : MoneyTransmittingBusiness) (c : ComplaintText) : Prop





axiom InvolvesCriminalProceeds (b : MoneyTransmittingBusiness) (c : ComplaintText) : Prop

end Proving.USC.T18.CommercePredicates.Ontology
