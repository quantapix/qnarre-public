







import Proving.USC.Common.Types
import Proving.USC.T18.PredicateDefs.Structure.Types
import Proving.USC.T18.PredicateDefs.Structure.Predicates

namespace Proving.USC.T18.PredicateDefs.Structure
open Proving.USC.Common





def edge_20_incorporates_fdiAct : Ref :=
  { source := "18 USC § 20(1)", target := "Federal Deposit Insurance Act § 3(c)(2)", kind := .Incorporates }

def edge_20_incorporates_12usc1422 : Ref :=
  { source := "18 USC § 20(3)", target := "12 USC § 1422", kind := .Incorporates }

def edge_20_incorporates_15usc662 : Ref :=
  { source := "18 USC § 20(5)", target := "15 USC § 662", kind := .Incorporates }

def edge_20_incorporates_27 : Ref :=
  { source := "18 USC § 20(10)", target := "18 USC § 27", kind := .Incorporates }





def edge_1346_incorporates_1341 : Ref :=
  { source := "18 USC § 1346", target := "18 USC § 1341", kind := .Incorporates }

def edge_1346_incorporates_1343 : Ref :=
  { source := "18 USC § 1346", target := "18 USC § 1343", kind := .Incorporates }





def edge_1515_incorporates_1512 : Ref :=
  { source := "18 USC § 1515(a)", target := "18 USC § 1512", kind := .Incorporates }

def edge_1515_incorporates_1513 : Ref :=
  { source := "18 USC § 1515(a)", target := "18 USC § 1513", kind := .Incorporates }

def edge_1515_incorporates_1505 : Ref :=
  { source := "18 USC § 1515(b)", target := "18 USC § 1505", kind := .Incorporates }


def edge_1515c_savings : Ref :=
  { source := "18 USC § 1515(c)", target := "18 USC ch. 73", kind := .Savings }


structure Coherent20 (c : ComplaintText) : Prop where
  fdiAct    : IncorporationHonored edge_20_incorporates_fdiAct c
  fhlb      : IncorporationHonored edge_20_incorporates_12usc1422 c
  sbic      : IncorporationHonored edge_20_incorporates_15usc662 c
  mortgage  : ReferencedSectionExists edge_20_incorporates_27 c



structure Coherent1346 (c : ComplaintText) : Prop where
  mailFrameExists : ReferencedSectionExists edge_1346_incorporates_1341 c
  wireFrameExists : ReferencedSectionExists edge_1346_incorporates_1343 c
  mailHonored     : IncorporationHonored edge_1346_incorporates_1341 c
  wireHonored     : IncorporationHonored edge_1346_incorporates_1343 c





structure Coherent1515 (c : ComplaintText) : Prop where
  s1512Exists  : ReferencedSectionExists edge_1515_incorporates_1512 c
  s1513Exists  : ReferencedSectionExists edge_1515_incorporates_1513 c
  s1505Exists  : ReferencedSectionExists edge_1515_incorporates_1505 c
  s1512Honored : IncorporationHonored edge_1515_incorporates_1512 c




inductive Coherent1515Path (c : ComplaintText) : Prop where
  | byIncorporation : Coherent1515 c → Coherent1515Path c
  | bySavingsCarveOut : ExceptionApplies edge_1515c_savings c → Coherent1515Path c

end Proving.USC.T18.PredicateDefs.Structure
