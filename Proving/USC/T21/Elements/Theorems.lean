import Proving.USC.T21.Elements.Types
import Proving.USC.T21.Elements.Predicates
import Proving.USC.T21.Elements.Statute
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates







namespace Proving.USC.T21.Elements

open Proving.USC.Common


theorem section841a1_intro {p : Person} {s : Substance} {c : ComplaintText}
    (hSci : ActedWithScienter p c) (hCS : IsControlledSubstance s c)
    (hAct : Act841a1 p s c) (hNoAuth : ¬ AuthorizedBySubchapter p c) :
    Section841a1 p s c :=
  ⟨hSci, hCS, hAct, hNoAuth⟩


theorem section841a2_intro {p : Person} {s : Substance} {c : ComplaintText}
    (hSci : ActedWithScienter p c) (hCF : IsCounterfeitSubstance s c)
    (hAct : Act841a2 p s c) (hNoAuth : ¬ AuthorizedBySubchapter p c) :
    Section841a2 p s c :=
  ⟨hSci, hCF, hAct, hNoAuth⟩


theorem aggravatedViolation841b1A_intro {p : Person} {s : Substance} {c : ComplaintText}
    (hViol : Section841a p s c) (hQty : QuantityTier841b1A s c) :
    AggravatedViolation841b1A p s c :=
  ⟨hViol, hQty⟩


theorem aggravatedViolation841b1B_intro {p : Person} {s : Substance} {c : ComplaintText}
    (hViol : Section841a p s c) (hQty : QuantityTier841b1B s c) :
    AggravatedViolation841b1B p s c :=
  ⟨hViol, hQty⟩


theorem section841c1_intro {p : Person} {s : Substance} {c : ComplaintText}
    (hSci : ActedWithScienter p c) (hList : IsListedChemical s c)
    (hPoss : PossessedSubstance p s c) (hInt : IntendedToManufacture p s c)
    (hNoAuth : ¬ AuthorizedBySubchapter p c) :
    Section841c1 p s c :=
  ⟨hSci, hList, hPoss, hInt, hNoAuth⟩


theorem section841c2_intro {p : Person} {s : Substance} {c : ComplaintText}
    (hSci : ActedWithScienter p c) (hList : IsListedChemical s c)
    (hAct : PossessedOrDistributed p s c)
    (hKnew : KnewChemicalWouldBeUsedToManufacture p s c)
    (hNoAuth : ¬ AuthorizedBySubchapter p c) :
    Section841c2 p s c :=
  ⟨hSci, hList, hAct, hKnew, hNoAuth⟩


theorem section841c3_intro {p : Person} {s : Substance} {c : ComplaintText}
    (hSci : ActedWithScienter p c) (hList : IsListedChemical s c)
    (hEvade : IntendedToEvadeRecordkeeping p c)
    (hAct : ReceivedOrDistributedReportableAmountInSmallUnits p s c) :
    Section841c3 p s c :=
  ⟨hSci, hList, hEvade, hAct⟩


theorem section841d1_intro {p : Person} {c : ComplaintText}
    (hPlaced : PlacedOrMaintainedBoobytrap p c) (hFed : SiteIsFederalProperty c)
    (hDrug : ControlledSubstanceActivityAtSite c) :
    Section841d1 p c :=
  ⟨hPlaced, hFed, hDrug⟩


theorem section841f1_intro {p : Person} {s : Substance} {c : ComplaintText}
    (hSci : ActedWithScienter p c) (hList : IsListedChemical s c)
    (hDist : DistributedSubstance p s c) (hNoAuth : ¬ AuthorizedBySubchapter p c) :
    Section841f1 p s c :=
  ⟨hSci, hList, hDist, hNoAuth⟩


theorem section841f2_intro {p : Person} {s : Substance} {c : ComplaintText}
    (hPoss : PossessedSubstance p s c) (hList : IsListedChemical s c)
    (hKnew : KnewRecordkeepingNotAdheredTo p s c) (hFail : FailedToRemedyViolation p c) :
    Section841f2 p s c :=
  ⟨hPoss, hList, hKnew, hFail⟩


theorem section841g1_intro {p : Person} {s : Substance} {c : ComplaintText}
    (hNet : UsedInternetToDistribute p s c) (hDrug : IsDateRapeDrug s c)
    (hKnew : KnewInternetSaleUnlawful p s c) :
    Section841g1 p s c :=
  ⟨hNet, hDrug, hKnew⟩


theorem section841h_intro {p : Person} {s : Substance} {c : ComplaintText}
    (hSci : ActedWithScienter p c) (hCS : IsControlledSubstance s c)
    (hAct : Act841h p s c) (hNoAuth : ¬ AuthorizedBySubchapter p c)
    (hNoSafe : ¬ WithinInternetSafeHarbor p c) :
    Section841h p s c :=
  ⟨hSci, hCS, hAct, hNoAuth, hNoSafe⟩


theorem attempt846_intro {p : Person} {c : ComplaintText}
    (hInt : IntendedToCommitPredicateOffense p c) (hStep : TookSubstantialStep p c) :
    Attempt846 p c :=
  ⟨hInt, hStep⟩


theorem conspiracy846_intro {p : Person} {ag : Agreement} {c : ComplaintText}
    (hAg : AgreementAmongTwoOrMore ag c) (hJoin : KnowinglyJoinedAgreement p ag c)
    (hObj : ObjectWasSubchapterOffense ag c) :
    Conspiracy846 p ag c :=
  ⟨hAg, hJoin, hObj⟩

end Proving.USC.T21.Elements
