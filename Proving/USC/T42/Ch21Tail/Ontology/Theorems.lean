




import Proving.USC.T42.Ch21Tail.Ontology.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T42.Ch21Tail.Ontology

open Proving.USC.Common



theorem protectedReporterMembership_intro
    {p : Person} {cond : InstitutionalCondition} {c : ComplaintText}
    (hReporter : IsReportingPerson p c) (hReportable : IsReportableCondition cond c)
    : ProtectedReporterMembership p cond c :=
  ⟨hReporter, hReportable⟩



theorem deprivingCondition_intro
    {cond : InstitutionalCondition} {c : ComplaintText}
    (h : DeprivesConstitutionalRight cond c)
    : DeprivingCondition cond c :=
  .constitutional h



theorem fundingPriorityMembership_intro
    {fund : Funds} {inst : Institution} {cond : InstitutionalCondition}
    {c : ComplaintText}
    (hFunds : IsFederalFunds fund c) (hInst : IsCoveredInstitution inst c)
    (hCond : DeprivingCondition cond c)
    : FundingPriorityMembership fund inst cond c :=
  ⟨hFunds, hInst, hCond⟩

end Proving.USC.T42.Ch21Tail.Ontology
