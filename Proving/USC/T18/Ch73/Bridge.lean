


























import Proving.USC.T18.Ch73.Elements.Statute
import Proving.USC.T18.Ch73.Deontic.Statute
import Proving.USC.T18.Ch73.Scienter.Statute
import Proving.Rico.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch73.Bridge

open Proving.USC.Common








#check (Elements.Section1503Offense :
  Proving.USC.Common.Person → Proving.USC.Common.Person →
  Proving.USC.Common.ComplaintText → Prop)
#check (Elements.Section1512Offense :
  Proving.USC.Common.Person → Proving.USC.Common.Person →
  Elements.Proceeding → Proving.USC.Common.ComplaintText → Prop)
#check (Elements.Section1513Offense :
  Proving.USC.Common.Person → Proving.USC.Common.Person →
  Proving.USC.Common.ComplaintText → Prop)
#check (Deontic.ProhibitionViolated1503a :
  Proving.USC.Common.Person → Proving.USC.Common.ComplaintText → Prop)
#check (Deontic.ProhibitionViolated1512c :
  Proving.USC.Common.Person → Proving.USC.Common.ComplaintText → Prop)
#check (Deontic.ProhibitionViolated1513a1 :
  Proving.USC.Common.Person → Proving.USC.Common.ComplaintText → Prop)
#check (Scienter.Scienter1503 :
  Proving.USC.Common.Person → Proving.USC.Common.ComplaintText → Prop)











axiom corr_ed_1503_endeavor {p t : Person} {c : ComplaintText} :
  Elements.Section1503Endeavor p t c → Deontic.ProhibitionViolated1503a p c
axiom corr_ed_1503_injury {p t : Person} {c : ComplaintText} :
  Elements.Section1503Injury p t c → Deontic.ProhibitionViolated1503a p c

theorem s1503_elements_implies_deontic {p t : Person} {c : ComplaintText}
    (h : Elements.Section1503Offense p t c) : Deontic.ProhibitionViolated1503a p c :=
  match h with
  | .endeavor he => corr_ed_1503_endeavor he
  | .injury   hi => corr_ed_1503_injury hi








inductive Deontic1512Violated (p : Person) (c : ComplaintText) : Prop where
  | forceA1     (h : Deontic.ProhibitionViolated1512a1 p c)
  | persuasionB (h : Deontic.ProhibitionViolated1512b p c)
  | tamperingC  (h : Deontic.ProhibitionViolated1512c p c)
  | harassmentD (h : Deontic.ProhibitionViolated1512d p c)

axiom corr_ed_1512_force {p t : Person} {pr : Elements.Proceeding} {c : ComplaintText} :
  Elements.Section1512Force p t pr c → Deontic.ProhibitionViolated1512a1 p c
axiom corr_ed_1512_persuasion {p t : Person} {pr : Elements.Proceeding} {c : ComplaintText} :
  Elements.Section1512Persuasion p t pr c → Deontic.ProhibitionViolated1512b p c
axiom corr_ed_1512_tampering {p : Person} {pr : Elements.Proceeding} {c : ComplaintText} :
  Elements.Section1512Tampering p pr c → Deontic.ProhibitionViolated1512c p c
axiom corr_ed_1512_harassment {p t : Person} {pr : Elements.Proceeding} {c : ComplaintText} :
  Elements.Section1512Harassment p t pr c → Deontic.ProhibitionViolated1512d p c

theorem s1512_elements_implies_deontic {p t : Person} {pr : Elements.Proceeding} {c : ComplaintText}
    (h : Elements.Section1512Offense p t pr c) : Deontic1512Violated p c :=
  match h with
  | .force      hf => .forceA1 (corr_ed_1512_force hf)
  | .persuasion hp => .persuasionB (corr_ed_1512_persuasion hp)
  | .tampering  ht => .tamperingC (corr_ed_1512_tampering ht)
  | .harassment hh => .harassmentD (corr_ed_1512_harassment hh)




