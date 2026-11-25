import Proving.USC.T18.Ch1.Procedure.Statute









namespace Proving.USC.T18.Ch1.Procedure

open Proving.USC.Common


theorem timelyDisclosure_intro {p : Person} {c : ComplaintText}
    (hK : HadKnowledgeOfFelony p c) (hD : DisclosureMade p c)
    (hT : DisclosureTimely p c) : TimelyDisclosure p c :=
  ⟨hK, hD, hT⟩



theorem misprisionBreach_intro {p : Person} {c : ComplaintText}
    (hK : HadKnowledgeOfFelony p c) (hC : ConcealedFelony p c)
    (hND : ¬ DisclosureMade p c) : MisprisionBreach p c :=
  ⟨hK, hC, hND⟩


theorem assimilatedOffense_intro {p : Person} {loc : Location} {c : ComplaintText}
    (hP : WithinSection7Place loc c) (hNF : NotPunishableByFederalEnactment p c)
    (hS : PunishableUnderStateLaw p c) : AssimilatedOffense p loc c :=
  ⟨hP, hNF, hS⟩

end Proving.USC.T18.Ch1.Procedure
