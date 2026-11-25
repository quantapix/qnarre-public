import Proving.USC.T31.Elements.Types
import Proving.USC.T31.Elements.Predicates
import Proving.USC.T31.Elements.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T31.Elements

open Proving.USC.Common


theorem section5313aInstitutionViolation_intro {fi : FinancialInstitution}
    {t : Transaction} {c : ComplaintText}
    (hDom : IsDomesticFinancialInstitution fi c)
    (hInv : InvolvedInCurrencyTransaction fi t c)
    (hThr : MeetsPrescribedReportingThreshold t c)
    (hNotExemptEntity : ¬ TransactionWithExemptEntity fi t c)
    (hNotExemptCustomer : ¬ TransactionExemptQualifiedCustomer fi t c)
    (hFail : InstitutionFailedToFileReport fi t c) :
    Section5313aInstitutionViolation fi t c :=
  ⟨hDom, hInv, hThr, hNotExemptEntity, hNotExemptCustomer, hFail⟩


theorem section5313aParticipantViolation_intro {p : Person} {fi : FinancialInstitution}
    {t : Transaction} {c : ComplaintText}
    (hDom : IsDomesticFinancialInstitution fi c)
    (hInv : InvolvedInCurrencyTransaction fi t c)
    (hThr : MeetsPrescribedReportingThreshold t c)
    (hPart : IsPrescribedParticipant p t c)
    (hBreach : ParticipantReportingBreach p t c) :
    Section5313aParticipantViolation p fi t c :=
  ⟨hDom, hInv, hThr, hPart, hBreach⟩


theorem section5324a_intro {p : Person} {c : ComplaintText}
    (hPurpose : PurposeToEvadeCurrencyReporting p c)
    (hConduct : Section5324aConduct p c) :
    Section5324a p c :=
  ⟨hPurpose, hConduct⟩


theorem section5324b_intro {p : Person} {c : ComplaintText}
    (hPurpose : PurposeToEvadeNonfinancialReporting p c)
    (hConduct : Section5324bConduct p c) :
    Section5324b p c :=
  ⟨hPurpose, hConduct⟩


theorem section5324c_intro {p : Person} {c : ComplaintText}
    (hPurpose : PurposeToEvadeInternationalReporting p c)
    (hConduct : Section5324cConduct p c) :
    Section5324c p c :=
  ⟨hPurpose, hConduct⟩


theorem section5324d2_intro {p : Person} {c : ComplaintText}
    (hViolation : Section5324Violation p c)
    (hAggravator : Section5324d2Aggravator p c) :
    Section5324d2 p c :=
  ⟨hViolation, hAggravator⟩

end Proving.USC.T31.Elements
