












import Proving.USC.T18.Ch113B.Wmd.Part2.Deontic.Types
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Part2.Deontic

open Proving.USC.Common






axiom AddresseeAnyPerson (p : Person) (c : ComplaintText) : Prop






axiom ConductOccurredInUnitedStates (k : Conduct) (c : ComplaintText) : Prop





axiom ConductOccurredOutsideUnitedStates (k : Conduct) (c : ComplaintText) : Prop







axiom MailOrFacilityOfInterstateCommerceUsedInFurtherance (k : Conduct) (c : ComplaintText) : Prop




axiom OffenseObstructsDelaysOrAffectsInterstateCommerce (k : Conduct) (c : ComplaintText) : Prop





axiom OffenseWouldHaveAffectedInterstateCommerceIfConsummated (k : Conduct) (c : ComplaintText) : Prop




axiom VictimOrIntendedVictimIsUnitedStatesGovernment (k : Conduct) (c : ComplaintText) : Prop




axiom VictimOrIntendedVictimIsMemberOfUniformedServices (k : Conduct) (c : ComplaintText) : Prop






axiom VictimOrIntendedVictimIsFederalOfficialOfficerEmployeeOrAgent (k : Conduct) (c : ComplaintText) : Prop





axiom PropertyOwnedPossessedOrLeasedByUnitedStates (pr : Property) (c : ComplaintText) : Prop






axiom OffenseCommittedInTerritorialSeaOfUnitedStates (k : Conduct) (c : ComplaintText) : Prop




axiom OffenseCommittedWithinSpecialMaritimeAndTerritorialJurisdiction (k : Conduct) (c : ComplaintText) : Prop





axiom KilledVictim (p : Person) (v : Person) (k : Conduct) (c : ComplaintText) : Prop



axiom KidnappedVictim (p : Person) (v : Person) (k : Conduct) (c : ComplaintText) : Prop



axiom MaimedVictim (p : Person) (v : Person) (k : Conduct) (c : ComplaintText) : Prop







axiom CommittedAssaultResultingInSeriousBodilyInjury (p : Person) (v : Person) (k : Conduct) (c : ComplaintText) : Prop




axiom AssaultedWithDangerousWeapon (p : Person) (v : Person) (k : Conduct) (c : ComplaintText) : Prop




axiom VictimIsPersonWithinUnitedStates (v : Person) (c : ComplaintText) : Prop







axiom CreatedSubstantialRiskOfSeriousBodilyInjuryToAnotherPerson (p : Person) (k : Conduct) (c : ComplaintText) : Prop




axiom DestroyedOrDamagedProperty (p : Person) (pr : Property) (k : Conduct) (c : ComplaintText) : Prop





axiom AttemptedOrConspiredToDestroyOrDamageProperty (p : Person) (pr : Property) (k : Conduct) (c : ComplaintText) : Prop




axiom PropertyIsWithinUnitedStates (pr : Property) (c : ComplaintText) : Prop







axiom ViolatesLawOfAState (p : Person) (k : Conduct) (c : ComplaintText) : Prop




axiom ViolatesLawOfTheUnitedStates (p : Person) (k : Conduct) (c : ComplaintText) : Prop





axiom ThreatenedToCommitOffense (p : Person) (o : Offense) (c : ComplaintText) : Prop



axiom AttemptedToCommitOffense (p : Person) (o : Offense) (c : ComplaintText) : Prop



axiom ConspiredToCommitOffense (p : Person) (o : Offense) (c : ComplaintText) : Prop






axiom OffenseWouldBeConstitutedByConduct (o : Offense) (k : Conduct) (c : ComplaintText) : Prop






axiom IsPrincipalOfOffenseUnderThisSection (p : Person) (o : Offense) (c : ComplaintText) : Prop




axiom IsCoconspiratorOfOffenseUnderThisSection (p : Person) (o : Offense) (c : ComplaintText) : Prop




axiom IsAccessoryAfterTheFactToOffenseUnderThisSection (p : Person) (o : Offense) (c : ComplaintText) : Prop




axiom IsOffenderInOffense (p : Person) (o : Offense) (c : ComplaintText) : Prop




axiom JurisdictionExercisedOverOffender (p : Person) (o : Offense) (c : ComplaintText) : Prop







axiom AddresseeIsSentencingCourt (t : Tribunal) (c : ComplaintText) : Prop





axiom PersonConvictedOfViolationOfThisSection (p : Person) (c : ComplaintText) : Prop



axiom ConvictedForKilling (p : Person) (c : ComplaintText) : Prop




