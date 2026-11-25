import Proving.USC.Common.Types
import Proving.USC.T20.Deontic.Types
import Proving.USC.T20.Deontic.Predicates
import Proving.USC.T20.Deontic.Statute






namespace Proving.USC.T20.Deontic

open Proving.USC.Common (Person Entity ComplaintText)


theorem prohibitionViolated1681a_intro {p : Person} {prog : Program} {c : ComplaintText}
    (hPerson : IsPersonInUS p c)
    (hAddr : IsEducationProgram prog c)
    (hCond : ReceivesFederalFinancialAssistance prog c)
    (hNoEx : ¬ ExemptionApplies1681a prog c)
    (hAct : SubjectedToSexDiscrimination p prog c) :
    ProhibitionViolated1681a p prog c :=
  ⟨⟨hPerson, hAddr, hCond, hNoEx⟩, hAct⟩


theorem obligationBreached1681a8_intro {e : Entity} {c : ComplaintText}
    (hAddr : IsEducationalInstitution e c)
    (hCond : SingleSexParentActivitiesProvided e c)
    (hNoAct : ¬ ComparableOpportunitiesProvided e c) :
    ObligationBreached1681a8 e c :=
  ⟨⟨hAddr, hCond⟩, hNoAct⟩


theorem permissionHolds1681b_intro {e : Entity} {c : ComplaintText}
    (hAddr : IsEducationalInstitution e c)
    (hCond : StatisticalImbalanceExists e c) :
    PermissionHolds1681b e c :=
  ⟨hAddr, hCond⟩


theorem obligationBreached1682Effectuate_intro {a : Agency} {c : ComplaintText}
    (hAddr : IsFederalAgencyEmpoweredToAssist a c)
    (hNoAct : ¬ IssuedEffectuatingRules a c) :
    ObligationBreached1682Effectuate a c :=
  ⟨⟨hAddr⟩, hNoAct⟩


theorem prohibitionViolated1682Effectiveness_intro {r : Rule} {a : Agency} {c : ComplaintText}
    (hAddr : IsFederalAgencyEmpoweredToAssist a c)
    (hIssued : RuleIssuedByAgency r a c)
    (hNoApproval : ¬ RuleApprovedByPresident r c)
    (hAct : RuleBecameEffective r c) :
    ProhibitionViolated1682Effectiveness r a c :=
  ⟨⟨hAddr, hIssued, hNoApproval⟩, hAct⟩


theorem complianceMeans1682_termination_intro {a : Agency} {e : Entity} {c : ComplaintText}
    (hFinding : ExpressFindingAfterHearing a e c) :
    ComplianceMeans1682 a e c :=
  ComplianceMeans1682.termination hFinding


theorem complianceMeans1682_otherMeans_intro {a : Agency} {e : Entity} {c : ComplaintText}
    (hAuth : OtherMeansAuthorizedByLaw a c) :
    ComplianceMeans1682 a e c :=
  ComplianceMeans1682.otherMeans hAuth


theorem permissionHolds1682Terminate_intro {a : Agency} {e : Entity} {c : ComplaintText}
    (hAddr : IsFederalAgencyEmpoweredToAssist a c)
    (hCond : ExpressFindingAfterHearing a e c) :
    PermissionHolds1682Terminate a e c :=
  ⟨hAddr, hCond⟩


theorem prohibitionViolated1682Premature_intro {a : Agency} {e : Entity} {c : ComplaintText}
    (hAddr : IsFederalAgencyEmpoweredToAssist a c)
    (hNoPredicates : ¬ (AdvisedOfNoncompliance a e c ∧ VoluntaryComplianceUnobtainable a e c))
    (hAct : TerminatedOrRefusedAssistance a e c) :
    ProhibitionViolated1682Premature a e c :=
  ⟨⟨hAddr, hNoPredicates⟩, hAct⟩


theorem obligationBreached1682Report_intro {a : Agency} {e : Entity} {c : ComplaintText}
    (hAddr : IsFederalAgencyEmpoweredToAssist a c)
    (hCond : TerminatedOrRefusedAssistance a e c)
    (hNoAct : ¬ FiledCongressionalReport a c) :
    ObligationBreached1682Report a e c :=
  ⟨⟨hAddr, hCond⟩, hNoAct⟩


theorem prohibitionViolated1682ThirtyDay_intro {a : Agency} {e : Entity} {c : ComplaintText}
    (hAddr : IsFederalAgencyEmpoweredToAssist a c)
    (hNotElapsed : ¬ ThirtyDaysElapsedSinceReport a c)
    (hAct : EnforcementActionBecameEffective a e c) :
    ProhibitionViolated1682ThirtyDay a e c :=
  ⟨⟨hAddr, hNotElapsed⟩, hAct⟩


theorem permissionHolds1683Review_intro {p : Person} {a : Agency} {e : Entity} {c : ComplaintText}
    (hAddr : IsPersonAggrieved p c)
    (hAction : TerminatedOrRefusedAssistance a e c)
    (hCond : ActionNotOtherwiseReviewable a c) :
    PermissionHolds1683Review p a e c :=
  ⟨hAddr, hAction, hCond⟩

end Proving.USC.T20.Deontic
