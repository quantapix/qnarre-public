










































import Proving.USC.T18.Ch71.Elements.Statute
import Proving.USC.T18.Ch71.Deontic.Statute
import Proving.USC.T18.Ch71.Ontology.Statute
import Proving.USC.T18.Ch71.Procedure.Statute

namespace Proving.USC.T18.Ch71.Bridge
open Proving.USC.Common
open Proving.USC.T18
open Proving.USC.T18.Ch71








axiom mapMatterED : Elements.Matter → Deontic.Matter
axiom mapMatterEO : Elements.Matter → Ch71.Ontology.Matter
axiom mapUtterEO  : Elements.Matter → Ch71.Ontology.Utterance
axiom mapMatterDO : Deontic.Matter  → Ch71.Ontology.Matter
axiom mapUtterDO  : Deontic.Matter  → Ch71.Ontology.Utterance




axiom corr_addr1461 (p : Person) (c : ComplaintText) : Deontic.AddresseeAnyPerson p c


axiom corr_nonmail1461 {m : Elements.Matter} {c : ComplaintText} :
    Elements.NonmailableMatter1461 m c → Deontic.IsNonmailableMatter1461 (mapMatterED m) c


axiom corr_mail1461 {p : Person} {m : Elements.Matter} {c : ComplaintText} :
    Elements.UsedMailsForConveyance p m c → Elements.KnewCharacterOfMatter p c →
    Deontic.KnowinglyMailsNonmailable1461 p (mapMatterED m) c


theorem s1461_elements_implies_deontic {p : Person} {m : Elements.Matter} {c : ComplaintText}
    (h : Elements.Section1461 p m c) : Deontic.ProhibitionViolated1461 p (mapMatterED m) c :=
  ⟨⟨corr_addr1461 p c, corr_nonmail1461 h.nonmailable⟩, corr_mail1461 h.usedMails h.scienter⟩


axiom corr_obscene1461 {m : Elements.Matter} {c : ComplaintText} :
    Elements.IsObscene m c → Ch71.Ontology.IsObsceneMatter (mapMatterEO m) c

axiom corr_abortion1461 {m : Elements.Matter} {c : ComplaintText} :
    Elements.IsAbortionRelatedMatter m c → Ch71.Ontology.IsAbortionRelatedArticle (mapMatterEO m) c


axiom corr_crimeInc1461 {m : Elements.Matter} {c : ComplaintText} :
    Elements.IsCrimeIncitingMatter m c → Ch71.Ontology.IsIndecent (mapMatterEO m) c






theorem s1461_elements_implies_ontology {m : Elements.Matter} {c : ComplaintText}
    (h : Elements.NonmailableMatter1461 m c) :
    Ch71.Ontology.NonmailableMatterMembership (mapMatterEO m) c :=
  match h with
  | .obscene ho       => .obscene  (corr_obscene1461 ho)
  | .abortion ha      => .abortion (corr_abortion1461 ha)
  | .crimeInciting hc => .indecent (corr_crimeInc1461 hc)




axiom corr_nonmailDO1461 {m : Deontic.Matter} {c : ComplaintText} :
    Deontic.IsNonmailableMatter1461 m c → Ch71.Ontology.NonmailableMatterMembership (mapMatterDO m) c


theorem s1461_deontic_implies_ontology {p : Person} {m : Deontic.Matter} {c : ComplaintText}
    (h : Deontic.ProhibitionViolated1461 p m c) :
    Ch71.Ontology.NonmailableMatterMembership (mapMatterDO m) c :=
  corr_nonmailDO1461 h.1.condition




















axiom corr_addr1462 (p : Person) (c : ComplaintText) : Deontic.AddresseeAnyPerson p c



axiom corr_matter1462 {m : Elements.Matter} {c : ComplaintText} :
    Elements.ProhibitedMatter1462 m c → Deontic.IsObsceneMatter1462 (mapMatterED m) c


axiom corr_commerce1462 {p : Person} {m : Elements.Matter} {c : ComplaintText} :
    Elements.ImportedOrTransportedInCommerce p m c → Deontic.AffectsInterstateOrForeignCommerce p c

axiom corr_act1462 {p : Person} {m : Elements.Matter} {c : ComplaintText} :
    Elements.ImportedOrTransportedInCommerce p m c → Deontic.ImportsOrTransportsObscene1462 p (mapMatterED m) c


