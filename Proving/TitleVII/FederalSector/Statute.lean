













import Proving.TitleVII.FederalSector.Predicates

namespace Proving.TitleVII.FederalSector

open Proving.TitleVII














inductive FederalSuitAuthorization
    (fe : FederalEmployee) (c : ComplaintText) : Prop where
  | finalAction
      (issued : FinalAgencyActionIssued fe c)
      (timely : FederalSuitTimelyFiled fe c) :
      FederalSuitAuthorization fe c
  | agencyInaction
      (elapsed : AgencyInactionAfterCharge fe c) :
      FederalSuitAuthorization fe c












structure FederalSectorClaim
    (fe : FederalEmployee) (ah : AgencyHead) (pa : PersonnelAction)
    (g : ProtectedGround) (c : ComplaintText) : Prop where
  coveredEmployee : IsCoveredFederalEmployee fe c
  agencyHeadDef   : IsAgencyHead ah fe c
  discrimination  : PersonnelActionDiscriminatory pa fe g c
  exhaustion      : FederalAdministrativeExhaustion fe c
  suitAuthorized  : FederalSuitAuthorization fe c







inductive ValidFederalSectorClaim
    (fe : FederalEmployee) (c : ComplaintText) : Prop where
  | mk
      (ah : AgencyHead) (pa : PersonnelAction) (g : ProtectedGround)
      (h : FederalSectorClaim fe ah pa g c) :
      ValidFederalSectorClaim fe c

end Proving.TitleVII.FederalSector
