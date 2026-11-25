













import Proving.USC.T42.Ch6ASchI.Reearn.Structure.Types
import Proving.USC.T42.Ch6ASchI.Reearn.Structure.Predicates

set_option autoImplicit false

namespace Proving.USC.T42.Ch6ASchI.Reearn.Structure

open Proving.USC.Common
















def edge_201f_exceptAsProvided_264d : Ref :=
  { source := "42 USC § 201(f)", target := "42 USC § 264(d)", kind := .ExceptAsProvided }


def edge_201j_incorporates_t26_4731g : Ref :=
  { source := "42 USC § 201(j)", target := "26 USC § 4731(g)", kind := .Incorporates }


def edge_201q_incorporates_t21_802 : Ref :=
  { source := "42 USC § 201(q)", target := "21 USC § 802", kind := .Incorporates }





def edge_203_incorporates_201 : Ref :=
  { source := "42 USC § 203", target := "42 USC § 201", kind := .Incorporates }



def edge_203_incorporates_ch6A : Ref :=
  { source := "42 USC § 203", target := "42 USC ch. 6A", kind := .Incorporates }





def edge_204a2_incorporates_classificationAct1923 : Ref :=
  { source := "42 USC § 204(a)(2)",
    target := "Classification Act of 1923, as amended (repealed)",
    kind := .Notwithstanding }



def edge_204a5_incorporates_t37 : Ref :=
  { source := "42 USC § 204(a)(5)", target := "37 USC", kind := .DeemedReference }



def edge_204c2D_incorporates_295p : Ref :=
  { source := "42 USC § 204(c)(2)(D)", target := "42 USC § 295p", kind := .Incorporates }




def edge_204c3_deemed_reserveCorps : Ref :=
  { source := "42 USC § 204(c)(3)",
    target := "any Federal statute referring to the \"Reserve Corps\" of the Public Health Service",
    kind := .DeemedReference }


def edge_204c3_exceptAsProvided_204b : Ref :=
  { source := "42 USC § 204(c)(3)", target := "42 USC § 204(b)", kind := .ExceptAsProvided }




def edge_204a_a3_exceptAsProvided_204a_a4 : Ref :=
  { source := "42 USC § 204a(a)(3)", target := "42 USC § 204a(a)(4)", kind := .ExceptAsProvided }



def edge_204a_a5_incorporates_247d : Ref :=
  { source := "42 USC § 204a(a)(5)(C)", target := "42 USC § 247d", kind := .Incorporates }



def edge_204a_a5_incorporates_nea : Ref :=
  { source := "42 USC § 204a(a)(5)(A)", target := "50 USC § 1601 et seq.", kind := .Incorporates }




def edge_204a_a5_incorporates_stafford : Ref :=
  { source := "42 USC § 204a(a)(5)(B)", target := "42 USC § 5121 et seq.", kind := .Incorporates }




def edge_204a_c_deemed_detailingEntity : Ref :=
  { source := "42 USC § 204a(c)", target := "42 USC § 215", kind := .DeemedReference }






def edge_205_incorporates_204 : Ref :=
  { source := "42 USC § 205", target := "42 USC § 204(a)(1)", kind := .Incorporates }





def edge_206c1_incorporates_204 : Ref :=
  { source := "42 USC § 206(c)(1)", target := "42 USC § 204(a)(1)", kind := .Incorporates }



def edge_206c2_exceptAsProvided_206c : Ref :=
  { source := "42 USC § 206(c)(2)", target := "42 USC § 206(c)(2)", kind := .ExceptAsProvided }






def edge_207a_incorporates_206b : Ref :=
  { source := "42 USC § 207(a)", target := "42 USC § 206(b)", kind := .Incorporates }



def edge_207a_incorporates_206c : Ref :=
  { source := "42 USC § 207(a)", target := "42 USC § 206(c)", kind := .Incorporates }



def edge_207a_incorporates_armyGrades : Ref :=
  { source := "42 USC § 207(a)", target := "10 USC (commissioned grades of the Army)",
    kind := .Incorporates }





def edge_209a1_exceptAsProvided_209b : Ref :=
  { source := "42 USC § 209(a)(1)", target := "42 USC § 209(b)", kind := .ExceptAsProvided }



