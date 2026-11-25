





























import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Obstruction.Elements.Statute
import Proving.USC.T18.Obstruction.Deontic.Statute
import Proving.USC.T18.Obstruction.Ontology.Statute

namespace Proving.USC.T18.Obstruction.Bridge

open Proving.USC.Common






axiom corr_1503_addressee {p : Person} {c : ComplaintText} :
    Elements.UsedCorruptOrForcibleMeans p c → Deontic.AddresseeInClass1503 p c



axiom corr_1503_condition {opd : Deontic.OfficialProceeding} {c : ComplaintText} :
    FederalJurisdictionalNexus c → Deontic.ConditionMet1503 opd c


axiom corr_1503_act {p : Person} {ope : Elements.OfficialProceeding}
    {opd : Deontic.OfficialProceeding} {c : ComplaintText} :
    Elements.ObstructedDueAdministrationOfJustice p ope c → Deontic.RegulatedActOccurred1503 p opd c





theorem s1503_elements_implies_deontic
    {p : Person} {ope : Elements.OfficialProceeding} {opd : Deontic.OfficialProceeding}
    {c : ComplaintText}
    (h : Elements.Section1503Omnibus p ope c) : Deontic.Prohibition1503Violated p opd c :=
  ⟨⟨corr_1503_addressee h.means, corr_1503_condition (opd := opd) h.federal⟩,
   corr_1503_act (opd := opd) h.obstruct⟩





axiom corr_1512_addressee {p : Person} {w : Elements.ProtectedWitness} {c : ComplaintText} :
    Elements.IntimidatedOrCorruptlyPersuaded p w c → Deontic.AddresseeInClass1512 p c


axiom corr_1512_condition {p : Person} {ope : Elements.OfficialProceeding}
    {opd : Deontic.OfficialProceeding} {c : ComplaintText} :
    Elements.IntentToAffectProceedingOrCommunication p ope c → Deontic.ConditionMet1512 opd c


axiom corr_1512_noDefense {p : Person} {c : ComplaintText} :
    Elements.NotSolelyLawfulTruthfulConduct p c → ¬ Deontic.LawfulTruthfulDefense1512 p c

axiom corr_1512_act {p : Person} {w : Elements.ProtectedWitness}
    {opd : Deontic.OfficialProceeding} {c : ComplaintText} :
    Elements.IntimidatedOrCorruptlyPersuaded p w c → Deontic.RegulatedActOccurred1512 p opd c




theorem s1512_elements_implies_deontic
    {p : Person} {w : Elements.ProtectedWitness} {ope : Elements.OfficialProceeding}
    {opd : Deontic.OfficialProceeding} {c : ComplaintText}
    (h : Elements.Section1512Intimidation p w ope c) : Deontic.Prohibition1512Violated p opd c :=
  ⟨⟨corr_1512_addressee h.conduct, corr_1512_condition (opd := opd) h.intent,
    corr_1512_noDefense h.notDefense⟩,
   corr_1512_act (opd := opd) h.conduct⟩




axiom corr_1513_addressee {p : Person} {w : Elements.ProtectedWitness} {c : ComplaintText} :
    Elements.CausedBodilyInjuryOrPropertyDamage p w c → Deontic.AddresseeInClass1513 p c


axiom corr_1513_condition {p : Person} {ope : Elements.OfficialProceeding}
    {opd : Deontic.OfficialProceeding} {c : ComplaintText} :
    Elements.IntentToRetaliateForProtectedAct p ope c → Deontic.ConditionMet1513 opd c

axiom corr_1513_act {p : Person} {w : Elements.ProtectedWitness}
    {opd : Deontic.OfficialProceeding} {c : ComplaintText} :
    Elements.CausedBodilyInjuryOrPropertyDamage p w c → Deontic.RegulatedActOccurred1513 p opd c




theorem s1513_elements_implies_deontic
    {p : Person} {w : Elements.ProtectedWitness} {ope : Elements.OfficialProceeding}
    {opd : Deontic.OfficialProceeding} {c : ComplaintText}
    (h : Elements.Section1513Injury p w ope c) : Deontic.Prohibition1513Violated p opd c :=
  ⟨⟨corr_1513_addressee h.conduct, corr_1513_condition (opd := opd) h.intent⟩,
   corr_1513_act (opd := opd) h.conduct⟩












axiom corr_o_nexus {c : ComplaintText} :
    FederalJurisdictionalNexus c → Ontology.HasObstructionNexus c


axiom corr_o_1503_personnel {p : Person} {ope : Elements.OfficialProceeding} {c : ComplaintText} :
    Elements.ObstructedDueAdministrationOfJustice p ope c →
    Σ' (cp : Ontology.CourtPersonnel) (j : Ontology.DueAdministrationOfJustice),
      PLift (Ontology.IsCourtPersonnel cp c) × PLift (Ontology.IsDueAdministrationOfJustice j c)



theorem s1503_elements_implies_ontology
    {p : Person} {ope : Elements.OfficialProceeding} {c : ComplaintText}
    (h : Elements.Section1503Omnibus p ope c) :
    ∃ (cp : Ontology.CourtPersonnel) (j : Ontology.DueAdministrationOfJustice),
      Ontology.Section1503Object cp j c :=
  let ⟨cp, j, hcp, hj⟩ := corr_o_1503_personnel h.obstruct
  ⟨cp, j, ⟨hcp.down, hj.down, corr_o_nexus h.federal⟩⟩


axiom corr_o_1512_objects {p : Person} {w : Elements.ProtectedWitness}
    {ope : Elements.OfficialProceeding} {c : ComplaintText} :
    Elements.IntimidatedOrCorruptlyPersuaded p w c →
    Elements.IntentToAffectProceedingOrCommunication p ope c →
    Σ' (op' : Ontology.OfficialProceeding) (w' : Ontology.Witness),
      PLift (Ontology.IsOfficialProceeding op' c) × PLift (Ontology.IsWitness w' c)



theorem s1512_elements_implies_ontology
    {p : Person} {w : Elements.ProtectedWitness} {ope : Elements.OfficialProceeding}
    {c : ComplaintText}
    (h : Elements.Section1512Intimidation p w ope c) :
    ∃ (op' : Ontology.OfficialProceeding) (w' : Ontology.Witness),
      Ontology.Section1512WitnessObject op' w' c :=
  let ⟨op', w', hop, hw⟩ := corr_o_1512_objects h.conduct h.intent
  ⟨op', w', ⟨hop.down, hw.down, corr_o_nexus h.federal⟩⟩



axiom corr_o_1513_objects {p : Person} {w : Elements.ProtectedWitness}
    {ope : Elements.OfficialProceeding} {c : ComplaintText} :
    Elements.CausedBodilyInjuryOrPropertyDamage p w c →
    Elements.IntentToRetaliateForProtectedAct p ope c →
    Σ' (w' : Ontology.Witness) (op' : Ontology.OfficialProceeding),
      PLift (Ontology.IsWitness w' c) × PLift (Ontology.IsOfficialProceeding op' c)



theorem s1513_elements_implies_ontology
    {p : Person} {w : Elements.ProtectedWitness} {ope : Elements.OfficialProceeding}
    {c : ComplaintText}
    (h : Elements.Section1513Injury p w ope c) :
    ∃ (w' : Ontology.Witness) (op' : Ontology.OfficialProceeding),
      Ontology.Section1513Object w' op' c :=
  let ⟨w', op', hw, hop⟩ := corr_o_1513_objects h.conduct h.intent
  ⟨w', op', ⟨hw.down, hop.down, corr_o_nexus h.federal⟩⟩

end Proving.USC.T18.Obstruction.Bridge
