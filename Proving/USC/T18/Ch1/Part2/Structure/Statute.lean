










import Proving.USC.T18.Ch1.Part2.Structure.Predicates

namespace Proving.USC.T18.Ch1.Part2.Structure

open Proving.USC.Common



structure Coherent19 (c : ComplaintText) : Prop where
  refExists : ReferencedSectionExists edge_19_incorporates_3571 c
  honored   : IncorporationHonored edge_19_incorporates_3571 c




structure Coherent20 (c : ComplaintText) : Prop where
  refExists27   : ReferencedSectionExists edge_20_incorporates_27 c
  honored27     : IncorporationHonored edge_20_incorporates_27 c
  refExists1422 : ReferencedSectionExists edge_20_incorporates_12_1422 c



structure Coherent21 (c : ComplaintText) : Prop where
  refExists : ReferencedSectionExists edge_21_incorporates_115 c
  honored   : IncorporationHonored edge_21_incorporates_115 c




structure Coherent24 (c : ComplaintText) : Prop where
  refExists1347    : ReferencedSectionExists edge_24_incorporates_1347 c
  honored1347      : IncorporationHonored edge_24_incorporates_1347 c
  refExistsExternal : ReferencedSectionExists edge_24_incorporates_42_1320a7b c




structure Coherent25 (c : ComplaintText) : Prop where
  refExists16 : ReferencedSectionExists edge_25_incorporates_16 c
  honored16   : IncorporationHonored edge_25_incorporates_16 c
  refExists23 : ReferencedSectionExists edge_25_incorporates_23 c
  honored23   : IncorporationHonored edge_25_incorporates_23 c



structure Coherent27 (c : ComplaintText) : Prop where
  refExists : ReferencedSectionExists edge_27_incorporates_18 c
  honored   : IncorporationHonored edge_27_incorporates_18 c




structure Coherent28 (c : ComplaintText) : Prop where
  refExists3771A : ReferencedSectionExists edge_28_incorporates_3771A c
  honored3771A   : IncorporationHonored edge_28_incorporates_3771A c
  refExists7102  : ReferencedSectionExists edge_28_incorporates_22_7102 c





inductive Section23Resolution (c : ComplaintText) : Prop where
  | expressProvision  (h : ExceptionApplies edge_23_exceptAsProvided c) : Section23Resolution c
  | defaultDefinition (h : ReferencedSectionExists edge_23_exceptAsProvided c) : Section23Resolution c

end Proving.USC.T18.Ch1.Part2.Structure
