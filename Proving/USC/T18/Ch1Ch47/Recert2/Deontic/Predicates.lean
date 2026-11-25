import Proving.USC.T18.Ch1Ch47.Recert2.Deontic.Types
import Proving.USC.Common.Types

set_option autoImplicit false











namespace Proving.USC.T18.Ch1Ch47.Recert2.Deontic

open Proving.USC.Common






axiom AddresseeAnyPerson (p : Person) (c : ComplaintText) : Prop




axiom AddresseeSentencingCourt (ct : Court) (c : ComplaintText) : Prop




axiom AffectsInterstateOrForeignCommerce (o : OffenseInstance) (c : ComplaintText) : Prop




axiom ExemptAuthorizedLawEnforcementActivity (p : Person) (c : ComplaintText) : Prop






axiom LocusWithinSMTJ (l : Locus) (c : ComplaintText) : Prop




axiom Section7Paragraph9Locus (l : Locus) (c : ComplaintText) : Prop




axiom OffenderDescribedInSection3261a (p : Person) (c : ComplaintText) : Prop




axiom AddresseeInterpretingCourt (ct : Court) (c : ComplaintText) : Prop




axiom Paragraph9ConflictsWithTreaty (t : Treaty) (c : ComplaintText) : Prop




axiom DeemedToSupersedeConflictingTreaty (ct : Court) (t : Treaty) (c : ComplaintText) : Prop






axiom IsFinancialInstitution (i : Institution) (c : ComplaintText) : Prop






axiom AddresseeProponentOfProof (g : Person) (c : ComplaintText) : Prop




axiom StolenOrCounterfeitNatureIsElement (pr : Property) (c : ComplaintText) : Prop




axiom OfficialRepresentationMade (d : Person) (pr : Property) (c : ComplaintText) : Prop




axiom DefendantBelievedPropertyOfSuchCharacter (d : Person) (pr : Property) (c : ComplaintText) : Prop




axiom EstablishesElementByBeliefProof (g : Person) (d : Person) (pr : Property) (c : ComplaintText) : Prop






axiom IsCourtOfTheUnitedStates (ct : Court) (c : ComplaintText) : Prop




axiom OtherwiseExpresslyProvided (c : ComplaintText) : Prop






axiom ViolationOfEnumeratedHealthCareStatute (o : OffenseInstance) (c : ComplaintText) : Prop




axiom ViolationOfConditionedHealthCareStatute (o : OffenseInstance) (c : ComplaintText) : Prop




axiom RelatesToHealthCareBenefitProgram (o : OffenseInstance) (c : ComplaintText) : Prop




axiom IsHealthCareBenefitProgram (e : Entity) (c : ComplaintText) : Prop






axiom ProhibitedAct1028a1 (p : Person) (d : IdentificationObject) (c : ComplaintText) : Prop




axiom ProhibitedAct1028a2 (p : Person) (d : IdentificationObject) (c : ComplaintText) : Prop




axiom ProhibitedAct1028a3 (p : Person) (d : IdentificationObject) (c : ComplaintText) : Prop




axiom ProhibitedAct1028a4 (p : Person) (d : IdentificationObject) (c : ComplaintText) : Prop




axiom ProhibitedAct1028a5 (p : Person) (d : IdentificationObject) (c : ComplaintText) : Prop




axiom ProhibitedAct1028a6 (p : Person) (d : IdentificationObject) (c : ComplaintText) : Prop




axiom ProhibitedAct1028a7 (p : Person) (d : IdentificationObject) (c : ComplaintText) : Prop




axiom ProhibitedAct1028a8 (p : Person) (d : IdentificationObject) (c : ComplaintText) : Prop




axiom Circumstance1028c1 (d : IdentificationObject) (c : ComplaintText) : Prop




axiom TransportedInMailInCourseOfConduct (d : IdentificationObject) (o : OffenseInstance) (c : ComplaintText) : Prop




axiom AttemptedOrConspired1028f (p : Person) (c : ComplaintText) : Prop




axiom ConvictedOfViolation1028a (p : Person) (o : OffenseInstance) (c : ComplaintText) : Prop




axiom AddresseeCourtOfConviction (ct : Court) (o : OffenseInstance) (c : ComplaintText) : Prop




