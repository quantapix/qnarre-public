








import Proving.USC.T42.TitleVIIEnf.Sanction.Types
import Proving.USC.T42.TitleVIIEnf.Sanction.Predicates

namespace Proving.USC.T42.TitleVIIEnf.Sanction

open Proving.USC.Common





def Fine2000e5b : Sanction := ⟨.Fine, 1000, .Ceiling⟩


def Imprisonment2000e5b : Sanction := ⟨.Imprisonment, 1, .Ceiling⟩



def Fine2000e8e : Sanction := ⟨.Fine, 1000, .Ceiling⟩


def Imprisonment2000e8e : Sanction := ⟨.Imprisonment, 1, .Ceiling⟩






def WithinRange (sought stat : Sanction) : Prop :=
  match stat.dir with
  | .Ceiling => sought.bound ≤ stat.bound
  | .Floor   => stat.bound ≤ sought.bound
  | .Exact   => sought.bound = stat.bound





structure Sanction2000e5b (c : ComplaintText) where

  fineSought   : Sanction

  fineHonours  : WithinRange fineSought Fine2000e5b

  prisonSought : Sanction

  prisonHonours : WithinRange prisonSought Imprisonment2000e5b

  offense      : OffenseTriggered .DiscloseConciliationInfo c

  finePleaded  : SanctionSought fineSought c




structure Sanction2000e8e (c : ComplaintText) where
  fineSought    : Sanction
  fineHonours   : WithinRange fineSought Fine2000e8e
  prisonSought  : Sanction
  prisonHonours : WithinRange prisonSought Imprisonment2000e8e
  offense       : OffenseTriggered .DiscloseCommissionInfo c
  finePleaded   : SanctionSought fineSought c





structure NoSanction2000e12b (c : ComplaintText) : Prop where

  barEstablished : GoodFaithRelianceBar c

end Proving.USC.T42.TitleVIIEnf.Sanction
