







import Proving.USC.T18.Ch113B.Wmd.Part2.Elements.Types
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Part2.Elements

open Proving.USC.Common









axiom ConductOccurringOutsideTheUnitedStates (o : Offense) (c : ComplaintText) : Prop



axiom ConductOccurringWithinTheUnitedStates (o : Offense) (c : ComplaintText) : Prop






axiom MailOrFacilityOfCommerceUsedInFurtherance (o : Offense) (c : ComplaintText) : Prop




axiom OffenseAffectsInterstateOrForeignCommerce (o : Offense) (c : ComplaintText) : Prop





axiom OffenseWouldHaveAffectedCommerceIfConsummated (o : Offense) (c : ComplaintText) : Prop





axiom VictimIsUnitedStatesGovernmentOrFederalPersonnel
    (v : Person) (o : Offense) (c : ComplaintText) : Prop




axiom PropertyOwnedPossessedOrLeasedToTheUnitedStates
    (pr : Property) (c : ComplaintText) : Prop






axiom OffenseCommittedInWatersSeawardOfTheBaselines
    (o : Offense) (c : ComplaintText) : Prop







axiom nauticalMilesSeawardFromTheBaselines (o : Offense) (c : ComplaintText) : Nat




axiom OffenseCommittedWithinSpecialMaritimeAndTerritorialJurisdiction
    (o : Offense) (c : ComplaintText) : Prop





axiom KillsPerson (p : Person) (o : Offense) (v : Person) (c : ComplaintText) : Prop



axiom KidnapsPerson (p : Person) (o : Offense) (v : Person) (c : ComplaintText) : Prop



axiom MaimsPerson (p : Person) (o : Offense) (v : Person) (c : ComplaintText) : Prop






axiom CommitsAssaultResultingInSeriousBodilyInjury
    (p : Person) (o : Offense) (v : Person) (c : ComplaintText) : Prop



axiom AssaultsWithADangerousWeapon
    (p : Person) (o : Offense) (v : Person) (c : ComplaintText) : Prop






axiom CreatesSubstantialRiskOfSeriousBodilyInjury
    (p : Person) (o : Offense) (c : ComplaintText) : Prop




axiom IsStructureConveyanceOrOtherProperty (pr : Property) (c : ComplaintText) : Prop




axiom PropertyIsWithinTheUnitedStates (pr : Property) (c : ComplaintText) : Prop



axiom DestroysOrDamagesProperty
    (p : Person) (o : Offense) (pr : Property) (c : ComplaintText) : Prop




axiom AttemptsOrConspiresToDestroyOrDamageProperty
    (p : Person) (o : Offense) (pr : Property) (c : ComplaintText) : Prop





axiom SubstantialRiskArisesFromThePropertyConduct
    (o : Offense) (pr : Property) (c : ComplaintText) : Prop








axiom ViolatesTheLawOfAnyState (p : Person) (o : Offense) (c : ComplaintText) : Prop



axiom ViolatesTheLawOfTheUnitedStates
    (p : Person) (o : Offense) (c : ComplaintText) : Prop





axiom CommunicatesAThreatToCommitTheObjectOffense
    (p : Person) (o : Offense) (obj : Offense) (c : ComplaintText) : Prop





axiom ThreatIsATrueThreat (p : Person) (o : Offense) (c : ComplaintText) : Prop





axiom IntendsToCommitTheObjectOffense
    (p : Person) (obj : Offense) (c : ComplaintText) : Prop




axiom TakesASubstantialStepTowardTheObjectOffense
    (p : Person) (o : Offense) (obj : Offense) (c : ComplaintText) : Prop




axiom JoinsTheAgreement (p : Person) (ag : Agreement) (c : ComplaintText) : Prop




axiom TheAgreementsObjectIsTheOffense
    (ag : Agreement) (obj : Offense) (c : ComplaintText) : Prop





axiom IsAPrincipalOfTheOffense (p : Person) (o : Offense) (c : ComplaintText) : Prop



axiom IsACoconspiratorOfTheOffense (p : Person) (o : Offense) (c : ComplaintText) : Prop




axiom IsAnAccessoryAfterTheFactToTheOffense
    (p : Person) (o : Offense) (c : ComplaintText) : Prop







axiom DeathResultsFromConductProhibitedByThisSection
    (o : Offense) (v : Person) (c : ComplaintText) : Prop







axiom CalculatedToInfluenceGovernmentByIntimidationOrCoercion
    (o : Offense) (c : ComplaintText) : Prop




axiom CalculatedToRetaliateAgainstGovernmentConduct
    (o : Offense) (c : ComplaintText) : Prop




axiom ViolatesAnEnumeratedTitle18Provision (o : Offense) (c : ComplaintText) : Prop




axiom ViolatesAnEnumeratedAtomicEnergyActProvision
    (o : Offense) (c : ComplaintText) : Prop




axiom ViolatesAnEnumeratedTitle49Provision (o : Offense) (c : ComplaintText) : Prop




axiom ViolatesSection1010ANarcoTerrorism (o : Offense) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch113B.Wmd.Part2.Elements
