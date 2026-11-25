








import Proving.USC.T18.Ch77.Part5.Structure.Types
import Proving.USC.T18.Ch77.Part5.Structure.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false

open Proving.USC.Common

namespace Proving.USC.T18.Ch77.Part5.Structure











def edge_1591a_incorporates_1591e2 : Ref :=
  { source := "18 USC § 1591(a)", target := "18 USC § 1591(e)(2)",
    kind := .Incorporates, signal := "coercion described in subsection (e)(2)" }


def edge_1591a_incorporates_1591e3 : Ref :=
  { source := "18 USC § 1591(a)", target := "18 USC § 1591(e)(3)",
    kind := .Incorporates, signal := "engage in a commercial sex act" }


def edge_1591a_incorporates_1591b : Ref :=
  { source := "18 USC § 1591(a)", target := "18 USC § 1591(b)",
    kind := .Incorporates, signal := "shall be punished as provided in subsection (b)" }



def edge_1591a_exceptAsProvided_1591a1 : Ref :=
  { source := "18 USC § 1591(a)", target := "18 USC § 1591(a)(1)",
    kind := .ExceptAsProvided,
    signal := "except where the act constituting the violation of paragraph (1) is advertising" }



def edge_1591a_lexSpecialis_1591c : Ref :=
  { source := "18 USC § 1591(a)", target := "18 USC § 1591(c)",
    kind := .LexSpecialis,
    signal := "the Government need not prove that the defendant knew, or recklessly disregarded the fact, that the person had not attained the age of 18 years" }



def edge_1591a1_incorporates_s7 : Ref :=
  { source := "18 USC § 1591(a)(1)", target := "18 USC § 7",
    kind := .Incorporates,
    signal := "within the special maritime and territorial jurisdiction of the United States" }


def edge_1591a2_incorporates_1591a1 : Ref :=
  { source := "18 USC § 1591(a)(2)", target := "18 USC § 1591(a)(1)",
    kind := .Incorporates,
    signal := "an act described in violation of paragraph (1)" }


def edge_1591a2_incorporates_1591e4 : Ref :=
  { source := "18 USC § 1591(a)(2)", target := "18 USC § 1591(e)(4)",
    kind := .Incorporates, signal := "participation in a venture" }


def edge_1591a2_incorporates_1591e6 : Ref :=
  { source := "18 USC § 1591(a)(2)", target := "18 USC § 1591(e)(6)",
    kind := .Incorporates, signal := "a venture which has engaged in an act" }


def edge_1591b_incorporates_1591a : Ref :=
  { source := "18 USC § 1591(b)", target := "18 USC § 1591(a)",
    kind := .Incorporates, signal := "The punishment for an offense under subsection (a) is" }


def edge_1591b_incorporates_3571 : Ref :=
  { source := "18 USC § 1591(b)", target := "18 USC § 3571",
    kind := .Incorporates, signal := "by a fine under this title" }


def edge_1591b1_incorporates_1591e2 : Ref :=
  { source := "18 USC § 1591(b)(1)", target := "18 USC § 1591(e)(2)",
    kind := .Incorporates, signal := "coercion described in subsection (e)(2)" }



def edge_1591b2_incorporates_1591b1 : Ref :=
  { source := "18 USC § 1591(b)(2)", target := "18 USC § 1591(b)(1)",
    kind := .Incorporates, signal := "if the offense was not so effected" }


def edge_1591c_incorporates_1591a1 : Ref :=
  { source := "18 USC § 1591(c)", target := "18 USC § 1591(a)(1)",
    kind := .Incorporates, signal := "In a prosecution under subsection (a)(1)" }


def edge_1591d_incorporates_1591 : Ref :=
  { source := "18 USC § 1591(d)", target := "18 USC § 1591",
    kind := .Incorporates, signal := "prevents the enforcement of this section" }


def edge_1591d_incorporates_3571 : Ref :=
  { source := "18 USC § 1591(d)", target := "18 USC § 3571",
    kind := .Incorporates, signal := "shall be fined under this title" }


def edge_1591e2_incorporates_1591e1 : Ref :=
  { source := "18 USC § 1591(e)(2)", target := "18 USC § 1591(e)(1)",
    kind := .Incorporates, signal := "the abuse or threatened abuse of law or the legal process" }


def edge_1591e2_incorporates_1591e5 : Ref :=
  { source := "18 USC § 1591(e)(2)", target := "18 USC § 1591(e)(5)",
    kind := .Incorporates, signal := "threats of serious harm to or physical restraint against any person" }



def edge_1591e4_incorporates_1591a1 : Ref :=
  { source := "18 USC § 1591(e)(4)", target := "18 USC § 1591(a)(1)",
    kind := .Incorporates,
    signal := "knowingly assisting, supporting, or facilitating a violation of subsection (a)(1)" }


