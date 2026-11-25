







import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T42.TitleVIIDef.Elements.Types
import Proving.USC.T42.TitleVIIDef.Elements.Predicates
import Proving.USC.T42.TitleVIIDef.Elements.Statute

namespace Proving.USC.T42.TitleVIIDef.Elements

open Proving.USC.Common


theorem disparateTreatment_intro {r e p ep c}
    (hResp : IsCoveredRespondent r c) (hICC : EngagedInInterstateCommerce e c)
    (hParty : IsPersonInUS p c) (hGround : OnProtectedGround p c)
    (hAdv : TookAdverseEmploymentAction r p ep c) (hIntent : IntentToDiscriminate r c)
    (hBFOQ : NotBonaFideOccupationalQualification r ep c)
    (hSen : NotPursuantToBonaFideSeniorityOrMeritSystem r ep c) :
    DisparateTreatment r e p ep c :=
  ⟨hResp, hICC, hParty, hGround, hAdv, hIntent, hBFOQ, hSen⟩


theorem disparateImpact_intro {r e p ep c}
    (hResp : IsCoveredRespondent r c) (hICC : EngagedInInterstateCommerce e c)
    (hParty : IsPersonInUS p c) (hGround : OnProtectedGround p c)
    (hImpact : PracticeCausesDisparateImpact ep c)
    (hNotJust : NotJobRelatedAndConsistentWithBusinessNecessity ep c) :
    DisparateImpact r e p ep c :=
  ⟨hResp, hICC, hParty, hGround, hImpact, hNotJust⟩


theorem retaliation_intro {r e p c}
    (hResp : IsCoveredRespondent r c) (hICC : EngagedInInterstateCommerce e c)
    (hParty : IsPersonInUS p c) (hAct : EngagedInProtectedActivity p c)
    (hLink : AdverseActionBecauseOfProtectedActivity r p c) :
    Retaliation r e p c :=
  ⟨hResp, hICC, hParty, hAct, hLink⟩

end Proving.USC.T42.TitleVIIDef.Elements
