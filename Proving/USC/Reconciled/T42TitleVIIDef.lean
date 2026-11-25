
















































import Proving.USC.T42.TitleVIIDef.Elements.Theorems
import Proving.USC.T42.TitleVIIDef.Deontic.Theorems
import Proving.USC.T42.TitleVIIDef.Ontology.Theorems
import Proving.USC.T42.TitleVIIDef.Scienter.Theorems
import Proving.USC.T42.TitleVIIDef.Evidentiary.Theorems
import Proving.USC.T42.TitleVIIDef.Bridge

namespace Proving.USC.Reconciled

open Proving.USC.Common








abbrev ValidTitleVIIClaim := @T42.TitleVIIDef.Elements.ValidTitleVIIClaim





abbrev RespondentMembership := @T42.TitleVIIDef.Ontology.RespondentMembership


abbrev EmployerMembership := @T42.TitleVIIDef.Ontology.EmployerMembership




abbrev dt_agrees_deontic := @T42.TitleVIIDef.Bridge.dt_elements_implies_deontic

abbrev ret_agrees_deontic := @T42.TitleVIIDef.Bridge.ret_elements_implies_deontic

abbrev di_agrees_deontic := @T42.TitleVIIDef.Bridge.di_elements_implies_deontic

abbrev dt_agrees_scienter := @T42.TitleVIIDef.Bridge.dt_elements_implies_scienter

end Proving.USC.Reconciled
