














import Proving.USC.Common.Types
import Proving.USC.T18.Ch1.Deontic.Types
import Proving.USC.T18.Ch1.Deontic.Predicates

namespace Proving.USC.T18.Ch1.Deontic

open Proving.USC.Common




structure Prohibition2a (p : Person) (o : Offense) (c : ComplaintText) : Prop where
  offense : OffenseAgainstUS o c



def Prohibition2aViolated (p : Person) (o : Offense) (c : ComplaintText) : Prop :=
  Prohibition2a p o c ∧ AbettedCommission p o c






def Prohibition2bViolated (p : Person) (o : Offense) (c : ComplaintText) : Prop :=
  WillfullyCausedOffense p o c





structure Prohibition3 (p : Person) (o : Offense) (c : ComplaintText) : Prop where
  offense  : OffenseAgainstUS o c
  scienter : KnowsOffenseCommitted p o c




def Prohibition3Violated (p : Person) (o : Offense) (c : ComplaintText) : Prop :=
  Prohibition3 p o c ∧ AssistedOffenderToHinder p o c







structure Obligation4 (p : Person) (o : Offense) (c : ComplaintText) : Prop where
  scienter : KnowsFelonyCommitted p o c



def Obligation4Breached (p : Person) (o : Offense) (c : ComplaintText) : Prop :=
  Obligation4 p o c ∧ ¬ MadeKnownAsSoonAsPossible p o c



def Prohibition4Violated (p : Person) (o : Offense) (c : ComplaintText) : Prop :=
  KnowsFelonyCommitted p o c ∧ ConcealedFelony p o c



def Misprision4 (p : Person) (o : Offense) (c : ComplaintText) : Prop :=
  Obligation4Breached p o c ∧ ConcealedFelony p o c






structure Prohibition13a (p : Person) (c : ComplaintText) : Prop where
  enclave    : WithinFederalEnclave p c
  notFed     : NotPunishableByCongress c
  stateCrime : PunishableUnderStateLaw c



def Prohibition13aViolated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition13a p c ∧ CommittedAssimilatedActOrOmission p c

end Proving.USC.T18.Ch1.Deontic
