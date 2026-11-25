






import Proving.USC.T42.TitleVIIEnf.Elements.Statute
import Proving.USC.Common.Predicates

namespace Proving.USC.T42.TitleVIIEnf.Elements

open Proving.USC.Common

theorem section2000e5Private_intro {p r ch c}
    (hAggr : IsAggrievedPerson p c) (hPiUS : IsPersonInUS p c)
    (hRight : HasPrivateRightOfAction p c) (hResp : IsCoveredRespondent r c)
    (hUEP : UnlawfulEmploymentPractice r c) (hChg : ChargeFiledWithEEOC ch r c)
    (hChgT : ChargeTimelyFiled ch c) (hExh : RightToSueExhausted ch c)
    (hSuitT : SuitTimelyFiled p c) (hNGF : NoGoodFaithRelianceDefense r c)
    : Section2000e5Private p r ch c :=
  ⟨hAggr, hPiUS, hRight, hResp, hUEP, hChg, hChgT, hExh, hSuitT, hNGF⟩

theorem section2000e6PatternOrPractice_intro {pp enforcer c}
    (hRes : PatternOrPracticeOfResistance pp c) (hDeny : IntendedToDenyRights pp c)
    (hIntent : IntentToDiscriminate enforcer c)
    (hRC : EnforcerHasReasonableCause pp c)
    : Section2000e6PatternOrPractice pp enforcer c :=
  ⟨hRes, hDeny, hIntent, hRC⟩

theorem section2000e16Federal_intro {p r c}
    (hFed : IsCoveredFederalEmployee p c) (hPiUS : IsPersonInUS p c)
    (hRight : HasPrivateRightOfAction p c) (hUEP : UnlawfulEmploymentPractice r c)
    (hExh : FederalAdministrativeExhaustion p c) (hSuitT : FederalSuitTimelyFiled p c)
    : Section2000e16Federal p r c :=
  ⟨hFed, hPiUS, hRight, hUEP, hExh, hSuitT⟩

theorem section2000e8Exemption_intro {r c}
    (hCov : IsRecordkeepingCoveredEntity r c) (hDen : ExemptionApplicationDenied r c)
    (hUH : RecordkeepingUndueHardship r c)
    : Section2000e8Exemption r c :=
  ⟨hCov, hDen, hUH⟩



theorem validTitleVIIEnforcementClaim_priv_intro {p r ch pp enforcer c}
    (h : Section2000e5Private p r ch c)
    : ValidTitleVIIEnforcementClaim p r ch pp enforcer c :=
  .priv h



theorem validTitleVIIEnforcementClaim_federal_intro {p r ch pp enforcer c}
    (h : Section2000e16Federal p r c)
    : ValidTitleVIIEnforcementClaim p r ch pp enforcer c :=
  .federal h



theorem validTitleVIIEnforcementClaim_agAction_intro {p r ch pp enforcer c}
    (h : Section2000e6PatternOrPractice pp enforcer c)
    : ValidTitleVIIEnforcementClaim p r ch pp enforcer c :=
  .agAction h

end Proving.USC.T42.TitleVIIEnf.Elements
