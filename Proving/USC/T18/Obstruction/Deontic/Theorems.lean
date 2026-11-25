










import Proving.USC.T18.Obstruction.Deontic.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T18.Obstruction.Deontic

open Proving.USC.Common



theorem prohibition1503Violated_intro {p op c}
    (hAddr : AddresseeInClass1503 p c) (hCond : ConditionMet1503 op c)
    (hAct : RegulatedActOccurred1503 p op c) : Prohibition1503Violated p op c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩



theorem prohibition1512Violated_intro {p op c}
    (hAddr : AddresseeInClass1512 p c) (hCond : ConditionMet1512 op c)
    (hNoDef : ¬ LawfulTruthfulDefense1512 p c)
    (hAct : RegulatedActOccurred1512 p op c) : Prohibition1512Violated p op c :=
  ⟨⟨hAddr, hCond, hNoDef⟩, hAct⟩



theorem prohibition1513Violated_intro {p op c}
    (hAddr : AddresseeInClass1513 p c) (hCond : ConditionMet1513 op c)
    (hAct : RegulatedActOccurred1513 p op c) : Prohibition1513Violated p op c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem obstructionViolated_intro_1503 {p op c}
    (h : Prohibition1503Violated p op c) : ObstructionViolated p op c :=
  .influencingOfficerOrJuror h


theorem obstructionViolated_intro_1512 {p op c}
    (h : Prohibition1512Violated p op c) : ObstructionViolated p op c :=
  .witnessTampering h


theorem obstructionViolated_intro_1513 {p op c}
    (h : Prohibition1513Violated p op c) : ObstructionViolated p op c :=
  .witnessRetaliation h

end Proving.USC.T18.Obstruction.Deontic
