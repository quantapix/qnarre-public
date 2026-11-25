














import Proving.USC.T09.Ch1.Structure.Types
import Proving.USC.T09.Ch1.Structure.Predicates

set_option autoImplicit false

namespace Proving.USC.T09.Ch1.Structure

open Proving.USC.Common













def edge_chapter_exceptAsProvided_1 : Ref :=
  { source := "9 USC ch. 1", target := "9 USC § 1", kind := .ExceptAsProvided }



def edge_2_incorporates_1 : Ref :=
  { source := "9 USC § 2", target := "9 USC § 1", kind := .Incorporates }




def edge_2_savings_contractLaw : Ref :=
  { source := "9 USC § 2"
  , target := "grounds as exist at law or in equity for the revocation of any contract"
  , kind := .Savings }



def edge_2_exceptAsProvided_ch4 : Ref :=
  { source := "9 USC § 2", target := "9 USC ch. 4", kind := .ExceptAsProvided }




def edge_3_incorporates_2 : Ref :=
  { source := "9 USC § 3", target := "9 USC § 2", kind := .Incorporates }



def edge_3_subjectTo_6 : Ref :=
  { source := "9 USC § 3", target := "9 USC § 6", kind := .SubjectTo }



def edge_4_incorporates_2 : Ref :=
  { source := "9 USC § 4", target := "9 USC § 2", kind := .Incorporates }



def edge_4_incorporates_t28 : Ref :=
  { source := "9 USC § 4", target := "28 USC (title 28)", kind := .Incorporates }



def edge_4_incorporates_frcp : Ref :=
  { source := "9 USC § 4", target := "Federal Rules of Civil Procedure", kind := .Incorporates }


def edge_4_subjectTo_6 : Ref :=
  { source := "9 USC § 4", target := "9 USC § 6", kind := .SubjectTo }






def edge_5_lexSpecialis_agreementMethod : Ref :=
  { source := "9 USC § 5"
  , target := "the parties' arbitration agreement (method of naming or appointing arbitrators)"
  , kind := .LexSpecialis }


def edge_5_subjectTo_6 : Ref :=
  { source := "9 USC § 5", target := "9 USC § 6", kind := .SubjectTo }



def edge_6_incorporates_motionPractice : Ref :=
  { source := "9 USC § 6"
  , target := "law provided for the making and hearing of motions"
  , kind := .Incorporates }





def edge_6_exceptAsProvided_chapter : Ref :=
  { source := "9 USC § 6", target := "9 USC ch. 1", kind := .ExceptAsProvided }



def edge_7_incorporates_5 : Ref :=
  { source := "9 USC § 7", target := "9 USC § 5", kind := .Incorporates }



def edge_7_incorporates_witnessFees : Ref :=
  { source := "9 USC § 7"
  , target := "fees of witnesses before masters of the United States courts"
  , kind := .Incorporates }



def edge_7_incorporates_subpoenaService : Ref :=
  { source := "9 USC § 7"
  , target := "manner of service of subpoenas to appear and testify before the court"
  , kind := .Incorporates }





def edge_7_incorporates_contemptLaw : Ref :=
  { source := "9 USC § 7"
  , target := "law for securing attendance of witnesses and punishing neglect or refusal to attend in the courts of the United States"
  , kind := .Incorporates }




def edge_8_notwithstanding_chapter : Ref :=
  { source := "9 USC § 8", target := "9 USC ch. 1", kind := .Notwithstanding }



def edge_8_incorporates_admiraltyProcedure : Ref :=
  { source := "9 USC § 8"
  , target := "the usual course of admiralty proceedings"
  , kind := .Incorporates }



def edge_9_exceptAsProvided_10 : Ref :=
  { source := "9 USC § 9", target := "9 USC § 10", kind := .ExceptAsProvided }


def edge_9_exceptAsProvided_11 : Ref :=
  { source := "9 USC § 9", target := "9 USC § 11", kind := .ExceptAsProvided }



