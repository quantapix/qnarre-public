import Proving.USC.T21.Deontic.Types
import Proving.USC.T21.Deontic.Predicates
import Proving.USC.T21.Deontic.Statute
import Proving.USC.Common.Types







namespace Proving.USC.T21.Deontic

open Proving.USC.Common (Person ComplaintText)



theorem prohibition841a_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AnyPersonAddressee p c) (hCond : NotAuthorizedBySubchapter p c)
    (hAct : RegulatedAct841a p c) : ProhibitionViolated841a p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibition841c_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AnyPersonAddressee p c) (hCond : NotAuthorizedBySubchapter p c)
    (hAct : ListedChemicalActOccurred841c p c) : ProhibitionViolated841c p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibition841d_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AnyPersonAddressee p c) (hCond : FederalDrugPropertyCondition841d p c)
    (hAct : BoobytrapActOccurred841d p c) : ProhibitionViolated841d p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibition841f1_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AnyPersonAddressee p c)
    (hAct : ListedChemicalDistributionOccurred841f1 p c) :
    ProhibitionViolated841f1 p c :=
  ⟨⟨hAddr⟩, hAct⟩


theorem prohibition841g1_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AnyPersonAddressee p c)
    (hAct : DateRapeDrugInternetActOccurred841g1 p c) :
    ProhibitionViolated841g1 p c :=
  ⟨⟨hAddr⟩, hAct⟩


theorem prohibition841h_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AnyPersonAddressee p c) (hCond : NotAuthorizedBySubchapter p c)
    (hAct : InternetDistributionActOccurred841h p c) :
    ProhibitionViolated841h p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩



theorem obligation841b_breached_intro {ct : Court} {p : Person} {c : ComplaintText}
    (hAddr : CourtAddressee ct c) (hCond : ProhibitionViolated841a p c)
    (hNoAct : ¬ SentenceImposedPer841b ct p c) : ObligationBreached841b ct p c :=
  ⟨⟨hAddr, hCond⟩, hNoAct⟩


theorem prohibition841b1C_violated_intro {ct : Court} {p : Person} {c : ComplaintText}
    (hAddr : CourtAddressee ct c) (hCond : MandatoryTermApplies841b1C p c)
    (hAct : ProbationOrSuspensionGranted841b1C ct p c) :
    ProhibitionViolated841b1C ct p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩



theorem power841e_intro {ct : Court} {p : Person} {c : ComplaintText}
    (hAddr : CourtAddressee ct c) (hCond : FelonyListedChemicalConviction841e p c) :
    Power841e ct p c :=
  ⟨hAddr, hCond⟩



theorem obligation841f2_breached_intro {p : Person} {c : ComplaintText}
    (hAddr : AnyPersonAddressee p c)
    (hCond : KnowledgeOfRecordkeepingViolation841f2 p c)
    (hNoAct : ¬ RemedialStepsTaken841f2 p c) : ObligationBreached841f2 p c :=
  ⟨⟨hAddr, hCond⟩, hNoAct⟩



theorem power841g3_intro {ag : Official} {c : ComplaintText}
    (hAddr : AttorneyGeneralAddressee ag c) : Power841g3 ag c :=
  ⟨hAddr⟩


theorem prohibition846_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AnyPersonAddressee p c) (hCond : ObjectOffenseInSubchapter846 p c)
    (hAct : ConspiracyOrAttemptActOccurred846 p c) : ProhibitionViolated846 p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩



theorem obligation846_breached_intro {ct : Court} {p : Person} {c : ComplaintText}
    (hAddr : CourtAddressee ct c) (hCond : ProhibitionViolated846 p c)
    (hNoAct : ¬ SamePenaltiesImposed846 ct p c) : ObligationBreached846 ct p c :=
  ⟨⟨hAddr, hCond⟩, hNoAct⟩



theorem definition802_intro {t : DefinedTerm} {c : ComplaintText}
    (hDef : TermDefined t c) : Definition802 t c :=
  ⟨hDef⟩



theorem obligation802p41_breached_intro {p : Person} {c : ComplaintText}
    (hAddr : AnyPersonAddressee p c) (hCond : ClaimsSteroidExemption802p41 p c)
    (hNoAct : ¬ BurdenOfGoingForwardBorne802p41 p c) : ObligationBreached802p41 p c :=
  ⟨⟨hAddr, hCond⟩, hNoAct⟩

end Proving.USC.T21.Deontic
