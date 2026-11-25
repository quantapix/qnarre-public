







import Proving.USC.T18.RacketeeringActs.Ontology.Statute

namespace Proving.USC.T18.RacketeeringActs.Ontology

open Proving.USC.Common


theorem title18PredicateMembership_intro {o c}
    (hEnum : IsTitle18PredicateOffence o c) (hRack : IsRacketeeringActivity o c)
    : Title18PredicateMembership o c :=
  ⟨hEnum, hRack⟩


theorem section1951Membership_robbery_intro {o c}
    (hRob : IsRobbery o c) (hCom : AffectsCommerce o c)
    : Section1951Membership o c :=
  ⟨HobbsActMeans.byRobbery hRob, hCom⟩


theorem section1951Membership_extortion_intro {o c}
    (hExt : IsExtortion o c) (hCom : AffectsCommerce o c)
    : Section1951Membership o c :=
  ⟨HobbsActMeans.byExtortion hExt, hCom⟩


theorem section1952Membership_intro {o c}
    (hUnlawful : IsUnlawfulActivity o c)
    : Section1952Membership o c :=
  ⟨hUnlawful⟩



theorem financialTransactionMembership_intro {t p e c}
    (hFT : IsFinancialTransaction t c) (hMI : IsMonetaryInstrument p c)
    (hFI : IsFinancialInstitution e c)
    : FinancialTransactionMembership t p e c :=
  ⟨hFT, hMI, hFI⟩



theorem section1956Membership_intro {t p oSua c}
    (hFT : IsFinancialTransaction t c) (hProc : IsProceeds p c)
    (hSua : IsSpecifiedUnlawfulActivity oSua c)
    : Section1956Membership t p oSua c :=
  ⟨hFT, hProc, hSua⟩



theorem section1957Membership_intro {t p oSua c}
    (hMT : IsMonetaryTransaction t c) (hCDP : IsCriminallyDerivedProperty p c)
    (hSua : IsSpecifiedUnlawfulActivity oSua c)
    : Section1957Membership t p oSua c :=
  ⟨hMT, hCDP, hSua⟩

end Proving.USC.T18.RacketeeringActs.Ontology
