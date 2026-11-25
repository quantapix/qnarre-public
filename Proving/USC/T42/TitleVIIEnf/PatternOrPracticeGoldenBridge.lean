


























import Proving.USC.T42.TitleVIIEnf.Elements.Statute
import Proving.TitleVII.PatternOrPractice.Statute
import Proving.TitleVII.PatternOrPractice.Theorems

namespace Proving.USC.T42.TitleVIIEnf.PatternOrPracticeGoldenBridge

open Proving.USC.Common



axiom mapComplaint  : ComplaintText → Proving.TitleVII.ComplaintText


axiom mapRespondent : Proving.USC.T42.TitleVIIEnf.Elements.PatternOrPractice → Proving.TitleVII.Respondent

axiom mapEnforcer   : Person → Proving.TitleVII.Enforcer




axiom corr_resistance {pp c} :
    Proving.USC.T42.TitleVIIEnf.Elements.PatternOrPracticeOfResistance pp c →
    Proving.TitleVII.PatternOrPractice.PatternOrPracticeOfResistance
      (mapRespondent pp) (mapComplaint c)


axiom corr_intendedDenial {pp c} :
    Proving.USC.T42.TitleVIIEnf.Elements.IntendedToDenyRights pp c →
    Proving.TitleVII.PatternOrPractice.IntendedToDenyRights
      (mapRespondent pp) (mapComplaint c)




axiom corr_reasonableCause (enforcer : Person) {pp c} :
    Proving.USC.T42.TitleVIIEnf.Elements.EnforcerHasReasonableCause pp c →
    Proving.TitleVII.PatternOrPractice.EnforcerHasReasonableCause
      (mapEnforcer enforcer) (mapRespondent pp) (mapComplaint c)









theorem cand_implies_golden_modulo_gaps
    {pp enforcer c}
    (h : Proving.USC.T42.TitleVIIEnf.Elements.Section2000e6PatternOrPractice pp enforcer c)
    (gap_authorizedEnforcer :
      Proving.TitleVII.PatternOrPractice.IsAuthorizedPatternOrPracticeEnforcer
        (mapEnforcer enforcer) (mapComplaint c))
    (gap_brings :
      Proving.TitleVII.PatternOrPractice.EnforcerBringsPatternOrPracticeAction
        (mapEnforcer enforcer) (mapRespondent pp) (mapComplaint c)) :
    Proving.TitleVII.PatternOrPractice.ValidPatternOrPracticeAction
      (mapRespondent pp) (mapComplaint c) :=
  Proving.TitleVII.PatternOrPractice.ValidPatternOrPracticeAction.viaEnforcer
    (mapEnforcer enforcer)
    { authorizedEnforcer := gap_authorizedEnforcer
      reasonableCause    := corr_reasonableCause enforcer h.reasonableCause
      patternOrPractice  := corr_resistance h.resistance
      intentToDeny       := corr_intendedDenial h.intendedDenial
      brings             := gap_brings }

end Proving.USC.T42.TitleVIIEnf.PatternOrPracticeGoldenBridge
