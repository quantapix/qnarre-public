




import Proving.USC.T18.Ch77.Part5.Structure.Types
import Proving.USC.T18.Ch77.Part5.Structure.Predicates
import Proving.USC.T18.Ch77.Part5.Structure.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

open Proving.USC.Common

namespace Proving.USC.T18.Ch77.Part5.Structure


theorem definitionsClosed1591_intro
    {coercion seriousHarm venture : DefinedTerm} {c : ComplaintText}
    (hAbuse : DefinedTermUsageConsistent coercion edge_1591e2_incorporates_1591e1 c)
    (hHarm : DefinedTermUsageConsistent seriousHarm edge_1591e2_incorporates_1591e5 c)
    (hVenture : DefinedTermUsageConsistent venture edge_1591e4_incorporates_1591e6 c)
    (hParaOne : IncorporationHonored edge_1591e4_incorporates_1591a1 c)
    : DefinitionsClosed1591 coercion seriousHarm venture c :=
  ⟨hAbuse, hHarm, hVenture, hParaOne⟩


theorem penaltyGradeResolved1591_aggravated_intro
    {c : ComplaintText}
    (hReferral : PenaltyReferralCoherent edge_1591a_incorporates_1591b c)
    (hMeans : IncorporationHonored edge_1591b1_incorporates_1591e2 c)
    (hOffense : IncorporationHonored edge_1591b_incorporates_1591a c)
    : PenaltyGradeResolved1591 c :=
  .aggravated hReferral hMeans hOffense


theorem penaltyGradeResolved1591_residual_intro
    {c : ComplaintText}
    (hReferral : PenaltyReferralCoherent edge_1591a_incorporates_1591b c)
    (hNotSoEffected : IncorporationHonored edge_1591b2_incorporates_1591b1 c)
    (hOffense : IncorporationHonored edge_1591b_incorporates_1591a c)
    : PenaltyGradeResolved1591 c :=
  .residual hReferral hNotSoEffected hOffense


theorem coherent1591_intro
    {coercion seriousHarm venture : DefinedTerm} {c : ComplaintText}
    (hCoercion : IncorporationHonored edge_1591a_incorporates_1591e2 c)
    (hCommercialSexAct : IncorporationHonored edge_1591a_incorporates_1591e3 c)
    (hBeneficiary : IncorporationHonored edge_1591a2_incorporates_1591a1 c)
    (hParticipation : IncorporationHonored edge_1591a2_incorporates_1591e4 c)
    (hVenture : IncorporationHonored edge_1591a2_incorporates_1591e6 c)
    (hMaritime : ReferencedSectionExists edge_1591a1_incorporates_s7 c)
    (hFine : ReferencedSectionExists edge_1591b_incorporates_3571 c)
    (hObstructionFine : ReferencedSectionExists edge_1591d_incorporates_3571 c)
    (hObstructionScope : IncorporationHonored edge_1591d_incorporates_1591 c)
    (hPenalty : PenaltyGradeResolved1591 c)
    (hAdvertising : ExceptionHonored edge_1591a_exceptAsProvided_1591a1 c)
    (hObservationScope : IncorporationHonored edge_1591c_incorporates_1591a1 c)
    (hObservation : ExceptionHonored edge_1591a_lexSpecialis_1591c c)
    (hDefs : DefinitionsClosed1591 coercion seriousHarm venture c)
    : Coherent1591 coercion seriousHarm venture c :=
  ⟨hCoercion, hCommercialSexAct, hBeneficiary, hParticipation, hVenture,
   hMaritime, hFine, hObstructionFine, hObstructionScope, hPenalty,
   hAdvertising, hObservationScope, hObservation, hDefs⟩


theorem observationOverrideFires1591_intro
    {c : ComplaintText}
    (hScoped : IncorporationHonored edge_1591c_incorporates_1591a1 c)
    (hTriggered : OverrideTriggered edge_1591a_lexSpecialis_1591c c)
    : ObservationOverrideFires1591 c :=
  ⟨hScoped, hTriggered⟩


theorem advertisingExceptionFires1591_intro
    {c : ComplaintText}
    (hTriggered : ExceptionApplies edge_1591a_exceptAsProvided_1591a1 c)
    (hHonored : ExceptionHonored edge_1591a_exceptAsProvided_1591a1 c)
    : AdvertisingExceptionFires1591 c :=
  ⟨hTriggered, hHonored⟩

end Proving.USC.T18.Ch77.Part5.Structure