inductive Deontic1513Violated (p : Person) (c : ComplaintText) : Prop where
  | killA1      (h : Deontic.ProhibitionViolated1513a1 p c)
  | injuryB     (h : Deontic.ProhibitionViolated1513b p c)
  | livelihoodE (h : Deontic.ProhibitionViolated1513e p c)

axiom corr_ed_1513_kill {p t : Person} {c : ComplaintText} :
  Elements.Section1513Kill p t c → Deontic.ProhibitionViolated1513a1 p c
axiom corr_ed_1513_injury {p t : Person} {c : ComplaintText} :
  Elements.Section1513Injury p t c → Deontic.ProhibitionViolated1513b p c
axiom corr_ed_1513_livelihood {p t : Person} {c : ComplaintText} :
  Elements.Section1513Livelihood p t c → Deontic.ProhibitionViolated1513e p c

theorem s1513_elements_implies_deontic {p t : Person} {c : ComplaintText}
    (h : Elements.Section1513Offense p t c) : Deontic1513Violated p c :=
  match h with
  | .kill       hk => .killA1 (corr_ed_1513_kill hk)
  | .injury     hi => .injuryB (corr_ed_1513_injury hi)
  | .livelihood hl => .livelihoodE (corr_ed_1513_livelihood hl)











axiom corr_es_1503 {p t : Person} {c : ComplaintText} :
  Elements.Section1503Offense p t c → Scienter.Scienter1503 p c
axiom corr_es_1512 {p t : Person} {pr : Elements.Proceeding} {c : ComplaintText} :
  Elements.Section1512Offense p t pr c → Scienter.Scienter1512 p c
axiom corr_es_1513 {p t : Person} {c : ComplaintText} :
  Elements.Section1513Offense p t c → Scienter.Scienter1513 p c

theorem s1503_elements_implies_scienter {p t : Person} {c : ComplaintText}
    (h : Elements.Section1503Offense p t c) : Scienter.Scienter1503 p c := corr_es_1503 h
theorem s1512_elements_implies_scienter {p t : Person} {pr : Elements.Proceeding} {c : ComplaintText}
    (h : Elements.Section1512Offense p t pr c) : Scienter.Scienter1512 p c := corr_es_1512 h
theorem s1513_elements_implies_scienter {p t : Person} {c : ComplaintText}
    (h : Elements.Section1513Offense p t c) : Scienter.Scienter1513 p c := corr_es_1513 h











axiom actOf : Person → ComplaintText → Proving.Rico.Act
axiom mapC  : ComplaintText → Proving.Rico.ComplaintText

axiom corr_rack_1503 {p t : Person} {c : ComplaintText} :
  Elements.Section1503Offense p t c → Proving.Rico.IsRacketeeringActivity (actOf p c) (mapC c)
axiom corr_rack_1512 {p t : Person} {pr : Elements.Proceeding} {c : ComplaintText} :
  Elements.Section1512Offense p t pr c → Proving.Rico.IsRacketeeringActivity (actOf p c) (mapC c)
axiom corr_rack_1513 {p t : Person} {c : ComplaintText} :
  Elements.Section1513Offense p t c → Proving.Rico.IsRacketeeringActivity (actOf p c) (mapC c)

theorem s1503_elements_implies_golden {p t : Person} {c : ComplaintText}
    (h : Elements.Section1503Offense p t c) :
    Proving.Rico.IsRacketeeringActivity (actOf p c) (mapC c) := corr_rack_1503 h
theorem s1512_elements_implies_golden {p t : Person} {pr : Elements.Proceeding} {c : ComplaintText}
    (h : Elements.Section1512Offense p t pr c) :
    Proving.Rico.IsRacketeeringActivity (actOf p c) (mapC c) := corr_rack_1512 h
theorem s1513_elements_implies_golden {p t : Person} {c : ComplaintText}
    (h : Elements.Section1513Offense p t c) :
    Proving.Rico.IsRacketeeringActivity (actOf p c) (mapC c) := corr_rack_1513 h

end Proving.USC.T18.Ch73.Bridge
