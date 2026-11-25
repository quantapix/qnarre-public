









import Proving.USC.T05.Structure.Types
import Proving.USC.T05.Structure.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T05.Structure






def edge_554_exceptAsProvided_carveouts : Ref :=
  { source := "5 USC § 554(a)", target := "5 USC § 554(a)(1)-(6)", kind := .ExceptAsProvided }


def edge_554_incorporates_556 : Ref :=
  { source := "5 USC § 554(c)(2)", target := "5 USC § 556", kind := .Incorporates }
def edge_554_incorporates_557 : Ref :=
  { source := "5 USC § 554(c)(2)", target := "5 USC § 557", kind := .Incorporates }


def edge_554d_incorporates_556 : Ref :=
  { source := "5 USC § 554(d)", target := "5 USC § 556", kind := .Incorporates }
def edge_554d_incorporates_557 : Ref :=
  { source := "5 USC § 554(d)", target := "5 USC § 557", kind := .Incorporates }




structure Coherent554 (c : Proving.USC.Common.ComplaintText) : Prop where
  inc556       : IncorporationHonored edge_554_incorporates_556 c
  inc557       : IncorporationHonored edge_554_incorporates_557 c
  exc556Exists : ReferencedSectionExists edge_554_incorporates_556 c
  exc557Exists : ReferencedSectionExists edge_554_incorporates_557 c
  carveout     : ExceptionApplies edge_554_exceptAsProvided_carveouts c





def edge_556_incorporates_553 : Ref :=
  { source := "5 USC § 556(a)", target := "5 USC § 553", kind := .Incorporates }
def edge_556_incorporates_554 : Ref :=
  { source := "5 USC § 556(a)", target := "5 USC § 554", kind := .Incorporates }

def edge_556_incorporates_3105 : Ref :=
  { source := "5 USC § 556(b)(3)", target := "5 USC § 3105", kind := .Incorporates }

def edge_556_incorporates_557 : Ref :=
  { source := "5 USC § 556(c)(10)", target := "5 USC § 557", kind := .Incorporates }


def edge_556d_exceptAsProvided_statute : Ref :=
  { source := "5 USC § 556(d)", target := "(other statute)", kind := .ExceptAsProvided }

def edge_556_incorporates_557d : Ref :=
  { source := "5 USC § 556(d)", target := "5 USC § 557(d)", kind := .Incorporates }





structure Coherent556 (c : Proving.USC.Common.ComplaintText) : Prop where
  inc557        : IncorporationHonored edge_556_incorporates_557 c
  inc557d       : IncorporationHonored edge_556_incorporates_557d c
  app554Exists  : ReferencedSectionExists edge_556_incorporates_554 c
  off3105Exists : ReferencedSectionExists edge_556_incorporates_3105 c
  burdenExc     : ExceptionApplies edge_556d_exceptAsProvided_statute c





def edge_557_incorporates_556 : Ref :=
  { source := "5 USC § 557(a)", target := "5 USC § 556", kind := .Incorporates }


def edge_557_subjectTo_554d : Ref :=
  { source := "5 USC § 557(b)", target := "5 USC § 554(d)", kind := .SubjectTo }


def edge_557d_subjectTo_557a : Ref :=
  { source := "5 USC § 557(d)(1)", target := "5 USC § 557(a)", kind := .SubjectTo }




structure Coherent557 (c : Proving.USC.Common.ComplaintText) : Prop where
  inc556      : IncorporationHonored edge_557_incorporates_556 c
  inc556Exists : ReferencedSectionExists edge_557_incorporates_556 c
  sub554d     : OverrideTriggered edge_557_subjectTo_554d c
  exParte     : OverrideTriggered edge_557d_subjectTo_557a c






def edge_701_exceptAsProvided_preclusion : Ref :=
  { source := "5 USC § 701(a)", target := "5 USC § 701(a)(1)-(2)", kind := .ExceptAsProvided }


def edge_701_incorporates_551 : Ref :=
  { source := "5 USC § 701(b)(2)", target := "5 USC § 551", kind := .Incorporates }



structure Coherent701 (c : Proving.USC.Common.ComplaintText) : Prop where
  inc551       : IncorporationHonored edge_701_incorporates_551 c
  def551Exists : ReferencedSectionExists edge_701_incorporates_551 c
  reviewExc    : ExceptionApplies edge_701_exceptAsProvided_preclusion c






def edge_702_savings_otherLaw : Ref :=
  { source := "5 USC § 702", target := "(other limitations / other statutes)", kind := .Savings }



structure Coherent702 (c : Proving.USC.Common.ComplaintText) : Prop where
  savingsExists  : ReferencedSectionExists edge_702_savings_otherLaw c
  savingsHonored : OverrideTriggered edge_702_savings_otherLaw c





def edge_704_exceptAsProvided_statute : Ref :=
  { source := "5 USC § 704", target := "(other statute — express finality)", kind := .ExceptAsProvided }



structure Coherent704 (c : Proving.USC.Common.ComplaintText) : Prop where
  finalityExc : ExceptionApplies edge_704_exceptAsProvided_statute c





def edge_706_incorporates_556 : Ref :=
  { source := "5 USC § 706(2)(E)", target := "5 USC § 556", kind := .Incorporates }
def edge_706_incorporates_557 : Ref :=
  { source := "5 USC § 706(2)(E)", target := "5 USC § 557", kind := .Incorporates }



structure Coherent706 (c : Proving.USC.Common.ComplaintText) : Prop where
  inc556       : IncorporationHonored edge_706_incorporates_556 c
  inc557       : IncorporationHonored edge_706_incorporates_557 c
  rec556Exists : ReferencedSectionExists edge_706_incorporates_556 c
  rec557Exists : ReferencedSectionExists edge_706_incorporates_557 c






inductive ReviewBarred (c : Proving.USC.Common.ComplaintText) : Prop
  | byPreclusion (h : ExceptionApplies edge_701_exceptAsProvided_preclusion c) : ReviewBarred c
  | byFinality   (h : ExceptionApplies edge_704_exceptAsProvided_statute c)    : ReviewBarred c

end Proving.USC.T05.Structure
