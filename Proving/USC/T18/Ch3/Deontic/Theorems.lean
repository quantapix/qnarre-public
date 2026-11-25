import Proving.USC.T18.Ch3.Deontic.Statute










namespace Proving.USC.T18.Ch3.Deontic

open Proving.USC.Common

theorem prohibitionViolated41_intro {p c}
    (hAddr : IsAddresseeAnyPerson p c) (hCond : ConditionMet41 c)
    (hAct : RegulatedActOccurred41 p c) : ProhibitionViolated41 p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

theorem prohibitionViolated42Import_intro {p c}
    (hAddr : IsAddresseeAnyPerson p c) (hCond : ConditionMet42Import c)
    (hAct : RegulatedActOccurred42Import p c) : ProhibitionViolated42Import p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

theorem obligation42ExportBreached_intro {p c}
    (hAddr : IsImporterOrConsignee p c) (hCond : ConditionMet42Export p c)
    (hNotAct : ¬ RegulatedActOccurred42Export p c) : Obligation42ExportBreached p c :=
  ⟨⟨hAddr, hCond⟩, hNotAct⟩

theorem prohibitionViolated42Transport_intro {p c}
    (hAddr : IsAddresseeAnyPerson p c) (hCond : ConditionMet42Transport c)
    (hAct : RegulatedActOccurred42Transport p c) : ProhibitionViolated42Transport p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

theorem prohibitionViolated43_intro {p e c}
    (hAddr : IsAddresseeAnyPerson p c) (hComm : InterstateOrForeignCommerceNexus c)
    (hCond : ConditionMet43 p e c) (hAct : RegulatedActOccurred43 p e c)
    : ProhibitionViolated43 p e c :=
  ⟨⟨hAddr, hComm, hCond⟩, hAct⟩

theorem prohibitionViolated47a_intro {p c}
    (hAddr : IsAddresseeAnyPerson p c) (hCond : ConditionMet47a c)
    (hAct : RegulatedActOccurred47a p c) : ProhibitionViolated47a p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

theorem prohibitionViolated47b_intro {p c}
    (hAddr : IsAddresseeAnyPerson p c) (hCond : ConditionMet47b c)
    (hAct : RegulatedActOccurred47b p c) : ProhibitionViolated47b p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

theorem prohibitionViolated48Crush_intro {p c}
    (hAddr : IsAddresseeAnyPerson p c) (hComm : InterstateOrForeignCommerceNexus c)
    (hAct : RegulatedActOccurred48Crush p c) : ProhibitionViolated48Crush p c :=
  ⟨⟨hAddr, hComm⟩, hAct⟩

theorem prohibitionViolated48Video_intro {p c}
    (hAddr : IsAddresseeAnyPerson p c) (hComm : InterstateOrForeignCommerceNexus c)
    (hAct : RegulatedActOccurred48Video p c) : ProhibitionViolated48Video p c :=
  ⟨⟨hAddr, hComm⟩, hAct⟩

theorem prohibitionViolated48Distribute_intro {p c}
    (hAddr : IsAddresseeAnyPerson p c) (hComm : InterstateOrForeignCommerceNexus c)
    (hAct : RegulatedActOccurred48Distribute p c) : ProhibitionViolated48Distribute p c :=
  ⟨⟨hAddr, hComm⟩, hAct⟩

theorem prohibitionViolated49_intro {p c}
    (hAddr : IsAddresseeAnyPerson p c) (hCond : ConditionMet49 c)
    (hAct : RegulatedActOccurred49 p c) : ProhibitionViolated49 p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

end Proving.USC.T18.Ch3.Deontic
