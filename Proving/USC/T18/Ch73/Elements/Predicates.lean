








import Proving.USC.T18.Ch73.Elements.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch73.Elements

open Proving.USC.Common






axiom ActedCorruptly (p : Person) (c : ComplaintText) : Prop



axiom UsedForceOrThreatOfForce (p : Person) (c : ComplaintText) : Prop



axiom UsedThreateningCommunication (p : Person) (c : ComplaintText) : Prop





axiom EndeavoredToInfluenceOrObstruct (p : Person) (c : ComplaintText) : Prop




axiom TargetIsJurorOrCourtOfficer (t : Person) (c : ComplaintText) : Prop



axiom AffectsDueAdministrationOfJustice (c : ComplaintText) : Prop




axiom InjuredOnAccountOfOfficialAct (p : Person) (t : Person) (c : ComplaintText) : Prop





axiom NexusToOfficialProceeding (c : ComplaintText) : Prop





axiom KilledOrAttemptedToKill (p : Person) (t : Person) (c : ComplaintText) : Prop




axiom IntentToPreventOrObstruct (p : Person) (c : ComplaintText) : Prop




axiom UsedIntimidationOrCorruptPersuasion (p : Person) (t : Person) (c : ComplaintText) : Prop




axiom TamperedWithRecordOrProceeding (p : Person) (c : ComplaintText) : Prop




axiom IntentionallyHarassed (p : Person) (t : Person) (c : ComplaintText) : Prop




axiom IsOfficialProceeding (pr : Proceeding) (c : ComplaintText) : Prop





axiom RelatesToFederalCommunication (c : ComplaintText) : Prop






axiom IntentToRetaliate (p : Person) (c : ComplaintText) : Prop




axiom CausedBodilyInjuryOrThreat (p : Person) (t : Person) (c : ComplaintText) : Prop




axiom TookActionHarmfulToLivelihood (p : Person) (t : Person) (c : ComplaintText) : Prop




axiom TargetIsWitnessVictimOrInformant (t : Person) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch73.Elements
