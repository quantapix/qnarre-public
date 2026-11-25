





import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T42.Ch21Tail.Elements.Types
import Proving.USC.T42.Ch21Tail.Elements.Predicates
import Proving.USC.T42.Ch21Tail.Elements.Statute
import Proving.USC.T42.Ch21Tail.Elements.Doctrine

set_option autoImplicit false

namespace Proving.USC.T42.Ch21Tail.Elements

open Proving.USC.Common




theorem protectedReport1997d_intro
    {p : Person} {r : Report} {i : Institution} {c : ComplaintText}
    (hReported : MadeReportOfConditions p r c)
    (hConcerns : ConditionsReportedAtInstitution r i c)
    (hCovered : IsCoveredInstitution i c)
    (hMayViolate : ConditionsMayConstituteSubchapterViolation r c) :
    ProtectedReport1997d p r i c :=
  ⟨hReported, hConcerns, hCovered, hMayViolate⟩


theorem section1997d_intro
    {v d : Person} {r : Report} {i : Institution}
    {a : RetaliatoryAct} {c : ComplaintText}
    (hProtected : ReportedProtectedConditions v r i c)
    (hRetaliation : SubjectedToRetaliation v d a c)
    (hCausation : RetaliationBecauseOfReport a r c) :
    Section1997d v d r i a c :=
  ⟨hProtected, hRetaliation, hCausation⟩


theorem validSection1997dRetaliationClaim_intro
    {v d : Person} {r : Report} {i : Institution}
    {a : RetaliatoryAct} {c : ComplaintText}
    (hViolation : Section1997d v d r i a c)
    (hPerson : IsPersonInUS v c)
    (hInjury : SufferedCognizableInjury v c)
    (hProximate : ProximateCause v c)
    (hTimely : WithinLimitations v c) :
    ValidSection1997dRetaliationClaim v d r i a c :=
  ⟨hViolation, hPerson, hInjury, hProximate, hTimely⟩




theorem deprivationOfProtectedRights_constitutional_intro
    {i : Institution} {c : ComplaintText}
    (h : ConditionsDepriveConstitutionalRights i c) :
    DeprivationOfProtectedRights i c :=
  .constitutional h



theorem deprivationOfProtectedRights_federalStatutory_intro
    {i : Institution} {c : ComplaintText}
    (h : ConditionsDepriveFederalStatutoryRights i c) :
    DeprivationOfProtectedRights i c :=
  .federalStatutory h


theorem correctableConditions1997g_intro
    {i : Institution} {c : ComplaintText}
    (hCovered : IsCoveredInstitution i c)
    (hDeplorable : ConditionsAreDeplorable i c)
    (hDeprivation : DeprivationOfProtectedRights i c) :
    CorrectableConditions1997g i c :=
  ⟨hCovered, hDeplorable, hDeprivation⟩


theorem correctionRoute1997g_litigation_intro
    {i : Institution} {c : ComplaintText}
    (h : CorrectionSoughtByLitigation i c) :
    CorrectionRoute1997g i c :=
  .litigation h



theorem correctionRoute1997g_voluntaryGoodFaith_intro
    {i : Institution} {c : ComplaintText} (g : GovernmentAgency)
    (h : VoluntaryGoodFaithEffortByGovernmentAgency g i c) :
    CorrectionRoute1997g i c :=
  .voluntaryGoodFaith g h



theorem section1997gFundingPriority_intro
    {i : Institution} {f : FundingProgram} {c : ComplaintText}
    (hConditions : ConditionsWarrantCorrection i c)
    (hFunds : FederalFundsAvailableForInstitutionalImprovement i f c)
    (hPriority : PriorityGivenToCorrectionOfConditions i f c)
    (hNoRedirection : ¬ ReliefRequiresRedirectionOfFunds f c) :
    Section1997gFundingPriority i f c :=
  ⟨hConditions, hFunds, hPriority, hNoRedirection⟩

end Proving.USC.T42.Ch21Tail.Elements
