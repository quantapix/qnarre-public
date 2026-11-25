










import Proving.USC.Common.Types
import Proving.USC.T18.Ch113B.Wmd.Part3.Procedure.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Part3.Procedure

open Proving.USC.Common







axiom Conduct2332aAlleged (p : Person) (c : ComplaintText) : Prop




axiom Base2332aEstablished (b : Base2332a) (p : Person) (c : ComplaintText) : Prop




axiom DeathResulted (p : Person) (c : ComplaintText) : Prop




axiom IsNationalOfTheUnitedStates (p : Person) (c : ComplaintText) : Prop









axiom Conduct2332bAlleged (p : Person) (c : ComplaintText) : Prop




axiom Inchoate2332bAlleged (p : Person) (c : ComplaintText) : Prop





axiom ConductTranscendsNationalBoundaries (p : Person) (c : ComplaintText) : Prop




axiom ViolatesStateOrFederalLaw (p : Person) (c : ComplaintText) : Prop




axiom Circumstance2332bPresentAsTo
    (x : Circumstance2332b) (o : Person) (c : ComplaintText) : Prop




axiom HasRole (r : OffenderRole) (o : Person) (c : ComplaintText) : Prop





axiom CoOffenderInSameOffense (o d : Person) (c : ComplaintText) : Prop






axiom KnewJurisdictionalBase (d : Person) (c : ComplaintText) : Prop




axiom StateLawElementsSatisfied (d : Person) (c : ComplaintText) : Prop






axiom StateProcedureOrEvidenceRuleSatisfied (d : Person) (c : ComplaintText) : Prop







axiom SeriousBodilyInjuryAsDefined (p : Person) (c : ComplaintText) : Prop





axiom CalculatedToInfluenceOrRetaliateAgainstGovernment
    (p : Person) (c : ComplaintText) : Prop




axiom ViolatesEnumeratedTerrorismOffense (p : Person) (c : ComplaintText) : Prop




axiom ChargedUnderEnumeratedInvestigativeOffense
    (x : EnumeratedInvestigativeOffense) (p : Person) (c : ComplaintText) : Prop





axiom AttorneyGeneralRequestedTreasuryAssistance (c : ComplaintText) : Prop





axiom SecretServiceActingUnderSection3056 (c : ComplaintText) : Prop




axiom ProbationImposed (s : SentencingRecord) (c : ComplaintText) : Prop




axiom AnotherTermOfImprisonmentExists (s : SentencingRecord) (c : ComplaintText) : Prop







axiom chargedConductClass (s : SentencingRecord) (c : ComplaintText) : ConductClass




axiom imposedTermYears (s : SentencingRecord) (c : ComplaintText) : Nat




axiom otherTermsEndDay (s : SentencingRecord) (c : ComplaintText) : Nat





axiom sectionTermStartDay (s : SentencingRecord) (c : ComplaintText) : Nat

end Proving.USC.T18.Ch113B.Wmd.Part3.Procedure
