












import Proving.USC.T18.Ch1Ch47.Recert.Structure.Types
import Proving.USC.T18.Ch1Ch47.Recert.Structure.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch1Ch47.Recert.Structure

open Proving.USC.Common


def mkRef (src tgt : String) (k : EdgeKind) (s : RefScope) (sig : String) : Ref :=
  { source := src, target := tgt, kind := k, scope := s, signal := sig }




def edge_7_definesForTitle18 : Ref :=
  mkRef "18 USC (title 18, any provision using the term)" "18 USC § 7"
    .Incorporates .InTitle
    "The term \"special maritime and territorial jurisdiction of the United States\", as used in this title, includes:"

def edge_7_6_incorporates_outerSpaceTreaty : Ref :=
  mkRef "18 USC § 7(6)"
    "Treaty on Principles Governing the Activities of States in the Exploration and Use of Outer Space, Including the Moon and Other Celestial Bodies"
    .Incorporates .Open
    "on the registry of the United States pursuant to the Treaty on Principles Governing the Activities of States …"

def edge_7_6_incorporates_registrationConvention : Ref :=
  mkRef "18 USC § 7(6)"
    "Convention on Registration of Objects Launched into Outer Space"
    .Incorporates .Open
    "and the Convention on Registration of Objects Launched into Outer Space"

def edge_7_9_incorporates_ina101 : Ref :=
  mkRef "18 USC § 7(9)" "8 USC § 1101 (Immigration and Nationality Act § 101)"
    .Incorporates .ExternalAct
    "as that term is used in section 101 of the Immigration and Nationality Act"

def edge_7_9_savings_treaties : Ref :=
  mkRef "18 USC § 7(9)" "any treaty or international agreement with which this paragraph conflicts"
    .Savings .Open
    "Nothing in this paragraph shall be deemed to supersede any treaty or international agreement with which this paragraph conflicts."

def edge_7_9_exceptAsProvided_3261a : Ref :=
  mkRef "18 USC § 7(9)" "18 USC § 3261(a)"
    .ExceptAsProvided .InTitle
    "This paragraph does not apply with respect to an offense committed by a person described in section 3261(a) of this title."




def edge_20_definesForTitle18 : Ref :=
  mkRef "18 USC (title 18, any provision using the term)" "18 USC § 20"
    .Incorporates .InTitle
    "As used in this title, the term \"financial institution\" means—"

def edge_20_1_incorporates_fdia3c2 : Ref :=
  mkRef "18 USC § 20(1)" "12 USC § 1813(c)(2) (Federal Deposit Insurance Act § 3(c)(2))"
    .Incorporates .ExternalAct
    "an insured depository institution (as defined in section 3(c)(2) of the Federal Deposit Insurance Act)"

def edge_20_3_incorporates_fhlba2 : Ref :=
  mkRef "18 USC § 20(3)" "12 USC § 1422 (Federal Home Loan Bank Act § 2)"
    .Incorporates .ExternalAct
    "a member, as defined in section 2 of the Federal Home Loan Bank Act (12 U.S.C. 1422)"

def edge_20_4_incorporates_farmCredit535 : Ref :=
  mkRef "18 USC § 20(4)" "Farm Credit Act of 1971 § 5.35(3) (12 USC § 2271(3))"
    .Incorporates .ExternalAct
    "a System institution of the Farm Credit System, as defined in section 5.35(3) of the Farm Credit Act of 1971"

def edge_20_5_incorporates_sbia103 : Ref :=
  mkRef "18 USC § 20(5)" "15 USC § 662 (Small Business Investment Act of 1958 § 103)"
    .Incorporates .ExternalAct
    "a small business investment company, as defined in section 103 of the Small Business Investment Act of 1958 (15 U.S.C. 662)"



def edge_20_6_incorporates_fdia3w1 : Ref :=
  mkRef "18 USC § 20(6)" "12 USC § 1813(w)(1) (Federal Deposit Insurance Act § 3(w)(1))"
    .Incorporates .ExternalAct
    "a depository institution holding company (as defined in section 3(w)(1) of the Federal Deposit Insurance Act;"



