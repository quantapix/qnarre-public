








import Proving.USC.T18.Ch73.Elements.Predicates
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch73.Elements

open Proving.USC.Common





inductive Section1503Means (p : Person) (c : ComplaintText) : Prop where
  | corrupt          (h : ActedCorruptly p c)
  | forcible         (h : UsedForceOrThreatOfForce p c)
  | threateningComm  (h : UsedThreateningCommunication p c)



inductive Section1503Object (t : Person) (c : ComplaintText) : Prop where
  | jurorOrOfficer (h : TargetIsJurorOrCourtOfficer t c)
  | dueAdmin       (h : AffectsDueAdministrationOfJustice c)


structure Section1503Endeavor (p t : Person) (c : ComplaintText) : Prop where
  means    : Section1503Means p c
  endeavor : EndeavoredToInfluenceOrObstruct p c
  object   : Section1503Object t c
  nexus    : NexusToOfficialProceeding c
  federal  : FederalJurisdictionalNexus c


structure Section1503Injury (p t : Person) (c : ComplaintText) : Prop where
  target  : TargetIsJurorOrCourtOfficer t c
  injury  : InjuredOnAccountOfOfficialAct p t c
  federal : FederalJurisdictionalNexus c


inductive Section1503Offense (p t : Person) (c : ComplaintText) : Prop where
  | endeavor (h : Section1503Endeavor p t c)
  | injury   (h : Section1503Injury p t c)





inductive ObstructionObject (pr : Proceeding) (c : ComplaintText) : Prop where
  | proceeding    (h : IsOfficialProceeding pr c)
  | communication (h : RelatesToFederalCommunication c)



inductive Section1512ForceAct (p t : Person) (c : ComplaintText) : Prop where
  | kill  (h : KilledOrAttemptedToKill p t c)
  | force (h : UsedForceOrThreatOfForce p c)


structure Section1512Force (p t : Person) (pr : Proceeding) (c : ComplaintText) : Prop where
  act     : Section1512ForceAct p t c
  intent  : IntentToPreventOrObstruct p c
  object  : ObstructionObject pr c
  federal : FederalJurisdictionalNexus c



structure Section1512Persuasion (p t : Person) (pr : Proceeding) (c : ComplaintText) : Prop where
  act     : UsedIntimidationOrCorruptPersuasion p t c
  intent  : IntentToPreventOrObstruct p c
  object  : ObstructionObject pr c
  federal : FederalJurisdictionalNexus c



structure Section1512Tampering (p : Person) (pr : Proceeding) (c : ComplaintText) : Prop where
  corrupt    : ActedCorruptly p c
  act        : TamperedWithRecordOrProceeding p c
  proceeding : IsOfficialProceeding pr c
  nexus      : NexusToOfficialProceeding c
  federal    : FederalJurisdictionalNexus c


structure Section1512Harassment (p t : Person) (pr : Proceeding) (c : ComplaintText) : Prop where
  act     : IntentionallyHarassed p t c
  object  : ObstructionObject pr c
  federal : FederalJurisdictionalNexus c


inductive Section1512Offense (p t : Person) (pr : Proceeding) (c : ComplaintText) : Prop where
  | force      (h : Section1512Force p t pr c)
  | persuasion (h : Section1512Persuasion p t pr c)
  | tampering  (h : Section1512Tampering p pr c)
  | harassment (h : Section1512Harassment p t pr c)




structure Section1513Kill (p t : Person) (c : ComplaintText) : Prop where
  act     : KilledOrAttemptedToKill p t c
  intent  : IntentToRetaliate p c
  target  : TargetIsWitnessVictimOrInformant t c
  federal : FederalJurisdictionalNexus c


structure Section1513Injury (p t : Person) (c : ComplaintText) : Prop where
  act     : CausedBodilyInjuryOrThreat p t c
  intent  : IntentToRetaliate p c
  target  : TargetIsWitnessVictimOrInformant t c
  federal : FederalJurisdictionalNexus c


structure Section1513Livelihood (p t : Person) (c : ComplaintText) : Prop where
  act     : TookActionHarmfulToLivelihood p t c
  intent  : IntentToRetaliate p c
  federal : FederalJurisdictionalNexus c


inductive Section1513Offense (p t : Person) (c : ComplaintText) : Prop where
  | kill       (h : Section1513Kill p t c)
  | injury     (h : Section1513Injury p t c)
  | livelihood (h : Section1513Livelihood p t c)

end Proving.USC.T18.Ch73.Elements
