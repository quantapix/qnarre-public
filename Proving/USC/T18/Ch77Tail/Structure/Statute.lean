







import Proving.USC.Common.Types
import Proving.USC.T18.Ch77Tail.Structure.Types
import Proving.USC.T18.Ch77Tail.Structure.Predicates

namespace Proving.USC.T18.Ch77Tail.Structure

open Proving.USC.Common


structure Coherent1582 (c : ComplaintText) : Prop where
  fineScheduleResolves : ReferencedSectionExists edge_1582_incorporates_3571 c


structure Coherent1585 (c : ComplaintText) : Prop where
  fineScheduleResolves : ReferencedSectionExists edge_1585_incorporates_3571 c


structure Coherent1586 (c : ComplaintText) : Prop where
  fineScheduleResolves : ReferencedSectionExists edge_1586_incorporates_3571 c


structure Coherent1587 (c : ComplaintText) : Prop where
  fineScheduleResolves : ReferencedSectionExists edge_1587_incorporates_3571 c


structure Coherent1588 (c : ComplaintText) : Prop where
  fineScheduleResolves : ReferencedSectionExists edge_1588_incorporates_3571 c







structure Coherent1592 (c : ComplaintText) : Prop where
  inCourseOffenseExists   : ReferencedSectionExists edge_1592a1_incorporates_1581 c
  intentOffenseExists     : ReferencedSectionExists edge_1592a2_incorporates_1581 c
  ancillaryOffenseExists  : ReferencedSectionExists edge_1592a1_incorporates_1594a c
  tvpaDefinitionHonored   : IncorporationHonored     edge_1592a3_incorporates_tvpa103 c
  victimExceptionHonored  : ExceptionApplies         edge_1592b_exceptAsProvided_1592a c
  penaltyIncorporated     : IncorporationHonored     edge_1592c_incorporates_1592a c

end Proving.USC.T18.Ch77Tail.Structure
