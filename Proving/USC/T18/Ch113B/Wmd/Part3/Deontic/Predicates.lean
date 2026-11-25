




import Proving.USC.Common.Types
import Proving.USC.T18.Ch113B.Wmd.Part3.Deontic.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Part3.Deontic

open Proving.USC.Common







axiom IsWeaponOfMassDestruction (w : Weapon) (c : ComplaintText) : Prop




axiom IsNationalOfTheUnitedStates (p : Person) (c : ComplaintText) : Prop



axiom IsRealOrPersonalProperty (pr : Property) (c : ComplaintText) : Prop





axiom ConductTranscendsNationalBoundaries (p : Person) (c : ComplaintText) : Prop






axiom IsFederalCrimeOfTerrorism (o : Offense) (c : ComplaintText) : Prop





axiom IsEnumeratedSection2332bFOffense (o : Offense) (c : ComplaintText) : Prop







axiom ActedWithoutLawfulAuthority (p : Person) (c : ComplaintText) : Prop





axiom IsPrincipalCoConspiratorOrAccessoryAfterTheFact
    (p : Person) (o : Offense) (c : ComplaintText) : Prop






axiom IsAdjudicatingCourt (t : Tribunal) (c : ComplaintText) : Prop



axiom IsAttorneyGeneral (e : Entity) (c : ComplaintText) : Prop



axiom IsSecretaryOfTheTreasury (e : Entity) (c : ComplaintText) : Prop








axiom UsedThreatenedAttemptedOrConspiredToUseWmd
    (p : Person) (w : Weapon) (c : ComplaintText) : Prop




axiom KilledKidnappedOrMaimedPersonWithinUnitedStates
    (p : Person) (v : Person) (c : ComplaintText) : Prop





axiom AssaultedPersonWithinUnitedStates
    (p : Person) (v : Person) (c : ComplaintText) : Prop






axiom CreatedSubstantialRiskOfSeriousBodilyInjuryByDamagingProperty
    (p : Person) (pr : Property) (c : ComplaintText) : Prop




axiom ThreatenedAttemptedOrConspiredToCommitSection2332bOffense
    (p : Person) (c : ComplaintText) : Prop




axiom PrescribedPunishmentImposed
    (t : Tribunal) (p : Person) (c : ComplaintText) : Prop




axiom ProbationImposedOnConvictedPerson
    (t : Tribunal) (p : Person) (c : ComplaintText) : Prop





axiom TermOfImprisonmentRunsConcurrently
    (t : Tribunal) (p : Person) (c : ComplaintText) : Prop





axiom ProofOfDefendantKnowledgeOfJurisdictionalBaseOmitted
    (p : Person) (c : ComplaintText) : Prop





axiom StateCriminalProcedureOrEvidenceProvisionsAdopted
    (t : Tribunal) (p : Person) (c : ComplaintText) : Prop




axiom PrimaryInvestigativeResponsibilityExercised
    (e : Entity) (o : Offense) (c : ComplaintText) : Prop




axiom AssistanceToAttorneyGeneralRendered (e : Entity) (c : ComplaintText) : Prop





axiom ConstructionInterferesWithSecretServiceAuthority
    (t : Tribunal) (c : ComplaintText) : Prop






axiom TargetIsUnitedStatesNationalOutsideUnitedStates
    (p : Person) (v : Person) (c : ComplaintText) : Prop




axiom TargetIsPersonOrPropertyWithinUnitedStates (p : Person) (c : ComplaintText) : Prop




axiom MailOrFacilityOfInterstateCommerceUsedInFurtherance
    (p : Person) (c : ComplaintText) : Prop




axiom PropertyUsedInOrAffectingInterstateCommerce
    (pr : Property) (c : ComplaintText) : Prop




axiom PerpetratorTravelsInInterstateCommerceInFurtherance
    (p : Person) (c : ComplaintText) : Prop






axiom OffenseAffectsInterstateOrForeignCommerce (p : Person) (c : ComplaintText) : Prop





axiom TargetIsPropertyOfTheUnitedStates (pr : Property) (c : ComplaintText) : Prop




axiom TargetIsForeignGovernmentPropertyWithinUnitedStates
    (pr : Property) (c : ComplaintText) : Prop



axiom ConductOccurredOutsideTheUnitedStates (p : Person) (c : ComplaintText) : Prop




axiom ConductViolatesLawsOfAStateOrTheUnitedStates (p : Person) (c : ComplaintText) : Prop





axiom VictimIsUnitedStatesGovernmentOrFederalOfficial (v : Person) (c : ComplaintText) : Prop





axiom PropertyIsOwnedPossessedOrLeasedByTheUnitedStates
    (pr : Property) (c : ComplaintText) : Prop






axiom OffenseCommittedInTerritorialSeaOfTheUnitedStates
    (p : Person) (c : ComplaintText) : Prop




axiom OffenseCommittedWithinSpecialMaritimeAndTerritorialJurisdiction
    (p : Person) (c : ComplaintText) : Prop




axiom AtLeastOneCircumstanceAppliesToAtLeastOneOffender
    (o : Offense) (c : ComplaintText) : Prop





axiom ConvictedOfViolatingSection2332b (p : Person) (c : ComplaintText) : Prop




axiom ProsecutionUnderSection2332bPending (p : Person) (c : ComplaintText) : Prop




axiom ProsecutionBasedOnAdoptionOfStateLaw (p : Person) (c : ComplaintText) : Prop




axiom OffenseIsUnderSubsection2332bA (o : Offense) (c : ComplaintText) : Prop




axiom IsAccessoryAfterTheFactToSection2332bOffense
    (p : Person) (o : Offense) (c : ComplaintText) : Prop




axiom AssistanceRequestedByAttorneyGeneral (e : Entity) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch113B.Wmd.Part3.Deontic