theorem s1462_elements_implies_deontic {p : Person} {m : Elements.Matter} {c : ComplaintText}
    (h : Elements.Section1462 p m c) : Deontic.ProhibitionViolated1462 p (mapMatterED m) c :=
  ⟨⟨corr_addr1462 p c, corr_matter1462 h.prohibited, corr_commerce1462 h.transported⟩,
   corr_act1462 h.transported⟩



axiom corr_matterEO1462 {m : Elements.Matter} {c : ComplaintText} :
    Elements.ProhibitedMatter1462 m c → Ch71.Ontology.Section1462Matter (mapMatterEO m) c

axiom corr_commerceEO1462 {p : Person} {m : Elements.Matter} {c : ComplaintText} :
    Elements.ImportedOrTransportedInCommerce p m c →
    Ch71.Ontology.IsInInterstateOrForeignCommerce (mapMatterEO m) c



theorem s1462_elements_implies_ontology {p : Person} {m : Elements.Matter} {c : ComplaintText}
    (h : Elements.Section1462 p m c) : Ch71.Ontology.Section1462Object (mapMatterEO m) c :=
  ⟨corr_matterEO1462 h.prohibited, corr_commerceEO1462 h.transported⟩



axiom corr_matterDO1462 {m : Deontic.Matter} {c : ComplaintText} :
    Deontic.IsObsceneMatter1462 m c → Ch71.Ontology.Section1462Matter (mapMatterDO m) c

axiom corr_commerceDO1462 {p : Person} {m : Deontic.Matter} {c : ComplaintText} :
    Deontic.AffectsInterstateOrForeignCommerce p c →
    Ch71.Ontology.IsInInterstateOrForeignCommerce (mapMatterDO m) c



theorem s1462_deontic_implies_ontology {p : Person} {m : Deontic.Matter} {c : ComplaintText}
    (h : Deontic.ProhibitionViolated1462 p m c) :
    Ch71.Ontology.Section1462Object (mapMatterDO m) c :=
  ⟨corr_matterDO1462 h.1.condition, corr_commerceDO1462 h.1.commerce⟩









axiom corr_addr1463 (p : Person) (c : ComplaintText) : Deontic.AddresseeAnyPerson p c

axiom corr_wrapper1463 {m : Elements.Matter} {c : ComplaintText} :
    Elements.BearsIndecentMatterOnWrapper m c → Deontic.IsIndecentWrapperMatter1463 (mapMatterED m) c

axiom corr_act1463 {p : Person} {m : Elements.Matter} {c : ComplaintText} :
    Elements.UsedMailsForConveyance p m c → Elements.KnewCharacterOfMatter p c →
    Deontic.KnowinglyDepositsWrapper1463 p (mapMatterED m) c


theorem s1463_elements_implies_deontic {p : Person} {m : Elements.Matter} {c : ComplaintText}
    (h : Elements.Section1463 p m c) : Deontic.ProhibitionViolated1463 p (mapMatterED m) c :=
  ⟨⟨corr_addr1463 p c, corr_wrapper1463 h.wrapper⟩, corr_act1463 h.usedMails h.scienter⟩








axiom corr_addr1464 (p : Person) (c : ComplaintText) : Deontic.AddresseeAnyPerson p c


axiom corr_lang1464 {m : Elements.Matter} {c : ComplaintText} :
    Elements.ProhibitedLanguage1464 m c → Deontic.IsObsceneOrProfaneLanguage1464 (mapMatterED m) c

axiom corr_act1464 {p : Person} {m : Elements.Matter} {c : ComplaintText} :
    Elements.UtteredByRadioCommunication p m c → Deontic.UttersByRadio1464 p (mapMatterED m) c


theorem s1464_elements_implies_deontic {p : Person} {m : Elements.Matter} {c : ComplaintText}
    (h : Elements.Section1464 p m c) : Deontic.ProhibitionViolated1464 p (mapMatterED m) c :=
  ⟨⟨corr_addr1464 p c, corr_lang1464 h.language⟩, corr_act1464 h.uttered⟩



axiom corr_langEO1464 {m : Elements.Matter} {c : ComplaintText} :
    Elements.ProhibitedLanguage1464 m c →
    Ch71.Ontology.IsObsceneIndecentOrProfaneLanguage (mapUtterEO m) c


