





























import Proving.USC.T18.Ch77.Elements.Statute
import Proving.USC.T18.Ch77.Deontic.Statute
import Proving.USC.T18.Ch77.Procedure.Statute
import Proving.USC.T18.Ch77.Scienter.Statute
import Proving.USC.Common.Predicates
import Proving.Rico.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Bridge

open Proving.USC.Common








#check (Elements.Section1581a :
  Proving.USC.Common.Person → Proving.USC.Common.ComplaintText → Prop)
#check (Elements.Section1592a : Proving.USC.Common.Person →
  Elements.Document → Proving.USC.Common.ComplaintText → Prop)
#check (Deontic.Prohibition1589b : Proving.USC.Common.Person →
  Proving.USC.Common.Entity → Proving.USC.Common.ComplaintText → Prop)
#check (Procedure.OffenseConductOccurred :
  Proving.USC.Common.Person → Proving.USC.Common.ComplaintText → Prop)
#check (Scienter.Scienter1592Culpable :
  Proving.USC.Common.Person → Proving.USC.Common.ComplaintText → Prop)








axiom actOf : Person → ComplaintText → Proving.Rico.Act
axiom mapC  : ComplaintText → Proving.Rico.ComplaintText








axiom corr_ed_1581_addr {d c} :
  Elements.CulpablePersonCapableOfIntent d c → Deontic.AddresseeWhoever d c
axiom corr_ed_1581_act {d c} :
  Elements.Section1581aConduct d c → Deontic.PeonageActOccurred1581 d c

theorem s1581_elements_implies_deontic {d c} (h : Elements.Section1581a d c) :
    Deontic.Prohibition1581aViolated d c :=
  ⟨⟨corr_ed_1581_addr h.culpable⟩, corr_ed_1581_act h.conduct⟩




axiom corr_ed_1583_addr {d c} :
  Elements.CulpablePersonCapableOfIntent d c → Deontic.AddresseeWhoever d c
axiom corr_ed_1583_kidnap {d c} :
  Elements.KidnapsOrCarriesForSlavery d c → Deontic.EnticementIntoSlaveryActOccurred1583 d c
axiom corr_ed_1583_entice {d c} :
  Elements.EnticesToPlaceForSlavery d c → Deontic.EnticementIntoSlaveryActOccurred1583 d c

theorem s1583_elements_implies_deontic_modulo_gaps {d c}
    (gap_1583a3_deontic_omits_obstruction :
      Elements.ObstructsChapterEnforcement d c →
        Deontic.EnticementIntoSlaveryActOccurred1583 d c)
    (h : Elements.Section1583a d c) : Deontic.Prohibition1583aViolated d c :=
  ⟨⟨corr_ed_1583_addr h.culpable⟩,
    match h.conduct with
    | .kidnaps x   => corr_ed_1583_kidnap x
    | .entices x   => corr_ed_1583_entice x
    | .obstructs x => gap_1583a3_deontic_omits_obstruction x⟩


axiom corr_ed_1589a_addr {d c} :
  Elements.CulpablePersonCapableOfIntent d c → Deontic.AddresseeWhoever d c
axiom corr_ed_1589a_scienter {d c} :
  Proving.USC.Common.ActedWithScienter d c → Deontic.ActedKnowingly d c
axiom corr_ed_1589a_act {d c} :
  Elements.ProvidesOrObtainsLabor d c → Elements.ForcedLaborMeans d c →
    Deontic.ForcedLaborActOccurred1589a d c

theorem s1589a_elements_implies_deontic {d c} (h : Elements.Section1589a d c) :
    Deontic.Prohibition1589aViolated d c :=
  ⟨⟨corr_ed_1589a_addr h.culpable, corr_ed_1589a_scienter h.scienter⟩,
    corr_ed_1589a_act h.obtains h.means⟩




axiom mapVen : Elements.Venture → Entity
axiom corr_ed_1589b_addr {d c} :
  Elements.CulpablePersonCapableOfIntent d c → Deontic.AddresseeWhoever d c
axiom corr_ed_1589b_knowingly {d ven c} :
  Elements.KnowinglyBenefitsFromVenture d ven c → Deontic.ActedKnowingly d c
axiom corr_ed_1589b_venture {ven c} :
  Elements.VentureEngagedInForcedLabor ven c →
    Deontic.VentureEngagedInForcedLabor1589b (mapVen ven) c
axiom corr_ed_1589b_act {d ven c} :
  Elements.KnowinglyBenefitsFromVenture d ven c →
    Deontic.BenefitFromForcedLaborVentureActOccurred1589b d (mapVen ven) c

theorem s1589b_elements_implies_deontic {d ven c} (h : Elements.Section1589b d ven c) :
    Deontic.Prohibition1589bViolated d (mapVen ven) c :=
  ⟨⟨corr_ed_1589b_addr h.culpable, corr_ed_1589b_knowingly h.benefits,
    corr_ed_1589b_venture h.venture⟩, corr_ed_1589b_act h.benefits⟩


