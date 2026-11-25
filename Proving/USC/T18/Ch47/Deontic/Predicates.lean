







import Proving.USC.Common.Types
import Proving.USC.T18.Ch47.Deontic.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch47.Deontic

open Proving.USC.Common







axiom AddresseeWhoever1028a (p : Person) (c : ComplaintText) : Prop







axiom ProducesWithoutLawfulAuthority1028a1
    (p : Person) (d : IdentificationArtifact) (c : ComplaintText) : Prop




axiom TransfersKnowingStolenOrUnauthorized1028a2
    (p : Person) (d : IdentificationArtifact) (c : ComplaintText) : Prop





axiom PossessesFiveOrMoreWithUnlawfulIntent1028a3
    (p : Person) (c : ComplaintText) : Prop




axiom PossessesWithIntentToDefraudUnitedStates1028a4
    (p : Person) (d : IdentificationArtifact) (c : ComplaintText) : Prop





axiom ProducesTransfersOrPossessesImplement1028a5
    (p : Person) (d : IdentificationArtifact) (c : ComplaintText) : Prop





axiom PossessesStolenUnitedStatesDocument1028a6
    (p : Person) (d : IdentificationArtifact) (c : ComplaintText) : Prop






axiom UsesMeansOfIdentificationForUnlawfulActivity1028a7
    (p : Person) (d : IdentificationArtifact) (c : ComplaintText) : Prop





axiom TrafficsInAuthenticationFeatures1028a8
    (p : Person) (d : IdentificationArtifact) (c : ComplaintText) : Prop








axiom CircumstanceUnitedStatesDocument1028c1
    (d : IdentificationArtifact) (c : ComplaintText) : Prop



axiom CircumstanceIsSubsectionA4Offense1028c2
    (p : Person) (c : ComplaintText) : Prop





axiom CircumstanceInterstateCommerceOrMail1028c3
    (p : Person) (d : IdentificationArtifact) (c : ComplaintText) : Prop








axiom LawfullyAuthorizedActivityExempt1028e (p : Person) (c : ComplaintText) : Prop






axiom AttemptsOffense1028f (p : Person) (c : ComplaintText) : Prop




axiom ConspiresToCommitOffense1028f (p : Person) (c : ComplaintText) : Prop







axiom ForfeitureProceedingUnderSection1028 (p : Person) (c : ComplaintText) : Prop





axiom ForfeitureGovernedByReferencedActProvision1028g
    (p : Person) (c : ComplaintText) : Prop






axiom ConvictedOfSubsectionAViolation1028h (p : Person) (c : ComplaintText) : Prop






axiom CourtOrderedForfeitureAndDisposition1028h
    (ct : Court) (p : Person) (c : ComplaintText) : Prop





axiom TierApplicable1028b (p : Person) (t : Tier1028b) (c : ComplaintText) : Prop




axiom PunishmentImposedWithinTier1028b
    (ct : Court) (p : Person) (t : Tier1028b) (c : ComplaintText) : Prop







axiom AddresseeWhoever1029a (p : Person) (c : ComplaintText) : Prop






axiom ProducesUsesOrTrafficsCounterfeitDevice1029a1
    (p : Person) (d : AccessArtifact) (c : ComplaintText) : Prop






axiom TrafficsOrUsesUnauthorizedDevices1029a2
    (p : Person) (d : AccessArtifact) (c : ComplaintText) : Prop





axiom PossessesFifteenOrMoreDevices1029a3 (p : Person) (c : ComplaintText) : Prop





axiom ProducesOrPossessesDeviceMakingEquipment1029a4
    (p : Person) (d : AccessArtifact) (c : ComplaintText) : Prop






axiom EffectsTransactionsWithAnothersDevices1029a5
    (p : Person) (d : AccessArtifact) (c : ComplaintText) : Prop






axiom SolicitsWithoutIssuerAuthorization1029a6
    (p : Person) (d : AccessArtifact) (c : ComplaintText) : Prop






axiom UsesModifiedTelecommunicationsInstrument1029a7
    (p : Person) (d : AccessArtifact) (c : ComplaintText) : Prop





axiom UsesScanningReceiver1029a8
    (p : Person) (d : AccessArtifact) (c : ComplaintText) : Prop







axiom UsesConfiguredHardwareOrSoftware1029a9
    (p : Person) (d : AccessArtifact) (c : ComplaintText) : Prop







axiom ArrangesPresentationOfTransactionRecords1029a10
    (p : Person) (d : AccessArtifact) (c : ComplaintText) : Prop






axiom AffectsInterstateOrForeignCommerce1029a (p : Person) (c : ComplaintText) : Prop








axiom LawfullyAuthorizedActivityExempt1029f (p : Person) (c : ComplaintText) : Prop






axiom CarrierAffiliatedActor1029g1 (p : Person) (c : ComplaintText) : Prop





axiom ProtectiveConductForCarrier1029g1 (p : Person) (c : ComplaintText) : Prop





axiom PurposeUnauthorizedServiceFromOtherCarrier1029g1
    (p : Person) (c : ComplaintText) : Prop






axiom ResearchOrDevelopmentPurpose1029g2 (p : Person) (c : ComplaintText) : Prop




axiom EstablishedByPreponderance1029g2 (p : Person) (c : ComplaintText) : Prop




axiom ConductIsProducingOrTrafficking1029g2 (p : Person) (c : ComplaintText) : Prop






axiom AttemptsOffense1029b1 (p : Person) (c : ComplaintText) : Prop




axiom PartyToConspiracy1029b2 (p : Person) (c : ComplaintText) : Prop




axiom ConductInFurtheranceByAnyParty1029b2 (p : Person) (c : ComplaintText) : Prop





axiom TierApplicable1029c (p : Person) (t : Tier1029c) (c : ComplaintText) : Prop




axiom PunishmentImposedWithinTier1029c
    (ct : Court) (p : Person) (t : Tier1029c) (c : ComplaintText) : Prop







axiom ForfeitureProceedingUnderSection1029 (p : Person) (c : ComplaintText) : Prop





axiom ForfeitureGovernedByReferencedActProvision1029c2
    (p : Person) (c : ComplaintText) : Prop






axiom IsUnitedStatesSecretService (ag : Agency) (c : ComplaintText) : Prop




axiom InvestigatesOffenseUnderSection1029
    (ag : Agency) (p : Person) (c : ComplaintText) : Prop




axiom AuthorityExercisedInAccordanceWithAgreement1029d
    (ag : Agency) (c : ComplaintText) : Prop




axiom AgreementEnteredByTreasuryAndAttorneyGeneral1029d (c : ComplaintText) : Prop






axiom ActsOutsideUnitedStatesJurisdiction1029h (p : Person) (c : ComplaintText) : Prop




axiom ConductWouldConstituteOffenseIfDomestic1029h
    (p : Person) (c : ComplaintText) : Prop







axiom InvolvesUnitedStatesConnectedAccessDevice1029h
    (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch47.Deontic
