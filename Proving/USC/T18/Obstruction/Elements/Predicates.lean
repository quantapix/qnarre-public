















import Proving.USC.T18.Obstruction.Elements.Types
import Proving.USC.Common.Predicates

namespace Proving.USC.T18.Obstruction.Elements

open Proving.USC.Common







axiom UsedCorruptOrForcibleMeans (p : Person) (c : ComplaintText) : Prop





axiom EndeavoredToInfluenceJudicialActor (p : Person) (j : JudicialActor) (c : ComplaintText) : Prop





axiom ObstructedDueAdministrationOfJustice (p : Person) (op : OfficialProceeding) (c : ComplaintText) : Prop






axiom KilledOrAttemptedKilling (p : Person) (w : ProtectedWitness) (c : ComplaintText) : Prop




axiom UsedPhysicalForceAgainstPerson (p : Person) (w : ProtectedWitness) (c : ComplaintText) : Prop





axiom IntimidatedOrCorruptlyPersuaded (p : Person) (w : ProtectedWitness) (c : ComplaintText) : Prop





axiom CorruptlyObstructedOfficialProceeding (p : Person) (op : OfficialProceeding) (c : ComplaintText) : Prop





axiom IntentionallyHarassedToDissuade (p : Person) (w : ProtectedWitness) (c : ComplaintText) : Prop







axiom IntentToAffectProceedingOrCommunication (p : Person) (op : OfficialProceeding) (c : ComplaintText) : Prop







axiom NotSolelyLawfulTruthfulConduct (p : Person) (c : ComplaintText) : Prop






axiom CausedBodilyInjuryOrPropertyDamage (p : Person) (w : ProtectedWitness) (c : ComplaintText) : Prop





axiom TookHarmfulActionAgainstInformant (p : Person) (w : ProtectedWitness) (c : ComplaintText) : Prop






axiom IntentToRetaliateForProtectedAct (p : Person) (op : OfficialProceeding) (c : ComplaintText) : Prop

end Proving.USC.T18.Obstruction.Elements
