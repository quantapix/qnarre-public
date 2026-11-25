
















import Proving.USC.T18.Elements.Statute
import Proving.USC.T18.Deontic.Statute
import Proving.USC.T18.Ontology.Statute
import Proving.USC.T18.Procedure.Statute
import Proving.USC.T18.Remedy.Statute
import Proving.USC.Common.Predicates

namespace Proving.USC.T18.Bridge
open Proving.USC.Common




axiom corr_addressee {p : Person} {e : Entity} {c : ComplaintText} :
    Elements.EmployedOrAssociated p e c → Deontic.AddresseeInClass p e c


axiom corr_condition {e : Entity} {c : ComplaintText} :
    Elements.EngagedInInterstateCommerce e c → Deontic.ConditionMet e c



axiom corr_act {p : Person} {e : Entity} {acts : List Elements.Act} {c : ComplaintText} :
    Elements.ConductsOrParticipates p e c → Elements.PatternOfRacketeering acts c →
    Deontic.RegulatedActOccurred p e c




theorem s1962c_elements_implies_deontic
    {p : Person} {e : Entity} {acts : List Elements.Act} {c : ComplaintText}
    (h : Elements.Section1962c p e acts c)
    : Deontic.ProhibitionViolated1962c p e c :=
  ⟨⟨corr_addressee h.associated, corr_condition h.interstateCommerce⟩,
   corr_act h.conducts h.pattern⟩




axiom corr_o_enterprise {e : Entity} {c : ComplaintText} :
    Elements.IsEnterprise e c → Ontology.IsEnterprise e c

axiom corr_o_person {p : Person} {c : ComplaintText} :
    Elements.CulpablePersonCapableOfIntent p c → Ontology.IsPerson p c

axiom corr_o_pattern {acts : List Elements.Act} {c : ComplaintText} :
    Elements.PatternOfRacketeering acts c → Ontology.IsPatternOfRacketeering c


axiom corr_do_enterprise {e : Entity} {c : ComplaintText} :
    Deontic.ConditionMet e c → Ontology.IsEnterprise e c

axiom corr_do_person {p : Person} {e : Entity} {c : ComplaintText} :
    Deontic.AddresseeInClass p e c → Ontology.IsPerson p c


axiom corr_do_pattern {p : Person} {e : Entity} {c : ComplaintText} :
    Deontic.RegulatedActOccurred p e c → Ontology.IsPatternOfRacketeering c




theorem s1962c_elements_implies_ontology
    {p : Person} {e : Entity} {acts : List Elements.Act} {c : ComplaintText}
    (h : Elements.Section1962c p e acts c)
    : Ontology.Section1962cTermsInhabited p e c :=
  ⟨corr_o_person h.culpable, corr_o_enterprise h.enterprise, corr_o_pattern h.pattern⟩



theorem s1962c_deontic_implies_ontology
    {p : Person} {e : Entity} {c : ComplaintText}
    (h : Deontic.ProhibitionViolated1962c p e c)
    : Ontology.Section1962cTermsInhabited p e c :=
  ⟨corr_do_person h.1.addressee, corr_do_enterprise h.1.condition, corr_do_pattern h.2⟩






def s1962c_tierA_pairwise_discharge : Prop :=
  (∀ {p e acts c}, Elements.Section1962c p e acts c → Deontic.ProhibitionViolated1962c p e c)
  ∧ (∀ {p e acts c}, Elements.Section1962c p e acts c → Ontology.Section1962cTermsInhabited p e c)
  ∧ (∀ {p e c}, Deontic.ProhibitionViolated1962c p e c → Ontology.Section1962cTermsInhabited p e c)

theorem s1962c_tierA : s1962c_tierA_pairwise_discharge :=
  ⟨fun h => s1962c_elements_implies_deontic h,
   fun h => s1962c_elements_implies_ontology h,
   fun h => s1962c_deontic_implies_ontology h⟩












axiom corr_within_limitations {p : Person} {c : ComplaintText} :
    Procedure.WithinFourYearWindow p c → WithinLimitations p c

theorem procedure_timeliness_collapses_to_common
    {p : Person} {c : ComplaintText}
    (h : Procedure.TimelyFiling p c) : WithinLimitations p c :=
  corr_within_limitations h.inWindow



axiom corr_proximate_cause {p : Person} {c : ComplaintText} :
    Remedy.CausedByViolation p c → ProximateCause p c

theorem remedy_causation_collapses_to_common
    {p : Person} {c : ComplaintText}
    (h : Remedy.Standing1964c p c) : ProximateCause p c :=
  corr_proximate_cause h.causation

end Proving.USC.T18.Bridge
