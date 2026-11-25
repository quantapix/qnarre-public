














import Proving.USC.T09.Structure.Types

namespace Proving.USC.T09.Structure

open Proving.USC.Common




def edge_s2_incorporates_s1 : Ref :=
  { source := "9 USC § 2", target := "9 USC § 1", kind := .Incorporates }



def edge_s2_savings_contractLaw : Ref :=
  { source := "9 USC § 2", target := "general contract law (revocation grounds)", kind := .Savings }


def edge_s2_exceptAsProvided_ch4 : Ref :=
  { source := "9 USC § 2", target := "9 USC ch. 4 (§ 402)", kind := .ExceptAsProvided }



def edge_s4_incorporates_t28 : Ref :=
  { source := "9 USC § 4", target := "28 USC (title 28 jurisdiction)", kind := .Incorporates, crossTitle := true }


def edge_s16_incorporates_s3 : Ref :=
  { source := "9 USC § 16(a)", target := "9 USC § 3", kind := .Incorporates }
def edge_s16_incorporates_s4 : Ref :=
  { source := "9 USC § 16(a)", target := "9 USC § 4", kind := .Incorporates }
def edge_s16_incorporates_s206 : Ref :=
  { source := "9 USC § 16(a)", target := "9 USC § 206", kind := .Incorporates }



def edge_s16_exceptAsProvided_t28_1292b : Ref :=
  { source := "9 USC § 16(b)", target := "28 USC § 1292(b)", kind := .ExceptAsProvided, crossTitle := true }



def edge_s202_incorporates_s2 : Ref :=
  { source := "9 USC § 202", target := "9 USC § 2", kind := .Incorporates }



def edge_s203_incorporates_t28_460 : Ref :=
  { source := "9 USC § 203", target := "28 USC § 460", kind := .Incorporates, crossTitle := true }



def edge_s208_incorporates_ch1 : Ref :=
  { source := "9 USC § 208", target := "9 USC ch. 1", kind := .Incorporates }



def edge_s208_subjectTo_ch4 : Ref :=
  { source := "9 USC § 208", target := "9 USC ch. 4", kind := .SubjectTo }



def edge_s302_incorporates_s202 : Ref :=
  { source := "9 USC § 302", target := "9 USC § 202", kind := .Incorporates }
def edge_s302_incorporates_s203 : Ref :=
  { source := "9 USC § 302", target := "9 USC § 203", kind := .Incorporates }
def edge_s302_incorporates_s204 : Ref :=
  { source := "9 USC § 302", target := "9 USC § 204", kind := .Incorporates }
def edge_s302_incorporates_s205 : Ref :=
  { source := "9 USC § 302", target := "9 USC § 205", kind := .Incorporates }
def edge_s302_incorporates_s207 : Ref :=
  { source := "9 USC § 302", target := "9 USC § 207", kind := .Incorporates }



def edge_s307_incorporates_ch1 : Ref :=
  { source := "9 USC § 307", target := "9 USC ch. 1", kind := .Incorporates }


def edge_s307_subjectTo_ch4 : Ref :=
  { source := "9 USC § 307", target := "9 USC ch. 4", kind := .SubjectTo }



def edge_s305_lexSpecialis_panamaOverNY : Ref :=
  { source := "9 USC § 305", target := "9 USC ch. 2 (NY Convention)", kind := .LexSpecialis }



def edge_s402_notwithstanding_title : Ref :=
  { source := "9 USC § 402(a)", target := "9 USC (entire title)", kind := .Notwithstanding }



def edge_s401_incorporates_t18_2246 : Ref :=
  { source := "9 USC § 401(3)", target := "18 USC § 2246", kind := .Incorporates, crossTitle := true }







axiom ReferencedSectionExists (r : Ref) (c : ComplaintText) : Prop





axiom IncorporationHonored (r : Ref) (c : ComplaintText) : Prop




axiom ExceptionApplies (r : Ref) (c : ComplaintText) : Prop





axiom OverrideTriggered (r : Ref) (c : ComplaintText) : Prop

end Proving.USC.T09.Structure
