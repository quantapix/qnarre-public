











import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Prohibited.Elements.Types
import Proving.USC.T18.Prohibited.Elements.Predicates
import Proving.USC.T18.Prohibited.Elements.Statute

namespace Proving.USC.T18.Prohibited.Elements

open Proving.USC.Common

theorem section1962a_intro {p i e acts c}
    (hCulp : CulpablePersonCapableOfIntent p c)
    (hIncome : IncomeDerivedFromPattern p i c)
    (hPat : PatternOfRacketeering acts c)
    (hEnt : IsEnterprise e c)
    (hICC : EngagedInInterstateCommerce e c)
    (hInv : InvestedIncomeInEnterprise p i e c)
    (hNotSH : ¬ PassiveSecuritiesSafeHarbor p e c) :
    Section1962a p i e acts c :=
  ⟨hCulp, hIncome, hPat, hEnt, hICC, hInv, hNotSH⟩

theorem section1962b_intro {p x e acts c}
    (hCulp : CulpablePersonCapableOfIntent p c)
    (hPat : PatternOfRacketeering acts c)
    (hEnt : IsEnterprise e c)
    (hICC : EngagedInInterstateCommerce e c)
    (hAcq : AcquiredOrMaintainedInterest p x e c)
    (hThru : ThroughPatternNexus p e c) :
    Section1962b p x e acts c :=
  ⟨hCulp, hPat, hEnt, hICC, hAcq, hThru⟩

theorem section1962c_intro {p e acts c}
    (hCulp : CulpablePersonCapableOfIntent p c)
    (hEnt : IsEnterprise e c)
    (hICC : EngagedInInterstateCommerce e c)
    (hAssoc : EmployedOrAssociated p e c)
    (hCond : ConductsOrParticipates p e c)
    (hPat : PatternOfRacketeering acts c)
    (hThru : ThroughPatternNexus p e c) :
    Section1962c p e acts c :=
  ⟨hCulp, hEnt, hICC, hAssoc, hCond, hPat, hThru⟩

theorem section1962d_intro {p ag c}
    (hCulp : CulpablePersonCapableOfIntent p c)
    (hAgree : AgreementAmongTwoOrMore ag c)
    (hSubst : AgreedToSubstantiveOffense p c) :
    Section1962d p ag c :=
  ⟨hCulp, hAgree, hSubst⟩

theorem violationOfSection1962_investA {p i x e acts ag c}
    (h : Section1962a p i e acts c) :
    ViolationOfSection1962 p i x e acts ag c := .investA h
theorem violationOfSection1962_acquireB {p i x e acts ag c}
    (h : Section1962b p x e acts c) :
    ViolationOfSection1962 p i x e acts ag c := .acquireB h
theorem violationOfSection1962_conductC {p i x e acts ag c}
    (h : Section1962c p e acts c) :
    ViolationOfSection1962 p i x e acts ag c := .conductC h
theorem violationOfSection1962_conspireD {p i x e acts ag c}
    (h : Section1962d p ag c) :
    ViolationOfSection1962 p i x e acts ag c := .conspireD h

end Proving.USC.T18.Prohibited.Elements