def edge_1591e4_incorporates_1591e6 : Ref :=
  { source := "18 USC § 1591(e)(4)", target := "18 USC § 1591(e)(6)",
    kind := .Incorporates, signal := "The term \"participation in a venture\"" }


def edges1591 : List Ref :=
  [ edge_1591a_incorporates_1591e2, edge_1591a_incorporates_1591e3,
    edge_1591a_incorporates_1591b, edge_1591a_exceptAsProvided_1591a1,
    edge_1591a_lexSpecialis_1591c, edge_1591a1_incorporates_s7,
    edge_1591a2_incorporates_1591a1, edge_1591a2_incorporates_1591e4,
    edge_1591a2_incorporates_1591e6, edge_1591b_incorporates_1591a,
    edge_1591b_incorporates_3571, edge_1591b1_incorporates_1591e2,
    edge_1591b2_incorporates_1591b1, edge_1591c_incorporates_1591a1,
    edge_1591d_incorporates_1591, edge_1591d_incorporates_3571,
    edge_1591e2_incorporates_1591e1, edge_1591e2_incorporates_1591e5,
    edge_1591e4_incorporates_1591a1, edge_1591e4_incorporates_1591e6 ]


def outboundEdges1591 : List Ref :=
  [ edge_1591a1_incorporates_s7, edge_1591b_incorporates_3571,
    edge_1591d_incorporates_3571 ]






structure DefinitionsClosed1591
    (coercion seriousHarm venture : DefinedTerm) (c : ComplaintText) : Prop where
  coercionFromAbuseOfProcess :
    DefinedTermUsageConsistent coercion edge_1591e2_incorporates_1591e1 c
  coercionFromSeriousHarm :
    DefinedTermUsageConsistent seriousHarm edge_1591e2_incorporates_1591e5 c
  participationFromVenture :
    DefinedTermUsageConsistent venture edge_1591e4_incorporates_1591e6 c
  participationFromParagraphOne :
    IncorporationHonored edge_1591e4_incorporates_1591a1 c





inductive PenaltyGradeResolved1591 (c : ComplaintText) : Prop where
  | aggravated
      (referral : PenaltyReferralCoherent edge_1591a_incorporates_1591b c)
      (means : IncorporationHonored edge_1591b1_incorporates_1591e2 c)
      (offense : IncorporationHonored edge_1591b_incorporates_1591a c)
  | residual
      (referral : PenaltyReferralCoherent edge_1591a_incorporates_1591b c)
      (notSoEffected : IncorporationHonored edge_1591b2_incorporates_1591b1 c)
      (offense : IncorporationHonored edge_1591b_incorporates_1591a c)






structure Coherent1591
    (coercion seriousHarm venture : DefinedTerm) (c : ComplaintText) : Prop where
  coercionRefResolves : IncorporationHonored edge_1591a_incorporates_1591e2 c
  commercialSexActRefResolves : IncorporationHonored edge_1591a_incorporates_1591e3 c
  beneficiaryRefResolves : IncorporationHonored edge_1591a2_incorporates_1591a1 c
  participationRefResolves : IncorporationHonored edge_1591a2_incorporates_1591e4 c
  ventureRefResolves : IncorporationHonored edge_1591a2_incorporates_1591e6 c
  maritimeJurisdictionExists : ReferencedSectionExists edge_1591a1_incorporates_s7 c
  fineProvisionExists : ReferencedSectionExists edge_1591b_incorporates_3571 c
  obstructionFineExists : ReferencedSectionExists edge_1591d_incorporates_3571 c
  obstructionScopeResolves : IncorporationHonored edge_1591d_incorporates_1591 c
  penaltyGrade : PenaltyGradeResolved1591 c
  advertisingCarveHonored : ExceptionHonored edge_1591a_exceptAsProvided_1591a1 c
  observationCarveScoped : IncorporationHonored edge_1591c_incorporates_1591a1 c
  observationCarveHonored : ExceptionHonored edge_1591a_lexSpecialis_1591c c
  definitionsClosed : DefinitionsClosed1591 coercion seriousHarm venture c




structure ObservationOverrideFires1591 (c : ComplaintText) : Prop where
  scopedToParagraphOne : IncorporationHonored edge_1591c_incorporates_1591a1 c
  triggered : OverrideTriggered edge_1591a_lexSpecialis_1591c c




structure AdvertisingExceptionFires1591 (c : ComplaintText) : Prop where
  triggered : ExceptionApplies edge_1591a_exceptAsProvided_1591a1 c
  honored : ExceptionHonored edge_1591a_exceptAsProvided_1591a1 c

end Proving.USC.T18.Ch77.Part5.Structure
