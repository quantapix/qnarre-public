

















































































import Proving.USC.T42.Ch21Tail.Elements.Statute
import Proving.USC.T42.Ch21Tail.Deontic.Statute
import Proving.USC.T42.Ch21Tail.Procedure.Statute
import Proving.USC.T42.Ch21Tail.Ontology.Statute

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T42.Bridge

open Proving.USC.Common

















namespace EtoD



axiom corr_addressee
    {v d : Person} {a : Proving.USC.T42.Ch21Tail.Elements.RetaliatoryAct}
    {c : ComplaintText} :
    Proving.USC.T42.Ch21Tail.Elements.SubjectedToRetaliation v d a c →
    Proving.USC.T42.Ch21Tail.Deontic.AddresseeInClass1997d d c



axiom corr_report
    {v : Person} {r : Proving.USC.T42.Ch21Tail.Elements.Report} {c : ComplaintText} :
    Proving.USC.T42.Ch21Tail.Elements.MadeReportOfConditions v r c →
    Proving.USC.T42.Ch21Tail.Deontic.ProtectedReportMade v c




axiom corr_qualify
    {r : Proving.USC.T42.Ch21Tail.Elements.Report} {c : ComplaintText} :
    Proving.USC.T42.Ch21Tail.Elements.ConditionsMayConstituteSubchapterViolation r c →
    Proving.USC.T42.Ch21Tail.Deontic.ConditionsMayConstituteSubchapterViolation c



axiom corr_act
    {v d : Person} {a : Proving.USC.T42.Ch21Tail.Elements.RetaliatoryAct}
    {c : ComplaintText} :
    Proving.USC.T42.Ch21Tail.Elements.SubjectedToRetaliation v d a c →
    Proving.USC.T42.Ch21Tail.Deontic.RetaliationOccurred d v c





axiom corr_causation
    {v d : Person} {r : Proving.USC.T42.Ch21Tail.Elements.Report}
    {a : Proving.USC.T42.Ch21Tail.Elements.RetaliatoryAct} {c : ComplaintText} :
    Proving.USC.T42.Ch21Tail.Elements.SubjectedToRetaliation v d a c →
    Proving.USC.T42.Ch21Tail.Elements.RetaliationBecauseOfReport a r c →
    Proving.USC.T42.Ch21Tail.Deontic.RetaliationForSoReporting d v c


theorem s1997d_elements_implies_deontic
    {v d : Person} {r : Proving.USC.T42.Ch21Tail.Elements.Report}
    {i : Proving.USC.T42.Ch21Tail.Elements.Institution}
    {a : Proving.USC.T42.Ch21Tail.Elements.RetaliatoryAct} {c : ComplaintText}
    (h : Proving.USC.T42.Ch21Tail.Elements.Section1997d v d r i a c) :
    Proving.USC.T42.Ch21Tail.Deontic.Prohibition1997dViolated d v c :=
  ⟨⟨corr_addressee h.retaliation,
    corr_report h.protectedReport.reported,
    corr_qualify h.protectedReport.mayViolate⟩,
   corr_act h.retaliation,
   corr_causation h.retaliation h.causation⟩

end EtoD













namespace EtoP


axiom corr_reportStep
    {v : Person} {r : Proving.USC.T42.Ch21Tail.Elements.Report} {c : ComplaintText} :
    Proving.USC.T42.Ch21Tail.Elements.MadeReportOfConditions v r c →
    Proving.USC.T42.Ch21Tail.Procedure.ReportStepOccurred v c



axiom corr_within
    {v : Person} {r : Proving.USC.T42.Ch21Tail.Elements.Report} {c : ComplaintText} :
    Proving.USC.T42.Ch21Tail.Elements.ConditionsMayConstituteSubchapterViolation r c →
    Proving.USC.T42.Ch21Tail.Procedure.ReportedConditionsWithinSubchapter v c



axiom corr_adverseStep
    {v d : Person} {a : Proving.USC.T42.Ch21Tail.Elements.RetaliatoryAct}
    {c : ComplaintText} :
    Proving.USC.T42.Ch21Tail.Elements.SubjectedToRetaliation v d a c →
    Proving.USC.T42.Ch21Tail.Procedure.AdverseActionStepOccurred v c



