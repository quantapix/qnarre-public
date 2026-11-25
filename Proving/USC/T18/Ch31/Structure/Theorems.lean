import Proving.USC.T18.Ch31.Structure.Statute









namespace Proving.USC.T18.Ch31.Structure
open Proving.USC.Common


theorem coherent659_intro {c : ComplaintText}
    (hMedExists  : ReferencedSectionExists edge_659_incorporates_670 c)
    (hMedHonored : IncorporationHonored edge_659_incorporates_670 c)
    (hFine       : IncorporationHonored edge_659_incorporates_3571 c)
    (hField      : SavingsClauseHonored edge_659_savings_stateLaw c)
    (hStateBar   : SavingsClauseHonored edge_659_savings_statePriorAdjudication c)
    : Coherent659 c :=
  ⟨hMedExists, hMedHonored, hFine, hField, hStateBar⟩


theorem punishmentPath659_default_intro {c : ComplaintText}
    (h : ReferencedSectionExists edge_659_incorporates_3571 c) : PunishmentPath659 c :=
  .defaultUnder659 h


theorem punishmentPath659_routed_intro {c : ComplaintText}
    (h : OverrideTriggered edge_659_lexSpecialis_670 c) : PunishmentPath659 c :=
  .routedTo670 h


theorem coherent664_intro {c : ComplaintText}
    (hErisaExists  : ReferencedSectionExists edge_664_incorporates_erisaTitleI c)
    (hErisaHonored : IncorporationHonored edge_664_incorporates_erisaTitleI c)
    (hFine         : IncorporationHonored edge_664_incorporates_3571 c)
    : Coherent664 c :=
  ⟨hErisaExists, hErisaHonored, hFine⟩

end Proving.USC.T18.Ch31.Structure