def edge_209a3_incorporates_212d : Ref :=
  { source := "42 USC § 209(a)(3)", target := "42 USC § 212(d)", kind := .Incorporates }



def edge_209b1_exceptAsProvided_205 : Ref :=
  { source := "42 USC § 209(b)(1)", target := "42 USC § 205", kind := .ExceptAsProvided }



def edge_209e1_notwithstanding_209b : Ref :=
  { source := "42 USC § 209(e)(1)", target := "42 USC § 209(b)", kind := .Notwithstanding }




def edge_209h_notwithstanding_alienEmploymentBars : Ref :=
  { source := "42 USC § 209(h)",
    target := "any other Act barring the employment of aliens",
    kind := .Notwithstanding }








def edge_209d_subjectTo_phsAct : Ref :=
  { source := "42 USC § 209d", target := "42 USC § 201 et seq.", kind := .SubjectTo }




def edge_210a2_incorporates_t37_303a : Ref :=
  { source := "42 USC § 210(a)(2)", target := "37 USC § 303a(b)", kind := .Incorporates }



def edge_210b_incorporates_211g3 : Ref :=
  { source := "42 USC § 210(b)", target := "42 USC § 211(g)(3)", kind := .Incorporates }


def edge_210c_incorporates_t5_5703 : Ref :=
  { source := "42 USC § 210(c)", target := "5 USC § 5703", kind := .Incorporates }



def edge_210f_incorporates_209g : Ref :=
  { source := "42 USC § 210(f)", target := "42 USC § 209(g)", kind := .Incorporates }







def edge_210_1a_incorporates_204 : Ref :=
  { source := "42 USC § 210-1(a)", target := "42 USC § 204(a)(1)", kind := .Incorporates }





def edge_210b_a_incorporates_209a1 : Ref :=
  { source := "42 USC § 210b(a)", target := "42 USC § 209(a)(1)", kind := .Incorporates }



def edge_210b_c_subjectTo_207d : Ref :=
  { source := "42 USC § 210b(c)", target := "42 USC § 207(d)", kind := .SubjectTo }









def edge_210b_d_incorporates_207c : Ref :=
  { source := "42 USC § 210b(d)", target := "42 USC § 207(c) (repealed 1979)",
    kind := .Incorporates }



def edge_210b_d_incorporates_206c : Ref :=
  { source := "42 USC § 210b(d)", target := "42 USC § 206(c)", kind := .Incorporates }




def edge_210b_f_notwithstanding_207d : Ref :=
  { source := "42 USC § 210b(f)", target := "42 USC § 207(d)", kind := .Notwithstanding }





def edge_211g3A_incorporates_t10_1406h : Ref :=
  { source := "42 USC § 211(g)(3)(A)", target := "10 USC § 1406(h)", kind := .Incorporates }



def edge_211g3B_incorporates_t10_1407 : Ref :=
  { source := "42 USC § 211(g)(3)(B)", target := "10 USC § 1407", kind := .Incorporates }



def edge_211l_incorporates_210b_c : Ref :=
  { source := "42 USC § 211(l)", target := "42 USC § 210b(c)", kind := .Incorporates }




def edge_211m_notwithstanding_t5_3332 : Ref :=
  { source := "42 USC § 211(m)", target := "5 USC § 3332", kind := .Notwithstanding }






def edge_211c_savings_otherInternshipCredit : Ref :=
  { source := "42 USC § 211c",
    target := "other provisions of law granting internship credit",
    kind := .Savings }




def edge_212a4_exceptAsProvided_212a6 : Ref :=
  { source := "42 USC § 212(a)(4)", target := "42 USC § 212(a)(6)", kind := .ExceptAsProvided }




def edge_212a4_incorporates_t10_1406 : Ref :=
  { source := "42 USC § 212(a)(4)", target := "10 USC § 1406", kind := .Incorporates }



def edge_212a4iii_incorporates_t37_205a : Ref :=
  { source := "42 USC § 212(a)(4)(iii)", target := "37 USC § 205(a)", kind := .Incorporates }


def edge_212a7_incorporates_211g3 : Ref :=
  { source := "42 USC § 212(a)(7)", target := "42 USC § 211(g)(3)", kind := .Incorporates }



def edge_212c_incorporates_213a_a19 : Ref :=
  { source := "42 USC § 212(c)(1)", target := "42 USC § 213a(a)(19)", kind := .Incorporates }



