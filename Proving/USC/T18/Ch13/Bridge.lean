

















































import Proving.USC.T18.Ch13.Elements.Statute
import Proving.USC.T18.Ch13.Deontic.Statute
import Proving.USC.T18.Ch13.Scienter.Statute
import Proving.USC.Common.Predicates

namespace Proving.USC.T18.Ch13.Bridge

open Proving.USC.Common
open Proving.USC.T18.Ch13











axiom corr_addr241 {ag p victim c} : Elements.ViolationOfSection241 ag p victim c → Deontic.AddresseeInClass241 p c
axiom corr_cond241 {ag p victim c} : Elements.ViolationOfSection241 ag p victim c → Deontic.ConditionMet241 c
axiom corr_act241  {ag p victim c} : Elements.ViolationOfSection241 ag p victim c → Deontic.RegulatedActOccurred241 p c



theorem s241_elements_implies_deontic {ag p victim c}
    (h : Elements.ViolationOfSection241 ag p victim c) : Deontic.ProhibitionViolated241 p c :=
  ⟨⟨corr_addr241 h, corr_cond241 h⟩, corr_act241 h⟩


axiom corr_addr242 {p victim c} : Elements.Section242 p victim c → Deontic.AddresseeInClass242 p c
axiom corr_cond242 {p victim c} : Elements.Section242 p victim c → Deontic.ConditionMet242 c
axiom corr_act242  {p victim c} : Elements.Section242 p victim c → Deontic.RegulatedActOccurred242 p c


theorem s242_elements_implies_deontic {p victim c}
    (h : Elements.Section242 p victim c) : Deontic.ProhibitionViolated242 p c :=
  ⟨⟨corr_addr242 h, corr_cond242 h⟩, corr_act242 h⟩


axiom corr_addr243 {p victim c} : Elements.Section243 p victim c → Deontic.AddresseeInClass243 p c
axiom corr_cond243 {p victim c} : Elements.Section243 p victim c → Deontic.ConditionMet243 c
axiom corr_act243  {p victim c} : Elements.Section243 p victim c → Deontic.RegulatedActOccurred243 p c


theorem s243_elements_implies_deontic {p victim c}
    (h : Elements.Section243 p victim c) : Deontic.ProhibitionViolated243 p c :=
  ⟨⟨corr_addr243 h, corr_cond243 h⟩, corr_act243 h⟩


axiom corr_addr244 {p victim c} : Elements.Section244 p victim c → Deontic.AddresseeInClass244 p c
axiom corr_cond244 {p victim c} : Elements.Section244 p victim c → Deontic.ConditionMet244 c
axiom corr_act244  {p victim c} : Elements.Section244 p victim c → Deontic.RegulatedActOccurred244 p c


theorem s244_elements_implies_deontic {p victim c}
    (h : Elements.Section244 p victim c) : Deontic.ProhibitionViolated244 p c :=
  ⟨⟨corr_addr244 h, corr_cond244 h⟩, corr_act244 h⟩


axiom corr_addr245 {p victim c} : Elements.Section245 p victim c → Deontic.AddresseeInClass245 p c
axiom corr_cond245 {p victim c} : Elements.Section245 p victim c → Deontic.ConditionMet245 c
axiom corr_act245  {p victim c} : Elements.Section245 p victim c → Deontic.RegulatedActOccurred245 p c


theorem s245_elements_implies_deontic {p victim c}
    (h : Elements.Section245 p victim c) : Deontic.ProhibitionViolated245 p c :=
  ⟨⟨corr_addr245 h, corr_cond245 h⟩, corr_act245 h⟩


axiom corr_addr246 {p victim c} : Elements.Section246 p victim c → Deontic.AddresseeInClass246 p c
axiom corr_cond246 {p victim c} : Elements.Section246 p victim c → Deontic.ConditionMet246 c
axiom corr_act246  {p victim c} : Elements.Section246 p victim c → Deontic.RegulatedActOccurred246 p c


