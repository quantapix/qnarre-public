







import Proving.USC.Common.Types
import Proving.USC.T18.Ch1.Deontic.Types
import Proving.USC.T18.Ch1.Deontic.Predicates
import Proving.USC.T18.Ch1.Deontic.Statute

namespace Proving.USC.T18.Ch1.Deontic

open Proving.USC.Common


theorem prohibition2a_violated_intro {p : Person} {o : Offense} {c : ComplaintText}
    (hOffense : OffenseAgainstUS o c) (hAct : AbettedCommission p o c) :
    Prohibition2aViolated p o c :=
  ⟨⟨hOffense⟩, hAct⟩


theorem prohibition2b_violated_intro {p : Person} {o : Offense} {c : ComplaintText}
    (hAct : WillfullyCausedOffense p o c) :
    Prohibition2bViolated p o c :=
  hAct


theorem prohibition3_violated_intro {p : Person} {o : Offense} {c : ComplaintText}
    (hOffense : OffenseAgainstUS o c) (hScienter : KnowsOffenseCommitted p o c)
    (hAct : AssistedOffenderToHinder p o c) :
    Prohibition3Violated p o c :=
  ⟨⟨hOffense, hScienter⟩, hAct⟩


theorem obligation4_breached_intro {p : Person} {o : Offense} {c : ComplaintText}
    (hScienter : KnowsFelonyCommitted p o c)
    (hNoReport : ¬ MadeKnownAsSoonAsPossible p o c) :
    Obligation4Breached p o c :=
  ⟨⟨hScienter⟩, hNoReport⟩


theorem prohibition4_violated_intro {p : Person} {o : Offense} {c : ComplaintText}
    (hScienter : KnowsFelonyCommitted p o c) (hConceal : ConcealedFelony p o c) :
    Prohibition4Violated p o c :=
  ⟨hScienter, hConceal⟩


theorem misprision4_intro {p : Person} {o : Offense} {c : ComplaintText}
    (hScienter : KnowsFelonyCommitted p o c)
    (hNoReport : ¬ MadeKnownAsSoonAsPossible p o c) (hConceal : ConcealedFelony p o c) :
    Misprision4 p o c :=
  ⟨⟨⟨hScienter⟩, hNoReport⟩, hConceal⟩



theorem prohibition13a_violated_intro {p : Person} {c : ComplaintText}
    (hEnclave : WithinFederalEnclave p c) (hNotFed : NotPunishableByCongress c)
    (hStateCrime : PunishableUnderStateLaw c)
    (hAct : CommittedAssimilatedActOrOmission p c) :
    Prohibition13aViolated p c :=
  ⟨⟨hEnclave, hNotFed, hStateCrime⟩, hAct⟩

end Proving.USC.T18.Ch1.Deontic