def edge_212d4_incorporates_237 : Ref :=
  { source := "42 USC § 212(d)(4)", target := "42 USC § 237", kind := .Incorporates }



def edge_212f_incorporates_t10_1208a2 : Ref :=
  { source := "42 USC § 212(f)", target := "10 USC § 1208(a)(2)", kind := .Incorporates }






def edge_213a_incorporates_armyOfficerBenefits : Ref :=
  { source := "42 USC § 213(a)",
    target := "any law of the United States conferring benefits on commissioned officers of the Army",
    kind := .Incorporates }



def edge_213a_exceptAsProvided_213b : Ref :=
  { source := "42 USC § 213(a)", target := "42 USC § 213(b)", kind := .ExceptAsProvided }




def edge_213d_deemed_veteransLaws : Ref :=
  { source := "42 USC § 213(d)",
    target := "laws administered by the Secretary of Veterans Affairs",
    kind := .DeemedReference }


def edge_213d_incorporates_417 : Ref :=
  { source := "42 USC § 213(d)", target := "42 USC § 417", kind := .Incorporates }




def edge_213e_deemed_scra : Ref :=
  { source := "42 USC § 213(e)", target := "50 USC § 3901 et seq.", kind := .DeemedReference }




def edge_213f_deemed_antidiscriminationLaws : Ref :=
  { source := "42 USC § 213(f)",
    target := "laws prohibiting discrimination on the basis of race, color, sex, ethnicity, age, religion, and disability",
    kind := .DeemedReference }





def edge_213a_a2_incorporates_t10_ch61 : Ref :=
  { source := "42 USC § 213a(a)(2)", target := "10 USC ch. 61", kind := .Incorporates }




def edge_213a_a2_exceptAsProvided_t10_1201 : Ref :=
  { source := "42 USC § 213a(a)(2)", target := "10 USC § 1201", kind := .ExceptAsProvided }



def edge_213a_a18_incorporates_t10_1034 : Ref :=
  { source := "42 USC § 213a(a)(18)", target := "10 USC § 1034", kind := .Incorporates }


def edge_213a_a19_incorporates_t10_ch1223 : Ref :=
  { source := "42 USC § 213a(a)(19)", target := "10 USC ch. 1223", kind := .Incorporates }




def edge_213a_a8_subjectTo_213 : Ref :=
  { source := "42 USC § 213a(a)(8)", target := "42 USC § 213", kind := .SubjectTo }




def edge_213a_a1_incorporates_t10_1036 : Ref :=
  { source := "42 USC § 213a(a)(1)", target := "10 USC § 1036", kind := .Incorporates }




def edge_213a_b1_deemed_secretaryHHS : Ref :=
  { source := "42 USC § 213a(b)(1)",
    target := "10 USC (\"military departments\", \"the Secretary concerned\", \"the Secretary of Defense\")",
    kind := .DeemedReference }




def edge_213a_b3_deemed_armedForces : Ref :=
  { source := "42 USC § 213a(b)(3)", target := "10 USC ch. 1223", kind := .DeemedReference }







def edge_214b_exceptAsProvided_otherFlagLaw : Ref :=
  { source := "42 USC § 214(b)",
    target := "any other provision of law providing for presentation of a United States flag on release for retirement",
    kind := .ExceptAsProvided }






def edge_215a_subjectTo_lawsOfDetailService : Ref :=
  { source := "42 USC § 215(a)",
    target := "the laws for the government of the armed service to which detailed",
    kind := .SubjectTo }



def edge_215d_incorporates_213 : Ref :=
  { source := "42 USC § 215(d)", target := "42 USC § 213", kind := .Incorporates }




def edge_215e_incorporates_204a_a5 : Ref :=
  { source := "42 USC § 215(e)", target := "42 USC § 204a(a)(5)", kind := .Incorporates }




def edge_215e_exceptAsProvided_coastGuardDod : Ref :=
  { source := "42 USC § 215(e)",
    target := "agreements negotiated with agencies hosting assigned Commissioned Corps officers (and the Coast Guard and Department of Defense)",
    kind := .ExceptAsProvided }







def edge_217_incorporates_ucmj : Ref :=
  { source := "42 USC § 217", target := "10 USC § 801 et seq.", kind := .Incorporates }