def edge_9_subjectTo_6 : Ref :=
  { source := "9 USC § 9", target := "9 USC § 6", kind := .SubjectTo }



def edge_10c_incorporates_5usc580 : Ref :=
  { source := "9 USC § 10(c)", target := "5 USC § 580", kind := .Incorporates }




def edge_10c_incorporates_5usc572 : Ref :=
  { source := "9 USC § 10(c)", target := "5 USC § 572", kind := .Incorporates }





def edge_10c_lexSpecialis_10a : Ref :=
  { source := "9 USC § 10(c)", target := "9 USC § 10(a)", kind := .LexSpecialis }



def edge_10_subjectTo_12 : Ref :=
  { source := "9 USC § 10", target := "9 USC § 12", kind := .SubjectTo }


def edge_10_subjectTo_6 : Ref :=
  { source := "9 USC § 10", target := "9 USC § 6", kind := .SubjectTo }



def edge_11_subjectTo_12 : Ref :=
  { source := "9 USC § 11", target := "9 USC § 12", kind := .SubjectTo }


def edge_11_subjectTo_6 : Ref :=
  { source := "9 USC § 11", target := "9 USC § 6", kind := .SubjectTo }


def edge_12_incorporates_10 : Ref :=
  { source := "9 USC § 12", target := "9 USC § 10", kind := .Incorporates }


def edge_12_incorporates_11 : Ref :=
  { source := "9 USC § 12", target := "9 USC § 11", kind := .Incorporates }




def edge_12_incorporates_serviceOfNotice : Ref :=
  { source := "9 USC § 12"
  , target := "law for service of notice of motion in an action in the same court; other process of the court"
  , kind := .Incorporates }


def edge_12_subjectTo_6 : Ref :=
  { source := "9 USC § 12", target := "9 USC § 6", kind := .SubjectTo }


def edge_13_incorporates_9 : Ref :=
  { source := "9 USC § 13", target := "9 USC § 9", kind := .Incorporates }



def edge_13_incorporates_11 : Ref :=
  { source := "9 USC § 13", target := "9 USC § 11", kind := .Incorporates }




def edge_13_incorporates_judgmentLaw : Ref :=
  { source := "9 USC § 13"
  , target := "all the provisions of law relating to a judgment in an action"
  , kind := .Incorporates }



def edge_title_exceptAsProvided_14 : Ref :=
  { source := "9 USC (title 9)", target := "9 USC § 14", kind := .ExceptAsProvided }




def edge_15_notwithstanding_actOfState : Ref :=
  { source := "9 USC § 15"
  , target := "the Act of State doctrine (federal common law)"
  , kind := .Notwithstanding }



def edge_15_incorporates_2 : Ref :=
  { source := "9 USC § 15", target := "9 USC § 2", kind := .Incorporates }


def edge_15_incorporates_9 : Ref :=
  { source := "9 USC § 15", target := "9 USC § 9", kind := .Incorporates }



def edge_15_incorporates_13 : Ref :=
  { source := "9 USC § 15", target := "9 USC § 13", kind := .Incorporates }



def edge_16a1A_incorporates_3 : Ref :=
  { source := "9 USC § 16(a)(1)(A)", target := "9 USC § 3", kind := .Incorporates }



def edge_16a1B_incorporates_4 : Ref :=
  { source := "9 USC § 16(a)(1)(B)", target := "9 USC § 4", kind := .Incorporates }



def edge_16a1C_incorporates_206 : Ref :=
  { source := "9 USC § 16(a)(1)(C)", target := "9 USC § 206", kind := .Incorporates }



def edge_16a1D_incorporates_9 : Ref :=
  { source := "9 USC § 16(a)(1)(D)", target := "9 USC § 9", kind := .Incorporates }


def edge_16a1E_incorporates_10 : Ref :=
  { source := "9 USC § 16(a)(1)(E)", target := "9 USC § 10", kind := .Incorporates }



