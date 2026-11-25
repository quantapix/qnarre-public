







import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch113B.Wmd.Procedure.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Procedure

open Proving.USC.Common






axiom ActedWithoutLawfulAuthority (d : Person) (c : ComplaintText) : Prop




axiom VictimIsUnitedStatesNationalAbroad (d : Person) (c : ComplaintText) : Prop




axiom TargetWithinUnitedStates (d : Person) (c : ComplaintText) : Prop





axiom MailOrInterstateFacilityUsedInFurtherance (d : Person) (c : ComplaintText) : Prop




axiom PropertyUsedInOrAffectingInterstateCommerce (d : Person) (c : ComplaintText) : Prop




axiom PerpetratorTraveledInInterstateCommerce (d : Person) (c : ComplaintText) : Prop




axiom OffenseAffectedInterstateCommerce (d : Person) (c : ComplaintText) : Prop




axiom TargetIsUnitedStatesOwnedOrUsedProperty (d : Person) (c : ComplaintText) : Prop




axiom TargetIsForeignGovernmentPropertyWithinUnitedStates (d : Person) (c : ComplaintText) : Prop




axiom DefendantIsNationalOfUnitedStates (d : Person) (c : ComplaintText) : Prop



axiom ConductOccurredOutsideUnitedStates (d : Person) (c : ComplaintText) : Prop




axiom DeathResultedFromOffense (d : Person) (c : ComplaintText) : Prop







axiom ConductTranscendedNationalBoundaries (d : Person) (c : ComplaintText) : Prop





axiom ConductViolatedStateOrFederalLaw (d : Person) (c : ComplaintText) : Prop




axiom OffenseObstructedDelayedOrAffectedInterstateCommerce (d : Person) (c : ComplaintText) : Prop





axiom VictimIsUnitedStatesGovernmentOrFederalOfficial (d : Person) (c : ComplaintText) : Prop





axiom PropertyOwnedPossessedOrLeasedToUnitedStates (d : Person) (c : ComplaintText) : Prop






axiom OffenseCommittedInTerritorialSea (d : Person) (c : ComplaintText) : Prop




axiom OffenseCommittedWithinSpecialMaritimeAndTerritorialJurisdiction
  (d : Person) (c : ComplaintText) : Prop




axiom DefendantIsPrincipalCoconspiratorOrAccessoryAfterTheFact
  (d : Person) (c : ComplaintText) : Prop






axiom CircumstanceAppliesToAtLeastOneOffender (d : Person) (c : ComplaintText) : Prop





axiom convictedConductClass (d : Person) (c : ComplaintText) : ConductClass





axiom termOfImprisonmentYearsImposed (d : Person) (c : ComplaintText) : Nat




axiom ProbationImposed (d : Person) (c : ComplaintText) : Prop




axiom TermRunsConcurrentlyWithAnotherTerm (d : Person) (c : ComplaintText) : Prop




axiom JurisdictionalBaseAllegedInIndictment
  (i : ChargingInstrument) (c : ComplaintText) : Prop






axiom DefendantKnewJurisdictionalBase (d : Person) (c : ComplaintText) : Prop




axiom OffenseBasedOnAdoptionOfStateLaw (d : Person) (c : ComplaintText) : Prop





axiom OnlyStateLawElementsApplied (d : Person) (c : ComplaintText) : Prop




axiom ConductWasAccessoryAfterTheFactUnderSection3
  (d : Person) (c : ComplaintText) : Prop





axiom CalculatedToInfluenceGovernmentConduct (d : Person) (c : ComplaintText) : Prop




axiom ViolatesEnumeratedTerrorismOffense (d : Person) (c : ComplaintText) : Prop







axiom ViolatesSection2332bEnumeratedInvestigativeOffense
  (d : Person) (c : ComplaintText) : Prop





axiom AttorneyGeneralRequestedTreasuryAssistance (d : Person) (c : ComplaintText) : Prop




axiom SecretServiceAuthorityUnderSection3056Applies
  (d : Person) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch113B.Wmd.Procedure
