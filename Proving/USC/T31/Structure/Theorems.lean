import Proving.USC.T31.Structure.Types
import Proving.USC.T31.Structure.Predicates
import Proving.USC.T31.Structure.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T31.Structure

open Proving.USC.Common (ComplaintText)


theorem coherent5311_intro {c : ComplaintText}
    (hAnchor : ReferencedSectionExists edge_5313e2C_incorporates_5311 c)
    : Coherent5311 c :=
  ⟨hAnchor⟩


theorem coherent5313_intro {c : ComplaintText}
    (hDepEx  : ReferencedSectionExists edge_5313g1_incorporates_fra19b1A c)
    (hDepInc : IncorporationHonored edge_5313g1_incorporates_fra19b1A c)
    (hTxnAcc : IncorporationHonored edge_5313e2A_incorporates_fra19b1C c)
    (hAuthEx : ReferencedSectionExists edge_5313d1_incorporates_5318a6 c)
    (hAuthInc : IncorporationHonored edge_5313d1_incorporates_5318a6 c)
    (hPurpose : IncorporationHonored edge_5313e2C_incorporates_5311 c)
    (hCarve  : ReferencedSectionExists edge_5313b_exceptAsProvided_5315 c)
    (hSaving : SavingsPreserved edge_5313f2_savings_otherLaw c)
    : Coherent5313 c :=
  ⟨hDepEx, hDepInc, hTxnAcc, hAuthEx, hAuthInc, hPurpose, hCarve, hSaving⟩


theorem exemptionPath5313_intro_mandatory {c : ComplaintText}
    (hCarved : ExceptionApplies edge_5313a_exceptAsProvided_5313d c)
    (hAuth   : IncorporationHonored edge_5313d1_incorporates_5318a6 c)
    : ExemptionPath5313 c :=
  .mandatory hCarved hAuth


theorem exemptionPath5313_intro_qualifiedBusinessCustomer {c : ComplaintText}
    (hCarved : ExceptionApplies edge_5313a_exceptAsProvided_5313e c)
    (hAuth   : IncorporationHonored edge_5313e1_incorporates_5318a6 c)
    : ExemptionPath5313 c :=
  .qualifiedBusinessCustomer hCarved hAuth


theorem coherent5324_intro {c : ComplaintText}
    (h5313aEx  : ReferencedSectionExists edge_5324a_incorporates_5313a c)
    (h5313aInc : IncorporationHonored edge_5324a_incorporates_5313a c)
    (h5326Ex   : ReferencedSectionExists edge_5324a_incorporates_5326 c)
    (h5331Ex   : ReferencedSectionExists edge_5324b_incorporates_5331 c)
    (h5316Ex   : ReferencedSectionExists edge_5324c_incorporates_5316 c)
    (hPenalty  : IncorporationHonored edge_5324d2_incorporates_t18s3571 c)
    : Coherent5324 c :=
  ⟨h5313aEx, h5313aInc, h5326Ex, h5331Ex, h5316Ex, hPenalty⟩


theorem evadedRegime5324_intro_domesticFinancialInstitution {c : ComplaintText}
    (hRegime : IncorporationHonored edge_5324a_incorporates_5313a c)
    : EvadedRegime5324 c :=
  .domesticFinancialInstitution hRegime


theorem evadedRegime5324_intro_nonfinancialTradeOrBusiness {c : ComplaintText}
    (hRegime : IncorporationHonored edge_5324b_incorporates_5331 c)
    : EvadedRegime5324 c :=
  .nonfinancialTradeOrBusiness hRegime


theorem evadedRegime5324_intro_monetaryInstrumentTransport {c : ComplaintText}
    (hRegime : IncorporationHonored edge_5324c_incorporates_5316 c)
    : EvadedRegime5324 c :=
  .monetaryInstrumentTransport hRegime

end Proving.USC.T31.Structure
