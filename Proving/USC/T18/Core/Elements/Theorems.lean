





import Proving.USC.T18.Core.Elements.Statute
import Proving.USC.Common.Predicates

namespace Proving.USC.T18.Core.Elements

open Proving.USC.Common


theorem section1962a_intro {p e i acts d c}
    (hCulp : CulpablePersonCapableOfIntent p c) (hEnt : IsEnterprise e c)
    (hICC : EngagedInInterstateCommerce e c) (hBasis : PredicateBasis acts d c)
    (hRecv : ReceivedIncomeFromPattern p i c)
    (hUse : UsesOrInvestsIncomeInEnterprise p i e c) :
    Section1962a p e i acts d c :=
  ⟨hCulp, hEnt, hICC, hBasis, hRecv, hUse⟩


theorem section1962b_intro {p e acts d c}
    (hCulp : CulpablePersonCapableOfIntent p c) (hEnt : IsEnterprise e c)
    (hICC : EngagedInInterstateCommerce e c) (hBasis : PredicateBasis acts d c)
    (hAcq : AcquiresOrMaintainsInterest p e c) :
    Section1962b p e acts d c :=
  ⟨hCulp, hEnt, hICC, hBasis, hAcq⟩


theorem section1962c_intro {p e acts d c}
    (hCulp : CulpablePersonCapableOfIntent p c) (hEnt : IsEnterprise e c)
    (hICC : EngagedInInterstateCommerce e c) (hDist : PersonEnterpriseDistinct p e c)
    (hAssoc : EmployedOrAssociated p e c) (hCond : ConductsOrParticipates p e c)
    (hBasis : PredicateBasis acts d c) :
    Section1962c p e acts d c :=
  ⟨hCulp, hEnt, hICC, hDist, hAssoc, hCond, hBasis⟩


theorem section1962d_intro {ag target c}
    (hAgree : AgreementAmongTwoOrMore ag c) (hObj : target) :
    Section1962d ag target c :=
  ⟨hAgree, hObj⟩


theorem predicateBasis_pattern_intro {acts d c}
    (h : PatternOfRacketeering acts c) : PredicateBasis acts d c :=
  .pattern h


theorem predicateBasis_unlawfulDebt_intro {acts d c}
    (h : CollectionOfUnlawfulDebt d c) : PredicateBasis acts d c :=
  .unlawfulDebt h

end Proving.USC.T18.Core.Elements
