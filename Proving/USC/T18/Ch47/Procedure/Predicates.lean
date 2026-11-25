










import Proving.USC.T18.Ch47.Procedure.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch47.Procedure

open Proving.USC.Common









axiom DocumentIsUnitedStatesOrSpecialEventIssued
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop



axiom OffenseIsDefraudUnitedStatesPossession
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop



axiom AffectsInterstateOrForeignCommerce
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop


axiom TransportedInTheMail
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop


axiom ConductOutsideUnitedStatesJurisdiction
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop


axiom AccessDeviceControlledByUnitedStatesEntity
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop






axiom ChargeInstituted
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop




axiom ConvictionEntered
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop




axiom ForfeitureAndDestructionOrdered
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop





axiom ForfeitureProcedureFollowedSection413
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop




axiom AgencyHasInvestigativeAuthority
    (a : Agency) (pr : Prosecution) (c : ComplaintText) : Prop





axiom TreasuryAttorneyGeneralAgreementInEffect
    (a : Agency) (pr : Prosecution) (c : ComplaintText) : Prop



axiom PriorConvictionUnderThisSectionExists
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop











axiom LawfullyAuthorizedInvestigativeActivity
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop




axiom CarrierProtectivePurposeConduct
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop




axiom ChargedConductIsProducingOrTrafficking
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop




axiom ResearchOrDevelopmentLawfulPurpose
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop




axiom DefendantEstablishedByPreponderance
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop




axiom ChargedUnderSubsectionA9
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop






axiom FacilitatesDomesticOrInternationalTerrorism
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop



axiom FacilitatesDrugTraffickingCrime
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop



axiom InConnectionWithCrimeOfViolence
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop



axiom ProductionOrTransferOfUnitedStatesOrIdentityDocument
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop



axiom OffenseUnderParagraphFive
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop



axiom OffenseUnderParagraphSeven
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop



axiom OffenseUnderParagraphThree
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop





axiom AnyOtherProductionTransferOrUse
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop





axiom OffenseUnderHigherPenaltyParagraph1029
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop




axiom OffenseUnderStandardPenaltyParagraph1029
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop





axiom AttemptedOffense
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop




axiom ConspiracyOfTwoOrMore
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop





axiom OvertActInFurtherance
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop












axiom AggregationPeriodStartDay
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Nat




axiom AggregationPeriodEndDay
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Nat




axiom AggregateValueObtainedCents
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Nat





axiom DocumentsProducedOrTransferredCount
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Nat




axiom PriorConvictionFinalDay
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Nat






axiom PriorConvictionEntryDay
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Nat




axiom OffenseCommencementDay
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Nat

end Proving.USC.T18.Ch47.Procedure
