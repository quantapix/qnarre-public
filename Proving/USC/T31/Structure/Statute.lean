import Proving.USC.T31.Structure.Types
import Proving.USC.T31.Structure.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T31.Structure

open Proving.USC.Common (ComplaintText)






structure Coherent5311 (c : ComplaintText) : Prop where
  purposeAnchorResolvable : ReferencedSectionExists edge_5313e2C_incorporates_5311 c





structure Coherent5313 (c : ComplaintText) : Prop where
  depositoryDefnExists       : ReferencedSectionExists edge_5313g1_incorporates_fra19b1A c
  depositoryDefnHonored      : IncorporationHonored edge_5313g1_incorporates_fra19b1A c
  transactionAccountHonored  : IncorporationHonored edge_5313e2A_incorporates_fra19b1C c
  exemptionAuthorityExists   : ReferencedSectionExists edge_5313d1_incorporates_5318a6 c
  exemptionAuthorityHonored  : IncorporationHonored edge_5313d1_incorporates_5318a6 c
  purposeIncorporationHonored : IncorporationHonored edge_5313e2C_incorporates_5311 c
  carveout5315Resolvable     : ReferencedSectionExists edge_5313b_exceptAsProvided_5315 c
  savingsRespected           : SavingsPreserved edge_5313f2_savings_otherLaw c



inductive ExemptionPath5313 (c : ComplaintText) : Prop where


  | mandatory
      (carved : ExceptionApplies edge_5313a_exceptAsProvided_5313d c)
      (authority : IncorporationHonored edge_5313d1_incorporates_5318a6 c) :
      ExemptionPath5313 c

  | qualifiedBusinessCustomer
      (carved : ExceptionApplies edge_5313a_exceptAsProvided_5313e c)
      (authority : IncorporationHonored edge_5313e1_incorporates_5318a6 c) :
      ExemptionPath5313 c




structure Coherent5324 (c : ComplaintText) : Prop where
  reporting5313aExists       : ReferencedSectionExists edge_5324a_incorporates_5313a c
  reporting5313aHonored      : IncorporationHonored edge_5324a_incorporates_5313a c
  geoTargetingOrderExists    : ReferencedSectionExists edge_5324a_incorporates_5326 c
  form8300ReportingExists    : ReferencedSectionExists edge_5324b_incorporates_5331 c
  cmirReportingExists        : ReferencedSectionExists edge_5324c_incorporates_5316 c
  penaltyIncorporationHonored : IncorporationHonored edge_5324d2_incorporates_t18s3571 c



inductive EvadedRegime5324 (c : ComplaintText) : Prop where


  | domesticFinancialInstitution
      (regime : IncorporationHonored edge_5324a_incorporates_5313a c) :
      EvadedRegime5324 c

  | nonfinancialTradeOrBusiness
      (regime : IncorporationHonored edge_5324b_incorporates_5331 c) :
      EvadedRegime5324 c

  | monetaryInstrumentTransport
      (regime : IncorporationHonored edge_5324c_incorporates_5316 c) :
      EvadedRegime5324 c

end Proving.USC.T31.Structure
