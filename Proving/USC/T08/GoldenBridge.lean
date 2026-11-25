


























import Proving.Rico.Predicates
import Proving.USC.T08.Elements.Theorems
import Proving.USC.Common.Types

namespace Proving.USC.T08.GoldenBridge
open Proving.USC.Common
open Proving.USC.T08










opaque Act : Type
axiom mapAct : Act → Proving.Rico.Act
axiom mapComplaint : ComplaintText → Proving.Rico.ComplaintText





axiom ForPurposeOfFinancialGain (p : Person) (c : ComplaintText) : Prop





axiom corr_1324_F {p a ag c} (act : Act) :
    Elements.ViolatesSection1324 p a ag c → ForPurposeOfFinancialGain p c →
    Proving.Rico.IsRacketeeringActivity (mapAct act) (mapComplaint c)


theorem s1324_elements_implies_rico_1961F {p a ag c} (act : Act)
    (hViol : Elements.ViolatesSection1324 p a ag c)
    (hGain : ForPurposeOfFinancialGain p c) :
    Proving.Rico.IsRacketeeringActivity (mapAct act) (mapComplaint c) :=
  corr_1324_F act hViol hGain





axiom corr_1327_F {p a c} (act : Act) :
    Elements.ViolatesSection1327 p a c → ForPurposeOfFinancialGain p c →
    Proving.Rico.IsRacketeeringActivity (mapAct act) (mapComplaint c)


theorem s1327_elements_implies_rico_1961F {p a c} (act : Act)
    (hViol : Elements.ViolatesSection1327 p a c)
    (hGain : ForPurposeOfFinancialGain p c) :
    Proving.Rico.IsRacketeeringActivity (mapAct act) (mapComplaint c) :=
  corr_1327_F act hViol hGain





axiom corr_1328_F {p a c} (act : Act) :
    Elements.ViolatesSection1328 p a c → ForPurposeOfFinancialGain p c →
    Proving.Rico.IsRacketeeringActivity (mapAct act) (mapComplaint c)


theorem s1328_elements_implies_rico_1961F {p a c} (act : Act)
    (hViol : Elements.ViolatesSection1328 p a c)
    (hGain : ForPurposeOfFinancialGain p c) :
    Proving.Rico.IsRacketeeringActivity (mapAct act) (mapComplaint c) :=
  corr_1328_F act hViol hGain

end Proving.USC.T08.GoldenBridge
