



































import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch117.Elements.Statute
import Proving.USC.T18.Ch117.Deontic.Statute
import Proving.USC.T18.Ch117.Ontology.Statute
import Proving.USC.T18.Ch117.Procedure.Statute
import Proving.USC.T18.Ch117.Structure.Statute

namespace Proving.USC.T18.Ch117.Bridge

open Proving.USC.Common
open Proving.USC.T18.Ch117





axiom corr_anyPerson_ofScienter {p : Person} {c : ComplaintText} :
    ActedWithScienter p c → Deontic.IsAnyPerson p c


axiom corr_anyPerson_ofTravels {p : Person} {c : ComplaintText} :
    Elements.TravelsInInterstateOrForeignCommerce p c → Deontic.IsAnyPerson p c
axiom corr_anyPerson_ofFacilitation {p v : Person} {c : ComplaintText} :
    Elements.ArrangesOrFacilitatesTravel p v c → Deontic.IsAnyPerson p c



axiom corr_nexus_ofTransport {p v : Person} {c : ComplaintText} :
    Elements.TransportsIndividualInInterstateCommerce p v c → Deontic.InInterstateOrForeignCommerce p c
axiom corr_nexus_ofCauses {p v : Person} {c : ComplaintText} :
    Elements.CausesIndividualToTravelInInterstateCommerce p v c → Deontic.InInterstateOrForeignCommerce p c
axiom corr_nexus_ofUses {p : Person} {c : ComplaintText} :
    Elements.UsesInterstateCommerceFacility p c → Deontic.InInterstateOrForeignCommerce p c
axiom corr_nexus_ofTravels {p : Person} {c : ComplaintText} :
    Elements.TravelsInInterstateOrForeignCommerce p c → Deontic.InInterstateOrForeignCommerce p c
axiom corr_nexus_ofFacilitation {p v : Person} {c : ComplaintText} :
    Elements.ArrangesOrFacilitatesTravel p v c → Deontic.InInterstateOrForeignCommerce p c


axiom corr_intentVice {p : Person} {c : ComplaintText} :
    Elements.IntentToEngageInProscribedSexualActivity p c → Deontic.IntentProstitutionOrChargeableActivity p c

axiom corr_intentIllicit {p : Person} {c : ComplaintText} :
    Elements.IntentToEngageInIllicitSexualConduct p c → Deontic.IntentIllicitSexualConduct p c

axiom corr_minor {v : Person} {c : ComplaintText} :
    Elements.IndividualUnderAge18 v c → Deontic.IndividualIsMinor c

axiom corr_citizen {p : Person} {c : ComplaintText} :
    Elements.IsUSCitizenOrPermanentResident p c → Deontic.IsUSCitizenOrLPR p c

axiom corr_abroad {p : Person} {c : ComplaintText} :
    Elements.TravelsInForeignCommerceOrResidesAbroad p c → Deontic.TraveledOrResidesAbroad p c

axiom corr_gain {p : Person} {c : ComplaintText} :
    Elements.ForCommercialAdvantageOrPrivateGain p c → Deontic.ForCommercialAdvantageOrGain p c

axiom corr_knowsTraveler {p : Person} {c : ComplaintText} :
    Elements.KnowsTravelerIntendsIllicitSexualConduct p c → Deontic.KnowsTravelerIllicitIntent p c



axiom corr_act_2421a {p v : Person} {c : ComplaintText} :
    Elements.Section2421a p v c → Deontic.KnowinglyTransportsForVice2421a p c
axiom corr_act_2422a {p v : Person} {c : ComplaintText} :
    Elements.Section2422a p v c → Deontic.KnowinglyEnticesTravelForVice2422a p c
axiom corr_act_2422b {p v : Person} {c : ComplaintText} :
    Elements.Section2422b p v c → Deontic.KnowinglyEnticesMinorForVice2422b p c
