









import Proving.USC.T42.Structure.Predicates

namespace Proving.USC.T42.Structure

open Proving.USC.Common




structure Coherent1981a (c : ComplaintText) : Prop where
  remedyRegimeExists : ReferencedSectionExists edge_1981a_incorporates_2000e5 c
  remedyIncorporated : IncorporationHonored edge_1981a_incorporates_2000e5 c
  s1981Exists        : ReferencedSectionExists edge_1981a_lexSpecialis_1981 c
  s1981Preserved     : SavingsPreserved edge_1981a_savings_1981 c






structure Coherent1983Base (c : ComplaintText) : Prop where
  rightExists       : ReferencedSectionExists edge_1983_incorporates_federalRight c
  rightIncorporated : IncorporationHonored edge_1983_incorporates_federalRight c


inductive Coherent1983 (c : ComplaintText) : Prop where

  | ordinary
      (base : Coherent1983Base c)
      (noException : ReferencedSectionExists edge_1983_exceptAsProvided_judicialOfficer c)


  | judicialOfficer
      (base : Coherent1983Base c)
      (exceptionApplies : ExceptionApplies edge_1983_exceptAsProvided_judicialOfficer c)
      (overrideFires : OverrideTriggered edge_1983_exceptAsProvided_judicialOfficer c)



structure Coherent1986 (c : ComplaintText) : Prop where
  s1985Exists       : ReferencedSectionExists edge_1986_incorporates_1985 c
  s1985Incorporated : IncorporationHonored edge_1986_incorporates_1985 c



structure Coherent2000d1 (c : ComplaintText) : Prop where
  s2000dExists       : ReferencedSectionExists edge_2000d1_incorporates_2000d c
  s2000dIncorporated : IncorporationHonored edge_2000d1_incorporates_2000d c




structure Coherent2000d7 (c : ComplaintText) : Prop where
  titleVIExists       : ReferencedSectionExists edge_2000d7_incorporates_2000d c
  titleVIIncorporated : IncorporationHonored edge_2000d7_incorporates_2000d c
  immunityOverridden  : OverrideTriggered edge_2000d7_notwithstanding_eleventhAmd c

end Proving.USC.T42.Structure