def edge_20_8_incorporates_fra25 : Ref :=
  mkRef "18 USC § 20(8)" "Federal Reserve Act §§ 25, 25(a) (12 USC §§ 601 et seq., 611 et seq.)"
    .Incorporates .ExternalAct
    "an organization operating under section 25 or section 25(a) of the Federal Reserve Act"

def edge_20_9_incorporates_iba1b : Ref :=
  mkRef "18 USC § 20(9)" "12 USC § 3101(1), (3) (International Banking Act of 1978 § 1(b)(1), (3))"
    .Incorporates .ExternalAct
    "a branch or agency of a foreign bank (as such terms are defined in paragraphs (1) and (3) of section 1(b) of the International Banking Act of 1978)"

def edge_20_10_incorporates_s27 : Ref :=
  mkRef "18 USC § 20(10)" "18 USC § 27"
    .Incorporates .InTitle
    "a mortgage lending business (as defined in section 27 of this title)"

def edge_20_10_incorporates_respa3 : Ref :=
  mkRef "18 USC § 20(10)" "12 USC § 2602 (Real Estate Settlement Procedures Act of 1974 § 3)"
    .Incorporates .ExternalAct
    "a federally related mortgage loan as defined in section 3 of the Real Estate Settlement Procedures Act of 1974"





def edge_21_a_suppliesTitle18StolenElement : Ref :=
  mkRef "18 USC (any title-18 offense with a stolen-or-counterfeit-property element)"
    "18 USC § 21(a)"
    .Incorporates .InTitle
    "Wherever in this title it is an element of an offense that— (1) any property was embezzled, robbed, stolen … and (2) the defendant knew that the property was of such character"

def edge_21_b_incorporates_s115 : Ref :=
  mkRef "18 USC § 21(b)" "18 USC § 115"
    .Incorporates .InTitle
    "any representation made by a Federal law enforcement officer (as defined in section 115)"



def edge_23_definesForTitle18 : Ref :=
  mkRef "18 USC (title 18, any provision using the term)" "18 USC § 23"
    .Incorporates .InTitle
    "As used in this title, except where otherwise expressly provided the term \"court of the United States\" includes …"






def edge_23_exceptAsProvided_openTitle18 : Ref :=
  mkRef "18 USC § 23" "18 USC (any provision expressly providing otherwise)"
    .ExceptAsProvided .Open
    "except where otherwise expressly provided"





def edge_24_definesForTitle18 : Ref :=
  mkRef "18 USC (title 18, any provision using the term)" "18 USC § 24"
    .Incorporates .InTitle
    "As used in this title, the term \"Federal health care offense\" means a violation of, or a criminal conspiracy to violate—"

private def s24a1 (tgt : String) : Ref :=
  mkRef "18 USC § 24(a)(1)" tgt .Incorporates .InTitle
    "section 669, 1035, 1347, or 1518 of this title"

def refs_24_a1_inTitle : List Ref :=
  [ s24a1 "18 USC § 669", s24a1 "18 USC § 1035",
    s24a1 "18 USC § 1347", s24a1 "18 USC § 1518" ]

def edge_24_a1_incorporates_ssa1128B : Ref :=
  mkRef "18 USC § 24(a)(1)" "42 USC § 1320a–7b (Social Security Act § 1128B)"
    .Incorporates .ExternalAct
    "or section 1128B of the Social Security Act (42 U.S.C. 1320a–7b)"

private def s24a2 (tgt : String) : Ref :=
  mkRef "18 USC § 24(a)(2)" tgt .Incorporates .InTitle
    "section 287, 371, 664, 666, 1001, 1027, 1341, 1343, 1349, or 1954 of this title"

def refs_24_a2_inTitle : List Ref :=
  [ s24a2 "18 USC § 287", s24a2 "18 USC § 371", s24a2 "18 USC § 664",
    s24a2 "18 USC § 666", s24a2 "18 USC § 1001", s24a2 "18 USC § 1027",
    s24a2 "18 USC § 1341", s24a2 "18 USC § 1343", s24a2 "18 USC § 1349",
    s24a2 "18 USC § 1954" ]

