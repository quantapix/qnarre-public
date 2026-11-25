











import Proving.TitleVII.Statute

namespace Proving.TitleVII



theorem chargePhase_intro
    {ch : Charge} {p : Person} {r : Respondent} {c : ComplaintText}
    (hAggrieved : IsAggrievedPerson p c)
    (hFiled     : ChargeFiledWithEEOC ch p r c)
    (hAlleges   : ChargeAllegesUnlawfulPractice ch r c)
    (hTimely    : ChargeTimelyFiled ch c)
    : ChargePhase ch p r c :=
  { aggrieved := hAggrieved
    filed := hFiled
    alleges := hAlleges
    timely := hTimely }



theorem privateRightOfAction_intro
    {p : Person} {r : Respondent} {ch : Charge} {c : ComplaintText}
    (hCharge    : ChargePhase ch p r c)
    (hExhausted : RightToSueExhausted p ch c)
    (hTimely    : SuitTimelyFiled p c)
    : PrivateRightOfAction p r ch c :=
  { charge := hCharge
    exhausted := hExhausted
    timelySuit := hTimely }

theorem publicEnforcementAction_intro
    {e : Enforcer} {k : RespondentClass}
    {p : Person} {r : Respondent} {ch : Charge} {c : ComplaintText}
    (hCharge       : ChargePhase ch p r c)
    (hConciliation : ConciliationFailed ch c)
    (hRespClass    : RespondentHasClass r k c)
    (hProper       : e = ProperEnforcerFor k)
    (hBrings       : EnforcerBringsCivilAction e r c)
    : PublicEnforcementAction e k p r ch c :=
  { charge := hCharge
    conciliation := hConciliation
    respClass := hRespClass
    properEnforcer := hProper
    brings := hBrings }



theorem validTitleVIIEnforcement_ofPrivateRight
    {p : Person} {r : Respondent} {ch : Charge} {c : ComplaintText}
    (h : PrivateRightOfAction p r ch c)
    : ValidTitleVIIEnforcement p r ch c :=
  ValidTitleVIIEnforcement.viaPrivateRight h

theorem validTitleVIIEnforcement_ofPublicEnforcement
    {e : Enforcer} {k : RespondentClass}
    {p : Person} {r : Respondent} {ch : Charge} {c : ComplaintText}
    (h : PublicEnforcementAction e k p r ch c)
    : ValidTitleVIIEnforcement p r ch c :=
  ValidTitleVIIEnforcement.viaPublicEnforcement e k h








theorem publicEnforcement_governmentRoutesToAG
    {e : Enforcer} {p : Person} {r : Respondent} {ch : Charge} {c : ComplaintText}
    (h : PublicEnforcementAction e RespondentClass.government p r ch c)
    : e = Enforcer.attorneyGeneral :=
  h.properEnforcer

theorem publicEnforcement_privateRoutesToEEOC
    {e : Enforcer} {p : Person} {r : Respondent} {ch : Charge} {c : ComplaintText}
    (h : PublicEnforcementAction e RespondentClass.private_ p r ch c)
    : e = Enforcer.commission :=
  h.properEnforcer

end Proving.TitleVII
