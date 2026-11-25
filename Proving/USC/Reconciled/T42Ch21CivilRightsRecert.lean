







































































































import Proving.USC.T42.Ch21CivilRights.Recert.Elements.Statute
import Proving.USC.T42.Ch21CivilRights.Recert.Deontic.Statute
import Proving.USC.T42.Ch21CivilRights.Recert.Ontology.Statute
import Proving.USC.T42.Ch21CivilRights.Recert.Procedure.Statute

set_option autoImplicit false

namespace Proving.USC.Reconciled

open Proving.USC.Common
open Proving.USC.T42.Ch21CivilRights.Recert










abbrev Section2000dViolation : Person → Elements.Recipient → Elements.Program →
    ComplaintText → Prop := Elements.Section2000d



abbrev ValidSection2000dJudicialClaim : Person → Elements.Recipient →
    Elements.Program → ComplaintText → Prop :=
  Elements.ValidSection2000dJudicialClaim













abbrev ProgramOrActivity : Ontology.ProgramOrActivity → Entity →
    Ontology.FederalFinancialAssistance → ComplaintText → Prop :=
  Ontology.ProgramOrActivityMembership



abbrev ProgramOrActivityElements : Elements.Program → ComplaintText → Prop :=
  Elements.ProgramOrActivity2000d4a













abbrev Section2000d1Enforcement : Elements.FederalAgency → Elements.Requirement →
    Elements.Recipient → Elements.EnforcementAction → ComplaintText → Prop :=
  Elements.Section2000d1




abbrev AssistanceInstrumentDelimitation : Ontology.AssistanceInstrument →
    ComplaintText → Prop := Ontology.IsCoveredAssistanceMode











abbrev Section2000a4ServiceProcess : Procedure.ServiceReferral → ComplaintText → Prop :=
  Procedure.Section2000a4ServiceProcess









abbrev LawfulTestimonyRelease : Procedure.ServiceReferral → ComplaintText → Prop :=
  Procedure.TestimonyReleasePermitted









abbrev Section2000a5Action : Person → Elements.PatternOrPractice →
    Elements.Pleading → ComplaintText → Prop := Elements.Section2000a5Action










abbrev Section2000a5ThreeJudgeConvening : Procedure.AttorneyGeneralAction →
    Procedure.ThreeJudgeCourt → ComplaintText → Prop :=
  Procedure.ThreeJudgeCourtConvened





















abbrev Section2000d7Abrogation : Person → Elements.Violation → ComplaintText → Prop :=
  Elements.Section2000d7Abrogation


abbrev Section2000d7RemediesEqualization : Person → Elements.Violation →
    ComplaintText → Prop := Elements.Section2000d7RemediesEqualization

end Proving.USC.Reconciled
