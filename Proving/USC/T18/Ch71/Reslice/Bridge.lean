




















import Proving.USC.T18.Ch71.Reslice.Elements.Statute
import Proving.USC.T18.Ch71.Reslice.Deontic.Statute
import Proving.USC.T18.Ch71.Reslice.Ontology.Statute
import Proving.USC.T18.Ch71.Reslice.Procedure.Statute
import Proving.USC.T18.Ch71.Reslice.Scienter.Statute
import Proving.Rico.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch71.Reslice.Bridge

open Proving.USC.Common



axiom mapMED : Elements.ObsceneMatter → Deontic.ObsceneMatter
axiom mapMEO : Elements.ObsceneMatter → Ontology.ObsceneMatter
axiom mapComplaintR : ComplaintText → Proving.Rico.ComplaintText





axiom corr_ed_obscene {m : Elements.ObsceneMatter} {c : ComplaintText} :
    Elements.MatterIsObscene m c → Deontic.MatterIsObscene (mapMED m) c



axiom corr_ed_addressee {p : Person} {m : Elements.ObsceneMatter} {c : ComplaintText} :
    Elements.KnowsObsceneCharacter p m c → Deontic.AddresseeIsAnyPerson p c







axiom corr_1462_commerce {p : Person} {m : Elements.ObsceneMatter} {c : ComplaintText} :
    Elements.ProhibitedTransportOrReceipt1462 p m c → Deontic.InterstateOrForeignCommerceNexus c


axiom corr_1462_act {p : Person} {m : Elements.ObsceneMatter} {c : ComplaintText} :
    Elements.ProhibitedTransportOrReceipt1462 p m c → Deontic.TransportedObsceneMatter1462 p (mapMED m) c


theorem s1462_elements_implies_deontic
    {p : Person} {m : Elements.ObsceneMatter} {c : ComplaintText}
    (h : Elements.Section1462 p m c) : Deontic.ProhibitionViolated1462 p (mapMED m) c :=
  ⟨⟨corr_ed_addressee h.scienter, corr_ed_obscene h.obscene, corr_1462_commerce h.conduct⟩,
   corr_1462_act h.conduct⟩


axiom corr_1462_offense {p : Person} {m : Elements.ObsceneMatter} {c : ComplaintText} :
    Elements.Section1462 p m c → Procedure.OffenseEstablished1462 p c


theorem s1462_elements_implies_procedure
    {p : Person} {m : Elements.ObsceneMatter} {c : ComplaintText}
    (h : Elements.Section1462 p m c) : Procedure.OffenseEstablished1462 p c :=
  corr_1462_offense h



axiom corr_1462_mental {p : Person} {m : Elements.ObsceneMatter} {c : ComplaintText} :
    Elements.KnowsObsceneCharacter p m c → Scienter.MentalStateProven p Scienter.MentalState.Knowledge c



theorem s1462_elements_implies_scienter
    {p : Person} {m : Elements.ObsceneMatter} {c : ComplaintText}
    (h : Elements.Section1462 p m c) : Scienter.Scienter1462 p c :=
  ⟨Scienter.MentalState.Knowledge, Scienter.MentalState.atLeast_refl _, corr_1462_mental h.scienter⟩


axiom corr_1462_o_obscene {m : Elements.ObsceneMatter} {c : ComplaintText} :
    Elements.MatterIsObscene m c → Ontology.IsObsceneMatter (mapMEO m) c


axiom corr_1462_o_channel {p : Person} {m : Elements.ObsceneMatter} {c : ComplaintText} :
    Elements.ProhibitedTransportOrReceipt1462 p m c →
      ∃ e : Entity, (Ontology.IsCommonCarrier e c ∨ Ontology.IsInteractiveComputerService e c)
        ∧ Ontology.InInterstateOrForeignCommerce e c


theorem s1462_elements_implies_ontology
    {p : Person} {m : Elements.ObsceneMatter} {c : ComplaintText}
    (h : Elements.Section1462 p m c) : Ontology.Section1462Matter c :=
  ⟨Ontology.Section1462Object.expressiveObscene (mapMEO m) (corr_1462_o_obscene h.obscene),
   corr_1462_o_channel h.conduct⟩



theorem s1462_tierA :
    (∀ (p : Person) (m : Elements.ObsceneMatter) (c : ComplaintText),
        Elements.Section1462 p m c → Deontic.ProhibitionViolated1462 p (mapMED m) c) ∧
    (∀ (p : Person) (m : Elements.ObsceneMatter) (c : ComplaintText),
        Elements.Section1462 p m c → Procedure.OffenseEstablished1462 p c) ∧
    (∀ (p : Person) (m : Elements.ObsceneMatter) (c : ComplaintText),
        Elements.Section1462 p m c → Scienter.Scienter1462 p c) ∧
    (∀ (p : Person) (m : Elements.ObsceneMatter) (c : ComplaintText),
        Elements.Section1462 p m c → Ontology.Section1462Matter c) :=
  ⟨fun _ _ _ h => s1462_elements_implies_deontic h,
   fun _ _ _ h => s1462_elements_implies_procedure h,
   fun _ _ _ h => s1462_elements_implies_scienter h,
   fun _ _ _ h => s1462_elements_implies_ontology h⟩





axiom corr_1465_commerce {m : Elements.ObsceneMatter} {c : ComplaintText} :
    Elements.AffectsInterstateOrForeignCommerce m c → Deontic.InterstateOrForeignCommerceNexus c


