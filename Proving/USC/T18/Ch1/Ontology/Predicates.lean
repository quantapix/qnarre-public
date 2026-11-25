













import Proving.USC.Common.Types
import Proving.USC.T18.Ch1.Ontology.Types

namespace Proving.USC.T18.Ch1.Ontology

open Proving.USC.Common






axiom IsPrincipal (p : Person) (c : ComplaintText) : Prop






axiom IsAccessoryAfterTheFact (p : Person) (c : ComplaintText) : Prop







axiom IsMisprisionOfFelony (p : Person) (c : ComplaintText) : Prop





axiom IsUnitedStates (pl : Place) (c : ComplaintText) : Prop






axiom IsDepartment (e : Entity) (c : ComplaintText) : Prop







axiom IsAgency (e : Entity) (c : ComplaintText) : Prop







axiom IsSpecialMaritimeTerritorialJurisdiction (pl : Place) (c : ComplaintText) : Prop







axiom IsObligationOrSecurityOfUS (i : Instrument) (c : ComplaintText) : Prop







axiom IsVesselOfUnitedStates (v : Vessel) (c : ComplaintText) : Prop






axiom IsInterstateCommerce (a : CommerceActivity) (c : ComplaintText) : Prop




axiom IsForeignCommerce (a : CommerceActivity) (c : ComplaintText) : Prop







axiom IsForeignGovernment (e : Entity) (c : ComplaintText) : Prop






axiom IsPostalService (e : Entity) (c : ComplaintText) : Prop







axiom IsMinor (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch1.Ontology