def edge_217_exceptAsProvided_presidentialDirection : Ref :=
  { source := "42 USC § 217",
    target := "direction of the President as Commander in Chief",
    kind := .ExceptAsProvided }





def edge_217a_a_notwithstanding_t5_competitiveService : Ref :=
  { source := "42 USC § 217a(a)",
    target := "5 USC (appointments in the competitive service)",
    kind := .Notwithstanding }




def edge_217a_a_notwithstanding_t5_ch51 : Ref :=
  { source := "42 USC § 217a(a)", target := "5 USC ch. 51", kind := .Notwithstanding }




def edge_217a_a_savings_otherCouncilAuthorities : Ref :=
  { source := "42 USC § 217a(a)",
    target := "other provisions of law authorizing advisory councils",
    kind := .Savings }



def edge_217a_b_incorporates_210c : Ref :=
  { source := "42 USC § 217a(b)", target := "42 USC § 210(c)", kind := .Incorporates }







def edge_217a1_incorporates_phsAct : Ref :=
  { source := "42 USC § 217a-1", target := "42 USC § 201 et seq.", kind := .Incorporates }



def edge_217a1_incorporates_alcoholAct1970 : Ref :=
  { source := "42 USC § 217a-1", target := "42 USC § 4541 et seq.", kind := .Incorporates }








def audit_210b_d_207c : RefAudit :=
  { ref := edge_210b_d_incorporates_207c, status := .RepealedTarget }



def audit_204_a2_classificationAct : RefAudit :=
  { ref := edge_204a2_incorporates_classificationAct1923, status := .RepealedTarget }








structure Section201IncorporationsResolve (c : ComplaintText) : Prop where
  stateTermException : ExceptionApplies edge_201f_exceptAsProvided_264d c
  narcoticDefinitionResolves : CrossTitleReferenceResolves edge_201j_incorporates_t26_4731g c
  controlledSubstanceDefinitionResolves : CrossTitleReferenceResolves edge_201q_incorporates_t21_802 c


structure Coherent203 (c : ComplaintText) : Prop where
  definitionsResolve : IncorporationHonored edge_203_incorporates_201 c
  delegationScopeResolves : ReferencedSectionExists edge_203_incorporates_ch6A c


structure Coherent204 (c : ComplaintText) : Prop where
  classificationActReference : TargetRepealedAtOperativeTime edge_204a2_incorporates_classificationAct1923 c
  warrantOfficerTitle37 : DeemedEquivalenceApplied edge_204a5_incorporates_t37 c
  underservedCommunities : IncorporationHonored edge_204c2D_incorporates_295p c
  reserveCorpsRedesignation : DeemedEquivalenceApplied edge_204c3_deemed_reserveCorps c
  redesignationCarveOut : ExceptionApplies edge_204c3_exceptAsProvided_204b c


structure Coherent204a (c : ComplaintText) : Prop where
  waiverCarveOut : ExceptionApplies edge_204a_a3_exceptAsProvided_204a_a4 c
  publicHealthEmergencyResolves : IncorporationHonored edge_204a_a5_incorporates_247d c
  nationalEmergencyResolves : CrossTitleReferenceResolves edge_204a_a5_incorporates_nea c
  disasterDeclarationResolves : IncorporationHonored edge_204a_a5_incorporates_stafford c
  deploymentDeemedAuthorized : DeemedEquivalenceApplied edge_204a_c_deemed_detailingEntity c


structure Coherent205 (c : ComplaintText) : Prop where
  corpsMembershipResolves : IncorporationHonored edge_205_incorporates_204 c


structure Coherent206 (c : ComplaintText) : Prop where
  corpsMembershipResolves : IncorporationHonored edge_206c1_incorporates_204 c
  temporaryPositionCapCarveOut : ExceptionApplies edge_206c2_exceptAsProvided_206c c


structure Coherent207 (c : ComplaintText) : Prop where
  assistantSurgeonGeneralCapResolves : IncorporationHonored edge_207a_incorporates_206b c
  temporaryPositionsResolve : IncorporationHonored edge_207a_incorporates_206c c
  armyGradeCorrespondence : CrossTitleReferenceResolves edge_207a_incorporates_armyGrades c


