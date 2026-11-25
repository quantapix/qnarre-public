















































import Proving.USC.Common.Types
import Proving.USC.T18.Ch25.Elements.Statute
import Proving.USC.T18.Ch25.Deontic.Statute
import Proving.USC.T18.Ch25.Ontology.Statute
import Proving.USC.T18.Ch25.Procedure.Statute
import Proving.USC.T18.Ch25.Structure.Statute

namespace Proving.USC.T18.Ch25.Bridge

open Proving.USC.Common
open Proving.USC.T18.Ch25



axiom mapObjD : Elements.Instrument → Deontic.Obligation
axiom mapObjO : Elements.Instrument → Ontology.Obligation




axiom corr_intentToDefraud {p : Person} {c : ComplaintText} :
    Elements.ActsWithIntentToDefraud p c → Deontic.IntentToDefraud p c



axiom corr_intentGenuine {p : Person} {c : ComplaintText} :
    Elements.IntentPassedAsGenuine p c → Deontic.IntentToPassAsGenuine p c



namespace S471



axiom corr_addressee {p : Person} {i : Elements.Instrument} {c : ComplaintText} :
    Elements.Section0471 p i c → Deontic.AddresseeIsPerson p c



axiom corr_forges {p : Person} {i : Elements.Instrument} {c : ComplaintText} :
    Elements.Section0471 p i c → Deontic.ForgesObligation p (mapObjD i) c

axiom corr_genus {p : Person} {i : Elements.Instrument} {c : ComplaintText} :
    Elements.Section0471 p i c → Ontology.IsObligationOrSecurity (mapObjO i) c


axiom corr_falsified {p : Person} {i : Elements.Instrument} {c : ComplaintText} :
    Elements.MakesCounterfeit471 p i c → Ontology.Falsified (mapObjO i) c

axiom corr_offense {p : Person} {i : Elements.Instrument} {c : ComplaintText} :
    Elements.Section0471 p i c → Procedure.OffenseCommitted471 p c


axiom corr_incorp {p : Person} {i : Elements.Instrument} {c : ComplaintText} :
    Elements.Section0471 p i c →
    Structure.IncorporationHonored Structure.edge_471_incorporates_8 c


theorem s471_elements_implies_deontic {p i c} (h : Elements.Section0471 p i c) :
    Deontic.ProhibitionViolated471 p (mapObjD i) c :=
  ⟨⟨corr_addressee h, corr_intentToDefraud h.intent⟩, corr_forges h⟩


theorem s471_elements_implies_ontology {p i c} (h : Elements.Section0471 p i c) :
    Ontology.CounterfeitObligation (mapObjO i) c :=
  ⟨corr_genus h, corr_falsified h.act⟩


theorem s471_elements_implies_procedure {p i c} (h : Elements.Section0471 p i c) :
    Procedure.OffenseCommitted471 p c :=
  corr_offense h


theorem s471_elements_implies_structure {p i c} (h : Elements.Section0471 p i c) :
    Structure.IncorporationHonored Structure.edge_471_incorporates_8 c :=
  corr_incorp h

end S471



namespace S472

axiom corr_addressee {p : Person} {i : Elements.Instrument} {c : ComplaintText} :
    Elements.Section0472 p i c → Deontic.AddresseeIsPerson p c


axiom corr_counterfeitObj {p : Person} {i : Elements.Instrument} {c : ComplaintText} :
    Elements.Section0472 p i c → Deontic.IsCounterfeitObligationOfUS (mapObjD i) c

axiom corr_utters {p : Person} {i : Elements.Instrument} {c : ComplaintText} :
    Elements.Section0472 p i c → Deontic.UttersCounterfeit p (mapObjD i) c
axiom corr_genus {p : Person} {i : Elements.Instrument} {c : ComplaintText} :
    Elements.Section0472 p i c → Ontology.IsObligationOrSecurity (mapObjO i) c

axiom corr_falsified {p : Person} {i : Elements.Instrument} {c : ComplaintText} :
    Elements.Section0472 p i c → Ontology.Falsified (mapObjO i) c
axiom corr_offense {p : Person} {i : Elements.Instrument} {c : ComplaintText} :
    Elements.Section0472 p i c → Procedure.OffenseCommitted472 p c

axiom corr_incorp {p : Person} {i : Elements.Instrument} {c : ComplaintText} :
    Elements.Section0472 p i c →
    Structure.IncorporationHonored Structure.edge_472_incorporates_471 c


theorem s472_elements_implies_deontic {p i c} (h : Elements.Section0472 p i c) :
    Deontic.ProhibitionViolated472 p (mapObjD i) c :=
  ⟨⟨corr_addressee h, corr_intentToDefraud h.intent⟩, corr_counterfeitObj h, corr_utters h⟩


theorem s472_elements_implies_ontology {p i c} (h : Elements.Section0472 p i c) :
    Ontology.CounterfeitObligation (mapObjO i) c :=
  ⟨corr_genus h, corr_falsified h⟩


theorem s472_elements_implies_procedure {p i c} (h : Elements.Section0472 p i c) :
    Procedure.OffenseCommitted472 p c :=
  corr_offense h


theorem s472_elements_implies_structure {p i c} (h : Elements.Section0472 p i c) :
    Structure.IncorporationHonored Structure.edge_472_incorporates_471 c :=
  corr_incorp h

end S472



namespace S473

axiom corr_addressee {p : Person} {i : Elements.Instrument} {c : ComplaintText} :
    Elements.Section0473 p i c → Deontic.AddresseeIsPerson p c
axiom corr_counterfeitObj {p : Person} {i : Elements.Instrument} {c : ComplaintText} :
    Elements.Section0473 p i c → Deontic.IsCounterfeitObligationOfUS (mapObjD i) c

axiom corr_deals {p : Person} {i : Elements.Instrument} {c : ComplaintText} :
    Elements.Section0473 p i c → Deontic.DealsInCounterfeit p (mapObjD i) c
axiom corr_genus {p : Person} {i : Elements.Instrument} {c : ComplaintText} :
    Elements.Section0473 p i c → Ontology.IsObligationOrSecurity (mapObjO i) c
axiom corr_falsified {p : Person} {i : Elements.Instrument} {c : ComplaintText} :
    Elements.Section0473 p i c → Ontology.Falsified (mapObjO i) c
axiom corr_offense {p : Person} {i : Elements.Instrument} {c : ComplaintText} :
    Elements.Section0473 p i c → Procedure.OffenseCommitted473 p c

axiom corr_incorp {p : Person} {i : Elements.Instrument} {c : ComplaintText} :
    Elements.Section0473 p i c →
    Structure.IncorporationHonored Structure.edge_473_incorporates_471 c


theorem s473_elements_implies_deontic {p i c} (h : Elements.Section0473 p i c) :
    Deontic.ProhibitionViolated473 p (mapObjD i) c :=
  ⟨⟨corr_addressee h, corr_intentGenuine h.intent⟩, corr_counterfeitObj h, corr_deals h⟩


theorem s473_elements_implies_ontology {p i c} (h : Elements.Section0473 p i c) :
    Ontology.CounterfeitObligation (mapObjO i) c :=
  ⟨corr_genus h, corr_falsified h⟩


theorem s473_elements_implies_procedure {p i c} (h : Elements.Section0473 p i c) :
    Procedure.OffenseCommitted473 p c :=
  corr_offense h


theorem s473_elements_implies_structure {p i c} (h : Elements.Section0473 p i c) :
    Structure.IncorporationHonored Structure.edge_473_incorporates_471 c :=
  corr_incorp h

end S473

end Proving.USC.T18.Ch25.Bridge
