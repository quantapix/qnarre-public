









import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T42.TitleVIIDef.Scienter.Types
import Proving.USC.T42.TitleVIIDef.Scienter.Predicates
import Proving.USC.T42.TitleVIIDef.Scienter.Statute

namespace Proving.USC.T42.TitleVIIDef.Scienter

open Proving.USC.Common



theorem scienter2000e2DisparateTreatment_intro {p c} (who : Addressee) (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState2000e2_disparateTreatment)
    (hProv : MentalStateProven p rung c) :
    DisparateTreatmentCulpable p c :=
  ⟨who, rung, hReach, hProv⟩



theorem scienter2000e2DisparateImpact_intro {p c} (who : Addressee) (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState2000e2_disparateImpact)
    (hProv : MentalStateProven p rung c) :
    DisparateImpactCulpable p c :=
  ⟨who, rung, hReach, hProv⟩



theorem scienter2000e2ControlledSubstance_intro {p c} (who : Addressee) (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState2000e2_controlledSubstance)
    (hProv : MentalStateProven p rung c) :
    ControlledSubstanceCulpable p c :=
  ⟨who, rung, hReach, hProv⟩


theorem scienter2000e3Retaliation_intro {p c} (who : Addressee) (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState2000e3_retaliation)
    (hProv : MentalStateProven p rung c) :
    RetaliationCulpable p c :=
  ⟨who, rung, hReach, hProv⟩



theorem scienter2000e3Notice_intro {p c} (who : Addressee) (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState2000e3_notice)
    (hProv : MentalStateProven p rung c) :
    NoticeCulpable p c :=
  ⟨who, rung, hReach, hProv⟩

end Proving.USC.T42.TitleVIIDef.Scienter
