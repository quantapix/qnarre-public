















import Proving.USC.T42.CRIPA.Structure.Types

namespace Proving.USC.T42.CRIPA.Structure
open Proving.USC.Common











def edge_1997a_incorporates_1997 : Ref :=
  { source := "42 USC § 1997a(a)", target := "42 USC § 1997", kind := .Incorporates }




def edge_1997a_incorporates_1997_1Bii : Ref :=
  { source := "42 USC § 1997a(a)", target := "42 USC § 1997(1)(B)(ii)", kind := .Incorporates }



def edge_1997b_incorporates_1997a : Ref :=
  { source := "42 USC § 1997b(a)", target := "42 USC § 1997a", kind := .Incorporates }



def edge_1997c_incorporates_1997 : Ref :=
  { source := "42 USC § 1997c(a)", target := "42 USC § 1997", kind := .Incorporates }





def edge_1997e_subjectTo_1983 : Ref :=
  { source := "42 USC § 1997e(a)", target := "42 USC § 1983", kind := .SubjectTo }




def edge_1997e_exceptAsProvided_1997a : Ref :=
  { source := "42 USC § 1997e(b)", target := "42 USC § 1997a", kind := .ExceptAsProvided }


def edge_1997e_exceptAsProvided_1997c : Ref :=
  { source := "42 USC § 1997e(b)", target := "42 USC § 1997c", kind := .ExceptAsProvided }




def edge_1997e_subjectTo_1988 : Ref :=
  { source := "42 USC § 1997e(d)", target := "42 USC § 1988", kind := .SubjectTo }



def edge_1997e_incorporates_t18_3006A : Ref :=
  { source := "42 USC § 1997e(d)(3)", target := "18 USC § 3006A", kind := .Incorporates }



def edge_1997e_incorporates_t18_2246 : Ref :=
  { source := "42 USC § 1997e(e)", target := "18 USC § 2246", kind := .Incorporates }





def edge_1997e_notwithstanding_procedure : Ref :=
  { source := "42 USC § 1997e(g)(1)", target := "any other law or rule of procedure", kind := .Notwithstanding }



def edge_1997f_incorporates_t28_522 : Ref :=
  { source := "42 USC § 1997f", target := "28 USC § 522", kind := .Incorporates }



def edge_1997h_incorporates_1997a : Ref :=
  { source := "42 USC § 1997h", target := "42 USC § 1997a", kind := .Incorporates }


def edge_1997h_incorporates_1997c : Ref :=
  { source := "42 USC § 1997h", target := "42 USC § 1997c", kind := .Incorporates }




def edge_1997i_savings_subchapter : Ref :=
  { source := "42 USC § 1997i", target := "42 USC §§ 1997-1997j (this subchapter)", kind := .Savings }



def edge_1997j_savings_existing_law : Ref :=
  { source := "42 USC § 1997j", target := "existing law (rights of non-US parties)", kind := .Savings }







axiom ReferencedSectionExists (r : Ref) (c : ComplaintText) : Prop






axiom IncorporationHonored (r : Ref) (c : ComplaintText) : Prop





axiom ExceptionApplies (r : Ref) (c : ComplaintText) : Prop






axiom OverrideTriggered (r : Ref) (c : ComplaintText) : Prop





axiom SavingsClauseRespected (r : Ref) (c : ComplaintText) : Prop

end Proving.USC.T42.CRIPA.Structure