axiom OrderedForfeitureAndDisposition1028h (ct : Court) (o : OffenseInstance) (c : ComplaintText) : Prop




axiom ForfeitureUnderSection1028 (o : OffenseInstance) (c : ComplaintText) : Prop




axiom AddresseeForfeitingAuthority (ct : Court) (c : ComplaintText) : Prop




axiom ForfeitureGovernedBySection413 (o : OffenseInstance) (c : ComplaintText) : Prop




axiom PunishedAsProvided1028b (ct : Court) (p : Person) (o : OffenseInstance) (c : ComplaintText) : Prop




axiom SingleDocumentBearingMultipleMeans (d : IdentificationObject) (c : ComplaintText) : Prop






axiom ProhibitedAct1029a1 (p : Person) (dv : AccessDevice) (c : ComplaintText) : Prop




axiom ProhibitedAct1029a2 (p : Person) (dv : AccessDevice) (c : ComplaintText) : Prop




axiom ProhibitedAct1029a3 (p : Person) (dv : AccessDevice) (c : ComplaintText) : Prop




axiom ProhibitedAct1029a4 (p : Person) (dv : AccessDevice) (c : ComplaintText) : Prop




axiom ProhibitedAct1029a5 (p : Person) (dv : AccessDevice) (c : ComplaintText) : Prop




axiom ProhibitedAct1029a6 (p : Person) (dv : AccessDevice) (c : ComplaintText) : Prop




axiom ProhibitedAct1029a7 (p : Person) (dv : AccessDevice) (c : ComplaintText) : Prop




axiom ProhibitedAct1029a8 (p : Person) (dv : AccessDevice) (c : ComplaintText) : Prop




axiom ProhibitedAct1029a9 (p : Person) (dv : AccessDevice) (c : ComplaintText) : Prop




axiom ProhibitedAct1029a10 (p : Person) (dv : AccessDevice) (c : ComplaintText) : Prop




axiom Attempted1029b1 (p : Person) (c : ComplaintText) : Prop




axiom PartyToConspiracy1029b2 (p : Person) (c : ComplaintText) : Prop




axiom OvertActInFurtherance1029b2 (c : ComplaintText) : Prop




axiom ConvictedOfViolation1029 (p : Person) (o : OffenseInstance) (c : ComplaintText) : Prop




axiom PunishedAsProvided1029c (ct : Court) (p : Person) (o : OffenseInstance) (c : ComplaintText) : Prop




axiom AddresseeSecretService (a : Agency) (c : ComplaintText) : Prop




axiom HasAuthorityToInvestigate1029d (a : Agency) (o : OffenseInstance) (c : ComplaintText) : Prop




axiom AddresseeTreasuryAndAttorneyGeneral (a : Agency) (c : ComplaintText) : Prop




axiom InteragencyAgreementEntered (ag : Agreement) (c : ComplaintText) : Prop




axiom AuthorityExercisedInAccordanceWithAgreement (a : Agency) (ag : Agreement) (c : ComplaintText) : Prop




axiom IsFacilitiesBasedCarrier (e : Entity) (c : ComplaintText) : Prop




axiom IsCreditCardSystemMember (e : Entity) (c : ComplaintText) : Prop




axiom AddresseeCarrierAffiliate (p : Person) (e : Entity) (c : ComplaintText) : Prop




axiom ProtectiveConductForCarrier (p : Person) (e : Entity) (c : ComplaintText) : Prop




axiom TraffickingConduct1029g1 (p : Person) (c : ComplaintText) : Prop




axiom PurposeObtainAnotherCarriersService (p : Person) (c : ComplaintText) : Prop




axiom ProducingOrTrafficking1029g2 (p : Person) (c : ComplaintText) : Prop




axiom ResearchOrDevelopmentDefenseEstablished (p : Person) (c : ComplaintText) : Prop




axiom ActOutsideUnitedStatesJurisdiction (p : Person) (c : ComplaintText) : Prop




axiom WouldConstituteOffenseUnder1029ab (p : Person) (dv : AccessDevice) (c : ComplaintText) : Prop




axiom DeviceLinkedToUnitedStatesEntity (dv : AccessDevice) (i : Institution) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch1Ch47.Recert2.Deontic
