






import Proving.USC.T18.Ch113B.Wmd.Part2.Procedure.Types
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Part2.Procedure

open Proving.USC.Common






axiom ChargedAsOffenseUnderThisSection (o : Offense) (c : ComplaintText) : Prop








axiom ConductOccurredWithinUnitedStates (o : Offense) (c : ComplaintText) : Prop




axiom ConductOccurredOutsideUnitedStates (o : Offense) (c : ComplaintText) : Prop










axiom MailOrInterstateFacilityUsedInFurtherance
    (o : Offense) (x : Person) (c : ComplaintText) : Prop




axiom OffenseObstructedDelayedOrAffectedCommerce
    (o : Offense) (x : Person) (c : ComplaintText) : Prop





axiom OffenseWouldHaveAffectedCommerceIfConsummated
    (o : Offense) (x : Person) (c : ComplaintText) : Prop




axiom VictimIsUnitedStatesGovernment (o : Offense) (x : Person) (c : ComplaintText) : Prop




axiom VictimIsMemberOfUniformedServices (o : Offense) (x : Person) (c : ComplaintText) : Prop





axiom VictimIsFederalOfficialOfficerEmployeeOrAgent
    (o : Offense) (x : Person) (c : ComplaintText) : Prop





axiom PropertyOwnedPossessedOrLeasedByUnitedStates
    (o : Offense) (x : Person) (c : ComplaintText) : Prop








axiom OffenseSiteWithinTerritorialSeaLocus
    (o : Offense) (x : Person) (c : ComplaintText) : Prop






axiom nauticalMilesSeawardFromBaseline (o : Offense) (c : ComplaintText) : Nat




axiom OffenseCommittedWithinSpecialMaritimeAndTerritorialJurisdiction
    (o : Offense) (x : Person) (c : ComplaintText) : Prop





axiom IsPrincipalOfOffense (x : Person) (o : Offense) (c : ComplaintText) : Prop



axiom IsCoConspiratorOfOffense (x : Person) (o : Offense) (c : ComplaintText) : Prop



axiom IsAccessoryAfterTheFactToOffense (x : Person) (o : Offense) (c : ComplaintText) : Prop





axiom JurisdictionalBaseAllegedInIndictment
    (i : Indictment) (o : Offense) (c : ComplaintText) : Prop






axiom DefendantKnewJurisdictionalBase (x : Person) (o : Offense) (c : ComplaintText) : Prop






axiom ProsecutionBasedOnAdoptedStateLaw (o : Offense) (c : ComplaintText) : Prop




axiom StateProvisionDefinesElementOfOffense
    (s : StateLawProvision) (o : Offense) (c : ComplaintText) : Prop




axiom StateProvisionPertainsToCriminalProcedureOrEvidence
    (s : StateLawProvision) (c : ComplaintText) : Prop





axiom OffenseIsUnderSubsectionA (o : Offense) (c : ComplaintText) : Prop





axiom OffenseIsThreatAttemptOrConspiracy (o : Offense) (c : ComplaintText) : Prop





axiom ConductRendersAccessoryAfterTheFactUnderSection3
    (x : Person) (o : Offense) (c : ComplaintText) : Prop






axiom CalculatedToInfluenceGovernmentConduct (o : Offense) (c : ComplaintText) : Prop




axiom CalculatedToRetaliateAgainstGovernmentConduct (o : Offense) (c : ComplaintText) : Prop




axiom ViolatesEnumeratedTitle18TerrorismOffense (o : Offense) (c : ComplaintText) : Prop




axiom ViolatesAtomicEnergyActOffense (o : Offense) (c : ComplaintText) : Prop





axiom ViolatesEnumeratedTitle49Offense (o : Offense) (c : ComplaintText) : Prop




axiom ViolatesNarcoterrorismOffense (o : Offense) (c : ComplaintText) : Prop









axiom ViolatesSectionListedInSubsectionF (o : Offense) (c : ComplaintText) : Prop




axiom AttorneyGeneralRequestedTreasuryAssistance (o : Offense) (c : ComplaintText) : Prop




axiom SecretServiceActingUnderSection3056Authority (o : Offense) (c : ComplaintText) : Prop






axiom ProsecutionCommencedUnderThisSection
    (x : Person) (o : Offense) (c : ComplaintText) : Prop



axiom ConvictedOfViolationOfThisSection (x : Person) (o : Offense) (c : ComplaintText) : Prop




axiom SentencePlacesDefendantOnProbation (s : Sentence) (c : ComplaintText) : Prop





axiom SubjectToAnotherTermOfImprisonment (s : Sentence) (c : ComplaintText) : Prop





axiom sentenceCommencementDay (s : Sentence) (c : ComplaintText) : Nat




axiom priorTermCompletionDay (s : Sentence) (c : ComplaintText) : Nat

end Proving.USC.T18.Ch113B.Wmd.Part2.Procedure
