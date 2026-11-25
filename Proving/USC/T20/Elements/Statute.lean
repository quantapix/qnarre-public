




import Proving.USC.T20.Elements.Types
import Proving.USC.T20.Elements.Predicates
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

namespace Proving.USC.T20.Elements

open Proving.USC.Common






inductive Exclusion1681a (p : Person) (prog : EducationProgram)
    (c : ComplaintText) : Prop where
  | excluded (h : ExcludedFromParticipation p prog c)
  | denied (h : DeniedBenefits p prog c)
  | discriminated (h : SubjectedToDiscrimination p prog c)




structure NoExemptionApplies (prog : EducationProgram)
    (inst : EducationalInstitution) (c : ComplaintText) : Prop where
  admissionsScope : ¬ AdmissionsOutsideCoveredScope inst c
  transitionPlan : ¬ TransitionPlanExemption inst c
  religiousTenets : ¬ ReligiousTenetsExemption inst c
  militaryTraining : ¬ MilitaryTrainingExemption inst c
  traditionallySingleSex : ¬ TraditionallySingleSexAdmissionsExemption inst c
  membershipPractices : ¬ MembershipPracticesExemption prog c
  boysGirlsState : ¬ BoysGirlsStateConferenceExemption prog c
  fatherSonMotherDaughter : ¬ FatherSonMotherDaughterExemption prog c
  pageantScholarship : ¬ PageantScholarshipExemption inst c




structure Section1681a (p : Person) (prog : EducationProgram)
    (inst : EducationalInstitution) (c : ComplaintText) : Prop where
  personInUS : IsPersonInUS p c
  educationProgram : IsEducationProgramOrActivity prog c
  federalAssistance : ReceivesFederalFinancialAssistance prog c
  onBasisOfSex : OnBasisOfSex p prog c
  exclusion : Exclusion1681a p prog c
  noExemption : NoExemptionApplies prog inst c
  notSolelyStatistical : ¬ SolelyStatisticalImbalanceClaim p prog c



structure ValidTitleIXClaim (p : Person) (prog : EducationProgram)
    (inst : EducationalInstitution) (c : ComplaintText) : Prop where
  violation : Section1681a p prog inst c
  causation : ProximateCause p c
  timely : WithinLimitations p c






structure LawfulRulemaking1682 (ag : FundingAgency) (c : ComplaintText) : Prop where
  empowered : EmpoweredToExtendFederalAssistance ag c
  generalRule : IssuedRuleOfGeneralApplicability ag c
  consistent : RuleConsistentWithStatutoryObjectives ag c
  presidentialApproval : RuleApprovedByPresident ag c





structure LawfulTermination1682 (ag : FundingAgency) (act : AgencyAction)
    (r : Recipient) (c : ComplaintText) : Prop where
  rulemaking : LawfulRulemaking1682 ag c
  hearing : OpportunityForHearingAfforded r c
  expressFinding : ExpressFindingOfNoncomplianceOnRecord r c
  limitedToRecipient : TerminationLimitedToFoundRecipient act r c
  limitedToProgram : TerminationLimitedToParticularProgram act c
  advised : AdvisedPersonsOfNoncompliance ag r c
  voluntaryUnavailable : DeterminedVoluntaryComplianceUnavailable ag r c
  reportFiled : FiledFullWrittenReportWithCommittees act c
  thirtyDaysElapsed : ∃ n, DaysElapsedSinceReportFiling act c n ∧ 30 ≤ n




inductive Compliance1682 (ag : FundingAgency) (act : AgencyAction)
    (r : Recipient) (c : ComplaintText) : Prop where
  | termination (h : LawfulTermination1682 ag act r c)
  | otherMeans (hRule : LawfulRulemaking1682 ag c)
      (hAdvised : AdvisedPersonsOfNoncompliance ag r c)
      (hVoluntary : DeterminedVoluntaryComplianceUnavailable ag r c)
      (hOther : OtherMeansAuthorizedByLaw act c)






structure Section1683Review (p : Person) (act : AgencyAction)
    (c : ComplaintText) : Prop where
  pursuantTo1682 : ActionPursuantToSection1682 act c
  terminatesAssistance : ActionTerminatesOrRefusesAssistance act c
  noncomplianceFinding : ActionRestsOnNoncomplianceFinding act c
  notOtherwiseReviewable : NotOtherwiseSubjectToJudicialReview act c
  aggrieved : IsPersonAggrieved p act c




inductive JudicialReview1683 (p : Person) (act : AgencyAction)
    (c : ComplaintText) : Prop where
  | ordinary (hPursuant : ActionPursuantToSection1682 act c)
      (hReviewable : OtherwiseReviewableByLaw act c)
  | apa (h : Section1683Review p act c)

end Proving.USC.T20.Elements
