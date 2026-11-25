












import Proving.USC.T18.RacketeeringActs.Deontic.Statute

namespace Proving.USC.T18.RacketeeringActs.Deontic

open Proving.USC.Common




theorem racketeeringActivityDefinition_intro {o c}
    (h : IsEnumeratedRacketeeringOffense o c) : RacketeeringActivityDefinition o c := h







theorem prohibition1951Violated_intro_robbery {p c}
    (hAddr : WhoeverAddressee p c) (hCommerce : ObstructedOrAffectedCommerce p c)
    (hRobbery : ByRobbery p c) : Prohibition1951Violated p c :=
  ⟨⟨hAddr, hCommerce⟩, ⟨hCommerce, .robbery hRobbery⟩⟩


theorem prohibition1951Violated_intro_extortion {p c}
    (hAddr : WhoeverAddressee p c) (hCommerce : ObstructedOrAffectedCommerce p c)
    (hExtortion : ByExtortion p c) : Prohibition1951Violated p c :=
  ⟨⟨hAddr, hCommerce⟩, ⟨hCommerce, .extortion hExtortion⟩⟩





theorem prohibition1952Violated_intro {p c}
    (hAddr : WhoeverAddressee p c) (hUnlawful : IsUnlawfulActivity p c)
    (hTravel : TraveledOrUsedInterstateFacility p c)
    (hIntent : IntentToAidUnlawfulActivity p c) : Prohibition1952Violated p c :=
  ⟨⟨hAddr, hUnlawful⟩, hTravel, hIntent⟩







theorem prohibition1956Violated_intro_promote {p t c}
    (hAddr : WhoeverAddressee p c) (hSUA : InvolvedSpecifiedUnlawfulActivity t c)
    (hTxn : ConductedFinancialTransaction p t c) (hKnew : KnewProceedsUnlawful p t c)
    (hPromote : IntentToPromoteSUA p t c) : Prohibition1956Violated p t c :=
  ⟨⟨hAddr, hSUA⟩, ⟨hTxn, hKnew, hSUA, .promote hPromote⟩⟩


theorem prohibition1956Violated_intro_conceal {p t c}
    (hAddr : WhoeverAddressee p c) (hSUA : InvolvedSpecifiedUnlawfulActivity t c)
    (hTxn : ConductedFinancialTransaction p t c) (hKnew : KnewProceedsUnlawful p t c)
    (hConceal : DesignedToConceal p t c) : Prohibition1956Violated p t c :=
  ⟨⟨hAddr, hSUA⟩, ⟨hTxn, hKnew, hSUA, .conceal hConceal⟩⟩







theorem prohibition1957Violated_intro {p t c}
    (hAddr : WhoeverAddressee p c) (hCirc : Section1957CircumstanceMet p c)
    (hTxn : EngagedInMonetaryTransaction p t c)
    (hDerived : IsCriminallyDerivedProperty t c)
    (hVal : 10000 < TransactedPropertyValue t c) : Prohibition1957Violated p t c :=
  ⟨⟨hAddr, hCirc⟩, hTxn, hDerived, by unfold Exceeds10kThreshold; omega⟩

end Proving.USC.T18.RacketeeringActs.Deontic
