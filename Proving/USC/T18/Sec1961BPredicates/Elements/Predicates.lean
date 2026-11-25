










import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Sec1961BPredicates.Elements.Types

namespace Proving.USC.T18.Sec1961BPredicates.Elements

open Proving.USC.Common







axiom TransportsInInterstateCommerce (prop : Property) (c : ComplaintText) : Prop




axiom AllegedPropertyValueDollars (n : Nat) (c : ComplaintText) : Prop



axiom KnowsPropertyStolen (p : Person) (prop : Property) (c : ComplaintText) : Prop




axiom DevisedSchemeToDefraud (p : Person) (c : ComplaintText) : Prop




axiom TransportsOrInducesTravelInScheme (p : Person) (c : ComplaintText) : Prop



axiom UnlawfulOrFraudulentIntent (p : Person) (c : ComplaintText) : Prop




axiom TransportsCounterfeitSecurities (prop : Property) (c : ComplaintText) : Prop




axiom KnowsCounterfeited (p : Person) (prop : Property) (c : ComplaintText) : Prop



axiom TransportsForgedTravelersCheck (prop : Property) (c : ComplaintText) : Prop



axiom TransportsCounterfeitingImplement (prop : Property) (c : ComplaintText) : Prop




axiom IsVeteransMemorialObject (prop : Property) (c : ComplaintText) : Prop





axiom ExemptForeignOrUSObligation (prop : Property) (c : ComplaintText) : Prop








axiom ReceivesPossessesStolenProperty (p : Person) (prop : Property) (c : ComplaintText) : Prop




axiom CrossedStateOrUSBoundaryAfterStolen (prop : Property) (c : ComplaintText) : Prop




axiom ReceivesCounterfeitSecuritiesInCommerce (prop : Property) (c : ComplaintText) : Prop




axiom ReceivesCounterfeitingImplementInCommerce (prop : Property) (c : ComplaintText) : Prop



axiom ReceivesVeteransMemorialObject (p : Person) (prop : Property) (c : ComplaintText) : Prop








axiom ProducesIdDocWithoutAuthority (p : Person) (doc : IdDocument) (c : ComplaintText) : Prop




axiom TransfersStolenIdDoc (p : Person) (doc : IdDocument) (c : ComplaintText) : Prop




axiom PossessesFiveOrMoreIdDocsToTransfer (p : Person) (doc : IdDocument) (c : ComplaintText) : Prop




axiom PossessesIdDocToDefraudUS (p : Person) (doc : IdDocument) (c : ComplaintText) : Prop




axiom ProducesDocMakingImplement (p : Person) (doc : IdDocument) (c : ComplaintText) : Prop




axiom PossessesStolenUSIdDoc (p : Person) (doc : IdDocument) (c : ComplaintText) : Prop





axiom UsesMeansOfIdForUnlawfulActivity (p : Person) (doc : IdDocument) (c : ComplaintText) : Prop




axiom TraffsAuthenticationFeatures (p : Person) (doc : IdDocument) (c : ComplaintText) : Prop



axiom ActedKnowingly1028 (p : Person) (c : ComplaintText) : Prop




axiom IdDocIssuedByUSAuthority (doc : IdDocument) (c : ComplaintText) : Prop



axiom IsSubsectionA4Offense (c : ComplaintText) : Prop




axiom AffectsInterstateCommerceOrMail (doc : IdDocument) (c : ComplaintText) : Prop





axiom LawfulLawEnforcementActivity (p : Person) (c : ComplaintText) : Prop







axiom ProducesUsesTraffsCounterfeitAccessDevice (p : Person) (d : AccessDevice) (c : ComplaintText) : Prop




axiom TraffsUnauthorizedAccessDeviceValue (p : Person) (d : AccessDevice) (c : ComplaintText) : Prop




axiom PossessesFifteenOrMoreDevices (p : Person) (d : AccessDevice) (c : ComplaintText) : Prop



axiom ProducesPossessesDeviceMakingEquipment (p : Person) (d : AccessDevice) (c : ComplaintText) : Prop




axiom EffectsTransactionsAnothersDevice (p : Person) (d : AccessDevice) (c : ComplaintText) : Prop




axiom SolicitsAccessDevice (p : Person) (d : AccessDevice) (c : ComplaintText) : Prop




axiom UsesModifiedTelecomInstrument (p : Person) (d : AccessDevice) (c : ComplaintText) : Prop



axiom UsesScanningReceiver (p : Person) (d : AccessDevice) (c : ComplaintText) : Prop




axiom UsesConfiguredHardwareSoftware (p : Person) (d : AccessDevice) (c : ComplaintText) : Prop




axiom ArrangesPresentmentOfTransactions (p : Person) (d : AccessDevice) (c : ComplaintText) : Prop



axiom IntentToDefraud1029 (p : Person) (c : ComplaintText) : Prop




axiom AccessDeviceAffectsCommerce (d : AccessDevice) (c : ComplaintText) : Prop








axiom ConductsGamblingBusiness (p : Person) (gb : GamblingBusiness) (c : ComplaintText) : Prop




axiom ViolatesStateGamblingLaw (gb : GamblingBusiness) (c : ComplaintText) : Prop




axiom AllegedPersonsInvolved (n : Nat) (c : ComplaintText) : Prop




axiom AllegedDaysInOperation (n : Nat) (c : ComplaintText) : Prop




axiom AllegedGrossRevenueSingleDay (n : Nat) (c : ComplaintText) : Prop




axiom ExemptCharitableOrRaffleGaming (gb : GamblingBusiness) (c : ComplaintText) : Prop







axiom EngagedInBettingBusiness (p : Person) (c : ComplaintText) : Prop



axiom KnowinglyUsesWireFacility (p : Person) (w : WireComm) (c : ComplaintText) : Prop




axiom TransmitsInterstateBetsOrWagerInfo (w : WireComm) (c : ComplaintText) : Prop




axiom SafeHarborNewsOrLegalToLegal (w : WireComm) (c : ComplaintText) : Prop

end Proving.USC.T18.Sec1961BPredicates.Elements
