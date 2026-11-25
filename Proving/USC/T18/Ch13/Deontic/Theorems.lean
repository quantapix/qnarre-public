









import Proving.USC.T18.Ch13.Deontic.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch13.Deontic

open Proving.USC.Common

theorem prohibitionViolated241_intro {p c}
    (hA : AddresseeInClass241 p c) (hC : ConditionMet241 c)
    (hAct : RegulatedActOccurred241 p c) : ProhibitionViolated241 p c :=
  ⟨⟨hA, hC⟩, hAct⟩

theorem prohibitionViolated242_intro {p c}
    (hA : AddresseeInClass242 p c) (hC : ConditionMet242 c)
    (hAct : RegulatedActOccurred242 p c) : ProhibitionViolated242 p c :=
  ⟨⟨hA, hC⟩, hAct⟩

theorem prohibitionViolated243_intro {p c}
    (hA : AddresseeInClass243 p c) (hC : ConditionMet243 c)
    (hAct : RegulatedActOccurred243 p c) : ProhibitionViolated243 p c :=
  ⟨⟨hA, hC⟩, hAct⟩

theorem prohibitionViolated244_intro {p c}
    (hA : AddresseeInClass244 p c) (hC : ConditionMet244 c)
    (hAct : RegulatedActOccurred244 p c) : ProhibitionViolated244 p c :=
  ⟨⟨hA, hC⟩, hAct⟩

theorem prohibitionViolated245_intro {p c}
    (hA : AddresseeInClass245 p c) (hC : ConditionMet245 c)
    (hAct : RegulatedActOccurred245 p c) : ProhibitionViolated245 p c :=
  ⟨⟨hA, hC⟩, hAct⟩

theorem certificationBreached_intro {c}
    (hCond : ProsecutionUnderChapterUndertaken c)
    (hNoCert : ¬ AttorneyGeneralCertificationMade c) : CertificationBreached c :=
  ⟨hCond, hNoCert⟩

theorem prohibitionViolated246_intro {p c}
    (hA : AddresseeInClass246 p c) (hC : ConditionMet246 c)
    (hAct : RegulatedActOccurred246 p c) : ProhibitionViolated246 p c :=
  ⟨⟨hA, hC⟩, hAct⟩

theorem prohibitionViolated247_intro {p c}
    (hA : AddresseeInClass247 p c) (hC : ConditionMet247 c)
    (hAct : RegulatedActOccurred247 p c) : ProhibitionViolated247 p c :=
  ⟨⟨hA, hC⟩, hAct⟩

theorem prohibitionViolated248_intro {p c}
    (hA : AddresseeInClass248 p c) (hC : ConditionMet248 c)
    (hAct : RegulatedActOccurred248 p c) : ProhibitionViolated248 p c :=
  ⟨⟨hA, hC⟩, hAct⟩

theorem prohibitionViolated249_intro {p c}
    (hA : AddresseeInClass249 p c) (hC : ConditionMet249 c)
    (hAct : RegulatedActOccurred249 p c) : ProhibitionViolated249 p c :=
  ⟨⟨hA, hC⟩, hAct⟩

theorem prohibitionViolated250_intro {p c}
    (hA : AddresseeInClass250 p c) (hC : ConditionMet250 c)
    (hAct : RegulatedActOccurred250 p c) : ProhibitionViolated250 p c :=
  ⟨⟨hA, hC⟩, hAct⟩

end Proving.USC.T18.Ch13.Deontic
