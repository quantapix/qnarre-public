





















import Proving.USC.T18.Elements.Statute
import Proving.USC.T18.Remedy.Statute
import Proving.USC.T18.Procedure.Statute

namespace Proving.USC.Reconciled.T18
open Proving.USC
open Proving.USC.Common




structure ValidCivilRicoComplaint1962c
    (plaintiff defendant : Person) (e : Entity)
    (acts : List T18.Elements.Act) (c : ComplaintText) : Prop where
  violation : T18.Elements.Section1962c defendant e acts c
  standing  : T18.Remedy.Standing1964c plaintiff c
  timely    : T18.Procedure.TimelyFiling plaintiff c

theorem validCivilRicoComplaint1962c_intro
    {plaintiff defendant : Person} {e : Entity}
    {acts : List T18.Elements.Act} {c : ComplaintText}
    (hViol : T18.Elements.Section1962c defendant e acts c)
    (hStand : T18.Remedy.Standing1964c plaintiff c)
    (hTimely : T18.Procedure.TimelyFiling plaintiff c)
    : ValidCivilRicoComplaint1962c plaintiff defendant e acts c :=
  ⟨hViol, hStand, hTimely⟩

end Proving.USC.Reconciled.T18
