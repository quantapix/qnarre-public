







import Proving.USC.T08.Elements.Statute

namespace Proving.USC.T08.Elements
open Proving.USC.Common



theorem bringingInImproperPlace_intro {p a : Person} {c : ComplaintText}
    (hAlien : IsAlien a c) (hKnows : KnowsPersonIsAlien p c)
    (hBrings : BringsOrAttemptsToBringToUS p c)
    (hPlace : AtPlaceOtherThanDesignated p c)
    : BringingInImproperPlace p a c :=
  ⟨hAlien, hKnows, hBrings, hPlace⟩

theorem transportingWithinUS_intro {p a : Person} {c : ComplaintText}
    (hAlien : IsAlien a c) (hSci : KnowsOrRecklessUnlawfulPresence p c)
    (hTrans : TransportsOrMovesWithinUS p c)
    (hFurth : InFurtheranceOfUnlawfulPresence p c)
    : TransportingWithinUS p a c :=
  ⟨hAlien, hSci, hTrans, hFurth⟩

theorem harboringAlien_intro {p a : Person} {c : ComplaintText}
    (hAlien : IsAlien a c) (hSci : KnowsOrRecklessUnlawfulPresence p c)
    (hHarb : ConcealsHarborsOrShields p c)
    (hNotRel : ¬ ReligiousWorkerException p c)
    : HarboringAlien p a c :=
  ⟨hAlien, hSci, hHarb, hNotRel⟩

theorem encouragingEntry_intro {p a : Person} {c : ComplaintText}
    (hAlien : IsAlien a c) (hEnc : EncouragesOrInducesEntry p c)
    (hSci : KnowsOrRecklessEntryUnlawful p c)
    (hNotRel : ¬ ReligiousWorkerException p c)
    : EncouragingEntry p a c :=
  ⟨hAlien, hEnc, hSci, hNotRel⟩

theorem bringingInUnauthorized_intro {p a : Person} {c : ComplaintText}
    (hAlien : IsAlien a c) (hSci : KnowsNoPriorAuthorization p c)
    (hBrings : BringsOrAttemptsToBringToUS p c)
    : BringingInUnauthorized p a c :=
  ⟨hAlien, hSci, hBrings⟩

theorem unlawfulEmploymentOfAliens_intro {p : Person} {c : ComplaintText}
    (hHires : HiresTenOrMoreInTwelveMonths p c)
    (hKnow : ActualKnowledgeIndividualsAreUnauthorizedAliens p c)
    : UnlawfulEmploymentOfAliens p c :=
  ⟨hHires, hKnow⟩



theorem aidingInadmissibleAlienEntry_intro {p a : Person} {c : ComplaintText}
    (hInadm : AlienInadmissibleCriminalOrSecurity a c)
    (hAids : KnowinglyAidsOrAssistsEntry p c)
    : AidingInadmissibleAlienEntry p a c :=
  ⟨hInadm, hAids⟩

theorem connivingInadmissibleAlienEntry_intro {p a : Person} {c : ComplaintText}
    (hInadm : AlienInadmissibleCriminalOrSecurity a c)
    (hConn : ConnivesOrConspiresToAllowEntry p c)
    : ConnivingInadmissibleAlienEntry p a c :=
  ⟨hInadm, hConn⟩



theorem importingForImmoralPurpose_intro {p a : Person} {c : ComplaintText}
    (hAlien : IsAlien a c) (hImp : ImportsOrAttemptsToImportAlien p c)
    (hPurp : ForProstitutionOrImmoralPurpose p c)
    : ImportingForImmoralPurpose p a c :=
  ⟨hAlien, hImp, hPurp⟩

theorem holdingForImmoralPurpose_intro {p a : Person} {c : ComplaintText}
    (hAlien : IsAlien a c) (hHolds : HoldsAlienForImmoralPurpose p c)
    (hPurp : ForProstitutionOrImmoralPurpose p c)
    (hPurs : InPursuanceOfIllegalImportation p c)
    : HoldingForImmoralPurpose p a c :=
  ⟨hAlien, hHolds, hPurp, hPurs⟩

theorem harboringForImmoralPurpose_intro {p a : Person} {c : ComplaintText}
    (hAlien : IsAlien a c) (hKeeps : KeepsMaintainsOrHarborsForImmoralPurpose p c)
    (hPurp : ForProstitutionOrImmoralPurpose p c)
    (hPurs : InPursuanceOfIllegalImportation p c)
    : HarboringForImmoralPurpose p a c :=
  ⟨hAlien, hKeeps, hPurp, hPurs⟩

end Proving.USC.T08.Elements
