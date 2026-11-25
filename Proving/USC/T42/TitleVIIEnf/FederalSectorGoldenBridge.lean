























import Proving.USC.T42.TitleVIIEnf.Elements.Statute
import Proving.TitleVII.FederalSector.Statute
import Proving.TitleVII.FederalSector.Theorems

namespace Proving.USC.T42.TitleVIIEnf.FederalSectorGoldenBridge

open Proving.USC.Common



axiom mapComplaint : ComplaintText → Proving.TitleVII.ComplaintText


axiom mapEmployee  : Person → Proving.TitleVII.FederalSector.FederalEmployee





axiom corr_coveredEmployee {p c} :
    Proving.USC.T42.TitleVIIEnf.Elements.IsCoveredFederalEmployee p c →
    Proving.TitleVII.FederalSector.IsCoveredFederalEmployee (mapEmployee p) (mapComplaint c)



axiom corr_exhaustion {p c} :
    Proving.USC.T42.TitleVIIEnf.Elements.FederalAdministrativeExhaustion p c →
    Proving.TitleVII.FederalSector.FederalAdministrativeExhaustion (mapEmployee p) (mapComplaint c)


axiom corr_timelySuit {p c} :
    Proving.USC.T42.TitleVIIEnf.Elements.FederalSuitTimelyFiled p c →
    Proving.TitleVII.FederalSector.FederalSuitTimelyFiled (mapEmployee p) (mapComplaint c)






axiom corr_finalActionIssued {p c} :
    Proving.USC.T42.TitleVIIEnf.Elements.FederalSuitTimelyFiled p c →
    Proving.TitleVII.FederalSector.FinalAgencyActionIssued (mapEmployee p) (mapComplaint c)







axiom corr_discrimination
    {p c} (r : Proving.USC.T42.TitleVIIEnf.Elements.Respondent)
    (pa : Proving.TitleVII.FederalSector.PersonnelAction)
    (g : Proving.TitleVII.FederalSector.ProtectedGround) :
    Proving.USC.T42.TitleVIIEnf.Elements.UnlawfulEmploymentPractice r c →
    Proving.TitleVII.FederalSector.PersonnelActionDiscriminatory
      pa (mapEmployee p) g (mapComplaint c)










theorem cand_implies_golden_modulo_gaps
    {p c} (r : Proving.USC.T42.TitleVIIEnf.Elements.Respondent)
    (h : Proving.USC.T42.TitleVIIEnf.Elements.Section2000e16Federal p r c)
    (ah : Proving.TitleVII.FederalSector.AgencyHead)
    (pa : Proving.TitleVII.FederalSector.PersonnelAction)
    (g : Proving.TitleVII.FederalSector.ProtectedGround)
    (gap_agencyHead :
      Proving.TitleVII.FederalSector.IsAgencyHead ah (mapEmployee p) (mapComplaint c)) :
    Proving.TitleVII.FederalSector.ValidFederalSectorClaim (mapEmployee p) (mapComplaint c) :=
  Proving.TitleVII.FederalSector.ValidFederalSectorClaim.mk ah pa g
    { coveredEmployee := corr_coveredEmployee h.federalEmployee
      agencyHeadDef   := gap_agencyHead
      discrimination  := corr_discrimination r pa g h.unlawfulPractice
      exhaustion      := corr_exhaustion h.exhausted
      suitAuthorized  := .finalAction (corr_finalActionIssued h.suitTimely)
                                      (corr_timelySuit h.suitTimely) }

end Proving.USC.T42.TitleVIIEnf.FederalSectorGoldenBridge
