













import Proving.USC.Common.Types
import Proving.USC.T18.Ch1.Deontic.Types

namespace Proving.USC.T18.Ch1.Deontic

open Proving.USC.Common







axiom OffenseAgainstUS (o : Offense) (c : ComplaintText) : Prop




axiom AbettedCommission (p : Person) (o : Offense) (c : ComplaintText) : Prop




axiom WillfullyCausedOffense (p : Person) (o : Offense) (c : ComplaintText) : Prop







axiom KnowsOffenseCommitted (p : Person) (o : Offense) (c : ComplaintText) : Prop




axiom AssistedOffenderToHinder (p : Person) (o : Offense) (c : ComplaintText) : Prop







axiom KnowsFelonyCommitted (p : Person) (o : Offense) (c : ComplaintText) : Prop




axiom ConcealedFelony (p : Person) (o : Offense) (c : ComplaintText) : Prop





axiom MadeKnownAsSoonAsPossible (p : Person) (o : Offense) (c : ComplaintText) : Prop









axiom WithinFederalEnclave (p : Person) (c : ComplaintText) : Prop




axiom NotPunishableByCongress (c : ComplaintText) : Prop





axiom PunishableUnderStateLaw (c : ComplaintText) : Prop



axiom CommittedAssimilatedActOrOmission (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch1.Deontic