axiom corr_because
    {v : Person} {r : Proving.USC.T42.Ch21Tail.Elements.Report}
    {a : Proving.USC.T42.Ch21Tail.Elements.RetaliatoryAct} {c : ComplaintText} :
    Proving.USC.T42.Ch21Tail.Elements.RetaliationBecauseOfReport a r c →
    Proving.USC.T42.Ch21Tail.Procedure.AdverseActionBecauseOfReport v c






theorem s1997d_elements_implies_procedure_modulo_gaps
    {v d : Person} {r : Proving.USC.T42.Ch21Tail.Elements.Report}
    {i : Proving.USC.T42.Ch21Tail.Elements.Institution}
    {a : Proving.USC.T42.Ch21Tail.Elements.RetaliatoryAct} {c : ComplaintText}
    {reportDay adverseDay : Nat}
    (h : Proving.USC.T42.Ch21Tail.Elements.Section1997d v d r i a c)
    (gap_reportDay :
      Proving.USC.T42.Ch21Tail.Procedure.ReportOccurredOnDay v c reportDay)
    (gap_adverseDay :
      Proving.USC.T42.Ch21Tail.Procedure.AdverseActionOccurredOnDay v c adverseDay)
    (gap_ordering :
      Proving.USC.T42.Ch21Tail.Procedure.ReportPrecedesAdverseAction reportDay adverseDay) :
    Proving.USC.T42.Ch21Tail.Procedure.Section1997dRetaliationEstablished
      v c reportDay adverseDay :=
  ⟨corr_reportStep h.protectedReport.reported,
   gap_reportDay,
   corr_within h.protectedReport.mayViolate,
   corr_adverseStep h.retaliation,
   gap_adverseDay,
   corr_because h.causation,
   gap_ordering⟩

end EtoP





namespace DtoP


axiom corr_reportStep {r : Person} {c : ComplaintText} :
    Proving.USC.T42.Ch21Tail.Deontic.ProtectedReportMade r c →
    Proving.USC.T42.Ch21Tail.Procedure.ReportStepOccurred r c



axiom corr_within {r : Person} {c : ComplaintText} :
    Proving.USC.T42.Ch21Tail.Deontic.ConditionsMayConstituteSubchapterViolation c →
    Proving.USC.T42.Ch21Tail.Procedure.ReportedConditionsWithinSubchapter r c


axiom corr_adverseStep {p r : Person} {c : ComplaintText} :
    Proving.USC.T42.Ch21Tail.Deontic.RetaliationOccurred p r c →
    Proving.USC.T42.Ch21Tail.Procedure.AdverseActionStepOccurred r c


axiom corr_because {p r : Person} {c : ComplaintText} :
    Proving.USC.T42.Ch21Tail.Deontic.RetaliationForSoReporting p r c →
    Proving.USC.T42.Ch21Tail.Procedure.AdverseActionBecauseOfReport r c



theorem s1997d_deontic_implies_procedure_modulo_gaps
    {p r : Person} {c : ComplaintText} {reportDay adverseDay : Nat}
    (h : Proving.USC.T42.Ch21Tail.Deontic.Prohibition1997dViolated p r c)
    (gap_reportDay :
      Proving.USC.T42.Ch21Tail.Procedure.ReportOccurredOnDay r c reportDay)
    (gap_adverseDay :
      Proving.USC.T42.Ch21Tail.Procedure.AdverseActionOccurredOnDay r c adverseDay)
    (gap_ordering :
      Proving.USC.T42.Ch21Tail.Procedure.ReportPrecedesAdverseAction reportDay adverseDay) :
    Proving.USC.T42.Ch21Tail.Procedure.Section1997dRetaliationEstablished
      r c reportDay adverseDay :=
  ⟨corr_reportStep h.1.protectedReport,
   gap_reportDay,
   corr_within h.1.reportedConditionsQualify,
   corr_adverseStep h.2.1,
   gap_adverseDay,
   corr_because h.2.2,
   gap_ordering⟩

end DtoP











namespace EtoO



