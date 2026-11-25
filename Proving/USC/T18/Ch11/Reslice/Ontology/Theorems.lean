import Proving.USC.Common.Types
import Proving.USC.T18.Ch11.Reslice.Ontology.Types
import Proving.USC.T18.Ch11.Reslice.Ontology.Predicates
import Proving.USC.T18.Ch11.Reslice.Ontology.Statute

set_option autoImplicit false
set_option relaxedAutoImplicit false









namespace Proving.USC.T18.Ch11.Reslice.Ontology

open Proving.USC.Common





theorem illegalRemunerationObject_intro
    {target program : Organization} {c : ComplaintText}
    (hTarget : ReferralTarget target c)
    (hProgram : IsHealthCareBenefitProgram program c)
    : IllegalRemunerationObject target program c :=
  { referralTarget := hTarget, underProgram := hProgram }



theorem examinerMembership_intro
    {p : Person} {agency : Organization} {c : ComplaintText}
    (hEx : IsExaminer p c)
    (hReg : IsFederalFinancialInstitutionRegulatoryAgency agency c)
    : ExaminerMembership p agency c :=
  { isExaminer := hEx, regulator := hReg }



theorem continuingFinancialCrimesEnterpriseMembership_intro
    {e fi : Organization} {c : ComplaintText}
    (hEnt : IsContinuingFinancialCrimesEnterprise e c)
    (hFin : IsFinancialInstitution fi c)
    : ContinuingFinancialCrimesEnterpriseMembership e fi c :=
  { isEnterprise := hEnt, affectsFinancialInst := hFin }




theorem referralTarget_ofRecoveryHome
    {o : Organization} {c : ComplaintText} (h : IsRecoveryHome o c)
    : ReferralTarget o c :=
  ReferralTarget.recoveryHome h


theorem referralTarget_ofClinicalTreatmentFacility
    {o : Organization} {c : ComplaintText} (h : IsClinicalTreatmentFacility o c)
    : ReferralTarget o c :=
  ReferralTarget.clinicalTreatmentFacility h


theorem referralTarget_ofLaboratory
    {o : Organization} {c : ComplaintText} (h : IsLaboratory o c)
    : ReferralTarget o c :=
  ReferralTarget.laboratory h

end Proving.USC.T18.Ch11.Reslice.Ontology
