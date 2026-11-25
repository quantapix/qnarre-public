









import Proving.USC.T08.Elements.Types

namespace Proving.USC.T08.Elements
open Proving.USC.Common






axiom IsAlien (a : Person) (c : ComplaintText) : Prop





axiom KnowsPersonIsAlien (p : Person) (c : ComplaintText) : Prop



axiom BringsOrAttemptsToBringToUS (p : Person) (c : ComplaintText) : Prop



axiom AtPlaceOtherThanDesignated (p : Person) (c : ComplaintText) : Prop







axiom KnowsOrRecklessUnlawfulPresence (p : Person) (c : ComplaintText) : Prop



axiom TransportsOrMovesWithinUS (p : Person) (c : ComplaintText) : Prop


axiom InFurtheranceOfUnlawfulPresence (p : Person) (c : ComplaintText) : Prop






axiom ConcealsHarborsOrShields (p : Person) (c : ComplaintText) : Prop






axiom EncouragesOrInducesEntry (p : Person) (c : ComplaintText) : Prop



axiom KnowsOrRecklessEntryUnlawful (p : Person) (c : ComplaintText) : Prop





axiom ReligiousWorkerException (p : Person) (c : ComplaintText) : Prop






axiom AidsOrAbetsOffense (p : Person) (c : ComplaintText) : Prop








axiom KnowsNoPriorAuthorization (p : Person) (c : ComplaintText) : Prop






axiom HiresTenOrMoreInTwelveMonths (p : Person) (c : ComplaintText) : Prop




axiom ActualKnowledgeIndividualsAreUnauthorizedAliens (p : Person) (c : ComplaintText) : Prop






axiom AlienInadmissibleCriminalOrSecurity (a : Person) (c : ComplaintText) : Prop



axiom KnowinglyAidsOrAssistsEntry (p : Person) (c : ComplaintText) : Prop



axiom ConnivesOrConspiresToAllowEntry (p : Person) (c : ComplaintText) : Prop






axiom ImportsOrAttemptsToImportAlien (p : Person) (c : ComplaintText) : Prop



axiom ForProstitutionOrImmoralPurpose (p : Person) (c : ComplaintText) : Prop


axiom HoldsAlienForImmoralPurpose (p : Person) (c : ComplaintText) : Prop



axiom KeepsMaintainsOrHarborsForImmoralPurpose (p : Person) (c : ComplaintText) : Prop



axiom InPursuanceOfIllegalImportation (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T08.Elements