def edge_24_a2_incorporates_fdca301 : Ref :=
  mkRef "18 USC § 24(a)(2)" "21 USC § 331 (Federal Food, Drug, and Cosmetic Act § 301)"
    .Incorporates .ExternalAct
    "section 301 of the Federal Food, Drug, and Cosmetic Act (21 U.S.C. 331)"

def edge_24_a2_incorporates_erisa501 : Ref :=
  mkRef "18 USC § 24(a)(2)" "29 USC § 1131 (Employee Retirement Income Security Act of 1974 § 501)"
    .Incorporates .ExternalAct
    "section 501 of the Employee Retirement Income Security Act of 1974 (29 U.S.C. 1131)"



def edge_24_a2_incorporates_erisa411_518_511 : Ref :=
  mkRef "18 USC § 24(a)(2)"
    "Employee Retirement Income Security Act of 1974 §§ 411, 518, 511 (29 USC §§ 1111, 1148, 1141)"
    .Incorporates .ExternalAct
    "or section 411, 518, or 511 of the Employee Retirement Income Security Act of 1974,,"

def edge_24_a2_subjectTo_healthCareNexus : Ref :=
  mkRef "18 USC § 24(a)(2)" "18 USC § 24(b)"
    .SubjectTo .Internal
    "if the violation or conspiracy relates to a health care benefit program"

def edge_24_b_definesForTitle18 : Ref :=
  mkRef "18 USC (title 18, any provision using the term)" "18 USC § 24(b)"
    .Incorporates .InTitle
    "As used in this title, the term \"health care benefit program\" means …"



def edge_1028_a_subjectTo_c : Ref :=
  mkRef "18 USC § 1028(a)" "18 USC § 1028(c)" .SubjectTo .Internal
    "Whoever, in a circumstance described in subsection (c) of this section—"

def edge_1028_a_subjectTo_b : Ref :=
  mkRef "18 USC § 1028(a)" "18 USC § 1028(b)" .SubjectTo .Internal
    "shall be punished as provided in subsection (b) of this section"

def edge_1028_b1_exceptAsProvided_b3b4 : Ref :=
  mkRef "18 USC § 1028(b)(1)" "18 USC § 1028(b)(3), (b)(4)" .ExceptAsProvided .Internal
    "except as provided in paragraphs (3) and (4)"

def edge_1028_b2_exceptAsProvided_b3b4 : Ref :=
  mkRef "18 USC § 1028(b)(2)" "18 USC § 1028(b)(3), (b)(4)" .ExceptAsProvided .Internal
    "except as provided in paragraphs (3) and (4)"

def edge_1028_b3A_incorporates_s929a2 : Ref :=
  mkRef "18 USC § 1028(b)(3)(A)" "18 USC § 929(a)(2)" .Incorporates .InTitle
    "to facilitate a drug trafficking crime (as defined in section 929(a)(2))"

def edge_1028_b3B_incorporates_s924c3 : Ref :=
  mkRef "18 USC § 1028(b)(3)(B)" "18 USC § 924(c)(3)" .Incorporates .InTitle
    "in connection with a crime of violence (as defined in section 924(c)(3))"

def refs_1028_b4_terrorism : List Ref :=
  [ mkRef "18 USC § 1028(b)(4)" "18 USC § 2331(5)" .Incorporates .InTitle
      "an act of domestic terrorism (as defined under section 2331(5) of this title)",
    mkRef "18 USC § 1028(b)(4)" "18 USC § 2331(1)" .Incorporates .InTitle
      "an act of international terrorism (as defined in section 2331(1) of this title)" ]


def edge_1028_d7D_incorporates_1029e : Ref :=
  mkRef "18 USC § 1028(d)(7)(D)" "18 USC § 1029(e)" .Incorporates .InTitle
    "telecommunication identifying information or access device (as defined in section 1029(e))"


def edge_1028A_incorporates_1028d : Ref :=
  mkRef "18 USC § 1028A" "18 USC § 1028(d)" .Incorporates .InTitle
    "In this section and section 1028A—"

