






import Proving.USC.T18.Ch11.Deontic.Statute

namespace Proving.USC.T18.Ch11.Deontic

open Proving.USC.Common



theorem prohibition201Bribery_violated_intro {p c}
    (hAddr : AddresseeInClass201 p c) (hAct : RegulatedActOccurred201Bribery p c)
    : Prohibition201BriberyViolated p c := ⟨⟨hAddr⟩, hAct⟩

theorem prohibition201Gratuity_violated_intro {p c}
    (hAddr : AddresseeInClass201 p c) (hAct : RegulatedActOccurred201Gratuity p c)
    : Prohibition201GratuityViolated p c := ⟨⟨hAddr⟩, hAct⟩



theorem prohibition203_violated_intro {p c}
    (hAddr : AddresseeInClass203 p c) (hAct : RegulatedActOccurred203 p c)
    : Prohibition203Violated p c := ⟨⟨hAddr⟩, hAct⟩



theorem prohibition204_violated_intro {p c}
    (hAct : RegulatedActOccurred204 p c) : Prohibition204Violated p c := hAct



theorem prohibition205_violated_intro {p c}
    (hAddr : AddresseeInClass205 p c) (hAct : RegulatedActOccurred205 p c)
    : Prohibition205Violated p c := ⟨⟨hAddr⟩, hAct⟩



theorem permission206_intro {p c}
    (h : ExemptionApplies206 p c) : Permission206 p c := h



theorem prohibition207_violated_intro {p c}
    (hAddr : AddresseeInClass207 p c) (hCond : ConditionMet207 c)
    (hAct : RegulatedActOccurred207 p c)
    : Prohibition207Violated p c := ⟨⟨hAddr, hCond⟩, hAct⟩

theorem prohibition207Foreign_violated_intro {p c}
    (hAddr : AddresseeInClass207 p c) (hAct : RegulatedActOccurred207Foreign p c)
    : Prohibition207ForeignViolated p c := ⟨hAddr, hAct⟩



theorem prohibition208_violated_intro {p c}
    (hAddr : AddresseeInClass208 p c) (hAct : RegulatedActOccurred208 p c)
    : Prohibition208Violated p c := ⟨⟨hAddr⟩, hAct⟩



theorem prohibition209_violated_intro {p c}
    (hAddr : AddresseeInClass209 p c) (hAct : RegulatedActOccurred209 p c)
    : Prohibition209Violated p c := ⟨⟨hAddr⟩, hAct⟩



theorem prohibition210_violated_intro {p c}
    (hAct : RegulatedActOccurred210 p c) : Prohibition210Violated p c := hAct

theorem prohibition211_violated_intro {p c}
    (hAct : RegulatedActOccurred211 p c) : Prohibition211Violated p c := hAct



theorem prohibition212_violated_intro {p c}
    (hAddr : AddresseeInClass212 p c) (hAct : RegulatedActOccurred212 p c)
    : Prohibition212Violated p c := ⟨⟨hAddr⟩, hAct⟩

theorem prohibition213_violated_intro {p c}
    (hAddr : AddresseeInClass213 p c) (hAct : RegulatedActOccurred213 p c)
    : Prohibition213Violated p c := ⟨⟨hAddr⟩, hAct⟩



theorem prohibition214_violated_intro {p c}
    (hAct : RegulatedActOccurred214 p c) : Prohibition214Violated p c := hAct



theorem prohibition215_violated_intro {p c}
    (hAddr : AddresseeInClass215 p c) (hAct : RegulatedActOccurred215 p c)
    : Prohibition215Violated p c := ⟨⟨hAddr⟩, hAct⟩

theorem obligation215_breached_intro {c}
    (h : ¬ GuidelinesEstablished215 c) : Obligation215Breached c := h



theorem prohibition217_violated_intro {p c}
    (hAddr : AddresseeInClass217 p c) (hAct : RegulatedActOccurred217 p c)
    : Prohibition217Violated p c := ⟨⟨hAddr⟩, hAct⟩



theorem prohibition219_violated_intro {p c}
    (hAddr : AddresseeInClass219 p c) (hAct : RegulatedActOccurred219 p c)
    : Prohibition219Violated p c := ⟨⟨hAddr⟩, hAct⟩



theorem prohibition220_violated_intro {p c}
    (hCond : ConditionMet220 c) (hAct : RegulatedActOccurred220 p c)
    : Prohibition220Violated p c := ⟨⟨hCond⟩, hAct⟩



theorem prohibition224_violated_intro {p c}
    (hAct : RegulatedActOccurred224 p c) : Prohibition224Violated p c := hAct



theorem prohibition225_violated_intro {p c}
    (hAddr : AddresseeInClass225 p c) (hCond : ConditionMet225 c)
    (hAct : RegulatedActOccurred225 p c)
    : Prohibition225Violated p c := ⟨⟨hAddr, hCond⟩, hAct⟩



theorem prohibition226_violated_intro {p c}
    (hCond : ConditionMet226 c) (hAct : RegulatedActOccurred226 p c)
    : Prohibition226Violated p c := ⟨⟨hCond⟩, hAct⟩



theorem prohibition227_violated_intro {p c}
    (hAddr : AddresseeInClass227 p c) (hAct : RegulatedActOccurred227 p c)
    : Prohibition227Violated p c := ⟨⟨hAddr⟩, hAct⟩



theorem power216_intro {p c}
    (h : IsAuthorizedToEnforce216 p c) : Power216 p c := h

theorem power218_intro {p c}
    (h : IsAuthorizedToVoid218 p c) : Power218 p c := h

end Proving.USC.T18.Ch11.Deontic