axiom corr_reportingPerson
    {v : Person} {r : Proving.USC.T42.Ch21Tail.Elements.Report} {c : ComplaintText} :
    Proving.USC.T42.Ch21Tail.Elements.MadeReportOfConditions v r c →
    Proving.USC.T42.Ch21Tail.Ontology.IsReportingPerson v c






axiom corr_reportableCondition
    {r : Proving.USC.T42.Ch21Tail.Elements.Report} {c : ComplaintText} :
    Proving.USC.T42.Ch21Tail.Elements.ConditionsMayConstituteSubchapterViolation r c →
    ∃ cond : Proving.USC.T42.Ch21Tail.Ontology.InstitutionalCondition,
      Proving.USC.T42.Ch21Tail.Ontology.IsReportableCondition cond c



theorem s1997d_elements_implies_ontology
    {v d : Person} {r : Proving.USC.T42.Ch21Tail.Elements.Report}
    {i : Proving.USC.T42.Ch21Tail.Elements.Institution}
    {a : Proving.USC.T42.Ch21Tail.Elements.RetaliatoryAct} {c : ComplaintText}
    (h : Proving.USC.T42.Ch21Tail.Elements.Section1997d v d r i a c) :
    ∃ cond : Proving.USC.T42.Ch21Tail.Ontology.InstitutionalCondition,
      Proving.USC.T42.Ch21Tail.Ontology.ProtectedReporterMembership v cond c :=
  let ⟨cond, hReportable⟩ := corr_reportableCondition h.protectedReport.mayViolate
  ⟨cond, ⟨corr_reportingPerson h.protectedReport.reported, hReportable⟩⟩

end EtoO







namespace DtoO



axiom corr_reportingPerson {r : Person} {c : ComplaintText} :
    Proving.USC.T42.Ch21Tail.Deontic.ProtectedReportMade r c →
    Proving.USC.T42.Ch21Tail.Ontology.IsReportingPerson r c



axiom corr_reportableCondition {c : ComplaintText} :
    Proving.USC.T42.Ch21Tail.Deontic.ConditionsMayConstituteSubchapterViolation c →
    ∃ cond : Proving.USC.T42.Ch21Tail.Ontology.InstitutionalCondition,
      Proving.USC.T42.Ch21Tail.Ontology.IsReportableCondition cond c



theorem s1997d_deontic_implies_ontology
    {d v : Person} {c : ComplaintText}
    (h : Proving.USC.T42.Ch21Tail.Deontic.Prohibition1997dViolated d v c) :
    ∃ cond : Proving.USC.T42.Ch21Tail.Ontology.InstitutionalCondition,
      Proving.USC.T42.Ch21Tail.Ontology.ProtectedReporterMembership v cond c :=
  let ⟨cond, hReportable⟩ := corr_reportableCondition h.1.reportedConditionsQualify
  ⟨cond, ⟨corr_reportingPerson h.1.protectedReport, hReportable⟩⟩

end DtoO









namespace PtoO


axiom corr_reportingPerson {p : Person} {c : ComplaintText} :
    Proving.USC.T42.Ch21Tail.Procedure.ReportStepOccurred p c →
    Proving.USC.T42.Ch21Tail.Ontology.IsReportingPerson p c



axiom corr_reportableCondition {p : Person} {c : ComplaintText} :
    Proving.USC.T42.Ch21Tail.Procedure.ReportedConditionsWithinSubchapter p c →
    ∃ cond : Proving.USC.T42.Ch21Tail.Ontology.InstitutionalCondition,
      Proving.USC.T42.Ch21Tail.Ontology.IsReportableCondition cond c


theorem s1997d_procedure_implies_ontology
    {p : Person} {c : ComplaintText} {reportDay adverseDay : Nat}
    (h : Proving.USC.T42.Ch21Tail.Procedure.Section1997dRetaliationEstablished
      p c reportDay adverseDay) :
    ∃ cond : Proving.USC.T42.Ch21Tail.Ontology.InstitutionalCondition,
      Proving.USC.T42.Ch21Tail.Ontology.ProtectedReporterMembership p cond c :=
  let ⟨cond, hReportable⟩ := corr_reportableCondition h.withinSubchapter
  ⟨cond, ⟨corr_reportingPerson h.reported, hReportable⟩⟩

end PtoO

end Proving.USC.T42.Bridge