theorem s246_elements_implies_deontic {p victim c}
    (h : Elements.Section246 p victim c) : Deontic.ProhibitionViolated246 p c :=
  ⟨⟨corr_addr246 h, corr_cond246 h⟩, corr_act246 h⟩


axiom corr_addr247 {p rp victim c} : Elements.Section247Offense p rp victim c → Deontic.AddresseeInClass247 p c
axiom corr_cond247 {p rp victim c} : Elements.Section247Offense p rp victim c → Deontic.ConditionMet247 c
axiom corr_act247  {p rp victim c} : Elements.Section247Offense p rp victim c → Deontic.RegulatedActOccurred247 p c



theorem s247_elements_implies_deontic {p rp victim c}
    (h : Elements.Section247Offense p rp victim c) : Deontic.ProhibitionViolated247 p c :=
  ⟨⟨corr_addr247 h, corr_cond247 h⟩, corr_act247 h⟩


axiom corr_addr248 {p victim c} : Elements.Section248CivilClaim p victim c → Deontic.AddresseeInClass248 p c
axiom corr_cond248 {p victim c} : Elements.Section248CivilClaim p victim c → Deontic.ConditionMet248 c
axiom corr_act248  {p victim c} : Elements.Section248CivilClaim p victim c → Deontic.RegulatedActOccurred248 p c


theorem s248_elements_implies_deontic {p victim c}
    (h : Elements.Section248CivilClaim p victim c) : Deontic.ProhibitionViolated248 p c :=
  ⟨⟨corr_addr248 h, corr_cond248 h⟩, corr_act248 h⟩


axiom corr_addr249 {p victim c} : Elements.Section249Offense p victim c → Deontic.AddresseeInClass249 p c
axiom corr_cond249 {p victim c} : Elements.Section249Offense p victim c → Deontic.ConditionMet249 c
axiom corr_act249  {p victim c} : Elements.Section249Offense p victim c → Deontic.RegulatedActOccurred249 p c


theorem s249_elements_implies_deontic {p victim c}
    (h : Elements.Section249Offense p victim c) : Deontic.ProhibitionViolated249 p c :=
  ⟨⟨corr_addr249 h, corr_cond249 h⟩, corr_act249 h⟩


axiom corr_addr250 {p c} : Elements.Section250 p c → Deontic.AddresseeInClass250 p c
axiom corr_cond250 {p c} : Elements.Section250 p c → Deontic.ConditionMet250 c
axiom corr_act250  {p c} : Elements.Section250 p c → Deontic.RegulatedActOccurred250 p c


theorem s250_elements_implies_deontic {p c}
    (h : Elements.Section250 p c) : Deontic.ProhibitionViolated250 p c :=
  ⟨⟨corr_addr250 h, corr_cond250 h⟩, corr_act250 h⟩









axiom corr_mp241 {ag p victim c} :
    Elements.ViolationOfSection241 ag p victim c →
    Scienter.MentalStateProven p Scienter.RequiredMentalState241 c
axiom corr_ds241 {p c} :
    Deontic.RegulatedActOccurred241 p c →
    Scienter.MentalStateProven p Scienter.RequiredMentalState241 c


theorem s241_elements_implies_scienter {ag p victim c}
    (h : Elements.ViolationOfSection241 ag p victim c) : Scienter.Scienter241 p c :=
  ⟨_, Scienter.MentalState.atLeast_refl _, corr_mp241 h⟩

theorem s241_deontic_implies_scienter {p c}
    (h : Deontic.ProhibitionViolated241 p c) : Scienter.Scienter241 p c :=
  ⟨_, Scienter.MentalState.atLeast_refl _, corr_ds241 h.2⟩


axiom corr_mp242 {p victim c} :
    Elements.Section242 p victim c →
    Scienter.MentalStateProven p Scienter.RequiredMentalState242 c
axiom corr_ds242 {p c} :
    Deontic.RegulatedActOccurred242 p c →
    Scienter.MentalStateProven p Scienter.RequiredMentalState242 c