def edge_16a1E_incorporates_11 : Ref :=
  { source := "9 USC § 16(a)(1)(E)", target := "9 USC § 11", kind := .Incorporates }



def edge_16b_exceptAsProvided_28usc1292b : Ref :=
  { source := "9 USC § 16(b)", target := "28 USC § 1292(b)", kind := .ExceptAsProvided }



def edge_16b1_incorporates_3 : Ref :=
  { source := "9 USC § 16(b)(1)", target := "9 USC § 3", kind := .Incorporates }



def edge_16b2_incorporates_4 : Ref :=
  { source := "9 USC § 16(b)(2)", target := "9 USC § 4", kind := .Incorporates }



def edge_16b3_incorporates_206 : Ref :=
  { source := "9 USC § 16(b)(3)", target := "9 USC § 206", kind := .Incorporates }



def chapter1Edges : List Ref :=
  [ edge_chapter_exceptAsProvided_1
  , edge_2_incorporates_1, edge_2_savings_contractLaw, edge_2_exceptAsProvided_ch4
  , edge_3_incorporates_2, edge_3_subjectTo_6
  , edge_4_incorporates_2, edge_4_incorporates_t28, edge_4_incorporates_frcp
  , edge_4_subjectTo_6
  , edge_5_lexSpecialis_agreementMethod, edge_5_subjectTo_6
  , edge_6_incorporates_motionPractice, edge_6_exceptAsProvided_chapter
  , edge_7_incorporates_5, edge_7_incorporates_witnessFees
  , edge_7_incorporates_subpoenaService, edge_7_incorporates_contemptLaw
  , edge_8_notwithstanding_chapter, edge_8_incorporates_admiraltyProcedure
  , edge_9_exceptAsProvided_10, edge_9_exceptAsProvided_11, edge_9_subjectTo_6
  , edge_10c_incorporates_5usc580, edge_10c_incorporates_5usc572
  , edge_10c_lexSpecialis_10a, edge_10_subjectTo_12, edge_10_subjectTo_6
  , edge_11_subjectTo_12, edge_11_subjectTo_6
  , edge_12_incorporates_10, edge_12_incorporates_11
  , edge_12_incorporates_serviceOfNotice, edge_12_subjectTo_6
  , edge_13_incorporates_9, edge_13_incorporates_11, edge_13_incorporates_judgmentLaw
  , edge_title_exceptAsProvided_14
  , edge_15_notwithstanding_actOfState, edge_15_incorporates_2
  , edge_15_incorporates_9, edge_15_incorporates_13
  , edge_16a1A_incorporates_3, edge_16a1B_incorporates_4, edge_16a1C_incorporates_206
  , edge_16a1D_incorporates_9, edge_16a1E_incorporates_10, edge_16a1E_incorporates_11
  , edge_16b_exceptAsProvided_28usc1292b
  , edge_16b1_incorporates_3, edge_16b2_incorporates_4, edge_16b3_incorporates_206 ]



def chapter1CrossTitleEdges : List Ref :=
  chapter1Edges.filter Ref.leavesTitle9









structure Coherent1 (c : ComplaintText) : Prop where
  maritimeTransactionsDefined :
    DefinitionSuppliedForTerm "maritime transactions" edge_2_incorporates_1 c
  commerceDefined :
    DefinitionSuppliedForTerm "commerce" edge_2_incorporates_1 c
  exclusionTargetExists : ReferencedSectionExists edge_chapter_exceptAsProvided_1 c



structure Coherent2 (c : ComplaintText) : Prop where
  definitionTargetExists : ReferencedSectionExists edge_2_incorporates_1 c
  definitionsHonored : IncorporationHonored edge_2_incorporates_1 c
  savingsPreserved : SavingsClausePreserves edge_2_savings_contractLaw c
  chapterFourCarveExists : ReferencedSectionExists edge_2_exceptAsProvided_ch4 c



structure Coherent3 (c : ComplaintText) : Prop where
  agreementTargetExists : ReferencedSectionExists edge_3_incorporates_2 c
  agreementHonored : IncorporationHonored edge_3_incorporates_2 c
  motionFormTargetExists : ReferencedSectionExists edge_3_subjectTo_6 c



