





























import Proving.USC.T18.Sec1961BPredicates.Elements.Statute
import Proving.USC.T18.Sec1961BPredicates.Deontic.Statute
import Proving.USC.T18.Sec1961BPredicates.Scienter.Statute
import Proving.USC.T18.Sec1961BPredicates.Ontology.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T18.Sec1961BPredicates.Bridge

open Proving.USC.Common
open Proving.USC.T18.Sec1961BPredicates



axiom mapGamblingBusiness : Elements.GamblingBusiness → Ontology.GamblingBusiness






axiom corr2314_addr {p prop c} : Elements.KnowsPropertyStolen p prop c → Deontic.AddresseeInClass2314 p c
axiom corr2314_scien {p prop c} : Elements.KnowsPropertyStolen p prop c → Deontic.ActedKnowingly p c
axiom corr2314_comm {prop c} : Elements.TransportsInInterstateCommerce prop c → Deontic.AffectsInterstateCommerce c
axiom corr2314_cond {c} : Elements.PropertyMeetsValueThreshold c → Deontic.ConditionMet2314 c
axiom corr2314_act {p prop c} : Elements.TransportsInInterstateCommerce prop c → Deontic.RegulatedActOccurred2314 p c

theorem s2314_elements_implies_deontic {p prop c} (h : Elements.Section2314Stolen p prop c) :
    Deontic.ProhibitionViolated2314 p c :=
  ⟨⟨corr2314_addr h.scienter, corr2314_scien h.scienter,
    corr2314_comm h.transports, corr2314_cond h.value⟩,
   corr2314_act h.transports⟩


axiom corr2314_proven {p prop c} :
    Elements.KnowsPropertyStolen p prop c → Scienter.MentalStateProven p Scienter.RequiredMentalState2314 c
theorem s2314_elements_implies_scienter {p prop c} (h : Elements.Section2314Stolen p prop c) :
    Scienter.Section2314Culpable p c :=
  ⟨Scienter.RequiredMentalState2314, Scienter.MentalState.atLeast_refl _, corr2314_proven h.scienter⟩





axiom corr2315_addr {p prop c} : Elements.KnowsPropertyStolen p prop c → Deontic.AddresseeInClass2315 p c
axiom corr2315_scien {p prop c} : Elements.KnowsPropertyStolen p prop c → Deontic.ActedKnowingly p c
axiom corr2315_comm {prop c} : Elements.CrossedStateOrUSBoundaryAfterStolen prop c → Deontic.AffectsInterstateCommerce c
axiom corr2315_cond {c} : Elements.PropertyMeetsValueThreshold c → Deontic.ConditionMet2315 c
axiom corr2315_act {p prop c} : Elements.ReceivesPossessesStolenProperty p prop c → Deontic.RegulatedActOccurred2315 p c

theorem s2315_elements_implies_deontic {p prop c} (h : Elements.Section2315Stolen p prop c) :
    Deontic.ProhibitionViolated2315 p c :=
  ⟨⟨corr2315_addr h.scienter, corr2315_scien h.scienter,
    corr2315_comm h.crossedBoundary, corr2315_cond h.value⟩,
   corr2315_act h.receives⟩

axiom corr2315_proven {p prop c} :
    Elements.KnowsPropertyStolen p prop c → Scienter.MentalStateProven p Scienter.RequiredMentalState2315 c
theorem s2315_elements_implies_scienter {p prop c} (h : Elements.Section2315Stolen p prop c) :
    Scienter.Section2315Culpable p c :=
  ⟨Scienter.RequiredMentalState2315, Scienter.MentalState.atLeast_refl _, corr2315_proven h.scienter⟩





axiom corr1028_addr {p c} : Elements.ActedKnowingly1028 p c → Deontic.AddresseeInClass1028 p c
axiom corr1028_scien {p c} : Elements.ActedKnowingly1028 p c → Deontic.ActedKnowingly p c
axiom corr1028_cond {doc c} : Elements.Circumstance1028 doc c → Deontic.ConditionMet1028 c
axiom corr1028_act {p doc c} : Elements.Conduct1028 p doc c → Deontic.RegulatedActOccurred1028 p c

theorem s1028_elements_implies_deontic {p doc c} (h : Elements.Section1028a p doc c) :
    Deontic.ProhibitionViolated1028 p c :=
  ⟨⟨corr1028_addr h.scienter, corr1028_scien h.scienter, corr1028_cond h.circumstance⟩,
   corr1028_act h.conduct⟩

axiom corr1028_proven {p c} :
    Elements.ActedKnowingly1028 p c → Scienter.MentalStateProven p Scienter.RequiredMentalState1028 c
theorem s1028_elements_implies_scienter {p doc c} (h : Elements.Section1028a p doc c) :
    Scienter.Section1028Culpable p c :=
  ⟨Scienter.RequiredMentalState1028, Scienter.MentalState.atLeast_refl _, corr1028_proven h.scienter⟩





