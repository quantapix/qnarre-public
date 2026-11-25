













































import Proving.USC.T20.Elements.Statute
import Proving.USC.T20.Deontic.Statute
import Proving.USC.T20.Ontology.Statute
import Proving.USC.T20.Procedure.Statute
import Proving.USC.T20.Structure.Statute

namespace Proving.USC.Reconciled

open Proving.USC.T20
open Proving.USC.Common (ComplaintText)











abbrev Exclusion1681a := Elements.Exclusion1681a


abbrev NoExemptionApplies1681a := Elements.NoExemptionApplies


abbrev Section1681a := Elements.Section1681a

abbrev ValidTitleIXClaim := Elements.ValidTitleIXClaim

abbrev ProhibitionViolated1681a := Deontic.ProhibitionViolated1681a


abbrev ObligationBreached1681a8 := Deontic.ObligationBreached1681a8

abbrev PermissionHolds1681b := Deontic.PermissionHolds1681b

abbrev EducationalInstitutionDefinition := Ontology.EducationalInstitutionDefinition

abbrev CoveredProgramMembership := Ontology.CoveredProgramMembership


abbrev TransitionExemption1681 := Procedure.TransitionExemption1681


abbrev Applicability1681a (c : ComplaintText) : Prop := Structure.Applicability1681a c

abbrev Coherent1681 (c : ComplaintText) : Prop := Structure.Coherent1681 c




abbrev EffectiveRule1682 := Procedure.EffectiveRule1682

abbrev LawfulRulemaking1682 := Elements.LawfulRulemaking1682


abbrev TerminationAuthorized1682 := Procedure.TerminationAuthorized1682



abbrev LawfulTermination1682 := Elements.LawfulTermination1682



abbrev ComplianceMeans1682 := Procedure.ComplianceMeans1682

abbrev TerminationEffective1682 := Procedure.TerminationEffective1682

abbrev Step1682 := Procedure.Step

abbrev Reachable1682 := Procedure.Reachable


abbrev ProhibitionViolated1682Premature := Deontic.ProhibitionViolated1682Premature

abbrev ObligationBreached1682Report := Deontic.ObligationBreached1682Report

abbrev FederalAssistanceFormDefinition := Ontology.FederalAssistanceFormDefinition

abbrev Coherent1682 (c : ComplaintText) : Prop := Structure.Coherent1682 c




abbrev Section1683Review := Elements.Section1683Review

abbrev JudicialReview1683 := Elements.JudicialReview1683

abbrev ApaReviewAvailable1683 := Procedure.ApaReviewAvailable1683

abbrev PermissionHolds1683Review := Deontic.PermissionHolds1683Review

abbrev AggrievedPersonMembership := Ontology.AggrievedPersonMembership

abbrev ReviewPath1683 (c : ComplaintText) : Prop := Structure.ReviewPath1683 c


abbrev Coherent1683 (c : ComplaintText) : Prop := Structure.Coherent1683 c

end Proving.USC.Reconciled
