






import Proving.USC.T18.Sec1961BPredicates.Elements.Statute

namespace Proving.USC.T18.Sec1961BPredicates.Elements

open Proving.USC.Common



theorem section2314Stolen_intro {p prop c}
    (hTransports : TransportsInInterstateCommerce prop c)
    (hValue : PropertyMeetsValueThreshold c)
    (hScienter : KnowsPropertyStolen p prop c)
    (hNotExempt : ¬ ExemptForeignOrUSObligation prop c) :
    Section2314Stolen p prop c :=
  ⟨hTransports, hValue, hScienter, hNotExempt⟩

theorem section2314Scheme_intro {p c}
    (hScheme : DevisedSchemeToDefraud p c)
    (hTravel : TransportsOrInducesTravelInScheme p c)
    (hValue : PropertyMeetsValueThreshold c) :
    Section2314Scheme p c :=
  ⟨hScheme, hTravel, hValue⟩

theorem section2314CounterfeitSecurities_intro {p prop c}
    (hIntent : UnlawfulOrFraudulentIntent p c)
    (hTransports : TransportsCounterfeitSecurities prop c)
    (hScienter : KnowsCounterfeited p prop c)
    (hNotExempt : ¬ ExemptForeignOrUSObligation prop c) :
    Section2314CounterfeitSecurities p prop c :=
  ⟨hIntent, hTransports, hScienter, hNotExempt⟩

theorem section2314TravelersCheck_intro {p prop c}
    (hIntent : UnlawfulOrFraudulentIntent p c)
    (hTransports : TransportsForgedTravelersCheck prop c) :
    Section2314TravelersCheck p prop c :=
  ⟨hIntent, hTransports⟩

theorem section2314Implement_intro {p prop c}
    (hIntent : UnlawfulOrFraudulentIntent p c)
    (hTransports : TransportsCounterfeitingImplement prop c) :
    Section2314Implement p prop c :=
  ⟨hIntent, hTransports⟩

theorem section2314Memorial_intro {p prop c}
    (hTransports : TransportsInInterstateCommerce prop c)
    (hScienter : KnowsPropertyStolen p prop c)
    (hMemorial : IsVeteransMemorialObject prop c) :
    Section2314Memorial p prop c :=
  ⟨hTransports, hScienter, hMemorial⟩



theorem section2315Stolen_intro {p prop c}
    (hReceives : ReceivesPossessesStolenProperty p prop c)
    (hValue : PropertyMeetsValueThreshold c)
    (hCrossed : CrossedStateOrUSBoundaryAfterStolen prop c)
    (hScienter : KnowsPropertyStolen p prop c)
    (hNotExempt : ¬ ExemptForeignOrUSObligation prop c) :
    Section2315Stolen p prop c :=
  ⟨hReceives, hValue, hCrossed, hScienter, hNotExempt⟩

theorem section2315CounterfeitSecurities_intro {p prop c}
    (hReceives : ReceivesCounterfeitSecuritiesInCommerce prop c)
    (hScienter : KnowsCounterfeited p prop c)
    (hNotExempt : ¬ ExemptForeignOrUSObligation prop c) :
    Section2315CounterfeitSecurities p prop c :=
  ⟨hReceives, hScienter, hNotExempt⟩

theorem section2315Implement_intro {p prop c}
    (hReceives : ReceivesCounterfeitingImplementInCommerce prop c)
    (hScienter : KnowsCounterfeited p prop c) :
    Section2315Implement p prop c :=
  ⟨hReceives, hScienter⟩

theorem section2315Memorial_intro {p prop c}
    (hReceives : ReceivesVeteransMemorialObject p prop c)
    (hCrossed : CrossedStateOrUSBoundaryAfterStolen prop c)
    (hScienter : KnowsPropertyStolen p prop c) :
    Section2315Memorial p prop c :=
  ⟨hReceives, hCrossed, hScienter⟩



theorem section1028a_intro {p doc c}
    (hConduct : Conduct1028 p doc c)
    (hScienter : ActedKnowingly1028 p c)
    (hCircumstance : Circumstance1028 doc c)
    (hNotExempt : ¬ LawfulLawEnforcementActivity p c) :
    Section1028a p doc c :=
  ⟨hConduct, hScienter, hCircumstance, hNotExempt⟩



theorem section1029a_intro {p d c}
    (hConduct : Conduct1029 p d c)
    (hScienter : IntentToDefraud1029 p c)
    (hCommerce : AccessDeviceAffectsCommerce d c)
    (hNotExempt : ¬ LawfulLawEnforcementActivity p c) :
    Section1029a p d c :=
  ⟨hConduct, hScienter, hCommerce, hNotExempt⟩



theorem illegalGamblingBusiness_intro {gb c}
    (hViolates : ViolatesStateGamblingLaw gb c)
    (hFive : InvolvesFiveOrMorePersons c)
    (hContinuity : ContinuityOrRevenue1955 c) :
    IllegalGamblingBusiness gb c :=
  ⟨hViolates, hFive, hContinuity⟩

theorem section1955_intro {p gb c}
    (hConducts : ConductsGamblingBusiness p gb c)
    (hIllegal : IsIllegalGamblingBusiness gb c)
    (hNotExempt : ¬ ExemptCharitableOrRaffleGaming gb c) :
    Section1955 p gb c :=
  ⟨hConducts, hIllegal, hNotExempt⟩



theorem section1084a_intro {p w c}
    (hBusiness : EngagedInBettingBusiness p c)
    (hUsesWire : KnowinglyUsesWireFacility p w c)
    (hInterstate : TransmitsInterstateBetsOrWagerInfo w c)
    (hNotSafeHarbor : ¬ SafeHarborNewsOrLegalToLegal w c) :
    Section1084a p w c :=
  ⟨hBusiness, hUsesWire, hInterstate, hNotSafeHarbor⟩

end Proving.USC.T18.Sec1961BPredicates.Elements
