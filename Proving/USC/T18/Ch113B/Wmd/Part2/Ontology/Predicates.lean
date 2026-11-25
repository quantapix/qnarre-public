







import Proving.USC.T18.Ch113B.Wmd.Part2.Ontology.Types
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Part2.Ontology

open Proving.USC.Common





axiom OccursWithinTheUnitedStates (x : Conduct) (c : ComplaintText) : Prop



axiom OccursOutsideTheUnitedStates (x : Conduct) (c : ComplaintText) : Prop







axiom IsFacilityOfInterstateOrForeignCommerce (f : Facility) (c : ComplaintText) : Prop






axiom IsSeriousBodilyInjury (i : Injury) (c : ComplaintText) : Prop





axiom ExtendsSeawardWithinTwelveNauticalMilesOfBaselines (l : Locale) (c : ComplaintText) : Prop




axiom BaselinesDeterminedInAccordanceWithInternationalLaw (l : Locale) (c : ComplaintText) : Prop






axiom IsCalculatedToInfluenceGovernmentConductByIntimidationOrCoercion
    (o : Offense) (c : ComplaintText) : Prop




axiom IsCalculatedToRetaliateAgainstGovernmentConduct (o : Offense) (c : ComplaintText) : Prop






axiom ViolatesEnumeratedTitle18TerrorismProvision (o : Offense) (c : ComplaintText) : Prop




axiom ViolatesEnumeratedAtomicEnergyActProvision (o : Offense) (c : ComplaintText) : Prop





axiom ViolatesEnumeratedTitle49Provision (o : Offense) (c : ComplaintText) : Prop




axiom ViolatesNarcoterrorismProvision (o : Offense) (c : ComplaintText) : Prop






axiom IsPersonWithinTheUnitedStates (p : Person) (c : ComplaintText) : Prop



axiom KillsPerson (x : Conduct) (p : Person) (c : ComplaintText) : Prop



axiom KidnapsPerson (x : Conduct) (p : Person) (c : ComplaintText) : Prop



axiom MaimsPerson (x : Conduct) (p : Person) (c : ComplaintText) : Prop





axiom AssaultsPerson (x : Conduct) (p : Person) (c : ComplaintText) : Prop




axiom InjuryResultsToPersonFromConduct
    (x : Conduct) (p : Person) (i : Injury) (c : ComplaintText) : Prop




axiom AssaultCommittedWithDangerousWeapon (x : Conduct) (c : ComplaintText) : Prop






axiom IsStructureConveyanceOrOtherRealOrPersonalProperty
    (q : PropertyObject) (c : ComplaintText) : Prop



axiom IsLocatedWithinTheUnitedStates (q : PropertyObject) (c : ComplaintText) : Prop



axiom DestroysOrDamagesProperty (x : Conduct) (q : PropertyObject) (c : ComplaintText) : Prop





axiom AttemptsOrConspiresToDestroyOrDamageProperty
    (x : Conduct) (q : PropertyObject) (c : ComplaintText) : Prop




axiom CreatesSubstantialRiskOfSeriousBodilyInjuryToAnotherPerson
    (x : Conduct) (p : Person) (c : ComplaintText) : Prop





axiom IsLawOfAState (l : LawProvision) (c : ComplaintText) : Prop




axiom IsLawOfTheUnitedStates (l : LawProvision) (c : ComplaintText) : Prop



axiom ViolatesLawProvision (x : Conduct) (l : LawProvision) (c : ComplaintText) : Prop




axiom IsElementOfTheOffenseUnderStateLaw (l : LawProvision) (c : ComplaintText) : Prop




axiom IsProvisionPertainingToCriminalProcedureOrEvidence
    (l : LawProvision) (c : ComplaintText) : Prop





axiom OffenseConsistsOfConduct (o : Offense) (x : Conduct) (c : ComplaintText) : Prop








axiom IsTheCircumstanceOfOffense (s : Circumstance) (o : Offense) (c : ComplaintText) : Prop





axiom IsTheMail (f : Facility) (c : ComplaintText) : Prop




axiom UsedInFurtheranceOfOffense (f : Facility) (o : Offense) (c : ComplaintText) : Prop






axiom ObstructsDelaysOrAffectsInterstateOrForeignCommerce
    (o : Offense) (c : ComplaintText) : Prop





axiom WouldHaveAffectedInterstateOrForeignCommerceIfConsummated
    (o : Offense) (c : ComplaintText) : Prop






axiom IsVictimOrIntendedVictimOfOffense (p : Person) (o : Offense) (c : ComplaintText) : Prop




axiom IsEntityVictimOrIntendedVictimOfOffense
    (e : Entity) (o : Offense) (c : ComplaintText) : Prop



axiom IsTheUnitedStatesGovernment (e : Entity) (c : ComplaintText) : Prop




axiom IsMemberOfTheUniformedServices (p : Person) (c : ComplaintText) : Prop





axiom IsFederalOfficialOfficerEmployeeOrAgent (p : Person) (c : ComplaintText) : Prop





axiom IsTheUnitedStates (e : Entity) (c : ComplaintText) : Prop




axiom IsDepartmentOrAgencyOfTheUnitedStates (e : Entity) (c : ComplaintText) : Prop




axiom IsOwnedPossessedOrLeasedInWholeOrInPartTo
    (q : PropertyObject) (e : Entity) (c : ComplaintText) : Prop





axiom OffenseCommittedInLocale (o : Offense) (l : Locale) (c : ComplaintText) : Prop






axiom IsAppurtenanceOfTheTerritorialSea (l : Locale) (c : ComplaintText) : Prop





axiom IsWithinSpecialMaritimeAndTerritorialJurisdiction (l : Locale) (c : ComplaintText) : Prop





axiom IsPrincipalOfOffense (p : Person) (o : Offense) (c : ComplaintText) : Prop



axiom IsCoconspiratorOfOffense (p : Person) (o : Offense) (c : ComplaintText) : Prop





axiom IsAccessoryAfterTheFactToOffense (p : Person) (o : Offense) (c : ComplaintText) : Prop



axiom CircumstanceApplicableToOffender (s : Circumstance) (p : Person) (c : ComplaintText) : Prop





axiom ThreatensToCommitOffense (x : Conduct) (o : Offense) (c : ComplaintText) : Prop



axiom AttemptsToCommitOffense (x : Conduct) (o : Offense) (c : ComplaintText) : Prop



axiom ConspiresToCommitOffense (x : Conduct) (o : Offense) (c : ComplaintText) : Prop





axiom DeathResultsToPersonFromConduct (x : Conduct) (p : Person) (c : ComplaintText) : Prop




axiom ConductFallsWithinProhibitedClass
    (x : Conduct) (k : ProhibitedConductClass) (c : ComplaintText) : Prop






axiom IsAllegedInTheIndictment (s : Circumstance) (ind : Indictment) (c : ComplaintText) : Prop





axiom DefendantKnowsOfJurisdictionalBase
    (p : Person) (s : Circumstance) (c : ComplaintText) : Prop




axiom IsProsecutionUnderThisSection (pr : Prosecution) (o : Offense) (c : ComplaintText) : Prop




axiom IsProsecutionBasedOnAdoptionOfStateLaw
    (pr : Prosecution) (l : LawProvision) (c : ComplaintText) : Prop








axiom IsListedAttorneyGeneralResponsibilityOffense (o : Offense) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch113B.Wmd.Part2.Ontology
