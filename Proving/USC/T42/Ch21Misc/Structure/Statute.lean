




import Proving.USC.T42.Ch21Misc.Structure.Predicates

namespace Proving.USC.T42.Ch21Misc.Structure

open Proving.USC.Common



structure Coherent2000d4a (c : ComplaintText) : Prop where
  leaDefExists       : ReferencedSectionExists edge_2000d4a_incorporates_t20s7801 c
  leaDefIncorporated : IncorporationHonored edge_2000d4a_incorporates_t20s7801 c



structure Coherent2000e1 (c : ComplaintText) : Prop where
  prohibition2000e2Exists : ReferencedSectionExists edge_2000e1c1_incorporates_2000e2 c
  prohibition2000e3Exists : ReferencedSectionExists edge_2000e1c1_incorporates_2000e3 c
  attribution2000e2       : IncorporationHonored edge_2000e1c1_incorporates_2000e2 c
  attribution2000e3       : IncorporationHonored edge_2000e1c1_incorporates_2000e3 c



inductive Exemption2000e1 (c : ComplaintText) : Prop where

  | religiousOrAlien
      (h : ExceptionApplies edge_2000e1a_exceptsSubchapter c) : Exemption2000e1 c

  | foreignLaw2000e2
      (h : ExceptionApplies edge_2000e1b_excepts_2000e2 c) : Exemption2000e1 c

  | foreignLaw2000e3
      (h : ExceptionApplies edge_2000e1b_excepts_2000e3 c) : Exemption2000e1 c

  | foreignPerson2000e2
      (h : ExceptionApplies edge_2000e1c2_excepts_2000e2 c) : Exemption2000e1 c

  | foreignPerson2000e3
      (h : ExceptionApplies edge_2000e1c2_excepts_2000e3 c) : Exemption2000e1 c




structure Coherent2000e7 (c : ComplaintText) : Prop where
  ulpDefExists       : ReferencedSectionExists edge_2000e7_incorporates_2000e2 c
  ulpDefIncorporated : IncorporationHonored edge_2000e7_incorporates_2000e2 c
  stateLawPreserved  : SavingsPreserved edge_2000e7_savings_stateLaw c



structure Coherent2000e10 (c : ComplaintText) : Prop where
  commissionExists       : ReferencedSectionExists edge_2000e10a_incorporates_2000e4 c
  commissionIncorporated : IncorporationHonored edge_2000e10a_incorporates_2000e4 c


structure Coherent2000e11 (c : ComplaintText) : Prop where
  veteransLawsPreserved : SavingsPreserved edge_2000e11_savings_veteransLaws c




structure Coherent2000e13 (c : ComplaintText) : Prop where
  assaultStatuteExists      : ReferencedSectionExists edge_2000e13_incorporates_t18s111 c
  killingStatuteExists      : ReferencedSectionExists edge_2000e13_incorporates_t18s1114 c
  assaultProtectionExtended : IncorporationHonored edge_2000e13_incorporates_t18s111 c
  killingProtectionExtended : IncorporationHonored edge_2000e13_incorporates_t18s1114 c




inductive PenaltyPath2000e13 (c : ComplaintText) : Prop where
  | standardPenalty
      (h : IncorporationHonored edge_2000e13_incorporates_t18s1114 c) : PenaltyPath2000e13 c
  | killingOverride
      (h : OverrideTriggered edge_2000e13_notwithstanding_t18s1114 c) : PenaltyPath2000e13 c



structure Coherent2000e14 (c : ComplaintText) : Prop where
  commissionExists       : ReferencedSectionExists edge_2000e14_incorporates_2000e4 c
  commissionIncorporated : IncorporationHonored edge_2000e14_incorporates_2000e4 c



structure Coherent2000e15 (c : ComplaintText) : Prop where
  coverageDefsExist        : ReferencedSectionExists edge_2000e15_incorporates_2000e c
  coverageDefsIncorporated : IncorporationHonored edge_2000e15_incorporates_2000e c




structure Coherent2000e17 (c : ComplaintText) : Prop where
  apaHearingExists        : ReferencedSectionExists edge_2000e17_incorporates_t5s554 c
  apaHearingIncorporated  : IncorporationHonored edge_2000e17_incorporates_t5s554 c
  specificControlsGeneral : LexSpecialisControls edge_2000e17_lexSpecialis_eeoOrders c



inductive Applicability2000e17 (c : ComplaintText) : Prop where
  | hearingProtected
      (h : IncorporationHonored edge_2000e17_incorporates_t5s554 c) : Applicability2000e17 c
  | substantialDeviation
      (h : ExceptionApplies edge_2000e17_proviso_excepts_self c) : Applicability2000e17 c

end Proving.USC.T42.Ch21Misc.Structure
