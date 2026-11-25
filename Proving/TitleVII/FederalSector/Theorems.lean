









import Proving.TitleVII.FederalSector.Statute

namespace Proving.TitleVII.FederalSector

open Proving.TitleVII



theorem federalSectorClaim_intro
    {fe : FederalEmployee} {ah : AgencyHead} {pa : PersonnelAction}
    {g : ProtectedGround} {c : ComplaintText}
    (hCovered  : IsCoveredFederalEmployee fe c)
    (hHead     : IsAgencyHead ah fe c)
    (hDiscrim  : PersonnelActionDiscriminatory pa fe g c)
    (hExhaust  : FederalAdministrativeExhaustion fe c)
    (hRoute    : FederalSuitAuthorization fe c)
    : FederalSectorClaim fe ah pa g c :=
  { coveredEmployee := hCovered
    agencyHeadDef := hHead
    discrimination := hDiscrim
    exhaustion := hExhaust
    suitAuthorized := hRoute }



theorem federalSectorClaim_intro_finalAction
    {fe : FederalEmployee} {ah : AgencyHead} {pa : PersonnelAction}
    {g : ProtectedGround} {c : ComplaintText}
    (hCovered  : IsCoveredFederalEmployee fe c)
    (hHead     : IsAgencyHead ah fe c)
    (hDiscrim  : PersonnelActionDiscriminatory pa fe g c)
    (hExhaust  : FederalAdministrativeExhaustion fe c)
    (hIssued   : FinalAgencyActionIssued fe c)
    (hTimely   : FederalSuitTimelyFiled fe c)
    : FederalSectorClaim fe ah pa g c :=
  federalSectorClaim_intro hCovered hHead hDiscrim hExhaust
    (.finalAction hIssued hTimely)



theorem federalSectorClaim_intro_inaction
    {fe : FederalEmployee} {ah : AgencyHead} {pa : PersonnelAction}
    {g : ProtectedGround} {c : ComplaintText}
    (hCovered  : IsCoveredFederalEmployee fe c)
    (hHead     : IsAgencyHead ah fe c)
    (hDiscrim  : PersonnelActionDiscriminatory pa fe g c)
    (hExhaust  : FederalAdministrativeExhaustion fe c)
    (hElapsed  : AgencyInactionAfterCharge fe c)
    : FederalSectorClaim fe ah pa g c :=
  federalSectorClaim_intro hCovered hHead hDiscrim hExhaust
    (.agencyInaction hElapsed)



theorem validFederalSectorClaim_intro
    {fe : FederalEmployee} {ah : AgencyHead} {pa : PersonnelAction}
    {g : ProtectedGround} {c : ComplaintText}
    (h : FederalSectorClaim fe ah pa g c)
    : ValidFederalSectorClaim fe c :=
  ValidFederalSectorClaim.mk ah pa g h

end Proving.TitleVII.FederalSector
