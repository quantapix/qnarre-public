













import Proving.USC.T18.Obstruction.Elements.Predicates
import Proving.USC.Common.Predicates

namespace Proving.USC.T18.Obstruction.Elements

open Proving.USC.Common








structure Section1503NamedActor (p : Person) (j : JudicialActor) (c : ComplaintText) : Prop where
  means     : UsedCorruptOrForcibleMeans p c
  scienter  : ActedWithScienter p c
  endeavor  : EndeavoredToInfluenceJudicialActor p j c
  federal   : FederalJurisdictionalNexus c



structure Section1503Omnibus (p : Person) (op : OfficialProceeding) (c : ComplaintText) : Prop where
  means     : UsedCorruptOrForcibleMeans p c
  scienter  : ActedWithScienter p c
  obstruct  : ObstructedDueAdministrationOfJustice p op c
  federal   : FederalJurisdictionalNexus c


inductive Section1503Violation (p : Person) (c : ComplaintText) : Prop where
  | namedActor {j : JudicialActor}     (h : Section1503NamedActor p j c)  : Section1503Violation p c
  | omnibus    {op : OfficialProceeding} (h : Section1503Omnibus p op c)  : Section1503Violation p c










structure Section1512Killing (p : Person) (w : ProtectedWitness) (op : OfficialProceeding) (c : ComplaintText) : Prop where
  conduct  : KilledOrAttemptedKilling p w c
  intent   : IntentToAffectProceedingOrCommunication p op c
  notDefense : NotSolelyLawfulTruthfulConduct p c
  federal  : FederalJurisdictionalNexus c


structure Section1512Force (p : Person) (w : ProtectedWitness) (op : OfficialProceeding) (c : ComplaintText) : Prop where
  conduct  : UsedPhysicalForceAgainstPerson p w c
  intent   : IntentToAffectProceedingOrCommunication p op c
  notDefense : NotSolelyLawfulTruthfulConduct p c
  federal  : FederalJurisdictionalNexus c



structure Section1512Intimidation (p : Person) (w : ProtectedWitness) (op : OfficialProceeding) (c : ComplaintText) : Prop where
  conduct   : IntimidatedOrCorruptlyPersuaded p w c
  scienter  : ActedWithScienter p c
  intent    : IntentToAffectProceedingOrCommunication p op c
  notDefense : NotSolelyLawfulTruthfulConduct p c
  federal   : FederalJurisdictionalNexus c


structure Section1512CorruptObstruction (p : Person) (op : OfficialProceeding) (c : ComplaintText) : Prop where
  conduct   : CorruptlyObstructedOfficialProceeding p op c
  scienter  : ActedWithScienter p c
  notDefense : NotSolelyLawfulTruthfulConduct p c
  federal   : FederalJurisdictionalNexus c


structure Section1512Harassment (p : Person) (w : ProtectedWitness) (op : OfficialProceeding) (c : ComplaintText) : Prop where
  conduct   : IntentionallyHarassedToDissuade p w c
  intent    : IntentToAffectProceedingOrCommunication p op c
  notDefense : NotSolelyLawfulTruthfulConduct p c
  federal   : FederalJurisdictionalNexus c


inductive Section1512Violation (p : Person) (c : ComplaintText) : Prop where
  | killing       {w op} (h : Section1512Killing p w op c)           : Section1512Violation p c
  | force         {w op} (h : Section1512Force p w op c)             : Section1512Violation p c
  | intimidation  {w op} (h : Section1512Intimidation p w op c)      : Section1512Violation p c
  | corruptObstr  {op}   (h : Section1512CorruptObstruction p op c)  : Section1512Violation p c
  | harassment    {w op} (h : Section1512Harassment p w op c)        : Section1512Violation p c








structure Section1513Killing (p : Person) (w : ProtectedWitness) (op : OfficialProceeding) (c : ComplaintText) : Prop where
  conduct  : KilledOrAttemptedKilling p w c
  intent   : IntentToRetaliateForProtectedAct p op c
  federal  : FederalJurisdictionalNexus c


structure Section1513Injury (p : Person) (w : ProtectedWitness) (op : OfficialProceeding) (c : ComplaintText) : Prop where
  conduct   : CausedBodilyInjuryOrPropertyDamage p w c
  scienter  : ActedWithScienter p c
  intent    : IntentToRetaliateForProtectedAct p op c
  federal   : FederalJurisdictionalNexus c


structure Section1513HarmfulAction (p : Person) (w : ProtectedWitness) (op : OfficialProceeding) (c : ComplaintText) : Prop where
  conduct   : TookHarmfulActionAgainstInformant p w c
  scienter  : ActedWithScienter p c
  intent    : IntentToRetaliateForProtectedAct p op c
  federal   : FederalJurisdictionalNexus c


inductive Section1513Violation (p : Person) (c : ComplaintText) : Prop where
  | killing       {w op} (h : Section1513Killing p w op c)        : Section1513Violation p c
  | injury        {w op} (h : Section1513Injury p w op c)         : Section1513Violation p c
  | harmfulAction {w op} (h : Section1513HarmfulAction p w op c)  : Section1513Violation p c

end Proving.USC.T18.Obstruction.Elements
