








import Proving.USC.T18.Sec1961BPredicates.Structure.Types
import Proving.USC.T18.Sec1961BPredicates.Structure.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T18.Sec1961BPredicates.Structure

open Proving.USC.Common





def edge_2314_incorporates_670 : Ref :=
  { source := "18 USC § 2314", target := "18 USC § 670", kind := .Incorporates }

def edge_2314_lexSpecialis_670 : Ref :=
  { source := "18 USC § 2314", target := "18 USC § 670", kind := .LexSpecialis }


def edge_2315_incorporates_670 : Ref :=
  { source := "18 USC § 2315", target := "18 USC § 670", kind := .Incorporates }
def edge_2315_lexSpecialis_670 : Ref :=
  { source := "18 USC § 2315", target := "18 USC § 670", kind := .LexSpecialis }



def edge_1028_incorporates_929 : Ref :=
  { source := "18 USC § 1028", target := "18 USC § 929(a)(2)", kind := .Incorporates }

def edge_1028_incorporates_924 : Ref :=
  { source := "18 USC § 1028", target := "18 USC § 924(c)(3)", kind := .Incorporates }

def edge_1028_incorporates_2331_5 : Ref :=
  { source := "18 USC § 1028", target := "18 USC § 2331(5)", kind := .Incorporates }

def edge_1028_incorporates_2331_1 : Ref :=
  { source := "18 USC § 1028", target := "18 USC § 2331(1)", kind := .Incorporates }

def edge_1028_incorporates_1028A : Ref :=
  { source := "18 USC § 1028", target := "18 USC § 1028A", kind := .Incorporates }

def edge_1028_incorporates_1029e : Ref :=
  { source := "18 USC § 1028", target := "18 USC § 1029(e)", kind := .Incorporates }

def edge_1028_subjectTo_853 : Ref :=
  { source := "18 USC § 1028", target := "21 USC § 853", kind := .SubjectTo }

def edge_1028_exceptAsProvided_ch224 : Ref :=
  { source := "18 USC § 1028", target := "18 USC ch. 224", kind := .ExceptAsProvided }



def edge_1029_subjectTo_853 : Ref :=
  { source := "18 USC § 1029", target := "21 USC § 853", kind := .SubjectTo }

def edge_1029_incorporates_47_153 : Ref :=
  { source := "18 USC § 1029", target := "47 USC § 153", kind := .Incorporates }

def edge_1029_incorporates_ch119 : Ref :=
  { source := "18 USC § 1029", target := "18 USC ch. 119", kind := .Incorporates }



def edge_1955_incorporates_stateLaw : Ref :=
  { source := "18 USC § 1955", target := "State or local gambling law", kind := .Incorporates }

def edge_1955_incorporates_12_1752 : Ref :=
  { source := "18 USC § 1955", target := "12 USC § 1752", kind := .Incorporates }

def edge_1955_incorporates_12_1813 : Ref :=
  { source := "18 USC § 1955", target := "12 USC § 1813", kind := .Incorporates }

def edge_1955_incorporates_12_5481 : Ref :=
  { source := "18 USC § 1955", target := "12 USC § 5481", kind := .Incorporates }

def edge_1955_exceptAsProvided_26_501 : Ref :=
  { source := "18 USC § 1955", target := "26 USC § 501(c)(3)", kind := .ExceptAsProvided }



def edge_1084_savings_stateCriminal : Ref :=
  { source := "18 USC § 1084", target := "State criminal law", kind := .Savings }

def edge_1084_exceptAsProvided_stateBetting : Ref :=
  { source := "18 USC § 1084", target := "State betting-legality law", kind := .ExceptAsProvided }





structure Coherent2314 (c : ComplaintText) : Prop where
  refExists          : ReferencedSectionExists edge_2314_incorporates_670 c
  incorporates       : IncorporationHonored edge_2314_incorporates_670 c
  punishmentOverride : OverrideTriggered edge_2314_lexSpecialis_670 c


structure Coherent2315 (c : ComplaintText) : Prop where
  refExists          : ReferencedSectionExists edge_2315_incorporates_670 c
  incorporates       : IncorporationHonored edge_2315_incorporates_670 c
  punishmentOverride : OverrideTriggered edge_2315_lexSpecialis_670 c



structure Coherent1028 (c : ComplaintText) : Prop where
  drugDef         : IncorporationHonored edge_1028_incorporates_929 c
  violenceDef     : IncorporationHonored edge_1028_incorporates_924 c
  domTerrorDef    : IncorporationHonored edge_1028_incorporates_2331_5 c
  intlTerrorDef   : IncorporationHonored edge_1028_incorporates_2331_1 c
  sharedDefs      : IncorporationHonored edge_1028_incorporates_1028A c
  accessDeviceDef : IncorporationHonored edge_1028_incorporates_1029e c
  forfeitureRegime: ReferencedSectionExists edge_1028_subjectTo_853 c
  leExempt        : ExceptionApplies edge_1028_exceptAsProvided_ch224 c



structure Coherent1029 (c : ComplaintText) : Prop where
  forfeitureRegime : ReferencedSectionExists edge_1029_subjectTo_853 c
  telecomDef       : IncorporationHonored edge_1029_incorporates_47_153 c
  wireInterceptRef : ReferencedSectionExists edge_1029_incorporates_ch119 c



structure Coherent1955 (c : ComplaintText) : Prop where
  stateLawPredicate : IncorporationHonored edge_1955_incorporates_stateLaw c
  creditUnionDef    : IncorporationHonored edge_1955_incorporates_12_1752 c
  depositoryDef     : IncorporationHonored edge_1955_incorporates_12_1813 c
  regulatorDef      : IncorporationHonored edge_1955_incorporates_12_5481 c
  taxExemptException: ExceptionApplies edge_1955_exceptAsProvided_26_501 c



structure Coherent1084 (c : ComplaintText) : Prop where
  stateSavings           : SavingsPreserved edge_1084_savings_stateCriminal c
  legalToLegalSafeHarbor : ExceptionApplies edge_1084_exceptAsProvided_stateBetting c

end Proving.USC.T18.Sec1961BPredicates.Structure
