import Proving.USC.T42.Ch21Misc.Ontology.Types
import Proving.USC.T42.Ch21Misc.Ontology.Predicates
import Proving.USC.T42.Ch21Misc.Ontology.Statute






namespace Proving.USC.T42.Ch21Misc.Ontology

open Proving.USC.Common




theorem programOrActivityMembership_govt_intro {e : Entity} {c : ComplaintText}
    (hOp : IsGovernmentalOperation e c)
    (hFFA : ReceivesFederalFinancialAssistance e c) :
    ProgramOrActivityMembership e c :=
  ProgramOrActivityMembership.govt hOp hFFA


theorem programOrActivityMembership_education_intro {e : Entity} {c : ComplaintText}
    (hOp : IsEducationalOperation e c)
    (hFFA : ReceivesFederalFinancialAssistance e c) :
    ProgramOrActivityMembership e c :=
  ProgramOrActivityMembership.education hOp hFFA


theorem programOrActivityMembership_privateOrg_intro {e : Entity} {c : ComplaintText}
    (hOp : IsPrivateOrganizationOperation e c)
    (hFFA : ReceivesFederalFinancialAssistance e c) :
    ProgramOrActivityMembership e c :=
  ProgramOrActivityMembership.privateOrg hOp hFFA


theorem programOrActivityMembership_joint_intro {e : Entity} {c : ComplaintText}
    (hOp : IsJointlyEstablishedEntity e c)
    (hFFA : ReceivesFederalFinancialAssistance e c) :
    ProgramOrActivityMembership e c :=
  ProgramOrActivityMembership.joint hOp hFFA




theorem employerControlsCorporation_intro {er : Employer} {corp : Corporation}
    {c : ComplaintText}
    (h1 : HasInterrelatedOperations er corp c)
    (h2 : HasCommonManagement er corp c)
    (h3 : HasCentralizedLaborRelationsControl er corp c)
    (h4 : HasCommonOwnershipOrFinancialControl er corp c) :
    EmployerControlsCorporation er corp c :=
  ⟨h1, h2, h3, h4⟩


theorem foreignPracticeAttribution_intro {er : Employer} {corp : Corporation}
    {c : ComplaintText}
    (hForeign : IsForeignIncorporated corp c)
    (hControl : EmployerControlsCorporation er corp c) :
    ForeignPracticeAttribution er corp c :=
  ⟨hForeign, hControl⟩


theorem religiousEmployerExemption_intro {e : Entity} {c : ComplaintText}
    (h : IsReligiousEntity e c) : ReligiousEmployerExemption e c :=
  ⟨h⟩


theorem alienOverseasExemption_intro {emp : EmploymentRelation} {c : ComplaintText}
    (h : IsEmploymentOfAliensOutsideStates emp c) : AlienOverseasExemption emp c :=
  ⟨h⟩


theorem foreignLawDefense_intro {emp : EmploymentRelation} {c : ComplaintText}
    (h : ForeignLawComplianceConflict emp c) : ForeignLawDefense emp c :=
  ⟨h⟩


theorem foreignEmployerCarveOut_intro {er : Employer} {c : ComplaintText}
    (h : IsForeignPersonNotAmericanControlled er c) : ForeignEmployerCarveOut er c :=
  ⟨h⟩




theorem preemptedStateLaw_intro {l : Law} {c : ComplaintText}
    (hState : IsStateOrLocalLaw l c)
    (hPurports : PurportsToRequireUnlawfulEmploymentPractice l c) :
    PreemptedStateLaw l c :=
  ⟨hState, hPurports⟩




theorem postingViolation_intro {e : Entity} {c : ComplaintText}
    (h : WillfulPostingViolation e c) : PostingViolation e c :=
  ⟨h⟩




theorem veteransPreferenceSaving_intro {l : Law} {c : ComplaintText}
    (h : IsVeteransPreferenceLaw l c) : VeteransPreferenceSaving l c :=
  ⟨h⟩




theorem commissionPersonnelProtection_intro {p : Person} {c : ComplaintText}
    (h : IsCommissionPersonnel p c) : CommissionPersonnelProtection p c :=
  ⟨h⟩




theorem acceptedPlanContractorProtection_intro {er : Employer}
    {pl : AffirmativeActionPlan} {c : ComplaintText}
    (hAccepted : IsAcceptedAffirmativeActionPlan pl c)
    (hNoDeviation : ¬ HasSubstantiallyDeviatedFromPlan er pl c) :
    AcceptedPlanContractorProtection er pl c :=
  ⟨hAccepted, hNoDeviation⟩

end Proving.USC.T42.Ch21Misc.Ontology