def edge_1028_a2_incorporates_s21a : Ref :=
  mkRef "18 USC § 1028(a)(2)" "18 USC § 21(a)" .Incorporates .InTitle
    "knowing that such document or feature was stolen or produced without lawful authority"

def edge_1028_a6_incorporates_s21a : Ref :=
  mkRef "18 USC § 1028(a)(6)" "18 USC § 21(a)" .Incorporates .InTitle
    "which is stolen or produced without lawful authority knowing that such document or feature was stolen"

def edge_1028_e_exceptAsProvided_ch224 : Ref :=
  mkRef "18 USC § 1028(e)" "18 USC ch. 224 (§§ 3521 et seq.)" .ExceptAsProvided .InTitle
    "or any activity authorized under chapter 224 of this title"

def edge_1028_e_savings_lawEnforcement : Ref :=
  mkRef "18 USC § 1028(e)"
    "lawfully authorized investigative, protective, or intelligence activity of a law enforcement or intelligence agency"
    .Savings .Open
    "This section does not prohibit any lawfully authorized investigative, protective, or intelligence activity …"

def edge_1028_f_subjectTo_a : Ref :=
  mkRef "18 USC § 1028(f)" "18 USC § 1028(a)" .SubjectTo .Internal
    "Any person who attempts or conspires to commit any offense under this section shall be subject to the same penalties …"

def edge_1028_g_incorporates_cdapca413 : Ref :=
  mkRef "18 USC § 1028(g)"
    "21 USC § 853 (Comprehensive Drug Abuse Prevention and Control Act of 1970 § 413)"
    .Incorporates .ExternalAct
    "shall be governed by the provisions of section 413 … of the Comprehensive Drug Abuse Prevention and Control Act of 1970 (21 U.S.C. 853)"

def edge_1028_g_exceptAsProvided_853d : Ref :=
  mkRef "18 USC § 1028(g)" "21 USC § 853(d)" .ExceptAsProvided .CrossTitle
    "(other than subsection (d) of that section)"

def edge_1028_i_incorporates_a7 : Ref :=
  mkRef "18 USC § 1028(i)" "18 USC § 1028(a)(7)" .Incorporates .Internal
    "For purpose of subsection (a)(7), a single identification document … shall be construed to be 1 means of identification."



def edge_1029_a_subjectTo_c : Ref :=
  mkRef "18 USC § 1029(a)" "18 USC § 1029(c)" .SubjectTo .Internal
    "shall, if the offense affects interstate or foreign commerce, be punished as provided in subsection (c) of this section"

def edge_1029_b1_subjectTo_a : Ref :=
  mkRef "18 USC § 1029(b)(1)" "18 USC § 1029(a)" .SubjectTo .Internal
    "Whoever attempts to commit an offense under subsection (a) of this section shall be subject to the same penalties …"

def edge_1029_b2_subjectTo_c : Ref :=
  mkRef "18 USC § 1029(b)(2)" "18 USC § 1029(c)" .SubjectTo .Internal
    "not greater than the amount provided as the maximum fine for such offense under subsection (c) of this section"

def edge_1029_c2_incorporates_csa413 : Ref :=
  mkRef "18 USC § 1029(c)(2)" "21 USC § 853 (Controlled Substances Act § 413)"
    .Incorporates .ExternalAct
    "shall be governed by section 413 of the Controlled Substances Act"

def edge_1029_c2_exceptAsProvided_853d : Ref :=
  mkRef "18 USC § 1029(c)(2)" "21 USC § 853(d)" .ExceptAsProvided .CrossTitle
    "except for subsection (d) of that section"

def edge_1029_d_savings_otherAgencies : Ref :=
  mkRef "18 USC § 1029(d)" "the investigative authority of any other agency over offenses under this section"
    .Savings .Open
    "The United States Secret Service shall, in addition to any other agency having such authority, have the authority to investigate offenses under this section."


def edge_1029_e7_incorporates_s20 : Ref :=
  mkRef "18 USC § 1029(e)(7)" "18 USC § 20" .Incorporates .InTitle
    "the term \"credit card system member\" means a financial institution or other entity that is a member of a credit card system"


