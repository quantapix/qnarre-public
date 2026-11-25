












import Proving.USC.T42.ADA.Structure.Types
import Proving.USC.T42.ADA.Structure.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T42.ADA.Structure

open Proving.USC.Common









def edge_12102_incorporates_12102_3 : Ref :=
  { source := "42 USC § 12102(1)(C)", target := "42 USC § 12102(3)", kind := .Incorporates }



def edge_12102_savings_construction : Ref :=
  { source := "42 USC § 12102(4)", target := "42 USC § 12102(1)", kind := .Savings }






def edge_12111_incorporates_2000e_4 : Ref :=
  { source := "42 USC § 12111(1)", target := "42 USC § 2000e-4", kind := .Incorporates }



def edge_12111_incorporates_2000e : Ref :=
  { source := "42 USC § 12111(7)", target := "42 USC § 2000e", kind := .Incorporates }



def edge_12111_incorporates_26_501c : Ref :=
  { source := "42 USC § 12111(5)(B)(ii)", target := "26 USC § 501(c)", kind := .Incorporates }



def edge_12111_incorporates_21_801 : Ref :=
  { source := "42 USC § 12111(6)(A)", target := "21 USC § 801", kind := .Incorporates }


def edge_12111_incorporates_21_812 : Ref :=
  { source := "42 USC § 12111(6)(B)", target := "21 USC § 812", kind := .Incorporates }






def edge_12112_incorporates_12111 : Ref :=
  { source := "42 USC § 12112", target := "42 USC § 12111", kind := .Incorporates }


def edge_12112_incorporates_12102 : Ref :=
  { source := "42 USC § 12112", target := "42 USC § 12102", kind := .Incorporates }



def edge_12112_exceptAsProvided_12112_d3 : Ref :=
  { source := "42 USC § 12112(d)(2)(A)", target := "42 USC § 12112(d)(3)", kind := .ExceptAsProvided }





def edge_12131_incorporates_49_24102 : Ref :=
  { source := "42 USC § 12131(1)(C)", target := "49 USC § 24102", kind := .Incorporates }





def edge_12132_subjectTo_subchapterII : Ref :=
  { source := "42 USC § 12132", target := "42 USC § 12131", kind := .SubjectTo }



def edge_12132_incorporates_12131 : Ref :=
  { source := "42 USC § 12132", target := "42 USC § 12131", kind := .Incorporates }






def edge_12181_incorporates_12131 : Ref :=
  { source := "42 USC § 12181(6)", target := "42 USC § 12131(1)", kind := .Incorporates }


def edge_12181_incorporates_49_20102 : Ref :=
  { source := "42 USC § 12181(8)", target := "49 USC § 20102", kind := .Incorporates }







def edge_12182_incorporates_12181 : Ref :=
  { source := "42 USC § 12182", target := "42 USC § 12181", kind := .Incorporates }



def edge_12182_notwithstanding_separatePrograms : Ref :=
  { source := "42 USC § 12182(b)(1)(C)", target := "42 USC § 12182(b)(1)(B)", kind := .Notwithstanding }



def edge_12182_savings_directThreat : Ref :=
  { source := "42 USC § 12182(b)(3)", target := "42 USC § 12182", kind := .Savings }





def edge_12203_subjectTo_12117 : Ref :=
  { source := "42 USC § 12203(c)", target := "42 USC § 12117", kind := .SubjectTo }


def edge_12203_subjectTo_12133 : Ref :=
  { source := "42 USC § 12203(c)", target := "42 USC § 12133", kind := .SubjectTo }


def edge_12203_subjectTo_12188 : Ref :=
  { source := "42 USC § 12203(c)", target := "42 USC § 12188", kind := .SubjectTo }




def edge_12203_incorporates_chapter : Ref :=
  { source := "42 USC § 12203", target := "42 USC § 12102", kind := .Incorporates }










structure Coherent12102 (c : ComplaintText) : Prop where
  regardedAsResolves   : ReferencedSectionExists edge_12102_incorporates_12102_3 c
  regardedAsHonored    : IncorporationHonored edge_12102_incorporates_12102_3 c
  constructionPreserved : SavingsPreserved edge_12102_savings_construction c



structure Coherent12111 (c : ComplaintText) : Prop where
  eeocExists       : ReferencedSectionExists edge_12111_incorporates_2000e_4 c
  titleVIIDefsExist : ReferencedSectionExists edge_12111_incorporates_2000e c
  exemptClubExists  : ReferencedSectionExists edge_12111_incorporates_26_501c c
  csaScheduleExists : ReferencedSectionExists edge_12111_incorporates_21_801 c
  controlledSubstExists : ReferencedSectionExists edge_12111_incorporates_21_812 c




structure Coherent12112 (c : ComplaintText) : Prop where
  defnsExist        : ReferencedSectionExists edge_12112_incorporates_12111 c
  defnsHonored      : IncorporationHonored edge_12112_incorporates_12111 c
  disabilityExists  : ReferencedSectionExists edge_12112_incorporates_12102 c
  disabilityHonored : IncorporationHonored edge_12112_incorporates_12102 c
  examExceptionApplies : ExceptionApplies edge_12112_exceptAsProvided_12112_d3 c



structure Coherent12131 (c : ComplaintText) : Prop where
  amtrakDefnExists : ReferencedSectionExists edge_12131_incorporates_49_24102 c



structure Coherent12132 (c : ComplaintText) : Prop where
  defnsExist     : ReferencedSectionExists edge_12132_incorporates_12131 c
  defnsHonored   : IncorporationHonored edge_12132_incorporates_12131 c
  subjectionMet  : SubjectionSatisfied edge_12132_subjectTo_subchapterII c



structure Coherent12181 (c : ComplaintText) : Prop where
  publicEntityExists : ReferencedSectionExists edge_12181_incorporates_12131 c
  publicEntityHonored : IncorporationHonored edge_12181_incorporates_12131 c
  railDefnExists     : ReferencedSectionExists edge_12181_incorporates_49_20102 c




structure Coherent12182 (c : ComplaintText) : Prop where
  defnsExist        : ReferencedSectionExists edge_12182_incorporates_12181 c
  defnsHonored      : IncorporationHonored edge_12182_incorporates_12181 c
  integrationOverride : OverrideTriggered edge_12182_notwithstanding_separatePrograms c
  directThreatSavings : SavingsPreserved edge_12182_savings_directThreat c






inductive RemedyRoutingResolved (c : ComplaintText) : Prop where
  | subchI   : SubjectionSatisfied edge_12203_subjectTo_12117 c → RemedyRoutingResolved c
  | subchII  : SubjectionSatisfied edge_12203_subjectTo_12133 c → RemedyRoutingResolved c
  | subchIII : SubjectionSatisfied edge_12203_subjectTo_12188 c → RemedyRoutingResolved c




structure Coherent12203 (c : ComplaintText) : Prop where
  substantiveExists  : ReferencedSectionExists edge_12203_incorporates_chapter c
  substantiveHonored : IncorporationHonored edge_12203_incorporates_chapter c
  remedyRouted       : RemedyRoutingResolved c

end Proving.USC.T42.ADA.Structure
