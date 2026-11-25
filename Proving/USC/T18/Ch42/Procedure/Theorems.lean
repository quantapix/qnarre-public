








import Proving.USC.T18.Ch42.Procedure.Statute

namespace Proving.USC.T18.Ch42.Procedure

open Proving.USC.Common





theorem rateExceeds45_of_eq {c : ComplaintText} {n : Nat}
    (hn : InterestRatePercent c = n) (h : n > 45) : RateExceeds45 c := by
  unfold RateExceeds45; omega



theorem outstandingExceeds100_of_eq {c : ComplaintText} {n : Nat}
    (hn : OutstandingCreditDollars c = n) (h : n > 100) : OutstandingExceeds100 c := by
  unfold OutstandingExceeds100; omega




theorem primaFacieExtortionate892_intro {c : ComplaintText}
    (hPros : ProsecutionUnderSection892 c)
    (h1 : RepaymentUnenforceableByCivilProcess c)
    (h2 : RateExceeds45 c)
    (h3 : DebtorBelievedCreditorExtortionate c)
    (h4 : OutstandingExceeds100 c) : PrimaFacieExtortionate892 c :=
  ⟨hPros, h1, h2, h3, h4⟩


theorem reputationEvidenceAdmissible892_intro {c : ComplaintText}
    (hPros : ProsecutionUnderSection892 c)
    (h12 : RepaymentUnenforceableByCivilProcess c ∨ RateExceeds45 c)
    (hDir : DirectEvidenceOfDebtorBeliefUnavailable c) :
    ReputationEvidenceAdmissible892 c :=
  ⟨hPros, h12, hDir⟩


theorem implicitThreatEvidence894_intro {c : ComplaintText}
    (hPros : ProsecutionUnderSection894 c)
    (hPrior : PriorExtortionateCollectionKnownToVictim c) :
    ImplicitThreatEvidence894 c :=
  ⟨hPros, hPrior⟩


theorem reputationEvidenceAdmissible894_intro {c : ComplaintText}
    (hPros : ProsecutionUnderSection894 c)
    (h12 : RepaymentUnenforceableByCivilProcess c ∨ RateExceeds45 c)
    (hDir : DirectEvidenceOfDebtorBeliefUnavailable c) :
    ReputationEvidenceAdmissible894 c :=
  ⟨hPros, h12, hDir⟩

end Proving.USC.T18.Ch42.Procedure