def edge_1029_h_incorporates_s20 : Ref :=
  mkRef "18 USC § 1029(h)" "18 USC § 20" .Incorporates .InTitle
    "if the offense involves an access device issued, owned, managed, or controlled by a financial institution …"

def edge_1029_e8_incorporates_ch119 : Ref :=
  mkRef "18 USC § 1029(e)(8)" "18 USC ch. 119 (§§ 2510 et seq.)" .Incorporates .InTitle
    "can be used to intercept a wire or electronic communication in violation of chapter 119"

def refs_1029_e_communicationsAct : List Ref :=
  [ mkRef "18 USC § 1029(e)(9)" "47 USC § 153 (Communications Act of 1934, title I, § 3)"
      .Incorporates .ExternalAct
      "the term \"telecommunications service\" has the meaning given such term in section 3 of title I of the Communications Act of 1934 (47 U.S.C. 153)",
    mkRef "18 USC § 1029(e)(10)" "47 USC §§ 301 et seq. (Communications Act of 1934, title III)"
      .Incorporates .ExternalAct
      "holds an operating license issued by the Federal Communications Commission under the authority of title III of the Communications Act of 1934" ]

def edge_1029_f_exceptAsProvided_ch224 : Ref :=
  mkRef "18 USC § 1029(f)" "18 USC ch. 224 (§§ 3521 et seq.)" .ExceptAsProvided .InTitle
    "or any activity authorized under chapter 224 of this title"

def edge_1029_f_savings_lawEnforcement : Ref :=
  mkRef "18 USC § 1029(f)"
    "lawfully authorized investigative, protective, or intelligence activity of a law enforcement or intelligence agency"
    .Savings .Open
    "This section does not prohibit any lawfully authorized investigative, protective, or intelligence activity …"

def edge_1029_g1_exceptAsProvided_a9 : Ref :=
  mkRef "18 USC § 1029(g)(1)" "18 USC § 1029(a)(9)" .ExceptAsProvided .Internal
    "It is not a violation of subsection (a)(9) for an officer, employee, or agent of … a facilities-based carrier …"

def edge_1029_g2_exceptAsProvided_a9 : Ref :=
  mkRef "18 USC § 1029(g)(2)" "18 USC § 1029(a)(9)" .ExceptAsProvided .Internal
    "it is an affirmative defense (which the defendant must establish by a preponderance of the evidence) that the conduct charged was engaged in for research or development …"








def edge_lexspec_1029e4_produce_over_1028d9 : Ref :=
  mkRef "18 USC § 1029(e)(4)" "18 USC § 1028(d)(9)" .LexSpecialis .InTitle
    "As used in this section— … the term \"produce\" includes design, alter, authenticate, duplicate, or assemble"

def edge_lexspec_1029e5_traffic_over_1028d12 : Ref :=
  mkRef "18 USC § 1029(e)(5)" "18 USC § 1028(d)(12)" .LexSpecialis .InTitle
    "As used in this section— … the term \"traffic\" means transfer, or otherwise dispose of, to another …"

def edge_lexspec_1029f_state_over_1028d11 : Ref :=
  mkRef "18 USC § 1029(f)" "18 USC § 1028(d)(11)" .LexSpecialis .InTitle
    "For purposes of this subsection, the term \"State\" includes a State of the United States, the District of Columbia, …"


def refs_ch1_titleWideDefinitions : List Ref :=
  [ edge_7_definesForTitle18, edge_20_definesForTitle18,
    edge_21_a_suppliesTitle18StolenElement, edge_23_definesForTitle18,
    edge_24_definesForTitle18 ]