axiom corr_ed_1590a_addr {d c} :
  Elements.CulpablePersonCapableOfIntent d c → Deontic.AddresseeWhoever d c
axiom corr_ed_1590a_scienter {d c} :
  Proving.USC.Common.ActedWithScienter d c → Deontic.ActedKnowingly d c
axiom corr_ed_1590a_act {d c} :
  Elements.TraffickingActForLabor d c → Elements.ForLaborInViolationOfChapter d c →
    Deontic.TraffickingForLaborActOccurred1590a d c

theorem s1590a_elements_implies_deontic {d c} (h : Elements.Section1590a d c) :
    Deontic.Prohibition1590aViolated d c :=
  ⟨⟨corr_ed_1590a_addr h.culpable, corr_ed_1590a_scienter h.scienter⟩,
    corr_ed_1590a_act h.act h.purpose⟩


axiom corr_ed_1591a_addr {d c} :
  Elements.CulpablePersonCapableOfIntent d c → Deontic.AddresseeWhoever d c
axiom corr_ed_1591a_scienter {d c} :
  Proving.USC.Common.ActedWithScienter d c → Deontic.ActedKnowingly d c
axiom corr_ed_1591a_interstate {d c} :
  Elements.InCommerceOrSpecialJurisdiction c → Deontic.AffectsInterstateCommerce d c
axiom corr_ed_1591a_means {d c} :
  Elements.Section1591Predicate d c → Deontic.MeansForceFraudOrMinor1591 d c
axiom corr_ed_1591a_act {d ven c} :
  Elements.Section1591Conduct d ven c → Deontic.SexTraffickingActOccurred1591a d c

theorem s1591a_elements_implies_deontic {d ven c} (h : Elements.Section1591a d ven c) :
    Deontic.Prohibition1591aViolated d c :=
  ⟨⟨corr_ed_1591a_addr h.culpable, corr_ed_1591a_scienter h.scienter,
    corr_ed_1591a_interstate h.jurisdiction, corr_ed_1591a_means h.predicate⟩,
    corr_ed_1591a_act h.conduct⟩




axiom corr_ed_1592a_addr {d c} :
  Elements.CulpablePersonCapableOfIntent d c → Deontic.AddresseeWhoever d c
axiom corr_ed_1592a_scienter {d c} :
  Proving.USC.Common.ActedWithScienter d c → Deontic.ActedKnowingly d c
axiom corr_ed_1592a_furtherance {d c} :
  Elements.Section1592Purpose d c → Deontic.InFurtheranceOfTrafficking1592 d c
axiom corr_ed_1592a_act {d doc c} :
  Elements.TampersWithDocument d doc c → Deontic.DocumentTraffickingActOccurred1592a d c
axiom corr_ed_1592_exc {d c} :
  Deontic.VictimExceptionApplies1592 d c → Elements.VictimExceptionApplies d c

theorem s1592a_elements_implies_deontic {d doc c} (h : Elements.Section1592a d doc c) :
    Deontic.Prohibition1592aViolated d c :=
  ⟨⟨corr_ed_1592a_addr h.culpable, corr_ed_1592a_scienter h.scienter,
    corr_ed_1592a_furtherance h.purpose,
    fun he => h.notVictimExcepted (corr_ed_1592_exc he)⟩,
    corr_ed_1592a_act h.tampers⟩







axiom corr_ep_1581 {d c} : Elements.Section1581a d c → Procedure.OffenseConductOccurred d c
axiom corr_ep_1583 {d c} : Elements.Section1583a d c → Procedure.OffenseConductOccurred d c
axiom corr_ep_1589a {d c} : Elements.Section1589a d c → Procedure.OffenseConductOccurred d c
axiom corr_ep_1589b {d ven c} : Elements.Section1589b d ven c → Procedure.OffenseConductOccurred d c
axiom corr_ep_1590a {d c} : Elements.Section1590a d c → Procedure.OffenseConductOccurred d c
axiom corr_ep_1591a {d ven c} : Elements.Section1591a d ven c → Procedure.OffenseConductOccurred d c
axiom corr_ep_1592a {d doc c} : Elements.Section1592a d doc c → Procedure.OffenseConductOccurred d c

theorem s1581_elements_implies_procedure {d c} (h : Elements.Section1581a d c) :
    Procedure.OffenseConductOccurred d c := corr_ep_1581 h
theorem s1583_elements_implies_procedure {d c} (h : Elements.Section1583a d c) :
    Procedure.OffenseConductOccurred d c := corr_ep_1583 h
theorem s1589a_elements_implies_procedure {d c} (h : Elements.Section1589a d c) :
    Procedure.OffenseConductOccurred d c := corr_ep_1589a h
theorem s1589b_elements_implies_procedure {d ven c} (h : Elements.Section1589b d ven c) :
    Procedure.OffenseConductOccurred d c := corr_ep_1589b h
theorem s1590a_elements_implies_procedure {d c} (h : Elements.Section1590a d c) :
    Procedure.OffenseConductOccurred d c := corr_ep_1590a h
