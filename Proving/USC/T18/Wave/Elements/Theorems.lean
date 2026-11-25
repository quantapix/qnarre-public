





import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Wave.Elements.Types
import Proving.USC.T18.Wave.Elements.Predicates
import Proving.USC.T18.Wave.Elements.Statute

namespace Proving.USC.T18.Wave.Elements

open Proving.USC.Common

theorem section1962a_intro {p e inc i acts c}
    (hCulp : CulpablePersonCapableOfIntent p c)
    (hRack : PatternOfRacketeering acts c ∨ CollectionOfUnlawfulDebt acts c)
    (hInc : IncomeDerivedFromPattern inc acts c)
    (hEnt : IsEnterprise e c)
    (hICC : EngagedInInterstateCommerce e c)
    (hInv : InvestedIncomeInEnterprise inc e i c) :
    Section1962a p e inc i acts c :=
  ⟨hCulp, hRack, hInc, hEnt, hICC, hInv⟩

theorem section1962b_intro {p e i acts c}
    (hCulp : CulpablePersonCapableOfIntent p c)
    (hRack : PatternOfRacketeering acts c ∨ CollectionOfUnlawfulDebt acts c)
    (hEnt : IsEnterprise e c)
    (hICC : EngagedInInterstateCommerce e c)
    (hAcq : AcquiredOrMaintainedInterest p e i acts c) :
    Section1962b p e i acts c :=
  ⟨hCulp, hRack, hEnt, hICC, hAcq⟩

theorem section1962c_intro {p e acts c}
    (hCulp : CulpablePersonCapableOfIntent p c)
    (hEnt : IsEnterprise e c)
    (hICC : EngagedInInterstateCommerce e c)
    (hDist : PersonEnterpriseDistinct p e c)
    (hAssoc : EmployedOrAssociated p e c)
    (hCond : ConductsOrParticipates p e c)
    (hRack : PatternOfRacketeering acts c ∨ CollectionOfUnlawfulDebt acts c) :
    Section1962c p e acts c :=
  ⟨hCulp, hEnt, hICC, hDist, hAssoc, hCond, hRack⟩

theorem section1962d_intro {p ag c substantiveObject}
    (hCulp : CulpablePersonCapableOfIntent p c)
    (hAgree : AgreementAmongTwoOrMore ag c)
    (hObj : substantiveObject) :
    Section1962d p ag c substantiveObject :=
  ⟨hCulp, hAgree, hObj⟩

theorem validCivilRicoClaim_intro {p c}
    (hViol : Section1962Violation c)
    (hInjury : InjuredInBusinessOrProperty p c)
    (hProx : ProximateCause p c)
    (hLim : WithinLimitations p c)
    (hNotBar : NotSecuritiesFraudBarred p c) :
    ValidCivilRicoClaim p c :=
  ⟨hViol, hInjury, hProx, hLim, hNotBar⟩

end Proving.USC.T18.Wave.Elements
