


























import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.CommercePredicates.Elements.Statute
import Proving.USC.T18.CommercePredicates.Deontic.Statute
import Proving.USC.T18.CommercePredicates.Ontology.Statute
import Proving.USC.T18.CommercePredicates.Procedure.Statute

namespace Proving.USC.T18.CommercePredicates.Bridge

open Proving.USC.Common









axiom corr58_addressee {p : Person} {c : ComplaintText} :
    Elements.IntentThatMurderCommitted p c → Deontic.AddresseeInClass1958 p c



axiom corr58_condition {p : Person} {c : ComplaintText} :
    Elements.IntentThatMurderCommitted p c → Elements.AsConsiderationForPecuniaryValue p c →
    Deontic.ConditionMet1958 p c






axiom corr58_act {p : Person} {f : Elements.CommerceFacility} {fd : Deontic.CommerceFacility}
    {c : ComplaintText} :
    Elements.JurisdictionalMeans1958 p f c → Deontic.RegulatedActOccurred1958 p fd c



theorem s1958_elements_implies_deontic
    {p : Person} {f : Elements.CommerceFacility} {fd : Deontic.CommerceFacility}
    {c : ComplaintText}
    (h : Elements.Section1958Completed p f c)
    : Deontic.Prohibition1958Violated p fd c :=
  ⟨⟨corr58_addressee h.intent, corr58_condition h.intent h.consideration⟩,
   corr58_act (fd := fd) h.means⟩








axiom corr58_proc_used {p : Person} {f : Elements.CommerceFacility} {c : ComplaintText} :
    Elements.JurisdictionalMeans1958 p f c → Procedure.InterstateFacilityUsed p c



theorem s1958_elements_implies_procedure
    {p : Person} {f : Elements.CommerceFacility} {c : ComplaintText}
    (h : Elements.Section1958Completed p f c)
    : Procedure.FacilityUseOccurred p c :=
  ⟨corr58_proc_used h.means⟩










axiom corr58_do_proc {p : Person} {fd : Deontic.CommerceFacility} {c : ComplaintText} :
    Deontic.RegulatedActOccurred1958 p fd c → Procedure.InterstateFacilityUsed p c



theorem s1958_deontic_implies_procedure
    {p : Person} {fd : Deontic.CommerceFacility} {c : ComplaintText}
    (h : Deontic.Prohibition1958Violated p fd c)
    : Procedure.FacilityUseOccurred p c :=
  ⟨corr58_do_proc h.2⟩











axiom corr60_addressee {p : Person} {b : Elements.MoneyTransmittingBusiness}
    {bd : Deontic.MoneyTransmittingBusiness} {c : ComplaintText} :
    Elements.KnowinglyConductsMTB p b c → Deontic.AddresseeInClass1960 p bd c



axiom corr60_condition {b : Elements.MoneyTransmittingBusiness}
    {bd : Deontic.MoneyTransmittingBusiness} {c : ComplaintText} :
    Elements.IsMoneyTransmittingBusiness b c → Elements.UnlicensedRoute1960 b c →
    Deontic.ConditionMet1960 bd c


axiom corr60_act {p : Person} {b : Elements.MoneyTransmittingBusiness}
    {bd : Deontic.MoneyTransmittingBusiness} {c : ComplaintText} :
    Elements.KnowinglyConductsMTB p b c → Deontic.RegulatedActOccurred1960 p bd c


theorem s1960_elements_implies_deontic
    {p : Person} {b : Elements.MoneyTransmittingBusiness}
    {bd : Deontic.MoneyTransmittingBusiness} {e : Entity} {c : ComplaintText}
    (h : Elements.Section1960 p b e c)
    : Deontic.Prohibition1960Violated p bd c :=
  ⟨⟨corr60_addressee (bd := bd) h.knowingConduct, corr60_condition (bd := bd) h.isMTB h.unlicensed⟩,
   corr60_act (bd := bd) h.knowingConduct⟩







axiom corr60_o_biz {b : Elements.MoneyTransmittingBusiness}
    {bo : Ontology.MoneyTransmittingBusiness} {c : ComplaintText} :
    Elements.IsMoneyTransmittingBusiness b c → Ontology.IsMoneyTransmittingBusiness bo c



axiom corr60_o_noState {b : Elements.MoneyTransmittingBusiness}
    {bo : Ontology.MoneyTransmittingBusiness} {c : ComplaintText} :
    Elements.OperatedWithoutStateLicense b c → Ontology.LacksStateLicense bo c
axiom corr60_o_noReg {b : Elements.MoneyTransmittingBusiness}
    {bo : Ontology.MoneyTransmittingBusiness} {c : ComplaintText} :
    Elements.FailsSection5330Registration b c → Ontology.FailsFederalRegistration bo c
