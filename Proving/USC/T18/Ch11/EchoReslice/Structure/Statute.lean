










import Proving.USC.Common.Types
import Proving.USC.T18.Ch11.EchoReslice.Structure.Types
import Proving.USC.T18.Ch11.EchoReslice.Structure.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch11.EchoReslice.Structure

open Proving.USC.Common





structure Section201Incorporations (c : ComplaintText) : Prop where

  briberyPublicOfficial    : IncorporationHonored edge_201b_incorporates_201a1 c

  briberySelectedOfficial  : IncorporationHonored edge_201b_incorporates_201a2 c

  briberyOfficialAct       : IncorporationHonored edge_201b_incorporates_201a3 c

  gratuityPublicOfficial   : IncorporationHonored edge_201c_incorporates_201a1 c

  gratuitySelectedOfficial : IncorporationHonored edge_201c_incorporates_201a2 c

  gratuityOfficialAct      : IncorporationHonored edge_201c_incorporates_201a3 c

  definitionsConfined      : DefinitionConfinedToSection edge_201b_incorporates_201a3 c

  briberyFineRegime        : TitleWideIncorporationResolves edge_201b_fine_thisTitle c

  gratuityFineRegime       : TitleWideIncorporationResolves edge_201c_fine_thisTitle c



inductive WitnessFeeExceptionPath (c : ComplaintText) : Prop where

  | statutoryFee : WitnessFeeProvidedByLaw c → WitnessFeeExceptionPath c

  | travelCost   : ReasonableTravelAndSubsistenceCost c → WitnessFeeExceptionPath c

  | timeLost     : ReasonableValueOfTimeLost c → WitnessFeeExceptionPath c


  | expertFee    : ReasonableExpertWitnessFee c → WitnessFeeExceptionPath c





structure WitnessFeeCarveHonored (r : Ref) (c : ComplaintText) : Prop where
  carveTriggered : ExceptionApplies r c
  route          : WitnessFeeExceptionPath c




structure Section201dCarve (c : ComplaintText) : Prop where
  fromB3 : WitnessFeeCarveHonored edge_201b3_exceptAsProvided_201d c
  fromB4 : WitnessFeeCarveHonored edge_201b4_exceptAsProvided_201d c
  fromC2 : WitnessFeeCarveHonored edge_201c2_exceptAsProvided_201d c
  fromC3 : WitnessFeeCarveHonored edge_201c3_exceptAsProvided_201d c





structure Section201SavingsCumulation (c : ComplaintText) : Prop where
  s1503Exists    : ReferencedSectionExists edge_201e_savings_1503 c
  s1504Exists    : ReferencedSectionExists edge_201e_savings_1504 c
  s1505Exists    : ReferencedSectionExists edge_201e_savings_1505 c
  s1503Preserved : SavingsClauseHonored edge_201e_savings_1503 c
  s1504Preserved : SavingsClauseHonored edge_201e_savings_1504 c
  s1505Preserved : SavingsClauseHonored edge_201e_savings_1505 c





structure Section201DanglingRefs (c : ComplaintText) : Prop where
  properDischargeLaw   : DanglingReferenceResolved dangling_201c1_properDischargeOfDuty c
  witnessFeeLaw        : DanglingReferenceResolved dangling_201d_witnessFeesProvidedByLaw c
  testimonyAuthority   : DanglingReferenceResolved dangling_201b3_testimonyAuthority c
  officialDutyLaw      : DanglingReferenceResolved dangling_201b1C_lawfulDuty c
  formerPublicOfficial : DanglingReferenceResolved dangling_201c1_formerPublicOfficial c








structure Coherent201 (c : ComplaintText) : Prop where
  incorporations : Section201Incorporations c
  carve          : Section201dCarve c
  savings        : Section201SavingsCumulation c
  dangling       : Section201DanglingRefs c

end Proving.USC.T18.Ch11.EchoReslice.Structure
