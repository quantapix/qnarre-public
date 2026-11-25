








import Proving.USC.T29.Structure.Types
import Proving.USC.T29.Structure.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T29.Structure

open Proving.USC.Common (ComplaintText)







def edge_152_incorporates_158 : Ref :=
  { source := "29 USC § 152(8)", target := "29 USC § 158", kind := .Incorporates }
def edge_152_incorporates_153 : Ref :=
  { source := "29 USC § 152(10)", target := "29 USC § 153", kind := .Incorporates }

def edge_152_incorporates_rla : Ref :=
  { source := "29 USC § 152(2)", target := "45 USC § 151", kind := .Incorporates }


def edge_153_incorporates_159 : Ref :=
  { source := "29 USC § 153(b)", target := "29 USC § 159", kind := .Incorporates }
def edge_153_incorporates_160 : Ref :=
  { source := "29 USC § 153(d)", target := "29 USC § 160", kind := .Incorporates }

def edge_153_incorporates_lmra : Ref :=
  { source := "29 USC § 153(a)", target := "29 USC § 141", kind := .Incorporates }


def edge_158_incorporates_157 : Ref :=
  { source := "29 USC § 158(a)(1)", target := "29 USC § 157", kind := .Incorporates }
def edge_158_subjectTo_159 : Ref :=
  { source := "29 USC § 158(a)(5)", target := "29 USC § 159", kind := .SubjectTo }
def edge_158_incorporates_156 : Ref :=
  { source := "29 USC § 158(a)(2)", target := "29 USC § 156", kind := .Incorporates }

def edge_158_exceptAsProvided_159a : Ref :=
  { source := "29 USC § 158(a)(3)", target := "29 USC § 159(a)", kind := .ExceptAsProvided }

def edge_158f_exceptAsProvided_158ab : Ref :=
  { source := "29 USC § 158(f)", target := "29 USC § 158", kind := .ExceptAsProvided }


def edge_160_incorporates_158 : Ref :=
  { source := "29 USC § 160(a)", target := "29 USC § 158", kind := .Incorporates }


def edge_160_savings_otherLaw : Ref :=
  { source := "29 USC § 160(a)", target := "other law", kind := .Savings }

def edge_160_exceptAsProvided_stateCession : Ref :=
  { source := "29 USC § 160(a)", target := "State statute", kind := .ExceptAsProvided }

def edge_160_subjectTo_limitations : Ref :=
  { source := "29 USC § 160(b)", target := "29 USC § 160(b)", kind := .SubjectTo }

def edge_160b_incorporates_2072 : Ref :=
  { source := "29 USC § 160(b)", target := "28 USC § 2072", kind := .Incorporates }

def edge_160_incorporates_2112 : Ref :=
  { source := "29 USC § 160(e)", target := "28 USC § 2112", kind := .Incorporates }

def edge_160_incorporates_1254 : Ref :=
  { source := "29 USC § 160(e)", target := "28 USC § 1254", kind := .Incorporates }

def edge_160l_notwithstanding_otherLaw : Ref :=
  { source := "29 USC § 160(l)", target := "other law", kind := .Notwithstanding }

def edge_160h_notwithstanding_ch6 : Ref :=
  { source := "29 USC § 160(h)", target := "29 USC § 101", kind := .Notwithstanding }



def edge_2000e9_incorporates_161 : Ref :=
  { source := "42 USC § 2000e-9", target := "29 USC § 161", kind := .Incorporates }

def edge_161_incorporates_districtCourts : Ref :=
  { source := "29 USC § 161(2)", target := "28 USC § 1331", kind := .Incorporates }


def edge_162_incorporates_subchapter : Ref :=
  { source := "29 USC § 162", target := "29 USC § 151", kind := .Incorporates }








structure Coherent152 (c : ComplaintText) : Prop where
  ulpDefExists      : ReferencedSectionExists edge_152_incorporates_158 c
  ulpDefHonored     : IncorporationHonored    edge_152_incorporates_158 c
  boardDefExists    : ReferencedSectionExists edge_152_incorporates_153 c
  boardDefHonored   : IncorporationHonored    edge_152_incorporates_153 c


structure Coherent153 (c : ComplaintText) : Prop where
  repPowerExists    : ReferencedSectionExists edge_153_incorporates_159 c
  repPowerHonored   : IncorporationHonored    edge_153_incorporates_159 c
  prosecExists      : ReferencedSectionExists edge_153_incorporates_160 c
  prosecHonored     : IncorporationHonored    edge_153_incorporates_160 c




structure Coherent158 (c : ComplaintText) : Prop where
  rightsExists      : ReferencedSectionExists edge_158_incorporates_157 c
  rightsHonored     : IncorporationHonored    edge_158_incorporates_157 c
  repRegimeApplies  : ConstraintApplies       edge_158_subjectTo_159 c
  securityCarveOut  : ExceptionApplies        edge_158_exceptAsProvided_159a c




structure Coherent160 (c : ComplaintText) : Prop where
  ulpRefExists      : ReferencedSectionExists edge_160_incorporates_158 c
  ulpRefHonored     : IncorporationHonored    edge_160_incorporates_158 c
  limitationsApply  : ConstraintApplies       edge_160_subjectTo_limitations c
  savingsPreserved  : SavingsHonored          edge_160_savings_otherLaw c



structure Coherent161 (c : ComplaintText) : Prop where
  inboundExists     : ReferencedSectionExists edge_2000e9_incorporates_161 c
  inboundHonored    : IncorporationHonored    edge_2000e9_incorporates_161 c


structure Coherent162 (c : ComplaintText) : Prop where
  subchapterExists  : ReferencedSectionExists edge_162_incorporates_subchapter c
  subchapterHonored : IncorporationHonored    edge_162_incorporates_subchapter c





inductive Section160Override (c : ComplaintText) : Prop
  | injunctiveOverride
      (h : OverrideTriggered edge_160l_notwithstanding_otherLaw c) : Section160Override c
  | equityLimitOverride
      (h : OverrideTriggered edge_160h_notwithstanding_ch6 c) : Section160Override c
  | stateCessionException
      (h : ExceptionApplies edge_160_exceptAsProvided_stateCession c) : Section160Override c

end Proving.USC.T29.Structure