axiom corr_1465_forsale {p : Person} {m : Elements.ObsceneMatter} {c : ComplaintText} :
    Elements.ForPurposeOfSaleOrDistribution p m c → Deontic.PurposeOfSaleOrDistribution1465 (mapMED m) c


axiom corr_1465_act {p : Person} {m : Elements.ObsceneMatter} {c : ComplaintText} :
    Elements.ProductionOrTransport1465 p m c → Deontic.ProducedOrTransportedForSale1465 p (mapMED m) c


theorem s1465_elements_implies_deontic
    {p : Person} {m : Elements.ObsceneMatter} {c : ComplaintText}
    (h : Elements.Section1465 p m c) : Deontic.ProhibitionViolated1465 p (mapMED m) c :=
  ⟨⟨corr_ed_addressee h.scienter, corr_ed_obscene h.obscene,
    corr_1465_commerce h.commerce, corr_1465_forsale h.purpose⟩,
   corr_1465_act h.conduct⟩


axiom corr_1465_offense {p : Person} {m : Elements.ObsceneMatter} {c : ComplaintText} :
    Elements.Section1465 p m c → Procedure.OffenseEstablished1465 p c


theorem s1465_elements_implies_procedure
    {p : Person} {m : Elements.ObsceneMatter} {c : ComplaintText}
    (h : Elements.Section1465 p m c) : Procedure.OffenseEstablished1465 p c :=
  corr_1465_offense h



axiom corr_1465_mental {p : Person} {m : Elements.ObsceneMatter} {c : ComplaintText} :
    Elements.ForPurposeOfSaleOrDistribution p m c → Scienter.MentalStateProven p Scienter.MentalState.Specific c



theorem s1465_elements_implies_scienter
    {p : Person} {m : Elements.ObsceneMatter} {c : ComplaintText}
    (h : Elements.Section1465 p m c) : Scienter.Scienter1465 p c :=
  ⟨Scienter.MentalState.Specific, Scienter.MentalState.atLeast_refl _, corr_1465_mental h.purpose⟩


axiom corr_1465_o_obscene {m : Elements.ObsceneMatter} {c : ComplaintText} :
    Elements.MatterIsObscene m c → Ontology.IsObsceneMatter (mapMEO m) c


axiom corr_1465_o_channel {p : Person} {m : Elements.ObsceneMatter} {c : ComplaintText} :
    Elements.ProductionOrTransport1465 p m c →
      ∃ e : Entity, Ontology.InInterstateOrForeignCommerce e c ∨ Ontology.IsInteractiveComputerService e c


theorem s1465_elements_implies_ontology
    {p : Person} {m : Elements.ObsceneMatter} {c : ComplaintText}
    (h : Elements.Section1465 p m c) : Ontology.Section1465Matter (mapMEO m) c :=
  ⟨corr_1465_o_obscene h.obscene, corr_1465_o_channel h.conduct⟩


theorem s1465_tierA :
    (∀ (p : Person) (m : Elements.ObsceneMatter) (c : ComplaintText),
        Elements.Section1465 p m c → Deontic.ProhibitionViolated1465 p (mapMED m) c) ∧
    (∀ (p : Person) (m : Elements.ObsceneMatter) (c : ComplaintText),
        Elements.Section1465 p m c → Procedure.OffenseEstablished1465 p c) ∧
    (∀ (p : Person) (m : Elements.ObsceneMatter) (c : ComplaintText),
        Elements.Section1465 p m c → Scienter.Scienter1465 p c) ∧
    (∀ (p : Person) (m : Elements.ObsceneMatter) (c : ComplaintText),
        Elements.Section1465 p m c → Ontology.Section1465Matter (mapMEO m) c) :=
  ⟨fun _ _ _ h => s1465_elements_implies_deontic h,
   fun _ _ _ h => s1465_elements_implies_procedure h,
   fun _ _ _ h => s1465_elements_implies_scienter h,
   fun _ _ _ h => s1465_elements_implies_ontology h⟩









axiom actOf1462 : Person → Elements.ObsceneMatter → Proving.Rico.Act
axiom actOf1465 : Person → Elements.ObsceneMatter → Proving.Rico.Act


axiom corr_1462_racketeering {p : Person} {m : Elements.ObsceneMatter} {c : ComplaintText} :
    Elements.Section1462 p m c →
      Proving.Rico.IsRacketeeringActivity (actOf1462 p m) (mapComplaintR c)



theorem s1462_elements_implies_golden
    {p : Person} {m : Elements.ObsceneMatter} {c : ComplaintText}
    (h : Elements.Section1462 p m c) :
    Proving.Rico.IsRacketeeringActivity (actOf1462 p m) (mapComplaintR c) :=
  corr_1462_racketeering h


axiom corr_1465_racketeering {p : Person} {m : Elements.ObsceneMatter} {c : ComplaintText} :
    Elements.Section1465 p m c →
      Proving.Rico.IsRacketeeringActivity (actOf1465 p m) (mapComplaintR c)



theorem s1465_elements_implies_golden
    {p : Person} {m : Elements.ObsceneMatter} {c : ComplaintText}
    (h : Elements.Section1465 p m c) :
    Proving.Rico.IsRacketeeringActivity (actOf1465 p m) (mapComplaintR c) :=
  corr_1465_racketeering h

end Proving.USC.T18.Ch71.Reslice.Bridge
