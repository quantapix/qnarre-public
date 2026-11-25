






import Proving.USC.T08.Structure.Types
import Proving.USC.T08.Structure.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T08.Structure

open Proving.USC.Common




def edge_1324_incorporates_1101 : Ref :=
  { source := "8 USC § 1324", target := "8 USC § 1101(a)(3)", kind := .Incorporates }


def edge_1324_incorporates_t18_1365 : Ref :=
  { source := "8 USC § 1324(a)(1)(B)(iii)", target := "18 USC § 1365", kind := .Incorporates }


def edge_1324_incorporates_1324a : Ref :=
  { source := "8 USC § 1324(a)(3)(B)(i)", target := "8 USC § 1324a(h)(3)", kind := .Incorporates }


def edge_1324_incorporates_t18_fine : Ref :=
  { source := "8 USC § 1324(a)", target := "18 USC § 3571", kind := .Incorporates }


def edge_1324_subjectTo_t18_981 : Ref :=
  { source := "8 USC § 1324(b)(2)", target := "18 USC § 981", kind := .SubjectTo }


def edge_1324_exceptCustoms : Ref :=
  { source := "8 USC § 1324(b)(2)", target := "18 USC § 981(d)", kind := .ExceptAsProvided }


def edge_1324_exceptReligious : Ref :=
  { source := "8 USC § 1324(a)(1)(C)", target := "8 USC § 1324(a)(1)(A)", kind := .ExceptAsProvided }


def edge_1324_notwithstanding_fre : Ref :=
  { source := "8 USC § 1324(d)", target := "Federal Rules of Evidence", kind := .Notwithstanding }




def edge_1327_incorporates_1182a2 : Ref :=
  { source := "8 USC § 1327", target := "8 USC § 1182(a)(2)", kind := .Incorporates }

def edge_1327_incorporates_1182a3 : Ref :=
  { source := "8 USC § 1327", target := "8 USC § 1182(a)(3)", kind := .Incorporates }


def edge_1327_except_1182a3E : Ref :=
  { source := "8 USC § 1327", target := "8 USC § 1182(a)(3)(E)", kind := .ExceptAsProvided }

def edge_1327_incorporates_aggFelony : Ref :=
  { source := "8 USC § 1327", target := "8 USC § 1101(a)(43)", kind := .Incorporates }

def edge_1327_incorporates_t18_fine : Ref :=
  { source := "8 USC § 1327", target := "18 USC § 3571", kind := .Incorporates }




def edge_1328_incorporates_1101 : Ref :=
  { source := "8 USC § 1328", target := "8 USC § 1101(a)(3)", kind := .Incorporates }

def edge_1328_incorporates_t18_fine : Ref :=
  { source := "8 USC § 1328", target := "18 USC § 3571", kind := .Incorporates }






structure Coherent1324 (c : ComplaintText) : Prop where
  alienDefExists      : ReferencedSectionExists edge_1324_incorporates_1101 c
  alienDefHonored     : IncorporationHonored    edge_1324_incorporates_1101 c
  sbiDefHonored       : IncorporationHonored    edge_1324_incorporates_t18_1365 c
  unauthDefHonored    : IncorporationHonored    edge_1324_incorporates_1324a c
  fineHonored         : IncorporationHonored    edge_1324_incorporates_t18_fine c
  forfeitureRegime    : ReferencedSectionExists edge_1324_subjectTo_t18_981 c



structure Coherent1327 (c : ComplaintText) : Prop where
  ground2Exists   : ReferencedSectionExists edge_1327_incorporates_1182a2 c
  ground2Honored  : IncorporationHonored    edge_1327_incorporates_1182a2 c
  ground3Honored  : IncorporationHonored    edge_1327_incorporates_1182a3 c
  aggFelonyHonored: IncorporationHonored    edge_1327_incorporates_aggFelony c
  fineExists      : ReferencedSectionExists edge_1327_incorporates_t18_fine c


structure Coherent1328 (c : ComplaintText) : Prop where
  alienDefHonored : IncorporationHonored    edge_1328_incorporates_1101 c
  fineExists      : ReferencedSectionExists edge_1328_incorporates_t18_fine c





inductive Override1324 (c : ComplaintText) : Prop
  | freDeposition (h : OverrideTriggered edge_1324_notwithstanding_fre c) : Override1324 c
  | customsDuty   (h : ExceptionApplies  edge_1324_exceptCustoms c)       : Override1324 c



inductive Carveout (c : ComplaintText) : Prop
  | religiousVolunteer (h : ExceptionApplies edge_1324_exceptReligious c) : Carveout c
  | ground3E           (h : ExceptionApplies edge_1327_except_1182a3E c)  : Carveout c

end Proving.USC.T08.Structure
