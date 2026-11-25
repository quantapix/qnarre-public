



import Proving.USC.T20.Elements.Types
import Proving.USC.T20.Elements.Predicates
import Proving.USC.T20.Elements.Statute
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

namespace Proving.USC.T20.Elements

open Proving.USC.Common


theorem noExemptionApplies_intro {prog : EducationProgram}
    {inst : EducationalInstitution} {c : ComplaintText}
    (hAdm : ¬ AdmissionsOutsideCoveredScope inst c)
    (hTrans : ¬ TransitionPlanExemption inst c)
    (hRel : ¬ ReligiousTenetsExemption inst c)
    (hMil : ¬ MilitaryTrainingExemption inst c)
    (hTrad : ¬ TraditionallySingleSexAdmissionsExemption inst c)
    (hMem : ¬ MembershipPracticesExemption prog c)
    (hBoys : ¬ BoysGirlsStateConferenceExemption prog c)
    (hFather : ¬ FatherSonMotherDaughterExemption prog c)
    (hPageant : ¬ PageantScholarshipExemption inst c) :
    NoExemptionApplies prog inst c :=
  ⟨hAdm, hTrans, hRel, hMil, hTrad, hMem, hBoys, hFather, hPageant⟩


theorem section1681a_intro {p : Person} {prog : EducationProgram}
    {inst : EducationalInstitution} {c : ComplaintText}
    (hPerson : IsPersonInUS p c)
    (hProg : IsEducationProgramOrActivity prog c)
    (hFund : ReceivesFederalFinancialAssistance prog c)
    (hSex : OnBasisOfSex p prog c)
    (hExcl : Exclusion1681a p prog c)
    (hNoEx : NoExemptionApplies prog inst c)
    (hNoStat : ¬ SolelyStatisticalImbalanceClaim p prog c) :
    Section1681a p prog inst c :=
  ⟨hPerson, hProg, hFund, hSex, hExcl, hNoEx, hNoStat⟩


theorem validTitleIXClaim_intro {p : Person} {prog : EducationProgram}
    {inst : EducationalInstitution} {c : ComplaintText}
    (hViol : Section1681a p prog inst c)
    (hCause : ProximateCause p c)
    (hTime : WithinLimitations p c) :
    ValidTitleIXClaim p prog inst c :=
  ⟨hViol, hCause, hTime⟩


theorem lawfulRulemaking1682_intro {ag : FundingAgency} {c : ComplaintText}
    (hEmp : EmpoweredToExtendFederalAssistance ag c)
    (hRule : IssuedRuleOfGeneralApplicability ag c)
    (hCons : RuleConsistentWithStatutoryObjectives ag c)
    (hPres : RuleApprovedByPresident ag c) :
    LawfulRulemaking1682 ag c :=
  ⟨hEmp, hRule, hCons, hPres⟩


theorem lawfulTermination1682_intro {ag : FundingAgency} {act : AgencyAction}
    {r : Recipient} {c : ComplaintText}
    (hRule : LawfulRulemaking1682 ag c)
    (hHear : OpportunityForHearingAfforded r c)
    (hFind : ExpressFindingOfNoncomplianceOnRecord r c)
    (hLimR : TerminationLimitedToFoundRecipient act r c)
    (hLimP : TerminationLimitedToParticularProgram act c)
    (hAdv : AdvisedPersonsOfNoncompliance ag r c)
    (hVol : DeterminedVoluntaryComplianceUnavailable ag r c)
    (hRep : FiledFullWrittenReportWithCommittees act c)
    (hThirty : ∃ n, DaysElapsedSinceReportFiling act c n ∧ 30 ≤ n) :
    LawfulTermination1682 ag act r c :=
  ⟨hRule, hHear, hFind, hLimR, hLimP, hAdv, hVol, hRep, hThirty⟩


theorem section1683Review_intro {p : Person} {act : AgencyAction}
    {c : ComplaintText}
    (hPur : ActionPursuantToSection1682 act c)
    (hTerm : ActionTerminatesOrRefusesAssistance act c)
    (hFind : ActionRestsOnNoncomplianceFinding act c)
    (hNoRev : NotOtherwiseSubjectToJudicialReview act c)
    (hAggr : IsPersonAggrieved p act c) :
    Section1683Review p act c :=
  ⟨hPur, hTerm, hFind, hNoRev, hAggr⟩



example {act : AgencyAction} {c : ComplaintText}
    (h : DaysElapsedSinceReportFiling act c 45) :
    ∃ n, DaysElapsedSinceReportFiling act c n ∧ 30 ≤ n :=
  ⟨45, h, by decide⟩

end Proving.USC.T20.Elements