structure Coherent209 (c : ComplaintText) : Prop where
  gradeLimitationCarveOut : ExceptionApplies edge_209a1_exceptAsProvided_209b c
  activeServiceDefinitionResolves : IncorporationHonored edge_209a3_incorporates_212d c
  surgeonGeneralAppointmentCarveOut : ExceptionApplies edge_209b1_exceptAsProvided_205 c
  reappointmentOverride : OverrideTriggered edge_209e1_notwithstanding_209b c
  alienEmploymentOverride : OverrideTriggered edge_209h_notwithstanding_alienEmploymentBars c


structure Coherent209d (c : ComplaintText) : Prop where
  otherProvisionsSatisfied : SubjectToConstraintSatisfied edge_209d_subjectTo_phsAct c


structure Coherent210 (c : ComplaintText) : Prop where
  specialPayCrossTitle : CrossTitleReferenceResolves edge_210a2_incorporates_t37_303a c
  retiredPayEntitlementResolves : IncorporationHonored edge_210b_incorporates_211g3 c
  travelExpensesCrossTitle : CrossTitleReferenceResolves edge_210c_incorporates_t5_5703 c
  fellowshipStipendsResolve : IncorporationHonored edge_210f_incorporates_209g c


structure Coherent210_1 (c : ComplaintText) : Prop where
  corpsMembershipResolves : IncorporationHonored edge_210_1a_incorporates_204 c



structure Coherent210b (c : ComplaintText) : Prop where
  examinationSubjectsResolve : IncorporationHonored edge_210b_a_incorporates_209a1 c
  gradeCeilingSatisfied : SubjectToConstraintSatisfied edge_210b_c_subjectTo_207d c
  repealedDirectorGradeReference : TargetRepealedAtOperativeTime edge_210b_d_incorporates_207c c
  temporaryAssignmentResolves : IncorporationHonored edge_210b_d_incorporates_206c c
  vacancyBorrowingOverride : OverrideTriggered edge_210b_f_notwithstanding_207d c


structure Coherent211 (c : ComplaintText) : Prop where
  retiredPayBaseCrossTitle : CrossTitleReferenceResolves edge_211g3A_incorporates_t10_1406h c
  modernizedRetiredPayCrossTitle : CrossTitleReferenceResolves edge_211g3B_incorporates_t10_1407 c
  categoryCeilingResolves : IncorporationHonored edge_211l_incorporates_210b_c c
  affidavitRequirementOverridden : OverrideTriggered edge_211m_notwithstanding_t5_3332 c


structure Coherent211c (c : ComplaintText) : Prop where
  duplicateCreditDeferred : SavingsClausePreserves edge_211c_savings_otherInternshipCredit c


structure Coherent212 (c : ComplaintText) : Prop where
  modernizedSystemCarveOut : ExceptionApplies edge_212a4_exceptAsProvided_212a6 c
  retiredPayBaseCrossTitle : CrossTitleReferenceResolves edge_212a4_incorporates_t10_1406 c
  basicPayCreditCrossTitle : CrossTitleReferenceResolves edge_212a4iii_incorporates_t37_205a c
  promotionFailureRetiredPayResolves : IncorporationHonored edge_212a7_incorporates_211g3 c
  nonRegularRetiredPayResolves : IncorporationHonored edge_212c_incorporates_213a_a19 c
  seniorBiomedicalServiceResolves : IncorporationHonored edge_212d4_incorporates_237 c
  disabilityRetirementCrossTitle : CrossTitleReferenceResolves edge_212f_incorporates_t10_1208a2 c




structure Section213IncorporationsResolve (c : ComplaintText) : Prop where
  armyBenefitParityResolves : IncorporationHonored edge_213a_incorporates_armyOfficerBenefits c
  ribbonAndRetiredPayCarveOut : ExceptionApplies edge_213a_exceptAsProvided_213b c
  veteransLawsDeeming : DeemedEquivalenceApplied edge_213d_deemed_veteransLaws c
  socialSecurityCreditResolves : IncorporationHonored edge_213d_incorporates_417 c
  servicemembersCivilReliefDeeming : DeemedEquivalenceApplied edge_213e_deemed_scra c
  antidiscriminationDeeming : DeemedEquivalenceApplied edge_213f_deemed_antidiscriminationLaws c



