import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch96.EchoReslice.Structure.Types

set_option autoImplicit false











namespace Proving.USC.T18.Ch96.EchoReslice.Structure

open Proving.USC.Common





def edge_1967_underThisChapter_ch96 : Ref :=
  { source := "18 USC § 1967", target := "18 USC ch. 96", kind := .Incorporates }






def edge_1967_ancillary_ch96 : Ref :=
  { source := "18 USC § 1967", target := "18 USC ch. 96", kind := .Incorporates }






def edge_1967_usCivilAction_ch96 : Ref :=
  { source := "18 USC § 1967", target := "18 USC ch. 96", kind := .Incorporates }





def edge_1967_lexSpecialis_generalAccess : Ref :=
  { source := "18 USC § 1967"
  , target := "general public-access law governing federal civil proceedings (non-statutory target)"
  , kind   := .LexSpecialis }


def edges1967 : List Ref :=
  [ edge_1967_underThisChapter_ch96
  , edge_1967_ancillary_ch96
  , edge_1967_usCivilAction_ch96
  , edge_1967_lexSpecialis_generalAccess ]






axiom ReferencedSectionExists (r : Ref) (c : ComplaintText) : Prop






axiom IncorporationHonored (r : Ref) (c : ComplaintText) : Prop






axiom ChapterScopeTetherHonored (r : Ref) (p : Proceeding) (c : ComplaintText) : Prop





axiom AncillaryToProceedingUnder (r : Ref) (p : Proceeding) (c : ComplaintText) : Prop





axiom UnitedStatesInstitutedActionUnder (r : Ref) (p : Proceeding) (c : ComplaintText) : Prop





axiom LexSpecialisDisplaces (r : Ref) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch96.EchoReslice.Structure
