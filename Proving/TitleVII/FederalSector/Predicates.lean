













import Proving.TitleVII.FederalSector.Types

namespace Proving.TitleVII.FederalSector

open Proving.TitleVII






axiom IsCoveredFederalEmployee (fe : FederalEmployee) (c : ComplaintText) : Prop





axiom IsAgencyHead (ah : AgencyHead) (fe : FederalEmployee) (c : ComplaintText) : Prop





axiom PersonnelActionDiscriminatory
    (pa : PersonnelAction) (fe : FederalEmployee) (g : ProtectedGround) (c : ComplaintText) : Prop












axiom FederalAdministrativeExhaustion (fe : FederalEmployee) (c : ComplaintText) : Prop






axiom FinalAgencyActionIssued (fe : FederalEmployee) (c : ComplaintText) : Prop






axiom FederalSuitTimelyFiled (fe : FederalEmployee) (c : ComplaintText) : Prop








axiom AgencyInactionAfterCharge (fe : FederalEmployee) (c : ComplaintText) : Prop

end Proving.TitleVII.FederalSector
