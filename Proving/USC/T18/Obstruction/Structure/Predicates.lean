























import Proving.USC.Common.Types
import Proving.USC.T18.Obstruction.Structure.Types

namespace Proving.USC.T18.Obstruction.Structure

open Proving.USC.Common




def edge_1503_incorporates_1111 : Ref :=
  { source := "18 USC § 1503", target := "18 USC § 1111", kind := .Incorporates }
def edge_1503_incorporates_1112 : Ref :=
  { source := "18 USC § 1503", target := "18 USC § 1112", kind := .Incorporates }





def edge_1512_incorporates_1515 : Ref :=
  { source := "18 USC § 1512", target := "18 USC § 1515", kind := .Incorporates }
def edge_1513_incorporates_1515 : Ref :=
  { source := "18 USC § 1513", target := "18 USC § 1515", kind := .Incorporates }



def edge_1512_incorporates_1111 : Ref :=
  { source := "18 USC § 1512", target := "18 USC § 1111", kind := .Incorporates }
def edge_1512_incorporates_1112 : Ref :=
  { source := "18 USC § 1512", target := "18 USC § 1112", kind := .Incorporates }
def edge_1513_incorporates_1111 : Ref :=
  { source := "18 USC § 1513", target := "18 USC § 1111", kind := .Incorporates }
def edge_1513_incorporates_1112 : Ref :=
  { source := "18 USC § 1513", target := "18 USC § 1112", kind := .Incorporates }





def edge_1512_savings_1515c : Ref :=
  { source := "18 USC § 1512", target := "18 USC § 1515(c)", kind := .Savings }






def edge_1512_lexSpecialis_1503 : Ref :=
  { source := "18 USC § 1512", target := "18 USC § 1503", kind := .LexSpecialis }








axiom ReferencedSectionExists (r : Ref) (c : ComplaintText) : Prop






axiom IncorporationHonored (r : Ref) (c : ComplaintText) : Prop






axiom ExceptionApplies (r : Ref) (c : ComplaintText) : Prop





axiom OverrideTriggered (r : Ref) (c : ComplaintText) : Prop

end Proving.USC.T18.Obstruction.Structure
