






























import Proving.USC.T42.ReligiousFreedom.Elements.Statute
import Proving.USC.T42.ReligiousFreedom.Deontic.Statute
import Proving.USC.T42.ReligiousFreedom.Ontology.Statute
import Proving.USC.T42.ReligiousFreedom.Procedure.Statute
import Proving.USC.T42.ReligiousFreedom.Structure.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T42.ReligiousFreedom.Bridge

open Proving.USC.Common
open Proving.USC.T42.ReligiousFreedom

















axiom corr_1996a_addressee {p : Person} {ea : Elements.PeyoteAct} {c : ComplaintText} :
    Elements.PenalizedOrDiscriminatedForPeyote p ea c →
    Deontic.AddresseeUnitedStatesOrState p c





axiom corr_1996a_condition {p : Person} {ea : Elements.PeyoteAct} {da : Deontic.Act}
    {c : ComplaintText} :
    Elements.IsIndianTribeMember p c →
    Elements.IsPeyoteUsePossessionTransport ea c →
    Elements.IsBonaFideCeremonialPurpose ea c →
    Elements.InConnectionWithTraditionalIndianReligion ea c →
    Deontic.CeremonialPeyoteUseQualifies p da c




axiom corr_1996a_violation {p : Person} {ea : Elements.PeyoteAct} {da : Deontic.Act}
    {c : ComplaintText} :
    Elements.PenalizedOrDiscriminatedForPeyote p ea c →
    Deontic.PenalizedOnBasisOfCeremonialUse p da c






theorem s1996a_elements_implies_deontic
    {p : Person} {ea : Elements.PeyoteAct} {da : Deontic.Act} {c : ComplaintText}
    (h : Elements.Section1996a p ea c)
    : Deontic.Prohibition1996aViolated p da c :=
  ⟨⟨corr_1996a_addressee h.adverseAction,
    corr_1996a_condition h.indian h.peyoteAct h.ceremonial h.inReligion⟩,
   corr_1996a_violation h.adverseAction⟩












axiom corr_1996a_o_tribe {p : Person} {t : Ontology.IndianTribe} {c : ComplaintText} :
    Elements.IsIndianTribeMember p c → Ontology.IsIndianTribe t c




theorem s1996a_elements_implies_ontology
    {p : Person} {ea : Elements.PeyoteAct} {t : Ontology.IndianTribe} {c : ComplaintText}
    (h : Elements.Section1996a p ea c)
    : Ontology.IndianTribeMembership t c :=
  ⟨corr_1996a_o_tribe h.indian⟩















axiom corr_1996b_addressee {p : Person} {c : ComplaintText} :
    Elements.IsAdoptionFosterPlacementActor p c →
    Deontic.AddresseeAdoptionPlacementActor p c




axiom corr_1996b_condition {p : Person} {c : ComplaintText} :
    Elements.IsAdoptionFosterPlacementActor p c →
    Deontic.ConditionInvolvedInPlacements p c





axiom corr_1996b_violation {p : Person} {d : Elements.PlacementDecision} {da : Deontic.Act}
    {c : ComplaintText} :
    Elements.InterethnicViolationTheory p d c →
    Elements.OnBasisOfRaceColorNationalOrigin p d c →
    Deontic.DeniedPlacementOnRacialBasis p da c






theorem s1996b_elements_implies_deontic
    {p : Person} {d : Elements.PlacementDecision} {da : Deontic.Act} {c : ComplaintText}
    (h : Elements.Section1996b p d c)
    : Deontic.Prohibition1996bViolated p da c :=
  ⟨⟨corr_1996b_addressee h.actor, corr_1996b_condition h.actor⟩,
   corr_1996b_violation h.prohibited h.onBasisOf⟩











axiom corr_1996b_proc_inProcess {p : Person} {c : ComplaintText} :
    Elements.IsAdoptionFosterPlacementActor p c → Procedure.InPlacementProcess p c




axiom corr_1996b_proc_noncompliance {p : Person} {d : Elements.PlacementDecision}
    {c : ComplaintText} :
    Elements.InterethnicViolationTheory p d c →
    Elements.OnBasisOfRaceColorNationalOrigin p d c →
    Procedure.PlacementNoncomplianceOccurred p c




theorem s1996b_elements_implies_procedure
    {p : Person} {d : Elements.PlacementDecision} {c : ComplaintText}
    (h : Elements.Section1996b p d c)
    : Procedure.PlacementViolationRouted p c :=
  ⟨corr_1996b_proc_inProcess h.actor,
   corr_1996b_proc_noncompliance h.prohibited h.onBasisOf⟩
































axiom gap_1996_sovereign_addressee {p : Person} {c : ComplaintText} :
    Elements.Section1996 p c → Deontic.AddresseeUnitedStates p c



axiom gap_1996_post1978_condition {p : Person} {c : ComplaintText} :
    Elements.Section1996 p c → Deontic.ConditionOnOrAfter1978 c








theorem s1996_elements_implies_deontic_modulo_gaps
    {p : Person} {c : ComplaintText}
    (h : Elements.Section1996 p c)
    : Deontic.Obligation1996 p c :=
  ⟨gap_1996_sovereign_addressee h, gap_1996_post1978_condition h⟩

end Proving.USC.T42.ReligiousFreedom.Bridge
