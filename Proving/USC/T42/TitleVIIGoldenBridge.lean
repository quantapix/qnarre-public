
























import Proving.TitleVII.Statute
import Proving.TitleVII.Theorems
import Proving.USC.T42.TitleVII.Elements.Statute

namespace Proving.USC.T42.TitleVIIGoldenBridge



axiom mapPerson     : Proving.USC.Common.Person → Proving.TitleVII.Person
axiom mapComplaint  : Proving.USC.Common.ComplaintText → Proving.TitleVII.ComplaintText
axiom mapCharge     : Proving.USC.T42.TitleVII.Elements.Charge → Proving.TitleVII.Charge
axiom mapRespondent : Proving.USC.T42.TitleVII.Elements.Respondent → Proving.TitleVII.Respondent




axiom corr_chargeTimely {p ch c} :
    Proving.USC.T42.TitleVII.Elements.TimelyChargeFiled p ch c →
    Proving.TitleVII.ChargeTimelyFiled (mapCharge ch) (mapComplaint c)



axiom corr_exhausted {p c} (ch : Proving.USC.T42.TitleVII.Elements.Charge) :
    Proving.USC.T42.TitleVII.Elements.RightToSueAndTimelySuit p c →
    Proving.TitleVII.RightToSueExhausted (mapPerson p) (mapCharge ch) (mapComplaint c)


axiom corr_timelySuit {p c} :
    Proving.USC.T42.TitleVII.Elements.RightToSueAndTimelySuit p c →
    Proving.TitleVII.SuitTimelyFiled (mapPerson p) (mapComplaint c)







theorem cand_implies_golden_modulo_gaps
    {p ch c} (r : Proving.USC.T42.TitleVII.Elements.Respondent)
    (h : Proving.USC.T42.TitleVII.Elements.Exhaustion p ch c)
    (gap_aggrieved :
      Proving.TitleVII.IsAggrievedPerson (mapPerson p) (mapComplaint c))
    (gap_filed :
      Proving.TitleVII.ChargeFiledWithEEOC
        (mapCharge ch) (mapPerson p) (mapRespondent r) (mapComplaint c))
    (gap_alleges :
      Proving.TitleVII.ChargeAllegesUnlawfulPractice
        (mapCharge ch) (mapRespondent r) (mapComplaint c)) :
    Proving.TitleVII.ValidTitleVIIEnforcement
      (mapPerson p) (mapRespondent r) (mapCharge ch) (mapComplaint c) :=
  Proving.TitleVII.validTitleVIIEnforcement_ofPrivateRight
    { charge :=
        { aggrieved := gap_aggrieved
          filed := gap_filed
          alleges := gap_alleges
          timely := corr_chargeTimely h.timelyCharge }
      exhausted := corr_exhausted ch h.rightToSue
      timelySuit := corr_timelySuit h.rightToSue }

end Proving.USC.T42.TitleVIIGoldenBridge