structure Coherent4 (c : ComplaintText) : Prop where
  agreementHonored : IncorporationHonored edge_4_incorporates_2 c
  title28JurisdictionResolves : CrossTitleReferenceResolves edge_4_incorporates_t28 c
  frcpServiceHonored : IncorporationHonored edge_4_incorporates_frcp c
  motionFormTargetExists : ReferencedSectionExists edge_4_subjectTo_6 c



structure Coherent5 (c : ComplaintText) : Prop where
  agreedMethodControls : LexSpecialisControls edge_5_lexSpecialis_agreementMethod c
  motionFormTargetExists : ReferencedSectionExists edge_5_subjectTo_6 c






structure Section6IncorporationsResolve (c : ComplaintText) : Prop where
  motionPracticeHonored : IncorporationHonored edge_6_incorporates_motionPractice c
  expressDeparturesExist : ReferencedSectionExists edge_6_exceptAsProvided_chapter c



structure Coherent7 (c : ComplaintText) : Prop where
  arbitratorSelectionHonored : IncorporationHonored edge_7_incorporates_5 c
  feeScheduleHonored : IncorporationHonored edge_7_incorporates_witnessFees c
  serviceModeHonored : IncorporationHonored edge_7_incorporates_subpoenaService c
  contemptPowerHonored : IncorporationHonored edge_7_incorporates_contemptLaw c



structure Coherent8 (c : ComplaintText) : Prop where
  overrideFires : OverrideTriggered edge_8_notwithstanding_chapter c
  admiraltyProcedureHonored : IncorporationHonored edge_8_incorporates_admiraltyProcedure c



structure Coherent9 (c : ComplaintText) : Prop where
  vacaturCarveExists : ReferencedSectionExists edge_9_exceptAsProvided_10 c
  modificationCarveExists : ReferencedSectionExists edge_9_exceptAsProvided_11 c
  motionFormTargetExists : ReferencedSectionExists edge_9_subjectTo_6 c



structure Coherent10 (c : ComplaintText) : Prop where
  adrAwardRefResolves : CrossTitleReferenceResolves edge_10c_incorporates_5usc580 c
  adrFactorsRefResolves : CrossTitleReferenceResolves edge_10c_incorporates_5usc572 c
  noticeConstraintExists : ReferencedSectionExists edge_10_subjectTo_12 c
  motionFormTargetExists : ReferencedSectionExists edge_10_subjectTo_6 c


structure Coherent11 (c : ComplaintText) : Prop where
  noticeConstraintExists : ReferencedSectionExists edge_11_subjectTo_12 c
  motionFormTargetExists : ReferencedSectionExists edge_11_subjectTo_6 c



structure Coherent12 (c : ComplaintText) : Prop where
  vacaturRefHonored : IncorporationHonored edge_12_incorporates_10 c
  modificationRefHonored : IncorporationHonored edge_12_incorporates_11 c
  serviceModeHonored : IncorporationHonored edge_12_incorporates_serviceOfNotice c
  motionFormTargetExists : ReferencedSectionExists edge_12_subjectTo_6 c



structure Coherent13 (c : ComplaintText) : Prop where
  confirmationRefHonored : IncorporationHonored edge_13_incorporates_9 c
  modificationRefHonored : IncorporationHonored edge_13_incorporates_11 c
  judgmentLawHonored : IncorporationHonored edge_13_incorporates_judgmentLaw c



structure Coherent14 (c : ComplaintText) : Prop where
  carveTargetExists : ReferencedSectionExists edge_title_exceptAsProvided_14 c



structure Coherent15 (c : ComplaintText) : Prop where
  actOfStateOverridden : OverrideTriggered edge_15_notwithstanding_actOfState c
  enforcementPathHonored : IncorporationHonored edge_15_incorporates_2 c
  confirmationPathHonored : IncorporationHonored edge_15_incorporates_9 c
  executionPathHonored : IncorporationHonored edge_15_incorporates_13 c



