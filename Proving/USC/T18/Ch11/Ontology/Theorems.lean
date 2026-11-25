





import Proving.USC.T18.Ch11.Ontology.Statute

namespace Proving.USC.T18.Ch11.Ontology

open Proving.USC.Common



theorem specialGovtEmployeeMembership_intro {p c}
    (hBase : IsOfficerOrEmployee p c) (hSge : IsSpecialGovernmentEmployee p c) :
    SpecialGovtEmployeeMembership p c := ⟨hBase, hSge⟩



theorem examinerMembership_intro {ex agency fi c}
    (hAgency : IsFederalFinancialInstitutionRegulatoryAgency agency c)
    (hFi : IsFinancialInstitution fi c) (hEx : IsExaminer ex c) :
    ExaminerMembership ex agency fi c := ⟨hAgency, hFi, hEx⟩


theorem officialActMembership_intro {m p c}
    (hAct : IsOfficialAct m c) (hOfficial : IsPublicOfficial p c) :
    OfficialActMembership m p c := ⟨hAct, hOfficial⟩



theorem continuingFinancialCrimesEnterpriseMembership_intro {ent fi c}
    (hEnt : IsContinuingFinancialCrimesEnterprise ent c)
    (hFi : IsFinancialInstitution fi c) :
    ContinuingFinancialCrimesEnterpriseMembership ent fi c := ⟨hEnt, hFi⟩


theorem memberOfCongressDefn_intro_senator {p c} (h : IsSenator p c) :
    MemberOfCongressDefn p c := .senator h


theorem memberOfCongressDefn_intro_representative {p c}
    (h : IsRepresentativeDelegateOrResidentCommissioner p c) :
    MemberOfCongressDefn p c := .representative h


theorem coveredGovernmentPersonDefn_intro_member {p c} (h : IsMemberOfCongress p c) :
    CoveredGovernmentPersonDefn p c := .member h


theorem coveredGovernmentPersonDefn_intro_congressional {p c}
    (h : IsCongressionalEmployee p c) : CoveredGovernmentPersonDefn p c := .congressional h


theorem coveredGovernmentPersonDefn_intro_executive {p c}
    (h : IsExecutiveBranchEmployee p c) : CoveredGovernmentPersonDefn p c := .executive h


theorem referralTargetDefn_intro_recoveryHome {e c} (h : IsRecoveryHome e c) :
    ReferralTargetDefn e c := .recoveryHome h


theorem referralTargetDefn_intro_clinicalTreatmentFacility {e c}
    (h : IsClinicalTreatmentFacility e c) : ReferralTargetDefn e c := .clinicalTreatmentFacility h


theorem referralTargetDefn_intro_laboratory {e c} (h : IsLaboratory e c) :
    ReferralTargetDefn e c := .laboratory h

end Proving.USC.T18.Ch11.Ontology