axiom DeathResultedFromOtherProhibitedConduct (p : Person) (c : ComplaintText) : Prop



axiom ConvictedForKidnapping (p : Person) (c : ComplaintText) : Prop



axiom ConvictedForMaiming (p : Person) (c : ComplaintText) : Prop




axiom ConvictedForAssaultWithDangerousWeaponOrResultingInSeriousBodilyInjury (p : Person) (c : ComplaintText) : Prop




axiom ConvictedForDestroyingOrDamagingProperty (p : Person) (c : ComplaintText) : Prop




axiom ConvictedForAttemptOrConspiracyToCommitOffense (p : Person) (o : Offense) (c : ComplaintText) : Prop




axiom ConvictedForThreateningToCommitOffense (p : Person) (c : ComplaintText) : Prop




axiom SentenceIsDeathOrImprisonmentForAnyTermOfYearsOrLife (s : Sentence) (c : ComplaintText) : Prop




axiom SentenceIsImprisonmentForAnyTermOfYearsOrLife (s : Sentence) (c : ComplaintText) : Prop





axiom SentenceIsImprisonmentNotMoreThanYears (s : Sentence) (n : Nat) (c : ComplaintText) : Prop





axiom SentenceDoesNotExceedMaximumForCompletedOffense (s : Sentence) (o : Offense) (c : ComplaintText) : Prop




axiom SentenceImposedOnPerson (t : Tribunal) (p : Person) (s : Sentence) (c : ComplaintText) : Prop






axiom PlacedPersonOnProbation (t : Tribunal) (p : Person) (c : ComplaintText) : Prop




axiom TermOfImprisonmentImposedUnderThisSection (s : Sentence) (p : Person) (c : ComplaintText) : Prop





axiom TermRunsConcurrentlyWithAnotherTermOfImprisonment (s : Sentence) (c : ComplaintText) : Prop






axiom IsProsecutionUnderThisSection (pros : Prosecution) (c : ComplaintText) : Prop



axiom JurisdictionalBaseAllegedInIndictment (pros : Prosecution) (c : ComplaintText) : Prop






axiom ProceededWithoutProvingDefendantKnowledgeOfJurisdictionalBase (pros : Prosecution) (p : Person) (c : ComplaintText) : Prop







axiom ProsecutionBasedOnAdoptionOfStateLaw (pros : Prosecution) (c : ComplaintText) : Prop




axiom AdoptedOnlyElementsOfOffenseUnderStateLaw (pros : Prosecution) (c : ComplaintText) : Prop




axiom AdoptedStateProvisionPertainingToCriminalProcedureOrEvidence (pros : Prosecution) (c : ComplaintText) : Prop







axiom IsAccessoryAfterTheFactUnderSection3 (p : Person) (o : Offense) (c : ComplaintText) : Prop





axiom ExtraterritorialFederalJurisdictionExercised (p : Person) (o : Offense) (c : ComplaintText) : Prop







axiom AddresseeIsAttorneyGeneral (p : Person) (c : ComplaintText) : Prop



axiom AddresseeIsSecretaryOfTheTreasury (p : Person) (c : ComplaintText) : Prop





axiom ExercisedPrimaryInvestigativeResponsibility (p : Person) (o : Offense) (c : ComplaintText) : Prop



axiom AssistedAttorneyGeneral (p : Person) (c : ComplaintText) : Prop




axiom AttorneyGeneralRequestedAssistance (c : ComplaintText) : Prop





axiom CalculatedToInfluenceOrAffectGovernmentConductByIntimidationOrCoercion (o : Offense) (c : ComplaintText) : Prop




axiom CalculatedToRetaliateAgainstGovernmentConduct (o : Offense) (c : ComplaintText) : Prop







axiom ViolatesEnumeratedTitle18TerrorismProvision (o : Offense) (c : ComplaintText) : Prop





axiom ViolatesEnumeratedAtomicEnergyActProvision (o : Offense) (c : ComplaintText) : Prop






axiom ViolatesEnumeratedTitle49Provision (o : Offense) (c : ComplaintText) : Prop





axiom ViolatesNarcoTerrorismProvision (o : Offense) (c : ComplaintText) : Prop





axiom ViolatesProvisionEnumeratedInSubsectionF (o : Offense) (c : ComplaintText) : Prop




axiom IsConstructionOfThisSection (x : Construction) (c : ComplaintText) : Prop





axiom ConstruedToInterfereWithSecretServiceAuthority (x : Construction) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch113B.Wmd.Part2.Deontic
