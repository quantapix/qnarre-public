








import Proving.USC.T18.Ch1.Part2.Elements.Types

namespace Proving.USC.T18.Ch1.Part2.Elements

open Proving.USC.Common





axiom IsObligationOrSecurityOfForeignGovernment (i : Instrument) (c : ComplaintText) : Prop





axiom HasForceElement (o : Offense) (c : ComplaintText) : Prop



axiom IsFelonyOffense (o : Offense) (c : ComplaintText) : Prop




axiom ByNatureSubstantialRiskOfForce (o : Offense) (c : ComplaintText) : Prop





axiom HasSevereMentalDiseaseOrDefect (p : Person) (c : ComplaintText) : Prop




axiom UnableToAppreciateNatureAndQuality (p : Person) (c : ComplaintText) : Prop




axiom UnableToAppreciateWrongfulness (p : Person) (c : ComplaintText) : Prop




axiom MentalDefectAtTimeOfOffense (p : Person) (c : ComplaintText) : Prop





axiom IsOrganization (e : Entity) (c : ComplaintText) : Prop





axiom IsPettyOffense (o : Offense) (c : ComplaintText) : Prop









axiom IsFinancialInstitution (e : Entity) (c : ComplaintText) : Prop






axiom PropertyOfStolenOrCounterfeitCharacter (pr : Property) (c : ComplaintText) : Prop




axiom DefendantKnewStolenCharacter (p : Person) (c : ComplaintText) : Prop






axiom IsCourtOfTheUnitedStates (ct : Court) (c : ComplaintText) : Prop





axiom ViolatesEnumeratedHealthOffenseListOne (o : Offense) (c : ComplaintText) : Prop





axiom ViolatesEnumeratedHealthOffenseListTwo (o : Offense) (c : ComplaintText) : Prop




axiom RelatesToHealthCareBenefitProgram (o : Offense) (c : ComplaintText) : Prop





axiom ProvidesMedicalBenefitUnderPlanOrContract (e : Entity) (c : ComplaintText) : Prop




axiom IsAdultEighteenOrOlder (p : Person) (c : ComplaintText) : Prop




axiom IntentionallyUsesMinor (p : Person) (c : ComplaintText) : Prop



axiom UseToCommitCrimeOfViolence (p : Person) (c : ComplaintText) : Prop




axiom UseToAvoidDetectionOrApprehension (p : Person) (c : ComplaintText) : Prop




axiom ProsecutableInCourtOfUnitedStates (p : Person) (c : ComplaintText) : Prop





axiom IsSeaport (pl : Place) (c : ComplaintText) : Prop






axiom FinancesOrRefinancesRealEstateDebt (e : Entity) (c : ComplaintText) : Prop





axiom IsCoveredFederalOffense (o : Offense) (c : ComplaintText) : Prop




axiom WasVictimOfTrafficking (p : Person) (c : ComplaintText) : Prop




axiom VictimStatusAtTimeOfOffense (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch1.Part2.Elements
