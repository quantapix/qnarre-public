import Proving.USC.T42.TitleVII.Elements.Statute









namespace Proving.USC.T42.TitleVII.Elements

open Proving.USC.Common

theorem coverage_intro {r p c}
    (hResp : IsCoveredRespondent r c) (hComm : AffectsCommerce r c)
    (hEmp : IsCoveredEmployee p c) (hExempt : NotStatutorilyExempt r c)
    (hPerson : IsPersonInUS p c) : Coverage r p c :=
  ⟨hResp, hComm, hEmp, hExempt, hPerson⟩

theorem exhaustion_intro {p ch c}
    (hCharge : TimelyChargeFiled p ch c) (hRTS : RightToSueAndTimelySuit p c) :
    Exhaustion p ch c :=
  ⟨hCharge, hRTS⟩

theorem disparateTreatment_intro {r p g pr c}
    (hGround : IsProtectedGround g c) (hAdverse : AdverseEmploymentAction r p pr c)
    (hCause : BecauseOfProtectedGround r p g c) (hIntent : IntentToDiscriminate p c)
    (hNotBFOQ : NotBonaFideOccupationalQualification r pr c)
    (hNotSen : NotBonaFideSenioritySystem r pr c) :
    DisparateTreatment r p g pr c :=
  ⟨hGround, hAdverse, hCause, hIntent, hNotBFOQ, hNotSen⟩

theorem disparateImpact_intro {r g pr c}
    (hGround : IsProtectedGround g c)
    (hImpact : PracticeCausesDisparateImpact r pr g c)
    (hNotJR : NotJobRelatedBusinessNecessity r pr c) :
    DisparateImpact r g pr c :=
  ⟨hGround, hImpact, hNotJR⟩

theorem mixedMotive_intro {r p g c}
    (hGround : IsProtectedGround g c) (hMot : WasMotivatingFactor r p g c) :
    MixedMotive r p g c :=
  ⟨hGround, hMot⟩

theorem retaliation_intro {r p pr c}
    (hActivity : EngagedInProtectedActivity p c)
    (hAdverse : AdverseEmploymentAction r p pr c)
    (hCause : RetaliatoryCausation r p c) (hProx : ProximateCause p c) :
    Retaliation r p pr c :=
  ⟨hActivity, hAdverse, hCause, hProx⟩

theorem validTitleVIIClaim_treatment_intro {r p g pr ch c}
    (cov : Coverage r p c) (ex : Exhaustion p ch c)
    (dt : DisparateTreatment r p g pr c) : ValidTitleVIIClaim r p g pr ch c :=
  .treatment cov ex dt

theorem validTitleVIIClaim_impact_intro {r p g pr ch c}
    (cov : Coverage r p c) (ex : Exhaustion p ch c)
    (di : DisparateImpact r g pr c) : ValidTitleVIIClaim r p g pr ch c :=
  .impact cov ex di

theorem validTitleVIIClaim_mixedMotive_intro {r p g pr ch c}
    (cov : Coverage r p c) (ex : Exhaustion p ch c)
    (mm : MixedMotive r p g c) : ValidTitleVIIClaim r p g pr ch c :=
  .mixedMotive cov ex mm

theorem validTitleVIIClaim_retaliation_intro {r p g pr ch c}
    (cov : Coverage r p c) (ex : Exhaustion p ch c)
    (ret : Retaliation r p pr c) : ValidTitleVIIClaim r p g pr ch c :=
  .retaliation cov ex ret

end Proving.USC.T42.TitleVII.Elements