theorem s242_elements_implies_scienter {p victim c}
    (h : Elements.Section242 p victim c) : Scienter.Scienter242 p c :=
  ⟨_, Scienter.MentalState.atLeast_refl _, corr_mp242 h⟩

theorem s242_deontic_implies_scienter {p c}
    (h : Deontic.ProhibitionViolated242 p c) : Scienter.Scienter242 p c :=
  ⟨_, Scienter.MentalState.atLeast_refl _, corr_ds242 h.2⟩


axiom corr_mp245 {p victim c} :
    Elements.Section245 p victim c →
    Scienter.MentalStateProven p Scienter.RequiredMentalState245 c
axiom corr_ds245 {p c} :
    Deontic.RegulatedActOccurred245 p c →
    Scienter.MentalStateProven p Scienter.RequiredMentalState245 c


theorem s245_elements_implies_scienter {p victim c}
    (h : Elements.Section245 p victim c) : Scienter.Scienter245 p c :=
  ⟨_, Scienter.MentalState.atLeast_refl _, corr_mp245 h⟩

theorem s245_deontic_implies_scienter {p c}
    (h : Deontic.ProhibitionViolated245 p c) : Scienter.Scienter245 p c :=
  ⟨_, Scienter.MentalState.atLeast_refl _, corr_ds245 h.2⟩


axiom corr_mp247 {p rp victim c} :
    Elements.Section247Offense p rp victim c →
    Scienter.MentalStateProven p Scienter.RequiredMentalState247 c
axiom corr_ds247 {p c} :
    Deontic.RegulatedActOccurred247 p c →
    Scienter.MentalStateProven p Scienter.RequiredMentalState247 c



theorem s247_elements_implies_scienter {p rp victim c}
    (h : Elements.Section247Offense p rp victim c) : Scienter.Scienter247 p c :=
  ⟨_, Scienter.MentalState.atLeast_refl _, corr_mp247 h⟩

theorem s247_deontic_implies_scienter {p c}
    (h : Deontic.ProhibitionViolated247 p c) : Scienter.Scienter247 p c :=
  ⟨_, Scienter.MentalState.atLeast_refl _, corr_ds247 h.2⟩


axiom corr_mp248 {p victim c} :
    Elements.Section248CivilClaim p victim c →
    Scienter.MentalStateProven p Scienter.RequiredMentalState248 c
axiom corr_ds248 {p c} :
    Deontic.RegulatedActOccurred248 p c →
    Scienter.MentalStateProven p Scienter.RequiredMentalState248 c


theorem s248_elements_implies_scienter {p victim c}
    (h : Elements.Section248CivilClaim p victim c) : Scienter.Scienter248 p c :=
  ⟨_, Scienter.MentalState.atLeast_refl _, corr_mp248 h⟩

theorem s248_deontic_implies_scienter {p c}
    (h : Deontic.ProhibitionViolated248 p c) : Scienter.Scienter248 p c :=
  ⟨_, Scienter.MentalState.atLeast_refl _, corr_ds248 h.2⟩


axiom corr_mp249 {p victim c} :
    Elements.Section249Offense p victim c →
    Scienter.MentalStateProven p Scienter.RequiredMentalState249 c
axiom corr_ds249 {p c} :
    Deontic.RegulatedActOccurred249 p c →
    Scienter.MentalStateProven p Scienter.RequiredMentalState249 c


theorem s249_elements_implies_scienter {p victim c}
    (h : Elements.Section249Offense p victim c) : Scienter.Scienter249 p c :=
  ⟨_, Scienter.MentalState.atLeast_refl _, corr_mp249 h⟩

theorem s249_deontic_implies_scienter {p c}
    (h : Deontic.ProhibitionViolated249 p c) : Scienter.Scienter249 p c :=
  ⟨_, Scienter.MentalState.atLeast_refl _, corr_ds249 h.2⟩

end Proving.USC.T18.Ch13.Bridge
