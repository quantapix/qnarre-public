






































import Proving.Rico.Statute
import Proving.USC.T18.CommercePredicates.Elements.Statute

namespace Proving.USC.T18.CommercePredicates.GoldenBridge

open Proving.USC.Common (ComplaintText Person Entity)









axiom mapComplaint : ComplaintText → Proving.Rico.ComplaintText
axiom mapAct1958 : Person → Elements.CommerceFacility → ComplaintText → Proving.Rico.Act
axiom mapAct1960 : Person → Elements.MoneyTransmittingBusiness → ComplaintText → Proving.Rico.Act












axiom corr_1958_is_racketeering {p : Person} {f : Elements.CommerceFacility} {c : ComplaintText} :
    Elements.JurisdictionalMeans1958 p f c →
    Elements.IntentThatMurderCommitted p c →
    Elements.AsConsiderationForPecuniaryValue p c →
    Proving.Rico.IsRacketeeringActivity (mapAct1958 p f c) (mapComplaint c)






theorem cand_1958_implies_golden_racketeering
    {p : Person} {f : Elements.CommerceFacility} {c : ComplaintText}
    (h : Elements.Section1958Completed p f c) :
    Proving.Rico.IsRacketeeringActivity (mapAct1958 p f c) (mapComplaint c) :=
  corr_1958_is_racketeering h.means h.intent h.consideration










axiom corr_1960_is_racketeering {p : Person} {b : Elements.MoneyTransmittingBusiness} {c : ComplaintText} :
    Elements.KnowinglyConductsMTB p b c →
    Elements.IsMoneyTransmittingBusiness b c →
    Elements.UnlicensedRoute1960 b c →
    Proving.Rico.IsRacketeeringActivity (mapAct1960 p b c) (mapComplaint c)







theorem cand_1960_implies_golden_racketeering
    {p : Person} {b : Elements.MoneyTransmittingBusiness} {e : Entity} {c : ComplaintText}
    (h : Elements.Section1960 p b e c) :
    Proving.Rico.IsRacketeeringActivity (mapAct1960 p b c) (mapComplaint c) :=
  corr_1960_is_racketeering h.knowingConduct h.isMTB h.unlicensed

end Proving.USC.T18.CommercePredicates.GoldenBridge
