





































































































import Proving.USC.T18.Ch13.Reslice.Deontic.Statute
import Proving.USC.T18.Ch13.Reslice.Elements.Statute
import Proving.USC.T18.Ch13.Reslice.Procedure.Statute
import Proving.USC.T18.Ch13.Reslice.Scienter.Statute
import Proving.USC.T18.Ch13.Reslice.Structure.Statute
import Proving.USC.T18.Ch13.Reslice.Ontology.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.Reconciled

open Proving.USC.Common
open Proving.USC.T18.Ch13.Reslice






abbrev Section245Violation := Elements.Section245b




abbrev ProtectedActivityTheory245b := Elements.ProtectedActivityTheory245b






abbrev Section245UncertifiedProsecutionDefect :=
  Procedure.Section245UncertifiedProsecutionDefect


abbrev Section245CertificationPrerequisite :=
  Procedure.Section245CertificationPrerequisite




abbrev InvestigationAuthorizedWithoutCertification :=
  Procedure.InvestigationAuthorizedWithoutCertification



abbrev Section245ViolationAttributable := Procedure.Section245ViolationAttributable




abbrev Obligation245bSentenceBreached := Deontic.Obligation245bSentenceBreached


abbrev Scienter245Culpable := Scienter.Scienter245Culpable











abbrev Section247Violation := Elements.Section247Violation


abbrev Section247a1 := Elements.Section247a1

abbrev Section247a2 := Elements.Section247a2


abbrev Section247c := Elements.Section247c




abbrev Section247CertificationPrerequisite :=
  Procedure.Section247CertificationPrerequisite






abbrev Section247LimitationBar := Procedure.Section247LimitationBar



abbrev Section247ProsecutionAuthorized := Procedure.Section247ProsecutionAuthorized



abbrev Obligation247dBreached := Deontic.Obligation247dBreached


abbrev Scienter247Culpable := Scienter.Scienter247Culpable










abbrev Section248Violation := Elements.Section248a





abbrev ProhibitedConduct248a := Elements.ProhibitedConduct248a



abbrev Section248SanctionsAvailable := Procedure.Section248SanctionsAvailable






abbrev Section248PrivateAction := Procedure.Section248PrivateAction


abbrev Section248CivilEnforcement := Procedure.Section248CivilEnforcement




abbrev Section248TimelyStatutoryDamagesElection :=
  Procedure.Section248TimelyStatutoryDamagesElection



abbrev Obligation248bBreached := Deontic.Obligation248bBreached


abbrev Scienter248Culpable := Scienter.Scienter248Culpable










abbrev StateMembership := Ontology.StateMembership

abbrev LawEnforcementOfficerMembership := Ontology.LawEnforcementOfficerMembership



abbrev FederallyProtectedActivityMembership :=
  Ontology.FederallyProtectedActivityMembership

abbrev PublicAccommodationMembership := Ontology.PublicAccommodationMembership

abbrev OwnerOccupiedSmallLodgingExemption :=
  Ontology.OwnerOccupiedSmallLodgingExemption



abbrev ReligiousRealPropertyMembership := Ontology.ReligiousRealPropertyMembership

abbrev FacilityMembership := Ontology.FacilityMembership

abbrev InterfereWithMembership := Ontology.InterfereWithMembership

abbrev IntimidateMembership := Ontology.IntimidateMembership

abbrev PhysicalObstructionMembership := Ontology.PhysicalObstructionMembership

abbrev ReproductiveHealthServicesMembership :=
  Ontology.ReproductiveHealthServicesMembership

abbrev NonviolentPhysicalObstructionMembership :=
  Ontology.NonviolentPhysicalObstructionMembership











abbrev Coherent245 := Structure.Coherent245

abbrev Coherent247 := Structure.Coherent247

abbrev Coherent248 := Structure.Coherent248

abbrev Ch13Ref := Structure.Ref

end Proving.USC.Reconciled
