import Proving.USC.Common.Types
import Proving.USC.T20.Deontic.Types
import Proving.USC.T20.Deontic.Predicates








namespace Proving.USC.T20.Deontic

open Proving.USC.Common (Person Entity ComplaintText)





structure Prohibition1681a (p : Person) (prog : Program) (c : ComplaintText) : Prop where
  protectedPerson : IsPersonInUS p c
  addressee : IsEducationProgram prog c
  condition : ReceivesFederalFinancialAssistance prog c
  noExemption : ¬ ExemptionApplies1681a prog c



def ProhibitionViolated1681a (p : Person) (prog : Program) (c : ComplaintText) : Prop :=
  Prohibition1681a p prog c ∧ SubjectedToSexDiscrimination p prog c





structure Obligation1681a8 (e : Entity) (c : ComplaintText) : Prop where
  addressee : IsEducationalInstitution e c
  condition : SingleSexParentActivitiesProvided e c



def ObligationBreached1681a8 (e : Entity) (c : ComplaintText) : Prop :=
  Obligation1681a8 e c ∧ ¬ ComparableOpportunitiesProvided e c







structure Permission1681b (e : Entity) (c : ComplaintText) : Prop where
  addressee : IsEducationalInstitution e c
  condition : StatisticalImbalanceExists e c


def PermissionHolds1681b (e : Entity) (c : ComplaintText) : Prop :=
  Permission1681b e c







structure Obligation1682Effectuate (a : Agency) (c : ComplaintText) : Prop where
  addressee : IsFederalAgencyEmpoweredToAssist a c



def ObligationBreached1682Effectuate (a : Agency) (c : ComplaintText) : Prop :=
  Obligation1682Effectuate a c ∧ ¬ IssuedEffectuatingRules a c





structure Prohibition1682Effectiveness (r : Rule) (a : Agency) (c : ComplaintText) : Prop where
  addressee : IsFederalAgencyEmpoweredToAssist a c
  issuedBy : RuleIssuedByAgency r a c
  condition : ¬ RuleApprovedByPresident r c



def ProhibitionViolated1682Effectiveness (r : Rule) (a : Agency) (c : ComplaintText) : Prop :=
  Prohibition1682Effectiveness r a c ∧ RuleBecameEffective r c







inductive ComplianceMeans1682 (a : Agency) (e : Entity) (c : ComplaintText) : Prop where
  | termination (finding : ExpressFindingAfterHearing a e c) : ComplianceMeans1682 a e c
  | otherMeans (authorized : OtherMeansAuthorizedByLaw a c) : ComplianceMeans1682 a e c




structure Permission1682Terminate (a : Agency) (e : Entity) (c : ComplaintText) : Prop where
  addressee : IsFederalAgencyEmpoweredToAssist a c
  condition : ExpressFindingAfterHearing a e c


def PermissionHolds1682Terminate (a : Agency) (e : Entity) (c : ComplaintText) : Prop :=
  Permission1682Terminate a e c







structure Prohibition1682Premature (a : Agency) (e : Entity) (c : ComplaintText) : Prop where
  addressee : IsFederalAgencyEmpoweredToAssist a c
  condition : ¬ (AdvisedOfNoncompliance a e c ∧ VoluntaryComplianceUnobtainable a e c)



def ProhibitionViolated1682Premature (a : Agency) (e : Entity) (c : ComplaintText) : Prop :=
  Prohibition1682Premature a e c ∧ TerminatedOrRefusedAssistance a e c





structure Obligation1682Report (a : Agency) (e : Entity) (c : ComplaintText) : Prop where
  addressee : IsFederalAgencyEmpoweredToAssist a c
  condition : TerminatedOrRefusedAssistance a e c



def ObligationBreached1682Report (a : Agency) (e : Entity) (c : ComplaintText) : Prop :=
  Obligation1682Report a e c ∧ ¬ FiledCongressionalReport a c





structure Prohibition1682ThirtyDay (a : Agency) (e : Entity) (c : ComplaintText) : Prop where
  addressee : IsFederalAgencyEmpoweredToAssist a c
  condition : ¬ ThirtyDaysElapsedSinceReport a c



def ProhibitionViolated1682ThirtyDay (a : Agency) (e : Entity) (c : ComplaintText) : Prop :=
  Prohibition1682ThirtyDay a e c ∧ EnforcementActionBecameEffective a e c






structure Permission1683Review (p : Person) (a : Agency) (e : Entity) (c : ComplaintText) : Prop where
  addressee : IsPersonAggrieved p c
  enforcementAction : TerminatedOrRefusedAssistance a e c
  condition : ActionNotOtherwiseReviewable a c


def PermissionHolds1683Review (p : Person) (a : Agency) (e : Entity) (c : ComplaintText) : Prop :=
  Permission1683Review p a e c

end Proving.USC.T20.Deontic