theorem s1464_elements_implies_ontology {p : Person} {m : Elements.Matter} {c : ComplaintText}
    (h : Elements.Section1464 p m c) :
    Ch71.Ontology.IsObsceneIndecentOrProfaneLanguage (mapUtterEO m) c :=
  corr_langEO1464 h.language


axiom corr_langDO1464 {m : Deontic.Matter} {c : ComplaintText} :
    Deontic.IsObsceneOrProfaneLanguage1464 m c →
    Ch71.Ontology.IsObsceneIndecentOrProfaneLanguage (mapUtterDO m) c


theorem s1464_deontic_implies_ontology {p : Person} {m : Deontic.Matter} {c : ComplaintText}
    (h : Deontic.ProhibitionViolated1464 p m c) :
    Ch71.Ontology.IsObsceneIndecentOrProfaneLanguage (mapUtterDO m) c :=
  corr_langDO1464 h.1.condition




axiom corr_pUtter1464 {p : Person} {m : Elements.Matter} {c : ComplaintText} :
    Elements.UtteredByRadioCommunication p m c → Procedure.ObsceneLanguageUttered p c





theorem s1464_elements_implies_procedure {p : Person} {m : Elements.Matter} {c : ComplaintText}
    (h : Elements.Section1464 p m c) : Procedure.BroadcastOffense p c :=
  ⟨corr_pUtter1464 h.uttered⟩




axiom corr_addr1465 (p : Person) (c : ComplaintText) : Deontic.AddresseeAnyPerson p c

axiom corr_matter1465 {m : Elements.Matter} {c : ComplaintText} :
    Elements.IsObscene m c → Deontic.IsObsceneMatter1465 (mapMatterED m) c

axiom corr_commerce1465 {p : Person} {m : Elements.Matter} {c : ComplaintText} :
    Elements.ProducedOrTransportedInCommerce p m c → Deontic.AffectsInterstateOrForeignCommerce p c


axiom corr_act1465 {p : Person} {m : Elements.Matter} {c : ComplaintText} :
    Elements.ProducedOrTransportedInCommerce p m c → Elements.ForPurposeOfSaleOrDistribution p m c →
    Deontic.ProducesOrTransportsForDistribution1465 p (mapMatterED m) c


theorem s1465_elements_implies_deontic {p : Person} {m : Elements.Matter} {c : ComplaintText}
    (h : Elements.Section1465 p m c) : Deontic.ProhibitionViolated1465 p (mapMatterED m) c :=
  ⟨⟨corr_addr1465 p c, corr_matter1465 h.obscene, corr_commerce1465 h.produced⟩,
   corr_act1465 h.produced h.purpose⟩


axiom corr_obsceneEO1465 {m : Elements.Matter} {c : ComplaintText} :
    Elements.IsObscene m c → Ch71.Ontology.IsObsceneMatter (mapMatterEO m) c


axiom corr_commerceEO1465 {p : Person} {m : Elements.Matter} {c : ComplaintText} :
    Elements.ProducedOrTransportedInCommerce p m c →
    Ch71.Ontology.IsInInterstateOrForeignCommerce (mapMatterEO m) c



theorem s1465_elements_implies_ontology {p : Person} {m : Elements.Matter} {c : ComplaintText}
    (h : Elements.Section1465 p m c) : Ch71.Ontology.ObsceneMatterInCommerce (mapMatterEO m) c :=
  ⟨corr_obsceneEO1465 h.obscene, corr_commerceEO1465 h.produced⟩


axiom corr_obsceneDO1465 {m : Deontic.Matter} {c : ComplaintText} :
    Deontic.IsObsceneMatter1465 m c → Ch71.Ontology.IsObsceneMatter (mapMatterDO m) c

axiom corr_commerceDO1465 {p : Person} {m : Deontic.Matter} {c : ComplaintText} :
    Deontic.AffectsInterstateOrForeignCommerce p c →
    Ch71.Ontology.IsInInterstateOrForeignCommerce (mapMatterDO m) c


theorem s1465_deontic_implies_ontology {p : Person} {m : Deontic.Matter} {c : ComplaintText}
    (h : Deontic.ProhibitionViolated1465 p m c) :
    Ch71.Ontology.ObsceneMatterInCommerce (mapMatterDO m) c :=
  ⟨corr_obsceneDO1465 h.1.condition, corr_commerceDO1465 h.1.commerce⟩

end Proving.USC.T18.Ch71.Bridge
