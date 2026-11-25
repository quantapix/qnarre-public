import Proving.USC.T18.Ch77.Part4.Structure.Predicates

set_option autoImplicit false















namespace Proving.USC.T18.Ch77.Part4.Structure

open Proving.USC.Common












inductive PunishmentReferentResolved (c : ComplaintText) : Prop where
  | forceOrUnder14 :
      IncorporationHonored edge_1591b1_incorporates_1591e2 c → PunishmentReferentResolved c
  | age14To18 :
      IncorporationHonored edge_1591b_incorporates_1591a c → PunishmentReferentResolved c




structure Coherent1591 (c : ComplaintText) : Prop where


  penaltyProvisionExists : ReferencedSectionExists edge_1591a_incorporates_1591b c

  penaltyReferentResolves : PunishmentReferentResolved c

  beneficiaryCrossRef : IncorporationHonored edge_1591a2_incorporates_1591a1 c

  participationDefinitionCloses : IncorporationHonored edge_1591e4_incorporates_1591a1 c

  coercionDefined : DefinedTermIncorporationHonored term_coercion c

  commercialSexActDefined : DefinedTermIncorporationHonored term_commercialSexAct c

  participationDefined : DefinedTermIncorporationHonored term_participationInAVenture c

  ventureDefined : DefinedTermIncorporationHonored term_venture c

  seriousHarmDefined : DefinedTermIncorporationHonored term_seriousHarm c


  abuseOfProcessDefined : DefinedTermIncorporationHonored term_abuseOfLegalProcess c



  observationExceptionHonored :
    ExceptionApplies edge_1591a_exceptAsProvided_1591c c →
      IncorporationHonored edge_1591c_incorporates_1591a1 c


  fineProvisionExists : ReferencedSectionExists edge_1591b_incorporates_3571 c

  obstructionFineExists : ReferencedSectionExists edge_1591d_incorporates_3571 c

  obstructionReferentExists : ReferencedSectionExists edge_1591d_incorporates_1591 c

end Proving.USC.T18.Ch77.Part4.Structure
