import Proving.USC.T18.Ch77.Part4.Structure.Statute

set_option autoImplicit false







namespace Proving.USC.T18.Ch77.Part4.Structure

open Proving.USC.Common



theorem punishmentReferentResolved_forceOrUnder14_intro {c : ComplaintText}
    (h : IncorporationHonored edge_1591b1_incorporates_1591e2 c)
    : PunishmentReferentResolved c :=
  .forceOrUnder14 h



theorem punishmentReferentResolved_age14To18_intro {c : ComplaintText}
    (h : IncorporationHonored edge_1591b_incorporates_1591a c)
    : PunishmentReferentResolved c :=
  .age14To18 h


theorem coherent1591_intro {c : ComplaintText}
    (hPenaltyExists : ReferencedSectionExists edge_1591a_incorporates_1591b c)
    (hPenaltyResolves : PunishmentReferentResolved c)
    (hBeneficiary : IncorporationHonored edge_1591a2_incorporates_1591a1 c)
    (hParticipationCloses : IncorporationHonored edge_1591e4_incorporates_1591a1 c)
    (hCoercion : DefinedTermIncorporationHonored term_coercion c)
    (hCommercialSexAct : DefinedTermIncorporationHonored term_commercialSexAct c)
    (hParticipation : DefinedTermIncorporationHonored term_participationInAVenture c)
    (hVenture : DefinedTermIncorporationHonored term_venture c)
    (hSeriousHarm : DefinedTermIncorporationHonored term_seriousHarm c)
    (hAbuseOfProcess : DefinedTermIncorporationHonored term_abuseOfLegalProcess c)
    (hObservation :
      ExceptionApplies edge_1591a_exceptAsProvided_1591c c →
        IncorporationHonored edge_1591c_incorporates_1591a1 c)
    (hFine : ReferencedSectionExists edge_1591b_incorporates_3571 c)
    (hObstructionFine : ReferencedSectionExists edge_1591d_incorporates_3571 c)
    (hObstructionReferent : ReferencedSectionExists edge_1591d_incorporates_1591 c)
    : Coherent1591 c :=
  { penaltyProvisionExists := hPenaltyExists
    penaltyReferentResolves := hPenaltyResolves
    beneficiaryCrossRef := hBeneficiary
    participationDefinitionCloses := hParticipationCloses
    coercionDefined := hCoercion
    commercialSexActDefined := hCommercialSexAct
    participationDefined := hParticipation
    ventureDefined := hVenture
    seriousHarmDefined := hSeriousHarm
    abuseOfProcessDefined := hAbuseOfProcess
    observationExceptionHonored := hObservation
    fineProvisionExists := hFine
    obstructionFineExists := hObstructionFine
    obstructionReferentExists := hObstructionReferent }

end Proving.USC.T18.Ch77.Part4.Structure
