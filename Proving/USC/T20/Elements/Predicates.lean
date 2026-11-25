




import Proving.USC.T20.Elements.Types
import Proving.USC.Common.Types

namespace Proving.USC.T20.Elements

open Proving.USC.Common





axiom OnBasisOfSex (p : Person) (prog : EducationProgram) (c : ComplaintText) : Prop



axiom ExcludedFromParticipation (p : Person) (prog : EducationProgram) (c : ComplaintText) : Prop



axiom DeniedBenefits (p : Person) (prog : EducationProgram) (c : ComplaintText) : Prop



axiom SubjectedToDiscrimination (p : Person) (prog : EducationProgram) (c : ComplaintText) : Prop



axiom IsEducationProgramOrActivity (prog : EducationProgram) (c : ComplaintText) : Prop




axiom ReceivesFederalFinancialAssistance (prog : EducationProgram) (c : ComplaintText) : Prop




axiom IsEducationalInstitution (inst : EducationalInstitution) (c : ComplaintText) : Prop






axiom AdmissionsOutsideCoveredScope (inst : EducationalInstitution) (c : ComplaintText) : Prop





axiom TransitionPlanExemption (inst : EducationalInstitution) (c : ComplaintText) : Prop




axiom ReligiousTenetsExemption (inst : EducationalInstitution) (c : ComplaintText) : Prop




axiom MilitaryTrainingExemption (inst : EducationalInstitution) (c : ComplaintText) : Prop





axiom TraditionallySingleSexAdmissionsExemption (inst : EducationalInstitution) (c : ComplaintText) : Prop






axiom MembershipPracticesExemption (prog : EducationProgram) (c : ComplaintText) : Prop





axiom BoysGirlsStateConferenceExemption (prog : EducationProgram) (c : ComplaintText) : Prop





axiom FatherSonMotherDaughterExemption (prog : EducationProgram) (c : ComplaintText) : Prop





axiom PageantScholarshipExemption (inst : EducationalInstitution) (c : ComplaintText) : Prop





axiom SolelyStatisticalImbalanceClaim (p : Person) (prog : EducationProgram) (c : ComplaintText) : Prop







axiom EmpoweredToExtendFederalAssistance (ag : FundingAgency) (c : ComplaintText) : Prop




axiom IssuedRuleOfGeneralApplicability (ag : FundingAgency) (c : ComplaintText) : Prop




axiom RuleConsistentWithStatutoryObjectives (ag : FundingAgency) (c : ComplaintText) : Prop




axiom RuleApprovedByPresident (ag : FundingAgency) (c : ComplaintText) : Prop




axiom OpportunityForHearingAfforded (r : Recipient) (c : ComplaintText) : Prop




axiom ExpressFindingOfNoncomplianceOnRecord (r : Recipient) (c : ComplaintText) : Prop




axiom TerminationLimitedToFoundRecipient (act : AgencyAction) (r : Recipient) (c : ComplaintText) : Prop




axiom TerminationLimitedToParticularProgram (act : AgencyAction) (c : ComplaintText) : Prop




axiom AdvisedPersonsOfNoncompliance (ag : FundingAgency) (r : Recipient) (c : ComplaintText) : Prop




axiom DeterminedVoluntaryComplianceUnavailable (ag : FundingAgency) (r : Recipient) (c : ComplaintText) : Prop




axiom OtherMeansAuthorizedByLaw (act : AgencyAction) (c : ComplaintText) : Prop





axiom FiledFullWrittenReportWithCommittees (act : AgencyAction) (c : ComplaintText) : Prop




axiom DaysElapsedSinceReportFiling (act : AgencyAction) (c : ComplaintText) (n : Nat) : Prop





axiom ActionPursuantToSection1682 (act : AgencyAction) (c : ComplaintText) : Prop




axiom ActionTerminatesOrRefusesAssistance (act : AgencyAction) (c : ComplaintText) : Prop




axiom ActionRestsOnNoncomplianceFinding (act : AgencyAction) (c : ComplaintText) : Prop




axiom NotOtherwiseSubjectToJudicialReview (act : AgencyAction) (c : ComplaintText) : Prop





axiom OtherwiseReviewableByLaw (act : AgencyAction) (c : ComplaintText) : Prop




axiom IsPersonAggrieved (p : Person) (act : AgencyAction) (c : ComplaintText) : Prop

end Proving.USC.T20.Elements
