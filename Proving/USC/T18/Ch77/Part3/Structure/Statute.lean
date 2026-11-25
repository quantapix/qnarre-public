import Proving.USC.Common.Types
import Proving.USC.T18.Ch77.Part3.Structure.Types
import Proving.USC.T18.Ch77.Part3.Structure.Predicates

set_option autoImplicit false















namespace Proving.USC.T18.Ch77.Part3.Structure

open Proving.USC.Common








structure Section1593bIncorporationsResolve (c : ComplaintText) : Prop where

  paragraph3Resolves : InternalAntecedentResolves edge_1593b1_incorporates_1593b3 c

  amountSourceExists : ReferencedSectionExists edge_1593b3_incorporates_2259c2 c


  amountDefinitionImported : TermMeaningImported term_fullAmountOfVictimsLosses c

  flsaFloorResolves : CrossTitleReferenceResolves edge_1593b3_incorporates_flsa c

  enforcementProcedureExists : ReferencedSectionExists edge_1593b2_incorporates_3664 c

  enforcementMannerHonored : IncorporationHonored edge_1593b2_incorporates_3663A c

  forfeitureRegimeResolves : CrossTitleReferenceResolves edge_1593b4_incorporates_853 c

  forfeitureCarveOut : ExceptionApplies edge_1593b4_except_853d c





structure Coherent1593 (c : ComplaintText) : Prop where

  displaces3663 : OverrideTriggered edge_1593a_notwithstanding_3663 c

  displaces3663A : OverrideTriggered edge_1593a_notwithstanding_3663A c

  cumulativeRemediesPreserved : SavingsClauseHonored edge_1593a_savings_otherPenalties c

  predicateOffenseScopeResolves : IncorporationHonored edge_1593a_incorporates_ch77 c

  amountRegime : Section1593bIncorporationsResolve c

  victimScopeResolves : IncorporationHonored edge_1593c_incorporates_ch77 c

  victimTermImported : TermMeaningImported term_victim c

  victimDefinitionControls : LexSpecialisControls edge_1593c_lexSpecialis_3663A c





inductive RestitutionOverridePath (c : ComplaintText) : Prop where

  | displacingDiscretionary :
      OverrideTriggered edge_1593a_notwithstanding_3663 c → RestitutionOverridePath c

  | displacingMandatory :
      OverrideTriggered edge_1593a_notwithstanding_3663A c → RestitutionOverridePath c







structure Section1593b4AntecedentDefect (c : ComplaintText) : Prop where

  antecedentMissing : ¬ InternalAntecedentResolves edge_1593b4_internal_forfeitureAntecedent c

  incorporationStillNamed : ReferencedSectionExists edge_1593b4_incorporates_853 c

end Proving.USC.T18.Ch77.Part3.Structure
