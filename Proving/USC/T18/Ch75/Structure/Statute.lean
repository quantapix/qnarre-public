









import Proving.USC.Common.Types
import Proving.USC.T18.Ch75.Structure.Types
import Proving.USC.T18.Ch75.Structure.Predicates

namespace Proving.USC.T18.Ch75.Structure

open Proving.USC.Common




structure Coherent1542 (c : ComplaintText) : Prop where
  terrorismDefResolves : ReferencedSectionExists edge_1542_incorp_2331 c
  drugCrimeDefResolves : ReferencedSectionExists edge_1542_incorp_929a c
  passportLawResolves  : ReferencedSectionExists edge_1542_incorp_passportLaw c
  terrorismDefHonored  : IncorporationHonored edge_1542_incorp_2331 c
  drugCrimeDefHonored  : IncorporationHonored edge_1542_incorp_929a c
  passportLawHonored   : IncorporationHonored edge_1542_incorp_passportLaw c



structure Coherent1543 (c : ComplaintText) : Prop where
  terrorismDefResolves : ReferencedSectionExists edge_1543_incorp_2331 c
  drugCrimeDefResolves : ReferencedSectionExists edge_1543_incorp_929a c
  terrorismDefHonored  : IncorporationHonored edge_1543_incorp_2331 c
  drugCrimeDefHonored  : IncorporationHonored edge_1543_incorp_929a c



structure Coherent1544 (c : ComplaintText) : Prop where
  terrorismDefResolves  : ReferencedSectionExists edge_1544_incorp_2331 c
  drugCrimeDefResolves  : ReferencedSectionExists edge_1544_incorp_929a c
  passportRulesResolves : ReferencedSectionExists edge_1544_incorp_passportRules c
  terrorismDefHonored   : IncorporationHonored edge_1544_incorp_2331 c
  drugCrimeDefHonored    : IncorporationHonored edge_1544_incorp_929a c
  passportRulesHonored  : IncorporationHonored edge_1544_incorp_passportRules c






structure Coherent1546 (c : ComplaintText) : Prop where
  terrorismDefResolves   : ReferencedSectionExists edge_1546_incorp_2331 c
  drugCrimeDefResolves   : ReferencedSectionExists edge_1546_incorp_929a c
  perjuryFormResolves    : ReferencedSectionExists edge_1546_incorp_1746 c
  immigrationLawsResolve : ReferencedSectionExists edge_1546_incorp_ina c
  terrorismDefHonored    : IncorporationHonored edge_1546_incorp_2331 c
  drugCrimeDefHonored    : IncorporationHonored edge_1546_incorp_929a c
  perjuryFormHonored     : IncorporationHonored edge_1546_incorp_1746 c
  immigrationLawsHonored : IncorporationHonored edge_1546_incorp_ina c
  occaCarveOutHonored    : ExceptionApplies edge_1546_except_occa c

end Proving.USC.T18.Ch75.Structure