theorem s1591a_elements_implies_procedure {d ven c} (h : Elements.Section1591a d ven c) :
    Procedure.OffenseConductOccurred d c := corr_ep_1591a h
theorem s1592a_elements_implies_procedure {d doc c} (h : Elements.Section1592a d doc c) :
    Procedure.OffenseConductOccurred d c := corr_ep_1592a h












axiom corr_es_1589 {d c} :
  Proving.USC.Common.ActedWithScienter d c → Scienter.Scienter1589Culpable d c
axiom corr_es_1590 {d c} :
  Proving.USC.Common.ActedWithScienter d c → Scienter.Scienter1590Culpable d c
axiom corr_es_1591 {d c} :
  Proving.USC.Common.ActedWithScienter d c → Scienter.Scienter1591Culpable d c
axiom corr_es_1592 {d c} :
  Proving.USC.Common.ActedWithScienter d c → Scienter.Scienter1592Culpable d c

theorem s1589a_elements_implies_scienter {d c} (h : Elements.Section1589a d c) :
    Scienter.Scienter1589Culpable d c := corr_es_1589 h.scienter
theorem s1590a_elements_implies_scienter {d c} (h : Elements.Section1590a d c) :
    Scienter.Scienter1590Culpable d c := corr_es_1590 h.scienter
theorem s1591a_elements_implies_scienter {d ven c} (h : Elements.Section1591a d ven c) :
    Scienter.Scienter1591Culpable d c := corr_es_1591 h.scienter
theorem s1592a_elements_implies_scienter {d doc c} (h : Elements.Section1592a d doc c) :
    Scienter.Scienter1592Culpable d c := corr_es_1592 h.scienter

theorem s1581_elements_implies_scienter_modulo_gaps {d c}
    (gap_1581_specific_scienter_not_encoded_by_elements :
      Elements.Section1581a d c → Scienter.Scienter1581Culpable d c)
    (h : Elements.Section1581a d c) : Scienter.Scienter1581Culpable d c :=
  gap_1581_specific_scienter_not_encoded_by_elements h

theorem s1583_elements_implies_scienter_modulo_gaps {d c}
    (gap_1583_specific_scienter_not_encoded_by_elements :
      Elements.Section1583a d c → Scienter.Scienter1583Culpable d c)
    (h : Elements.Section1583a d c) : Scienter.Scienter1583Culpable d c :=
  gap_1583_specific_scienter_not_encoded_by_elements h








axiom corr_rack_1581 {d c} :
  Elements.Section1581a d c → Proving.Rico.IsRacketeeringActivity (actOf d c) (mapC c)
axiom corr_rack_1583 {d c} :
  Elements.Section1583a d c → Proving.Rico.IsRacketeeringActivity (actOf d c) (mapC c)
axiom corr_rack_1589a {d c} :
  Elements.Section1589a d c → Proving.Rico.IsRacketeeringActivity (actOf d c) (mapC c)
axiom corr_rack_1589b {d ven c} :
  Elements.Section1589b d ven c → Proving.Rico.IsRacketeeringActivity (actOf d c) (mapC c)
axiom corr_rack_1590a {d c} :
  Elements.Section1590a d c → Proving.Rico.IsRacketeeringActivity (actOf d c) (mapC c)
axiom corr_rack_1591a {d ven c} :
  Elements.Section1591a d ven c → Proving.Rico.IsRacketeeringActivity (actOf d c) (mapC c)
axiom corr_rack_1592a {d doc c} :
  Elements.Section1592a d doc c → Proving.Rico.IsRacketeeringActivity (actOf d c) (mapC c)

theorem s1581_elements_implies_golden {d c} (h : Elements.Section1581a d c) :
    Proving.Rico.IsRacketeeringActivity (actOf d c) (mapC c) := corr_rack_1581 h
theorem s1583_elements_implies_golden {d c} (h : Elements.Section1583a d c) :
    Proving.Rico.IsRacketeeringActivity (actOf d c) (mapC c) := corr_rack_1583 h
theorem s1589a_elements_implies_golden {d c} (h : Elements.Section1589a d c) :
    Proving.Rico.IsRacketeeringActivity (actOf d c) (mapC c) := corr_rack_1589a h
theorem s1589b_elements_implies_golden {d ven c} (h : Elements.Section1589b d ven c) :
    Proving.Rico.IsRacketeeringActivity (actOf d c) (mapC c) := corr_rack_1589b h
theorem s1590a_elements_implies_golden {d c} (h : Elements.Section1590a d c) :
    Proving.Rico.IsRacketeeringActivity (actOf d c) (mapC c) := corr_rack_1590a h
theorem s1591a_elements_implies_golden {d ven c} (h : Elements.Section1591a d ven c) :
    Proving.Rico.IsRacketeeringActivity (actOf d c) (mapC c) := corr_rack_1591a h
theorem s1592a_elements_implies_golden {d doc c} (h : Elements.Section1592a d doc c) :
    Proving.Rico.IsRacketeeringActivity (actOf d c) (mapC c) := corr_rack_1592a h

end Proving.USC.T18.Ch77.Bridge
