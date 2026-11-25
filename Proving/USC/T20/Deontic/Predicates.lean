import Proving.USC.Common.Types
import Proving.USC.T20.Deontic.Types






namespace Proving.USC.T20.Deontic

open Proving.USC.Common (Person Entity ComplaintText)





axiom IsPersonInUS (p : Person) (c : ComplaintText) : Prop



axiom IsEducationProgram (prog : Program) (c : ComplaintText) : Prop



axiom ReceivesFederalFinancialAssistance (prog : Program) (c : ComplaintText) : Prop





axiom SubjectedToSexDiscrimination (p : Person) (prog : Program) (c : ComplaintText) : Prop








axiom ExemptionApplies1681a (prog : Program) (c : ComplaintText) : Prop








axiom IsEducationalInstitution (e : Entity) (c : ComplaintText) : Prop






axiom SingleSexParentActivitiesProvided (e : Entity) (c : ComplaintText) : Prop




axiom ComparableOpportunitiesProvided (e : Entity) (c : ComplaintText) : Prop







axiom StatisticalImbalanceExists (e : Entity) (c : ComplaintText) : Prop








axiom IsFederalAgencyEmpoweredToAssist (a : Agency) (c : ComplaintText) : Prop





axiom IssuedEffectuatingRules (a : Agency) (c : ComplaintText) : Prop



axiom RuleIssuedByAgency (r : Rule) (a : Agency) (c : ComplaintText) : Prop



axiom RuleApprovedByPresident (r : Rule) (c : ComplaintText) : Prop



axiom RuleBecameEffective (r : Rule) (c : ComplaintText) : Prop




axiom ExpressFindingAfterHearing (a : Agency) (e : Entity) (c : ComplaintText) : Prop



axiom OtherMeansAuthorizedByLaw (a : Agency) (c : ComplaintText) : Prop




axiom TerminatedOrRefusedAssistance (a : Agency) (e : Entity) (c : ComplaintText) : Prop




axiom AdvisedOfNoncompliance (a : Agency) (e : Entity) (c : ComplaintText) : Prop




axiom VoluntaryComplianceUnobtainable (a : Agency) (e : Entity) (c : ComplaintText) : Prop





axiom FiledCongressionalReport (a : Agency) (c : ComplaintText) : Prop



axiom ThirtyDaysElapsedSinceReport (a : Agency) (c : ComplaintText) : Prop



axiom EnforcementActionBecameEffective (a : Agency) (e : Entity) (c : ComplaintText) : Prop






axiom IsPersonAggrieved (p : Person) (c : ComplaintText) : Prop



axiom ActionNotOtherwiseReviewable (a : Agency) (c : ComplaintText) : Prop

end Proving.USC.T20.Deontic
