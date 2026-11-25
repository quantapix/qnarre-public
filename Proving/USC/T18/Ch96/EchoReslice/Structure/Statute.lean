import Proving.USC.Common.Types
import Proving.USC.T18.Ch96.EchoReslice.Structure.Types
import Proving.USC.T18.Ch96.EchoReslice.Structure.Predicates

set_option autoImplicit false












namespace Proving.USC.T18.Ch96.EchoReslice.Structure

open Proving.USC.Common




inductive Sec1967Reach (p : Proceeding) (c : ComplaintText) : Prop where

  | ancillary
      (anc    : AncillaryToProceedingUnder edge_1967_ancillary_ch96 p c)
      (tether : ChapterScopeTetherHonored edge_1967_underThisChapter_ch96 p c)

  | unitedStatesCivilAction
      (usAction : UnitedStatesInstitutedActionUnder edge_1967_usCivilAction_ch96 p c)
      (tether   : ChapterScopeTetherHonored edge_1967_underThisChapter_ch96 p c)




structure Coherent1967 (p : Proceeding) (c : ComplaintText) : Prop where
  chapterExists              : ReferencedSectionExists edge_1967_underThisChapter_ch96 c
  chapterIncorporationHonored : IncorporationHonored edge_1967_underThisChapter_ch96 c
  reach                      : Sec1967Reach p c




structure Sec1967Displacement (c : ComplaintText) : Prop where
  generalAccessRuleDisplaced : LexSpecialisDisplaces edge_1967_lexSpecialis_generalAccess c

end Proving.USC.T18.Ch96.EchoReslice.Structure