axiom corr60_o_criminal {b : Elements.MoneyTransmittingBusiness}
    {bo : Ontology.MoneyTransmittingBusiness} {c : ComplaintText} :
    Elements.InvolvesCriminallyDerivedFunds b c → Ontology.InvolvesCriminalProceeds bo c



theorem s1960_route_implies_ontology_condition
    {b : Elements.MoneyTransmittingBusiness} {bo : Ontology.MoneyTransmittingBusiness}
    {c : ComplaintText}
    (h : Elements.UnlicensedRoute1960 b c) : Ontology.UnlicensedCondition bo c :=
  match h with
  | .noStateLicense hh => .noStateLicense (corr60_o_noState (bo := bo) hh)
  | .noRegistration hh => .noFedRegistration (corr60_o_noReg (bo := bo) hh)
  | .criminalFunds  hh => .criminalProceeds (corr60_o_criminal (bo := bo) hh)




theorem s1960_elements_implies_ontology
    {p : Person} {b : Elements.MoneyTransmittingBusiness}
    {bo : Ontology.MoneyTransmittingBusiness} {e : Entity} {c : ComplaintText}
    (h : Elements.Section1960 p b e c)
    : Ontology.UnlicensedMoneyTransmittingBusinessDef bo c :=
  ⟨corr60_o_biz (bo := bo) h.isMTB, s1960_route_implies_ontology_condition (bo := bo) h.unlicensed⟩











axiom corr60_proc_A {b : Elements.MoneyTransmittingBusiness}
    {bp : Procedure.MoneyTransmittingBusiness} {c : ComplaintText} :
    Elements.OperatedWithoutStateLicense b c → Procedure.UnlicensedOperation bp c

axiom corr60_proc_B {b : Elements.MoneyTransmittingBusiness}
    {bp : Procedure.MoneyTransmittingBusiness} {c : ComplaintText} :
    Elements.FailsSection5330Registration b c → Procedure.RegistrationDefault bp c




axiom gap_proc_C {b : Elements.MoneyTransmittingBusiness}
    {bp : Procedure.MoneyTransmittingBusiness} {c : ComplaintText} :
    Elements.InvolvesCriminallyDerivedFunds b c → Procedure.OffendingComplianceState bp c





theorem s1960_elements_implies_procedure_modulo_gaps
    {p : Person} {b : Elements.MoneyTransmittingBusiness}
    {bp : Procedure.MoneyTransmittingBusiness} {e : Entity} {c : ComplaintText}
    (h : Elements.Section1960 p b e c)
    : Procedure.OffendingComplianceState bp c :=
  match h.unlicensed with
  | .noStateLicense hh => .viaUnlicensed (corr60_proc_A (bp := bp) hh)
  | .noRegistration hh => .viaRegistration (corr60_proc_B (bp := bp) hh)
  | .criminalFunds  hh => gap_proc_C (bp := bp) hh









def s1958_tierA_pairwise : Prop :=
  (∀ {p : Person} {f : Elements.CommerceFacility} {fd : Deontic.CommerceFacility} {c},
      Elements.Section1958Completed p f c → Deontic.Prohibition1958Violated p fd c)
  ∧ (∀ {p : Person} {f : Elements.CommerceFacility} {c},
      Elements.Section1958Completed p f c → Procedure.FacilityUseOccurred p c)
  ∧ (∀ {p : Person} {fd : Deontic.CommerceFacility} {c},
      Deontic.Prohibition1958Violated p fd c → Procedure.FacilityUseOccurred p c)

theorem s1958_tierA : s1958_tierA_pairwise :=
  ⟨fun {_ _ fd _} h => s1958_elements_implies_deontic (fd := fd) h,
   fun h => s1958_elements_implies_procedure h,
   fun h => s1958_deontic_implies_procedure h⟩

def s1960_tierA_pairwise : Prop :=
  (∀ {p : Person} {b : Elements.MoneyTransmittingBusiness}
      {bd : Deontic.MoneyTransmittingBusiness} {e : Entity} {c},
      Elements.Section1960 p b e c → Deontic.Prohibition1960Violated p bd c)
  ∧ (∀ {p : Person} {b : Elements.MoneyTransmittingBusiness}
      {bo : Ontology.MoneyTransmittingBusiness} {e : Entity} {c},
      Elements.Section1960 p b e c → Ontology.UnlicensedMoneyTransmittingBusinessDef bo c)

theorem s1960_tierA : s1960_tierA_pairwise :=
  ⟨fun {_ _ bd _ _} h => s1960_elements_implies_deontic (bd := bd) h,
   fun {_ _ bo _ _} h => s1960_elements_implies_ontology (bo := bo) h⟩

end Proving.USC.T18.CommercePredicates.Bridge
