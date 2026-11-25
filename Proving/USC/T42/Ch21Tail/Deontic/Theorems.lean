





import Proving.USC.Common.Types
import Proving.USC.T42.Ch21Tail.Deontic.Types
import Proving.USC.T42.Ch21Tail.Deontic.Predicates
import Proving.USC.T42.Ch21Tail.Deontic.Statute

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T42.Ch21Tail.Deontic

open Proving.USC.Common




theorem prohibition1997dViolated_intro
    {p r : Person} {c : ComplaintText}
    (hAddr : AddresseeInClass1997d p c)
    (hReport : ProtectedReportMade r c)
    (hQualify : ConditionsMayConstituteSubchapterViolation c)
    (hAct : RetaliationOccurred p r c)
    (hNexus : RetaliationForSoReporting p r c) :
    Prohibition1997dViolated p r c :=
  ⟨⟨hAddr, hReport, hQualify⟩, hAct, hNexus⟩




theorem obligation1997gCorrectionBreached_intro
    {a : Entity} {i : Institution} {c : ComplaintText}
    (hAddr : AddresseeInClass1997g a c)
    (hCovered : InstitutionCoveredBySubchapter i c)
    (hConditions : DeplorableConditionsDepriveRights i c)
    (hOmission : ¬ VoluntaryGoodFaithCorrectionUndertaken a i c) :
    Obligation1997gCorrectionBreached a i c :=
  ⟨⟨hAddr, hCovered, hConditions⟩, hOmission⟩


theorem obligation1997gCorrectionFulfilled_intro
    {a : Entity} {i : Institution} {c : ComplaintText}
    (hAddr : AddresseeInClass1997g a c)
    (hCovered : InstitutionCoveredBySubchapter i c)
    (hConditions : DeplorableConditionsDepriveRights i c)
    (hAct : VoluntaryGoodFaithCorrectionUndertaken a i c) :
    Obligation1997gCorrectionFulfilled a i c :=
  ⟨⟨hAddr, hCovered, hConditions⟩, hAct⟩




theorem obligation1997gPriorityBreached_intro
    {a : Entity} {i : Institution} {c : ComplaintText}
    (hAddr : AddresseeInClass1997g a c)
    (hCovered : InstitutionCoveredBySubchapter i c)
    (hConditions : DeplorableConditionsDepriveRights i c)
    (hFunds : FederalFundsAvailableForImprovement i c)
    (hOmission : ¬ PriorityGivenToConditionCorrection a i c) :
    Obligation1997gPriorityBreached a i c :=
  ⟨⟨hAddr, hCovered, hConditions, hFunds⟩, hOmission⟩


theorem obligation1997gPriorityFulfilled_intro
    {a : Entity} {i : Institution} {c : ComplaintText}
    (hAddr : AddresseeInClass1997g a c)
    (hCovered : InstitutionCoveredBySubchapter i c)
    (hConditions : DeplorableConditionsDepriveRights i c)
    (hFunds : FederalFundsAvailableForImprovement i c)
    (hAct : PriorityGivenToConditionCorrection a i c) :
    Obligation1997gPriorityFulfilled a i c :=
  ⟨⟨hAddr, hCovered, hConditions, hFunds⟩, hAct⟩



theorem permission1997gNoRedirectionExercised_intro
    {a : Entity} {c : ComplaintText}
    (hAddr : AddresseeInClass1997g a c)
    (hAct : DeclinesFundRedirection a c) :
    Permission1997gNoRedirectionExercised a c :=
  ⟨⟨hAddr⟩, hAct⟩

end Proving.USC.T42.Ch21Tail.Deontic