axiom corr1029_addr {p c} : Elements.IntentToDefraud1029 p c → Deontic.AddresseeInClass1029 p c
axiom corr1029_scien {p c} : Elements.IntentToDefraud1029 p c → Deontic.ActedKnowingly p c
axiom corr1029_cond {d c} : Elements.AccessDeviceAffectsCommerce d c → Deontic.ConditionMet1029 c
axiom corr1029_act {p d c} : Elements.Conduct1029 p d c → Deontic.RegulatedActOccurred1029 p c

theorem s1029_elements_implies_deontic {p d c} (h : Elements.Section1029a p d c) :
    Deontic.ProhibitionViolated1029 p c :=
  ⟨⟨corr1029_addr h.scienter, corr1029_scien h.scienter, corr1029_cond h.commerce⟩,
   corr1029_act h.conduct⟩


axiom corr1029_proven {p c} :
    Elements.IntentToDefraud1029 p c → Scienter.MentalStateProven p Scienter.RequiredMentalState1029 c
theorem s1029_elements_implies_scienter {p d c} (h : Elements.Section1029a p d c) :
    Scienter.Section1029Culpable p c :=
  ⟨Scienter.RequiredMentalState1029, Scienter.MentalState.atLeast_refl _, corr1029_proven h.scienter⟩






axiom corr1955_addr {p gb c} : Elements.ConductsGamblingBusiness p gb c → Deontic.AddresseeInClass1955 p c
axiom corr1955_cond {gb c} : Elements.IllegalGamblingBusiness gb c → Deontic.ConditionMet1955 c
axiom corr1955_act {p gb c} : Elements.ConductsGamblingBusiness p gb c → Deontic.RegulatedActOccurred1955 p c

theorem s1955_elements_implies_deontic {p gb c} (h : Elements.Section1955 p gb c) :
    Deontic.ProhibitionViolated1955 p c :=
  ⟨⟨corr1955_addr h.conducts, corr1955_cond h.illegal⟩, corr1955_act h.conducts⟩



axiom corr1955_o_state {gb c} : Elements.ViolatesStateGamblingLaw gb c → Ontology.ViolatesStateGamblingLaw (mapGamblingBusiness gb) c
axiom corr1955_o_five {gb c} : Elements.InvolvesFiveOrMorePersons c → Ontology.InvolvesFiveOrMorePersons (mapGamblingBusiness gb) c
axiom corr1955_o_cont {gb c} : Elements.ContinuityOrRevenue1955 c → Ontology.MeetsContinuityOrRevenueThreshold (mapGamblingBusiness gb) c
axiom corr1955_o_member {gb c} : Elements.IllegalGamblingBusiness gb c → Ontology.IsIllegalGamblingBusiness (mapGamblingBusiness gb) c

theorem s1955_elements_implies_ontology {p gb c} (h : Elements.Section1955 p gb c) :
    Ontology.IllegalGamblingBusinessDef (mapGamblingBusiness gb) c :=
  ⟨corr1955_o_state h.illegal.violatesState, corr1955_o_five h.illegal.fivePersons,
   corr1955_o_cont h.illegal.continuity, corr1955_o_member h.illegal⟩




theorem s1955_elements_implies_scienter_modulo_gaps {p gb c}
    (_h : Elements.Section1955 p gb c)
    (gap_grounded_1955 : Scienter.MentalStateProven p Scienter.RequiredMentalState1955 c) :
    Scienter.Section1955Culpable p c :=
  ⟨Scienter.RequiredMentalState1955, Scienter.MentalState.atLeast_refl _, gap_grounded_1955⟩





axiom corr1084_addr {p c} : Elements.EngagedInBettingBusiness p c → Deontic.AddresseeInClass1084a p c
axiom corr1084_scien {p w c} : Elements.KnowinglyUsesWireFacility p w c → Deontic.ActedKnowingly p c
axiom corr1084_comm {w c} : Elements.TransmitsInterstateBetsOrWagerInfo w c → Deontic.AffectsInterstateCommerce c
axiom corr1084_cond {p c} : Elements.EngagedInBettingBusiness p c → Deontic.ConditionMet1084a c
axiom corr1084_act {p w c} : Elements.KnowinglyUsesWireFacility p w c → Deontic.RegulatedActOccurred1084a p c

theorem s1084_elements_implies_deontic {p w c} (h : Elements.Section1084a p w c) :
    Deontic.ProhibitionViolated1084a p c :=
  ⟨⟨corr1084_addr h.business, corr1084_scien h.usesWire,
    corr1084_comm h.interstate, corr1084_cond h.business⟩,
   corr1084_act h.usesWire⟩

axiom corr1084_proven {p w c} :
    Elements.KnowinglyUsesWireFacility p w c → Scienter.MentalStateProven p Scienter.RequiredMentalState1084 c
theorem s1084_elements_implies_scienter {p w c} (h : Elements.Section1084a p w c) :
    Scienter.Section1084Culpable p c :=
  ⟨Scienter.RequiredMentalState1084, Scienter.MentalState.atLeast_refl _, corr1084_proven h.usesWire⟩

end Proving.USC.T18.Sec1961BPredicates.Bridge
