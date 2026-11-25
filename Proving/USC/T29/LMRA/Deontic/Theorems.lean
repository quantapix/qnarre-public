







import Proving.USC.T29.LMRA.Deontic.Statute

namespace Proving.USC.T29.LMRA.Deontic

open Proving.USC.Common



theorem prohibition186aViolated_intro {p t c}
    (hAddr : IsEmployerSidePayor p c)
    (hNoEx : ¬ Section186cExemptionApplies t c)
    (hAct  : PaymentActOccurred p t c) :
    Prohibition186aViolated p t c :=
  ⟨⟨hAddr, hNoEx⟩, hAct⟩



theorem prohibition186b1Violated_intro {p t c}
    (hAddr : IsPaymentRecipient p c)
    (hNoEx : ¬ Section186cExemptionApplies t c)
    (hAct  : ReceiptActOccurred p t c) :
    Prohibition186b1Violated p t c :=
  ⟨⟨hAddr, hNoEx⟩, hAct⟩



theorem prohibition187aViolated_intro {p c}
    (hAddr : IsLaborOrganizationAddressee p c)
    (hAct  : SecondaryBoycottActOccurred p c) :
    Prohibition187aViolated p c :=
  ⟨⟨hAddr⟩, hAct⟩



theorem obligation174aBreached_intro {p c}
    (hAddr  : IsBargainingParty p c)
    (hNoAct : ¬ ReasonableEffortActOccurred p c) :
    Obligation174aBreached p c :=
  ⟨⟨hAddr⟩, hNoAct⟩



theorem power176Exercised_intro {p d c}
    (hAddr : IsPresidentAddressee p c)
    (hCond : NationalEmergencyConditionMet d c)
    (hAct  : BoardOfInquiryAppointed d c) :
    Power176Exercised p d c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩



theorem obligation178Satisfied_intro {d c}
    (hCond : InjunctionFindingsMet d c)
    (hAct  : InjunctionIssued d c) :
    Obligation178Satisfied d c :=
  ⟨⟨hCond⟩, hAct⟩



theorem obligation178Breached_intro {d c}
    (hCond  : InjunctionFindingsMet d c)
    (hNoAct : ¬ InjunctionIssued d c) :
    Obligation178Breached d c :=
  ⟨⟨hCond⟩, hNoAct⟩

end Proving.USC.T29.LMRA.Deontic