axiom corr_act_2423a {p v : Person} {c : ComplaintText} :
    Elements.Section2423a p v c → Deontic.KnowinglyTransportsMinorForVice2423a p c
axiom corr_act_2423b {p : Person} {c : ComplaintText} :
    Elements.Section2423b p c → Deontic.TravelsWithIllicitSexualIntent2423b p c
axiom corr_act_2423c {p : Person} {c : ComplaintText} :
    Elements.Section2423c p c → Deontic.EngagesInIllicitSexualConduct2423c p c
axiom corr_act_2423e {p v : Person} {c : ComplaintText} :
    Elements.Section2423e p v c → Deontic.FacilitatesViceTravel2423e p c




theorem s2421a_elements_implies_deontic {p v c} (h : Elements.Section2421a p v c) :
    Deontic.ProhibitionViolated2421a p c :=
  ⟨⟨corr_anyPerson_ofScienter h.scienter, corr_nexus_ofTransport h.transports,
    corr_intentVice h.intent⟩, corr_act_2421a h⟩


theorem s2422a_elements_implies_deontic {p v c} (h : Elements.Section2422a p v c) :
    Deontic.ProhibitionViolated2422a p c :=
  ⟨⟨corr_anyPerson_ofScienter h.scienter, corr_nexus_ofCauses h.causesTravel,
    corr_intentVice h.intent⟩, corr_act_2422a h⟩


theorem s2422b_elements_implies_deontic {p v c} (h : Elements.Section2422b p v c) :
    Deontic.ProhibitionViolated2422b p c :=
  ⟨⟨corr_anyPerson_ofScienter h.scienter, corr_nexus_ofUses h.usesCommerce,
    corr_minor h.minor, corr_intentVice h.intent⟩, corr_act_2422b h⟩


theorem s2423a_elements_implies_deontic {p v c} (h : Elements.Section2423a p v c) :
    Deontic.ProhibitionViolated2423a p c :=
  ⟨⟨corr_anyPerson_ofScienter h.scienter, corr_nexus_ofTransport h.transports,
    corr_minor h.minor, corr_intentVice h.intent⟩, corr_act_2423a h⟩


theorem s2423b_elements_implies_deontic {p c} (h : Elements.Section2423b p c) :
    Deontic.ProhibitionViolated2423b p c :=
  ⟨⟨corr_anyPerson_ofTravels h.travels, corr_nexus_ofTravels h.travels,
    corr_intentIllicit h.intent⟩, corr_act_2423b h⟩


theorem s2423c_elements_implies_deontic {p c} (h : Elements.Section2423c p c) :
    Deontic.ProhibitionViolated2423c p c :=
  ⟨⟨corr_citizen h.citizen, corr_abroad h.travels⟩, corr_act_2423c h⟩


theorem s2423e_elements_implies_deontic {p v c} (h : Elements.Section2423e p v c) :
    Deontic.ProhibitionViolated2423e p c :=
  ⟨⟨corr_anyPerson_ofFacilitation h.arranges, corr_nexus_ofFacilitation h.arranges,
    corr_gain h.purpose, corr_knowsTraveler h.knowsIntent⟩, corr_act_2423e h⟩












axiom corr_2424_addressee {p v : Person} {c : ComplaintText} :
    Elements.Section2424a p v c → Deontic.IsHarborerOfAlienForProstitution p c
axiom corr_2424_filing {p v : Person} {c : ComplaintText} :
    Elements.Section2424a p v c → Deontic.StatementBeingFiled p c
axiom corr_2424_falseAct {p : Person} {c : ComplaintText} :
    Elements.FalselyStatesOrFailsToDiscloseInStatement p c →
    Deontic.KnowinglyFalsifiesAlienStatement2424aFalse p c



theorem s2424_false_elements_implies_deontic_modulo_gaps {p v c}
    (h : Elements.Section2424a p v c)
    (gap_falseStatementTheory : Elements.FalselyStatesOrFailsToDiscloseInStatement p c) :
    Deontic.ProhibitionViolated2424aFalse p c :=
  ⟨⟨corr_2424_addressee h, corr_2424_filing h⟩, corr_2424_falseAct gap_falseStatementTheory⟩








