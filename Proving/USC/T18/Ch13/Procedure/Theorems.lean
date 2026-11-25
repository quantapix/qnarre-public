







import Proving.USC.T18.Ch13.Procedure.Types
import Proving.USC.T18.Ch13.Procedure.Predicates
import Proving.USC.T18.Ch13.Procedure.Statute

namespace Proving.USC.T18.Ch13.Procedure

open Proving.USC.Common


theorem section245ProsecutionAuthorized_intro {p : Person} {c : ComplaintText}
    (hCert : ProsecutionCertified p c) : Section245ProsecutionAuthorized p c :=
  ⟨hCert⟩


theorem section247TimelyProsecution_intro {p : Person} {c : ComplaintText}
    (hCert : ProsecutionCertified p c)
    (hCom : AffectsInterstateCommerce p c)
    (hTimely : IsNoncapitalOffense p c → WithinSevenYearLimitation c) :
    Section247TimelyProsecution p c :=
  ⟨hCert, hCom, hTimely⟩


theorem section249TimelyProsecution_intro {p : Person} {c : ComplaintText}
    (hCert : ProsecutionCertified p c)
    (hGround : CertificationGroundEstablished p c)
    (hGuide : ProsecutionFollowsAGGuidelines p c)
    (hTimely : ¬ DeathResulted p c → WithinSevenYearLimitation c) :
    Section249TimelyProsecution p c :=
  ⟨hCert, hGround, hGuide, hTimely⟩


theorem section248PrivateCivilAction_intro {p : Person} {c : ComplaintText}
    (hAggr : PlaintiffIsAggrievedPerson p c)
    (hCom : CivilActionCommenced p c)
    (hVen : FiledInAppropriateDistrictCourt p c) :
    Section248PrivateCivilAction p c :=
  ⟨hAggr, hCom, hVen⟩


theorem section248AGCivilAction_intro {p : Person} {c : ComplaintText}
    (hCause : AGHasReasonableCause p c)
    (hCom : CivilActionCommenced p c)
    (hVen : FiledInAppropriateDistrictCourt p c) :
    Section248AGCivilAction p c :=
  ⟨hCause, hCom, hVen⟩


theorem section248StateAGCivilAction_intro {p : Person} {c : ComplaintText}
    (hParens : StateAGParensPatriae p c)
    (hCom : CivilActionCommenced p c)
    (hVen : FiledInAppropriateDistrictCourt p c) :
    Section248StateAGCivilAction p c :=
  ⟨hParens, hCom, hVen⟩


theorem section248SubsequentOffense_intro {p : Person} {c : ComplaintText}
    (hPrior : PriorConvictionUnderSection p c) : Section248SubsequentOffense p c :=
  ⟨hPrior⟩



theorem section248StatutoryDamagesElection_intro {c : ComplaintText}
    (h : electionDay c < finalJudgmentDay c) : ElectionBeforeFinalJudgment c :=
  h

end Proving.USC.T18.Ch13.Procedure
