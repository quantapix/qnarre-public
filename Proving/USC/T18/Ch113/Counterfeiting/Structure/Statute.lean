









import Proving.USC.T18.Ch113.Counterfeiting.Structure.Predicates

namespace Proving.USC.T18.Ch113.Counterfeiting.Structure

open Proving.USC.Common





structure Coherent2318 (c : ComplaintText) : Prop where
  traffic    : IncorporationHonored edge_2318_incorporates_2320f c
  copyTerms  : IncorporationHonored edge_2318_incorporates_t17_101 c
  aircraft   : IncorporationHonored edge_2318_incorporates_t49_46501 c
  forfeiture : ReferencedSectionExists edge_2318_subjectTo_2323 c




structure Coherent2319 (c : ComplaintText) : Prop where
  criminalPredicate : IncorporationHonored edge_2319_incorporates_t17_506a c
  copyTerms         : IncorporationHonored edge_2319_incorporates_t17_101 c
  exclusiveRights   : IncorporationHonored edge_2319_incorporates_t17_106 c
  limitations       : ReferencedSectionExists edge_2319_subjectTo_t17_107_122 c





structure Coherent2320 (c : ComplaintText) : Prop where
  forfeiture  : ReferencedSectionExists edge_2320_subjectTo_2323 c
  lanham      : IncorporationHonored edge_2320_incorporates_lanham c
  designation : IncorporationHonored edge_2320_incorporates_t36_220506 c
  drug        : IncorporationHonored edge_2320_incorporates_t21_321 c
  agReport    : ReferencedSectionExists edge_2320_incorporates_t28_522 c




inductive Section2320Disposition (c : ComplaintText) : Prop where
  | offense              : Coherent2320 c → Section2320Disposition c
  | repackagingException : ExceptionApplies edge_2320_exceptAsProvided_repackaging c → Section2320Disposition c

end Proving.USC.T18.Ch113.Counterfeiting.Structure