structure Coherent16 (c : ComplaintText) : Prop where
  stayOrderRefHonored : IncorporationHonored edge_16a1A_incorporates_3 c
  compelOrderRefHonored : IncorporationHonored edge_16a1B_incorporates_4 c
  conventionRefExists : ReferencedSectionExists edge_16a1C_incorporates_206 c
  confirmationRefHonored : IncorporationHonored edge_16a1D_incorporates_9 c
  vacaturRefHonored : IncorporationHonored edge_16a1E_incorporates_10 c
  modificationRefHonored : IncorporationHonored edge_16a1E_incorporates_11 c
  interlocutoryCarveResolves : CrossTitleReferenceResolves edge_16b_exceptAsProvided_28usc1292b c
  barredStayRefHonored : IncorporationHonored edge_16b1_incorporates_3 c
  barredCompelRefHonored : IncorporationHonored edge_16b2_incorporates_4 c
  barredConventionRefExists : ReferencedSectionExists edge_16b3_incorporates_206 c






inductive ChapterOperationDefeated (c : ComplaintText) : Prop where

  | workerExclusion : TransportationWorkerExclusionApplies c → ChapterOperationDefeated c

  | preEnactmentContract : PreEnactmentContractExclusionApplies c → ChapterOperationDefeated c

  | chapterFourOverride :
      ExceptionApplies edge_2_exceptAsProvided_ch4 c → ChapterOperationDefeated c


inductive Section10VacaturRegime (c : ComplaintText) : Prop where

  | general : ReferencedSectionExists edge_10_subjectTo_12 c → Section10VacaturRegime c


  | adrAct :
      CrossTitleReferenceResolves edge_10c_incorporates_5usc580 c →
      CrossTitleReferenceResolves edge_10c_incorporates_5usc572 c →
      LexSpecialisControls edge_10c_lexSpecialis_10a c →
      Section10VacaturRegime c




inductive Section16AppealReferent (c : ComplaintText) : Prop where

  | refusedStay3 : IncorporationHonored edge_16a1A_incorporates_3 c → Section16AppealReferent c

  | deniedPetition4 : IncorporationHonored edge_16a1B_incorporates_4 c → Section16AppealReferent c

  | deniedApplication206 :
      ReferencedSectionExists edge_16a1C_incorporates_206 c → Section16AppealReferent c

  | confirmation9 : IncorporationHonored edge_16a1D_incorporates_9 c → Section16AppealReferent c

  | vacatur10 : IncorporationHonored edge_16a1E_incorporates_10 c → Section16AppealReferent c

  | modification11 :
      IncorporationHonored edge_16a1E_incorporates_11 c → Section16AppealReferent c



  | subjectToThisTitle :
      ReferencedSectionExists edge_chapter_exceptAsProvided_1 c → Section16AppealReferent c






def Section9ConfirmationMandateIntact (c : ComplaintText) : Prop :=
  ¬ ExceptionApplies edge_9_exceptAsProvided_10 c ∧
  ¬ ExceptionApplies edge_9_exceptAsProvided_11 c



def ChapterOperatesOnContract (c : ComplaintText) : Prop :=
  ¬ ChapterOperationDefeated c



structure Title9Chapter1Coherent (c : ComplaintText) : Prop where
  s1 : Coherent1 c
  s2 : Coherent2 c
  s3 : Coherent3 c
  s4 : Coherent4 c
  s5 : Coherent5 c
  s6 : Section6IncorporationsResolve c
  s7 : Coherent7 c
  s8 : Coherent8 c
  s9 : Coherent9 c
  s10 : Coherent10 c
  s11 : Coherent11 c
  s12 : Coherent12 c
  s13 : Coherent13 c
  s14 : Coherent14 c
  s15 : Coherent15 c
  s16 : Coherent16 c

end Proving.USC.T09.Ch1.Structure
