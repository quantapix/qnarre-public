



























import Proving.USC.T18.Ch75.Reslice.Elements.Statute
import Proving.Rico.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch75.Reslice.GoldenBridge

open Proving.USC.Common









opaque Act : Type

axiom mapAct : Act → Proving.Rico.Act
axiom mapComplaint : ComplaintText → Proving.Rico.ComplaintText





axiom corr_1542_B {p : Person} {s : Elements.Statement}
    {a : Elements.PassportApplication} {pp : Elements.Passport}
    {c : ComplaintText} (act : Act) :
    Elements.Section1542 p s a pp c →
    Proving.Rico.IsRacketeeringActivity (mapAct act) (mapComplaint c)



theorem s1542_elements_implies_rico_1961B {p : Person} {s : Elements.Statement}
    {a : Elements.PassportApplication} {pp : Elements.Passport}
    {c : ComplaintText} (act : Act) (h : Elements.Section1542 p s a pp c) :
    Proving.Rico.IsRacketeeringActivity (mapAct act) (mapComplaint c) :=
  corr_1542_B act h




axiom corr_1543_B {p : Person} {pp : Elements.Passport} {c : ComplaintText}
    (act : Act) :
    Elements.Section1543 p pp c →
    Proving.Rico.IsRacketeeringActivity (mapAct act) (mapComplaint c)


theorem s1543_elements_implies_rico_1961B {p : Person} {pp : Elements.Passport}
    {c : ComplaintText} (act : Act) (h : Elements.Section1543 p pp c) :
    Proving.Rico.IsRacketeeringActivity (mapAct act) (mapComplaint c) :=
  corr_1543_B act h




axiom corr_1544_B {p : Person} {pp : Elements.Passport} {c : ComplaintText}
    (act : Act) :
    Elements.Section1544 p pp c →
    Proving.Rico.IsRacketeeringActivity (mapAct act) (mapComplaint c)


theorem s1544_elements_implies_rico_1961B {p : Person} {pp : Elements.Passport}
    {c : ComplaintText} (act : Act) (h : Elements.Section1544 p pp c) :
    Proving.Rico.IsRacketeeringActivity (mapAct act) (mapComplaint c) :=
  corr_1544_B act h







axiom corr_1546a_B {p : Person} {s : Elements.Statement}
    {d : Elements.ImmigrationDocument} {art : Elements.PrintingArticle}
    {f : Elements.ImmigrationFiling} {c : ComplaintText} (act : Act) :
    Elements.Section1546a p s d art f c →
    Proving.Rico.IsRacketeeringActivity (mapAct act) (mapComplaint c)


theorem s1546a_elements_implies_rico_1961B {p : Person} {s : Elements.Statement}
    {d : Elements.ImmigrationDocument} {art : Elements.PrintingArticle}
    {f : Elements.ImmigrationFiling} {c : ComplaintText} (act : Act)
    (h : Elements.Section1546a p s d art f c) :
    Proving.Rico.IsRacketeeringActivity (mapAct act) (mapComplaint c) :=
  corr_1546a_B act h


axiom corr_1546b_B {p : Person} {idDoc : Elements.IdentificationDocument}
    {att : Elements.Attestation} {c : ComplaintText} (act : Act) :
    Elements.Section1546b p idDoc att c →
    Proving.Rico.IsRacketeeringActivity (mapAct act) (mapComplaint c)


theorem s1546b_elements_implies_rico_1961B {p : Person}
    {idDoc : Elements.IdentificationDocument} {att : Elements.Attestation}
    {c : ComplaintText} (act : Act) (h : Elements.Section1546b p idDoc att c) :
    Proving.Rico.IsRacketeeringActivity (mapAct act) (mapComplaint c) :=
  corr_1546b_B act h

end Proving.USC.T18.Ch75.Reslice.GoldenBridge