structure Section7IncorporationsResolve (c : ComplaintText) : Prop where
  titleScope        : DefinitionScopeSatisfied edge_7_definesForTitle18 c
  inaNationalityDef : CrossTitleReferenceResolves edge_7_9_incorporates_ina101 c
  spaceTreaty       : CrossTitleReferenceResolves edge_7_6_incorporates_outerSpaceTreaty c
  spaceRegistration : CrossTitleReferenceResolves edge_7_6_incorporates_registrationConvention c
  treatySavings     : SavingsClausePreserves edge_7_9_savings_treaties c
  mejaCarveOutKnown : ReferencedSectionExists edge_7_9_exceptAsProvided_3261a c
  mejaCarveOutClear : ¬ ExceptionApplies edge_7_9_exceptAsProvided_3261a c




structure Section20IncorporationsResolve (c : ComplaintText) : Prop where
  titleScope           : DefinitionScopeSatisfied edge_20_definesForTitle18 c
  insuredDepository    : CrossTitleReferenceResolves edge_20_1_incorporates_fdia3c2 c
  homeLoanBankMember   : CrossTitleReferenceResolves edge_20_3_incorporates_fhlba2 c
  farmCreditInstitution: CrossTitleReferenceResolves edge_20_4_incorporates_farmCredit535 c
  sbic                 : CrossTitleReferenceResolves edge_20_5_incorporates_sbia103 c
  holdingCompany       : CrossTitleReferenceResolves edge_20_6_incorporates_fdia3w1 c
  edgeActOrganization  : CrossTitleReferenceResolves edge_20_8_incorporates_fra25 c
  foreignBankBranch    : CrossTitleReferenceResolves edge_20_9_incorporates_iba1b c
  mortgageLendingDef   : IncorporationHonored edge_20_10_incorporates_s27 c
  respaMortgageLoan    : CrossTitleReferenceResolves edge_20_10_incorporates_respa3 c




structure Coherent21 (c : ComplaintText) : Prop where
  titleWideElementSupply     : DefinitionScopeSatisfied edge_21_a_suppliesTitle18StolenElement c
  lawEnforcementOfficerDef   : ReferencedSectionExists edge_21_b_incorporates_s115 c
  lawEnforcementOfficerUsed  : IncorporationHonored edge_21_b_incorporates_s115 c





inductive Section23DefinitionControls (c : ComplaintText) : Prop
  | general      : ¬ OverrideTriggered edge_23_exceptAsProvided_openTitle18 c →
                   Section23DefinitionControls c
  | expressOverride : OverrideTriggered edge_23_exceptAsProvided_openTitle18 c →
                   ReferencedSectionExists edge_23_exceptAsProvided_openTitle18 c →
                   Section23DefinitionControls c



structure Section23IncorporationsResolve (c : ComplaintText) : Prop where
  titleScope : DefinitionScopeSatisfied edge_23_definesForTitle18 c
  controls   : Section23DefinitionControls c




structure Section24IncorporationsResolve (c : ComplaintText) : Prop where
  titleScope          : DefinitionScopeSatisfied edge_24_definesForTitle18 c
  inTitlePredicates1  : AllReferencedSectionsExist refs_24_a1_inTitle c
  antiKickback        : CrossTitleReferenceResolves edge_24_a1_incorporates_ssa1128B c
  inTitlePredicates2  : AllReferencedSectionsExist refs_24_a2_inTitle c
  fdcaProhibitedActs  : CrossTitleReferenceResolves edge_24_a2_incorporates_fdca301 c
  erisaFalseStatement : CrossTitleReferenceResolves edge_24_a2_incorporates_erisa501 c
  erisaOther          : CrossTitleReferenceResolves edge_24_a2_incorporates_erisa411_518_511 c
  healthCareNexus     : DefinitionScopeSatisfied edge_24_a2_subjectTo_healthCareNexus c
  benefitProgramScope : DefinitionScopeSatisfied edge_24_b_definesForTitle18 c










