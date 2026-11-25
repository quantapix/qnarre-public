






import Proving.USC.Common.Types
import Proving.USC.T18.Sec1961BPredicates.Elements.Types
import Proving.USC.T18.Sec1961BPredicates.Elements.Predicates

namespace Proving.USC.T18.Sec1961BPredicates.Elements

open Proving.USC.Common




def PropertyMeetsValueThreshold (c : ComplaintText) : Prop :=
  ∃ n : Nat, AllegedPropertyValueDollars n c ∧ n ≥ 5000


def InvolvesFiveOrMorePersons (c : ComplaintText) : Prop :=
  ∃ n : Nat, AllegedPersonsInvolved n c ∧ n ≥ 5


def OperatedOverThirtyDays (c : ComplaintText) : Prop :=
  ∃ n : Nat, AllegedDaysInOperation n c ∧ n > 30


def GrossRevenueThresholdMet (c : ComplaintText) : Prop :=
  ∃ n : Nat, AllegedGrossRevenueSingleDay n c ∧ n ≥ 2000






structure Section2314Stolen (p : Person) (prop : Property) (c : ComplaintText) : Prop where
  transports : TransportsInInterstateCommerce prop c
  value      : PropertyMeetsValueThreshold c
  scienter   : KnowsPropertyStolen p prop c
  notExempt  : ¬ ExemptForeignOrUSObligation prop c


structure Section2314Scheme (p : Person) (c : ComplaintText) : Prop where
  scheme           : DevisedSchemeToDefraud p c
  transportsTravel : TransportsOrInducesTravelInScheme p c
  value            : PropertyMeetsValueThreshold c


structure Section2314CounterfeitSecurities (p : Person) (prop : Property) (c : ComplaintText) : Prop where
  intent     : UnlawfulOrFraudulentIntent p c
  transports : TransportsCounterfeitSecurities prop c
  scienter   : KnowsCounterfeited p prop c
  notExempt  : ¬ ExemptForeignOrUSObligation prop c


structure Section2314TravelersCheck (p : Person) (prop : Property) (c : ComplaintText) : Prop where
  intent     : UnlawfulOrFraudulentIntent p c
  transports : TransportsForgedTravelersCheck prop c


structure Section2314Implement (p : Person) (prop : Property) (c : ComplaintText) : Prop where
  intent     : UnlawfulOrFraudulentIntent p c
  transports : TransportsCounterfeitingImplement prop c


structure Section2314Memorial (p : Person) (prop : Property) (c : ComplaintText) : Prop where
  transports : TransportsInInterstateCommerce prop c
  scienter   : KnowsPropertyStolen p prop c
  isMemorial : IsVeteransMemorialObject prop c


inductive ViolationOf2314 (p : Person) (prop : Property) (c : ComplaintText) : Prop where
  | stolen         (h : Section2314Stolen p prop c)
  | scheme         (h : Section2314Scheme p c)
  | counterfeit    (h : Section2314CounterfeitSecurities p prop c)
  | travelersCheck (h : Section2314TravelersCheck p prop c)
  | implement      (h : Section2314Implement p prop c)
  | memorial       (h : Section2314Memorial p prop c)







structure Section2315Stolen (p : Person) (prop : Property) (c : ComplaintText) : Prop where
  receives        : ReceivesPossessesStolenProperty p prop c
  value           : PropertyMeetsValueThreshold c
  crossedBoundary : CrossedStateOrUSBoundaryAfterStolen prop c
  scienter        : KnowsPropertyStolen p prop c
  notExempt       : ¬ ExemptForeignOrUSObligation prop c


structure Section2315CounterfeitSecurities (p : Person) (prop : Property) (c : ComplaintText) : Prop where
  receives  : ReceivesCounterfeitSecuritiesInCommerce prop c
  scienter  : KnowsCounterfeited p prop c
  notExempt : ¬ ExemptForeignOrUSObligation prop c


structure Section2315Implement (p : Person) (prop : Property) (c : ComplaintText) : Prop where
  receives : ReceivesCounterfeitingImplementInCommerce prop c
  scienter : KnowsCounterfeited p prop c


structure Section2315Memorial (p : Person) (prop : Property) (c : ComplaintText) : Prop where
  receives        : ReceivesVeteransMemorialObject p prop c
  crossedBoundary : CrossedStateOrUSBoundaryAfterStolen prop c
  scienter        : KnowsPropertyStolen p prop c


