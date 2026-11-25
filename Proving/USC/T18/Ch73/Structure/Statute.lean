import Proving.USC.T18.Ch73.Structure.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false










namespace Proving.USC.T18.Ch73.Structure

open Proving.USC.Common



structure Coherent1503 (c : ComplaintText) : Prop where
  killingIncorp      : IncorporationHonored edge_1503_incorporates_1111 c
  manslaughterIncorp : IncorporationHonored edge_1503_incorporates_1112 c



structure Coherent1512 (c : ComplaintText) : Prop where
  killingIncorp      : IncorporationHonored edge_1512_incorporates_1111 c
  manslaughterIncorp : IncorporationHonored edge_1512_incorporates_1112 c
  venueRefExists     : ReferencedSectionExists edge_1512_ref_1503 c



structure Coherent1513 (c : ComplaintText) : Prop where
  killingIncorp      : IncorporationHonored edge_1513_incorporates_1111 c
  manslaughterIncorp : IncorporationHonored edge_1513_incorporates_1112 c



structure Ch73IncorporationsResolve (c : ComplaintText) : Prop where
  s1503 : Coherent1503 c
  s1512 : Coherent1512 c
  s1513 : Coherent1513 c

end Proving.USC.T18.Ch73.Structure