structure Section213aIncorporationsResolve (c : ComplaintText) : Prop where
  escortAllowanceReferenceExists : ReferencedSectionExists edge_213a_a1_incorporates_t10_1036 c
  disabilityRetirementResolves : CrossTitleReferenceResolves edge_213a_a2_incorporates_t10_ch61 c
  trainingDutyCarveOut : ExceptionApplies edge_213a_a2_exceptAsProvided_t10_1201 c
  protectedCommunicationsResolves : CrossTitleReferenceResolves edge_213a_a18_incorporates_t10_1034 c
  nonRegularRetirementResolves : CrossTitleReferenceResolves edge_213a_a19_incorporates_t10_ch1223 c
  militaryClaimsCondition : SubjectToConstraintSatisfied edge_213a_a8_subjectTo_213 c
  authoritySubstitution : DeemedEquivalenceApplied edge_213a_b1_deemed_secretaryHHS c
  armedForcesTermSubstitution : DeemedEquivalenceApplied edge_213a_b3_deemed_armedForces c


structure Coherent214 (c : ComplaintText) : Prop where
  priorFlagPresentationCarveOut : ExceptionApplies edge_214b_exceptAsProvided_otherFlagLaw c
  thisSectionControls : LexSpecialisControls edge_214b_exceptAsProvided_otherFlagLaw c


structure Coherent215 (c : ComplaintText) : Prop where
  detailedOfficerGovernedByHostLaw : SubjectToConstraintSatisfied edge_215a_subjectTo_lawsOfDetailService c
  militaryBenefitsCreditResolves : IncorporationHonored edge_215d_incorporates_213 c
  urgentNeedDefinitionResolves : IncorporationHonored edge_215e_incorporates_204a_a5 c
  deploymentAuthorityCarveOut : ExceptionApplies edge_215e_exceptAsProvided_coastGuardDod c


structure Coherent217 (c : ComplaintText) : Prop where
  ucmjSubjectionResolves : CrossTitleReferenceResolves edge_217_incorporates_ucmj c
  commanderInChiefCarveOut : ExceptionApplies edge_217_exceptAsProvided_presidentialDirection c


structure Coherent217a (c : ComplaintText) : Prop where
  competitiveServiceOverride : OverrideTriggered edge_217a_a_notwithstanding_t5_competitiveService c
  classificationPayOverride : OverrideTriggered edge_217a_a_notwithstanding_t5_ch51 c
  otherCouncilAuthoritiesPreserved : SavingsClausePreserves edge_217a_a_savings_otherCouncilAuthorities c
  compensationRateResolves : IncorporationHonored edge_217a_b_incorporates_210c c


structure Coherent217a1 (c : ComplaintText) : Prop where
  phsActScopeResolves : IncorporationHonored edge_217a1_incorporates_phsAct c
  alcoholActScopeResolves : IncorporationHonored edge_217a1_incorporates_alcoholAct1970 c






inductive MilitaryCharacterPath (c : ComplaintText) : Prop where


  | executiveOrderDeclaration
      (h : CrossTitleReferenceResolves edge_217_incorporates_ucmj c) :
      MilitaryCharacterPath c


  | detailToArmedService
      (h : SubjectToConstraintSatisfied edge_215a_subjectTo_lawsOfDetailService c) :
      MilitaryCharacterPath c


  | benefitIncorporation
      (h : IncorporationHonored edge_213a_incorporates_armyOfficerBenefits c) :
      MilitaryCharacterPath c




inductive RetiredPayBaseIncorporation (c : ComplaintText) : Prop where

  | preSept1980
      (h : CrossTitleReferenceResolves edge_211g3A_incorporates_t10_1406h c) :
      RetiredPayBaseIncorporation c

  | postSept1980
      (h : CrossTitleReferenceResolves edge_211g3B_incorporates_t10_1407 c) :
      RetiredPayBaseIncorporation c

  | modernizedSystem
      (h : ExceptionApplies edge_212a4_exceptAsProvided_212a6 c) :
      RetiredPayBaseIncorporation c







structure SubchapterIReferentialIntegrity (c : ComplaintText) : Prop where
  definitionalHub : Section201IncorporationsResolve c
  armyBenefitParity : Section213IncorporationsResolve c
  title10Incorporations : Section213aIncorporationsResolve c
  danglingDirectorGradeCitation : TargetRepealedAtOperativeTime edge_210b_d_incorporates_207c c

end Proving.USC.T42.Ch6ASchI.Reearn.Structure