inductive ViolationOf2315 (p : Person) (prop : Property) (c : ComplaintText) : Prop where
  | stolen      (h : Section2315Stolen p prop c)
  | counterfeit (h : Section2315CounterfeitSecurities p prop c)
  | implement   (h : Section2315Implement p prop c)
  | memorial    (h : Section2315Memorial p prop c)






inductive Conduct1028 (p : Person) (doc : IdDocument) (c : ComplaintText) : Prop where
  | produce        (h : ProducesIdDocWithoutAuthority p doc c)
  | transfer       (h : TransfersStolenIdDoc p doc c)
  | possessFive    (h : PossessesFiveOrMoreIdDocsToTransfer p doc c)
  | possessDefraud (h : PossessesIdDocToDefraudUS p doc c)
  | implement      (h : ProducesDocMakingImplement p doc c)
  | possessUS      (h : PossessesStolenUSIdDoc p doc c)
  | meansOfId      (h : UsesMeansOfIdForUnlawfulActivity p doc c)
  | traffic        (h : TraffsAuthenticationFeatures p doc c)


inductive Circumstance1028 (doc : IdDocument) (c : ComplaintText) : Prop where
  | usIssued (h : IdDocIssuedByUSAuthority doc c)
  | a4       (h : IsSubsectionA4Offense c)
  | commerce (h : AffectsInterstateCommerceOrMail doc c)



structure Section1028a (p : Person) (doc : IdDocument) (c : ComplaintText) : Prop where
  conduct      : Conduct1028 p doc c
  scienter     : ActedKnowingly1028 p c
  circumstance : Circumstance1028 doc c
  notExempt    : ¬ LawfulLawEnforcementActivity p c






inductive Conduct1029 (p : Person) (d : AccessDevice) (c : ComplaintText) : Prop where
  | counterfeit   (h : ProducesUsesTraffsCounterfeitAccessDevice p d c)
  | unauthorized  (h : TraffsUnauthorizedAccessDeviceValue p d c)
  | fifteen       (h : PossessesFifteenOrMoreDevices p d c)
  | equipment     (h : ProducesPossessesDeviceMakingEquipment p d c)
  | anothers      (h : EffectsTransactionsAnothersDevice p d c)
  | solicit       (h : SolicitsAccessDevice p d c)
  | telecom       (h : UsesModifiedTelecomInstrument p d c)
  | scanner       (h : UsesScanningReceiver p d c)
  | hwsw          (h : UsesConfiguredHardwareSoftware p d c)
  | presentment   (h : ArrangesPresentmentOfTransactions p d c)



structure Section1029a (p : Person) (d : AccessDevice) (c : ComplaintText) : Prop where
  conduct   : Conduct1029 p d c
  scienter  : IntentToDefraud1029 p c
  commerce  : AccessDeviceAffectsCommerce d c
  notExempt : ¬ LawfulLawEnforcementActivity p c






inductive ContinuityOrRevenue1955 (c : ComplaintText) : Prop where
  | thirtyDays (h : OperatedOverThirtyDays c)
  | revenue    (h : GrossRevenueThresholdMet c)



structure IllegalGamblingBusiness (gb : GamblingBusiness) (c : ComplaintText) : Prop where
  violatesState : ViolatesStateGamblingLaw gb c
  fivePersons   : InvolvesFiveOrMorePersons c
  continuity    : ContinuityOrRevenue1955 c


abbrev IsIllegalGamblingBusiness (gb : GamblingBusiness) (c : ComplaintText) : Prop :=
  IllegalGamblingBusiness gb c



structure Section1955 (p : Person) (gb : GamblingBusiness) (c : ComplaintText) : Prop where
  conducts  : ConductsGamblingBusiness p gb c
  illegal   : IsIllegalGamblingBusiness gb c
  notExempt : ¬ ExemptCharitableOrRaffleGaming gb c








structure Section1084a (p : Person) (w : WireComm) (c : ComplaintText) : Prop where
  business      : EngagedInBettingBusiness p c
  usesWire      : KnowinglyUsesWireFacility p w c
  interstate    : TransmitsInterstateBetsOrWagerInfo w c
  notSafeHarbor : ¬ SafeHarborNewsOrLegalToLegal w c

end Proving.USC.T18.Sec1961BPredicates.Elements