structure Coherent1028 (c : ComplaintText) : Prop where
  circumstanceClause      : ReferencedSectionExists edge_1028_a_subjectTo_c c
  penaltyClause           : ReferencedSectionExists edge_1028_a_subjectTo_b c
  penaltyExceptionsHonored1 : ExceptionHonored edge_1028_b1_exceptAsProvided_b3b4 c
  penaltyExceptionsHonored2 : ExceptionHonored edge_1028_b2_exceptAsProvided_b3b4 c
  drugTraffickingDef      : ReferencedSectionExists edge_1028_b3A_incorporates_s929a2 c
  crimeOfViolenceDef      : ReferencedSectionExists edge_1028_b3B_incorporates_s924c3 c
  terrorismDefs           : AllReferencedSectionsExist refs_1028_b4_terrorism c
  accessDeviceDef         : IncorporationHonored edge_1028_d7D_incorporates_1029e c
  suppliesDefsTo1028A     : DefinitionScopeSatisfied edge_1028A_incorporates_1028d c
  stolenNatureRule2       : IncorporationHonored edge_1028_a2_incorporates_s21a c
  stolenNatureRule6       : IncorporationHonored edge_1028_a6_incorporates_s21a c
  attemptConspiracyParity : ReferencedSectionExists edge_1028_f_subjectTo_a c
  forfeitureRegime        : CrossTitleReferenceResolves edge_1028_g_incorporates_cdapca413 c
  forfeitureCarveOut      : ExceptionHonored edge_1028_g_exceptAsProvided_853d c
  meansCountingRule       : DefinitionScopeSatisfied edge_1028_i_incorporates_a7 c
  lawEnforcementSavings   : SavingsClausePreserves edge_1028_e_savings_lawEnforcement c
  lawEnforcementCarveOut  : ¬ ExceptionApplies edge_1028_e_exceptAsProvided_ch224 c




inductive Section1029a9DefenseRoute (c : ComplaintText) : Prop
  | carrierProtection   : ExceptionApplies edge_1029_g1_exceptAsProvided_a9 c →
                          Section1029a9DefenseRoute c
  | researchDevelopment : ExceptionApplies edge_1029_g2_exceptAsProvided_a9 c →
                          Section1029a9DefenseRoute c






structure Coherent1029 (c : ComplaintText) : Prop where
  penaltyClause          : ReferencedSectionExists edge_1029_a_subjectTo_c c
  attemptParity          : ReferencedSectionExists edge_1029_b1_subjectTo_a c
  conspiracyPenaltyRef   : ReferencedSectionExists edge_1029_b2_subjectTo_c c
  forfeitureRegime       : CrossTitleReferenceResolves edge_1029_c2_incorporates_csa413 c
  forfeitureCarveOut     : ExceptionHonored edge_1029_c2_exceptAsProvided_853d c
  secretServiceSavings   : SavingsClausePreserves edge_1029_d_savings_otherAgencies c
  creditCardMemberDef    : IncorporationHonored edge_1029_e7_incorporates_s20 c
  extraterritorialFiDef  : IncorporationHonored edge_1029_h_incorporates_s20 c
  wiretapChapter         : ReferencedSectionExists edge_1029_e8_incorporates_ch119 c
  communicationsAct      : AllReferencedSectionsExist refs_1029_e_communicationsAct c
  lawEnforcementSavings  : SavingsClausePreserves edge_1029_f_savings_lawEnforcement c
  lawEnforcementCarveOut : ¬ ExceptionApplies edge_1029_f_exceptAsProvided_ch224 c










structure SliceEditorialDefects : Prop where
  fra25aReferencesInText : SourceTextEditoriallyDefective edge_20_8_incorporates_fra25
  s23MissingComma        : SourceTextEditoriallyDefective edge_23_exceptAsProvided_openTitle18
  s24aDoubledComma       : SourceTextEditoriallyDefective edge_24_a2_incorporates_erisa411_518_511




structure SliceDefinitionalCoherence (c : ComplaintText) : Prop where
  titleWideDefinitionsStand : AllReferencedSectionsExist refs_ch1_titleWideDefinitions c
  produceScoped             : DefinitionScopeSatisfied edge_lexspec_1029e4_produce_over_1028d9 c
  trafficScoped             : DefinitionScopeSatisfied edge_lexspec_1029e5_traffic_over_1028d12 c
  stateScoped               : DefinitionScopeSatisfied edge_lexspec_1029f_state_over_1028d11 c

end Proving.USC.T18.Ch1Ch47.Recert.Structure
