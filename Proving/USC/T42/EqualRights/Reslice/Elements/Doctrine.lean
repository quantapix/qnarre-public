




















import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.Common.Tactic
import Proving.USC.T42.EqualRights.Reslice.Elements.Types
import Proving.USC.T42.EqualRights.Reslice.Elements.Predicates
import Proving.USC.T42.EqualRights.Reslice.Elements.Statute

set_option autoImplicit false

namespace Proving.USC.T42.EqualRights.Reslice.Elements

open Proving.USC.Common



@[grind →] theorem contracts_of_making {k : Contract} {c : ComplaintText}
    (h : ContractMakingImpaired k c) : MakeAndEnforceContractsImpaired k c := .making h

@[grind →] theorem contracts_of_performance {k : Contract} {c : ComplaintText}
    (h : ContractPerformanceImpaired k c) : MakeAndEnforceContractsImpaired k c :=
  .performance h

@[grind →] theorem contracts_of_modification {k : Contract} {c : ComplaintText}
    (h : ContractModificationImpaired k c) : MakeAndEnforceContractsImpaired k c :=
  .modification h

@[grind →] theorem contracts_of_termination {k : Contract} {c : ComplaintText}
    (h : ContractTerminationImpaired k c) : MakeAndEnforceContractsImpaired k c :=
  .termination h

@[grind →] theorem contracts_of_benefits {k : Contract} {c : ComplaintText}
    (h : ContractualBenefitsEnjoymentImpaired k c) :
    MakeAndEnforceContractsImpaired k c := .benefits h



example {k : Contract} {c : ComplaintText} (h : ContractTerminationImpaired k c) :
    ImpairedMakeAndEnforceContracts k c := by prove_element



example {k : Contract} {c : ComplaintText}
    (h : ContractualBenefitsEnjoymentImpaired k c) :
    ImpairedMakeAndEnforceContracts k c := by prove_element



@[grind →] theorem federalStatutoryRight_of_prongs {r : ProtectedRight} {c : ComplaintText}
    (h1 : StatuteIntendedToBenefitPlaintiff r c) (h2 : RightNotVagueOrAmorphous r c)
    (h3 : StatuteImposesMandatoryObligation r c)
    (h4 : UnambiguousRightsCreatingLanguage r c) : FederalStatutoryRight r c :=
  ⟨h1, h2, h3, h4⟩

@[grind →] theorem securedRight_of_statutory {r : ProtectedRight} {c : ComplaintText}
    (h : FederalStatutoryRight r c) : SecuredFederalRight r c := .statutory h

@[grind →] theorem securedRight_of_constitutional {r : ProtectedRight} {c : ComplaintText}
    (h : RightSecuredByConstitution r c) : SecuredFederalRight r c := .constitutional h


example {r : ProtectedRight} {c : ComplaintText}
    (h1 : StatuteIntendedToBenefitPlaintiff r c) (h2 : RightNotVagueOrAmorphous r c)
    (h3 : StatuteImposesMandatoryObligation r c)
    (h4 : UnambiguousRightsCreatingLanguage r c) :
    RightSecuredByConstitutionAndLaws r c := by prove_element


example {r : ProtectedRight} {c : ComplaintText} (h : RightSecuredByConstitution r c) :
    RightSecuredByConstitutionAndLaws r c := by prove_element





example {p : Person} {c : ComplaintText}
    (h : daysFromAccrualToCommencement p c = 200) : CommencedWithinOneYear p c := by
  simp [CommencedWithinOneYear, h]


example {c : ComplaintText} (h : deathActionDamagesSoughtDollars c = 4000) :
    WithinDeathActionDamagesCap c := by
  simp [WithinDeathActionDamagesCap, h]



example {p d : Person} {c : ComplaintText}
    (hn : employeeCountInTwentyOrMoreWeeks d c = 60)
    (hs : compensatoryAndPunitiveSumDollars p c = 40000) :
    WithinDamagesCap1981a p d c := by
  refine .tier50k ?_ ?_ ?_ <;> simp [hn, hs]

end Proving.USC.T42.EqualRights.Reslice.Elements