axiom mapConductE : Person → ComplaintText → Ontology.Conduct
axiom corr_isc_sexualAct {p : Person} {c : ComplaintText} :
    Elements.SexualActWithMinorUnder18 p c →
    Ontology.IsSexualActCh109A (mapConductE p c) c ∧ Ontology.IsUnderAge18 p c
axiom corr_isc_commercial {p : Person} {c : ComplaintText} :
    Elements.CommercialSexActWithMinorUnder18 p c →
    Ontology.IsCommercialSexAct (mapConductE p c) c ∧ Ontology.IsUnderAge18 p c
axiom corr_isc_childPorn {p : Person} {c : ComplaintText} :
    Elements.ProducesChildPornography p c →
    Ontology.IsChildPornographyProduction (mapConductE p c) c


theorem s2423g_elements_implies_ontology {p c} (h : Elements.IllicitSexualConduct p c) :
    Ontology.IllicitSexualConductDef (mapConductE p c) p c :=
  match h with
  | .sexualAct hh =>
      let ⟨hAct, hAge⟩ := corr_isc_sexualAct hh; .sexualActUnder18 hAct hAge
  | .commercialSexAct hh =>
      let ⟨hAct, hAge⟩ := corr_isc_commercial hh; .commercialSexActUnder18 hAct hAge
  | .childPorn hh =>
      .childPornProduction (corr_isc_childPorn hh)






axiom corr_struct_2423a {p v : Person} {c : ComplaintText} :
    Elements.Section2423a p v c → Structure.Coherent2423 c
axiom corr_struct_2423b {p : Person} {c : ComplaintText} :
    Elements.Section2423b p c → Structure.Coherent2423 c
axiom corr_struct_2423c {p : Person} {c : ComplaintText} :
    Elements.Section2423c p c → Structure.Coherent2423 c
axiom corr_struct_2423e {p v : Person} {c : ComplaintText} :
    Elements.Section2423e p v c → Structure.Coherent2423 c
axiom corr_struct_2421A {p : Person} {c : ComplaintText} :
    Elements.Section2421A_b p c → Structure.Coherent2421A c


theorem s2423a_elements_implies_structure {p v c} (h : Elements.Section2423a p v c) :
    Structure.Coherent2423 c := corr_struct_2423a h

theorem s2423b_elements_implies_structure {p c} (h : Elements.Section2423b p c) :
    Structure.Coherent2423 c := corr_struct_2423b h

theorem s2423c_elements_implies_structure {p c} (h : Elements.Section2423c p c) :
    Structure.Coherent2423 c := corr_struct_2423c h

theorem s2423e_elements_implies_structure {p v c} (h : Elements.Section2423e p v c) :
    Structure.Coherent2423 c := corr_struct_2423e h

theorem s2421A_elements_implies_structure {p c} (h : Elements.Section2421A_b p c) :
    Structure.Coherent2421A c := corr_struct_2421A h






axiom corr_proc_injured {plaintiff defendant : Person} {c : ComplaintText} :
    Elements.Section2421A_c plaintiff defendant c → Procedure.InjuredByViolation plaintiff c
axiom corr_proc_harboring {p v : Person} {c : ComplaintText} :
    Elements.Section2424a p v c → Procedure.HarboringForProhibitedPurpose p c


theorem s2421A_c_elements_implies_procedure {plaintiff defendant c}
    (h : Elements.Section2421A_c plaintiff defendant c) :
    Procedure.InjuredByViolation plaintiff c := corr_proc_injured h

theorem s2424_elements_implies_procedure {p v c} (h : Elements.Section2424a p v c) :
    Procedure.HarboringForProhibitedPurpose p c := corr_proc_harboring h

end Proving.USC.T18.Ch117.Bridge
