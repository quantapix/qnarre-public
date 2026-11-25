
































import Proving.USC.T08.Elements.Theorems
import Proving.USC.T08.Deontic.Theorems
import Proving.USC.T08.Scienter.Theorems
import Proving.USC.Common.Types

namespace Proving.USC.T08.Bridge
open Proving.USC.Common
open Proving.USC.T08








axiom corr1324_addr {p a ag c} :
    Elements.ViolatesSection1324 p a ag c → Deontic.AddresseeInClass1324 p c
axiom corr1324_cond {p a ag c} (al : Deontic.Alien) :
    Elements.ViolatesSection1324 p a ag c → Deontic.ConditionMet1324 al c
axiom corr1324_act {p a ag c} (al : Deontic.Alien) :
    Elements.ViolatesSection1324 p a ag c → Deontic.RegulatedActOccurred1324 p al c
axiom corr1324_elem_sci {p a ag c} :
    Elements.ViolatesSection1324 p a ag c → Scienter.Scienter1324_transportHarborEncourage p c
axiom corr1324_deo_sci {p c} (al : Deontic.Alien) :
    Deontic.ProhibitionViolated1324 p al c → Scienter.Scienter1324_transportHarborEncourage p c


theorem s1324_elements_implies_deontic {p a ag c} (al : Deontic.Alien)
    (h : Elements.ViolatesSection1324 p a ag c) : Deontic.ProhibitionViolated1324 p al c :=
  Deontic.prohibition1324_violated_intro (corr1324_addr h) (corr1324_cond al h) (corr1324_act al h)


theorem s1324_elements_implies_scienter {p a ag c}
    (h : Elements.ViolatesSection1324 p a ag c) :
    Scienter.Scienter1324_transportHarborEncourage p c :=
  corr1324_elem_sci h


theorem s1324_deontic_implies_scienter {p c} (al : Deontic.Alien)
    (h : Deontic.ProhibitionViolated1324 p al c) :
    Scienter.Scienter1324_transportHarborEncourage p c :=
  corr1324_deo_sci al h






axiom corr1327_addr {p a c} :
    Elements.ViolatesSection1327 p a c → Deontic.AddresseeInClass1327 p c
axiom corr1327_cond {p a c} (al : Deontic.Alien) :
    Elements.ViolatesSection1327 p a c → Deontic.ConditionMet1327 al c
axiom corr1327_act {p a c} (al : Deontic.Alien) :
    Elements.ViolatesSection1327 p a c → Deontic.RegulatedActOccurred1327 p al c
axiom corr1327_elem_sci {p a c} :
    Elements.ViolatesSection1327 p a c → Scienter.Scienter1327 p c
axiom corr1327_deo_sci {p c} (al : Deontic.Alien) :
    Deontic.ProhibitionViolated1327 p al c → Scienter.Scienter1327 p c


theorem s1327_elements_implies_deontic {p a c} (al : Deontic.Alien)
    (h : Elements.ViolatesSection1327 p a c) : Deontic.ProhibitionViolated1327 p al c :=
  Deontic.prohibition1327_violated_intro (corr1327_addr h) (corr1327_cond al h) (corr1327_act al h)


theorem s1327_elements_implies_scienter {p a c}
    (h : Elements.ViolatesSection1327 p a c) : Scienter.Scienter1327 p c :=
  corr1327_elem_sci h


theorem s1327_deontic_implies_scienter {p c} (al : Deontic.Alien)
    (h : Deontic.ProhibitionViolated1327 p al c) : Scienter.Scienter1327 p c :=
  corr1327_deo_sci al h






axiom corr1328_addr {p a c} :
    Elements.ViolatesSection1328 p a c → Deontic.AddresseeInClass1328 p c
axiom corr1328_cond {p a c} (al : Deontic.Alien) :
    Elements.ViolatesSection1328 p a c → Deontic.ConditionMet1328 al c
axiom corr1328_act {p a c} (al : Deontic.Alien) :
    Elements.ViolatesSection1328 p a c → Deontic.RegulatedActOccurred1328 p al c
axiom corr1328_elem_sci {p a c} :
    Elements.ViolatesSection1328 p a c → Scienter.Scienter1328 p c
axiom corr1328_deo_sci {p c} (al : Deontic.Alien) :
    Deontic.ProhibitionViolated1328 p al c → Scienter.Scienter1328 p c


theorem s1328_elements_implies_deontic {p a c} (al : Deontic.Alien)
    (h : Elements.ViolatesSection1328 p a c) : Deontic.ProhibitionViolated1328 p al c :=
  Deontic.prohibition1328_violated_intro (corr1328_addr h) (corr1328_cond al h) (corr1328_act al h)


theorem s1328_elements_implies_scienter {p a c}
    (h : Elements.ViolatesSection1328 p a c) : Scienter.Scienter1328 p c :=
  corr1328_elem_sci h


theorem s1328_deontic_implies_scienter {p c} (al : Deontic.Alien)
    (h : Deontic.ProhibitionViolated1328 p al c) : Scienter.Scienter1328 p c :=
  corr1328_deo_sci al h

end Proving.USC.T08.Bridge
