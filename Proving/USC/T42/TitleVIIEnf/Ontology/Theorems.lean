







import Proving.USC.T42.TitleVIIEnf.Ontology.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T42.TitleVIIEnf.Ontology

open Proving.USC.Common


theorem chargeMembership_intro {x : Charge} {r : Respondent} {p : Person}
    {c : ComplaintText}
    (hCharge : IsCharge x c)
    (hUEP : IsUnlawfulEmploymentPractice p c)
    (hResp : IsRespondent r c)
    (hAggr : IsAggrievedPerson p c)
    : ChargeMembership x r p c :=
  ⟨hCharge, hUEP, hResp, hAggr⟩


theorem respondentMembership_intro {r : Respondent} {p : Person}
    {c : ComplaintText}
    (hResp : IsRespondent r c) (hEmp : IsEmployer p c)
    : RespondentMembership r p c :=
  ⟨hResp, hEmp⟩



theorem generalCounselMembership_intro {p : Person} {x : Commission}
    {c : ComplaintText}
    (hGC : IsGeneralCounsel p c) (hComm : IsCommission x c)
    : GeneralCounselMembership p x c :=
  ⟨hGC, hComm⟩


theorem patternOrPracticeMembership_intro {x : PatternOrPractice} {p : Person}
    {c : ComplaintText}
    (hPat : IsPatternOrPractice x c) (hUEP : IsUnlawfulEmploymentPractice p c)
    : PatternOrPracticeMembership x p c :=
  ⟨hPat, hUEP⟩



theorem personnelActionMembership_intro {x : PersonnelAction} {p : Person}
    {c : ComplaintText}
    (hAct : IsPersonnelAction x c) (hEmp : IsEmployer p c)
    : PersonnelActionMembership x p c :=
  ⟨hAct, hEmp⟩



theorem conciliationAgreementMembership_intro {x : ConciliationAgreement}
    {r : Respondent} {c : ComplaintText}
    (hAgr : IsConciliationAgreement x c) (hResp : IsRespondent r c)
    : ConciliationAgreementMembership x r c :=
  ⟨hAgr, hResp⟩

end Proving.USC.T42.TitleVIIEnf.Ontology
