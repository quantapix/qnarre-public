















import Proving.USC.Common.Types
import Proving.USC.T42.EqualRights.Recert.Structure.Types
import Proving.USC.T42.EqualRights.Recert.Structure.Predicates

set_option autoImplicit false

namespace Proving.USC.T42.EqualRights.Recert.Structure

open Proving.USC.Common






def ref1981ContractDefinition : Ref :=
  { source := "42 USC § 1981(a)", target := "42 USC § 1981(b)", kind := .Incorporates }



def ref1981ScopeClause : Ref :=
  { source := "42 USC § 1981(c)", target := "42 USC § 1981(a)", kind := .Incorporates }





def ref1981aToTitleVIIEnforcement : Ref :=
  { source := "42 USC § 1981a(a)(1)", target := "42 USC § 2000e-5", kind := .Incorporates }


def ref1981aToTitleVIIFederalSector : Ref :=
  { source := "42 USC § 1981a(a)(1)", target := "42 USC § 2000e-16", kind := .Incorporates }



def ref1981aToTitleVIIProhibitions : Ref :=
  { source := "42 USC § 1981a(a)(1)", target := "42 USC § 2000e-2", kind := .Incorporates }



def ref1981aToTitleVIIRetaliation : Ref :=
  { source := "42 USC § 1981a(a)(1)", target := "42 USC § 2000e-3", kind := .Incorporates }




def ref1981aSubordinateToSection1981 : Ref :=
  { source := "42 USC § 1981a(a)(1)", target := "42 USC § 1981", kind := .SubjectTo }



def ref1981aToTitleVIIRelief : Ref :=
  { source := "42 USC § 1981a(a)(1)", target := "42 USC § 2000e-5(g)", kind := .Incorporates }



def ref1981aDamagesCap : Ref :=
  { source := "42 USC § 1981a(a)", target := "42 USC § 1981a(b)(3)", kind := .SubjectTo }




def ref1981aToAdaEnforcement : Ref :=
  { source := "42 USC § 1981a(a)(2)", target := "42 USC § 12117(a)", kind := .Incorporates }



def ref1981aToRehabActRemedies : Ref :=
  { source := "42 USC § 1981a(a)(2)", target := "29 USC § 794a(a)(1)", kind := .Incorporates }




def ref1981aToRehabActSection791 : Ref :=
  { source := "42 USC § 1981a(a)(2)", target := "29 USC § 791", kind := .Incorporates }



def ref1981aToAdaTitleIProhibition : Ref :=
  { source := "42 USC § 1981a(a)(2)", target := "42 USC § 12112", kind := .Incorporates }



def ref1981aToAdaAccommodation : Ref :=
  { source := "42 USC § 1981a(a)(2)", target := "42 USC § 12112(b)(5)", kind := .Incorporates }




def ref1981aGoodFaithCarve : Ref :=
  { source := "42 USC § 1981a(a)(2)", target := "42 USC § 1981a(a)(3)", kind := .ExceptAsProvided }




def ref1981aBackpayExclusion : Ref :=
  { source := "42 USC § 1981a(b)(2)", target := "42 USC § 2000e-5(g)", kind := .Incorporates }




def ref1981aSavingsForSection1981 : Ref :=
  { source := "42 USC § 1981a(b)(4)", target := "42 USC § 1981", kind := .Savings }



def ref1981aJuryBlindToCap : Ref :=
  { source := "42 USC § 1981a(c)(2)", target := "42 USC § 1981a(b)(3)", kind := .Incorporates }




def ref1981aComplainingPartyTitleVII : Ref :=
  { source := "42 USC § 1981a(d)(1)(A)", target := "42 USC § 2000e et seq.", kind := .Incorporates }



def ref1981aComplainingPartyAdaTitleI : Ref :=
  { source := "42 USC § 1981a(d)(1)(B)", target := "42 USC § 12111 et seq.", kind := .Incorporates }



def ref1981aDiscriminatoryPracticeDefinition : Ref :=
  { source := "42 USC § 1981a(d)(2)", target := "42 USC § 1981a(a)", kind := .Incorporates }







def ref1983ToConstitutionAndLaws : Ref :=
  { source := "42 USC § 1983"
  , target := "U.S. Const. and the laws of the United States"
  , kind := .Incorporates }






def ref1983JudicialOfficerProviso : Ref :=
  { source := "42 USC § 1983"
  , target := "42 USC § 1983 (judicial-officer proviso)"
  , kind := .ExceptAsProvided }




def ref1983DistrictOfColumbiaDeeming : Ref :=
  { source := "42 USC § 1983"
  , target := "Acts of Congress applicable exclusively to the District of Columbia"
  , kind := .Incorporates }









def ref1985Clause1ToRemedy : Ref :=
  { source := "42 USC § 1985(1)"
  , target := "42 USC § 1985(3) (remedial clause)"
  , kind := .Incorporates }


def ref1985Clause2ToRemedy : Ref :=
  { source := "42 USC § 1985(2)"
  , target := "42 USC § 1985(3) (remedial clause)"
  , kind := .Incorporates }


def ref1985Clause3ToRemedy : Ref :=
  { source := "42 USC § 1985(3)"
  , target := "42 USC § 1985(3) (remedial clause)"
  , kind := .Incorporates }






def ref1986ToSection1985 : Ref :=
  { source := "42 USC § 1986", target := "42 USC § 1985", kind := .Incorporates }




def ref1986OneYearLimitation : Ref :=
  { source := "42 USC § 1986"
  , target := "42 USC § 1986 (one-year proviso)"
  , kind := .SubjectTo }




def ref1986LimitationDisplacesBorrowing : Ref :=
  { source := "42 USC § 1986", target := "42 USC § 1988(a)", kind := .LexSpecialis }







def ref1988aToRevisedStatutes : Ref :=
  { source := "42 USC § 1988(a)"
  , target := "R.S. titles 13, 24, 70 (uncodified)"
  , kind := .Incorporates }




def ref1988aToFederalLaw : Ref :=
  { source := "42 USC § 1988(a)"
  , target := "the laws of the United States"
  , kind := .Incorporates }




def ref1988aToStateCommonLaw : Ref :=
  { source := "42 USC § 1988(a)"
  , target := "State common law as modified by State constitution and statutes"
  , kind := .ExceptAsProvided }



def ref1988aStateLawConsistencyFloor : Ref :=
  { source := "42 USC § 1988(a)"
  , target := "the Constitution and laws of the United States"
  , kind := .SubjectTo }


def ref1988bFeesToSection1981 : Ref :=
  { source := "42 USC § 1988(b)", target := "42 USC § 1981", kind := .Incorporates }


def ref1988bFeesToSection1981a : Ref :=
  { source := "42 USC § 1988(b)", target := "42 USC § 1981a", kind := .Incorporates }



def ref1988bFeesToSection1982 : Ref :=
  { source := "42 USC § 1988(b)", target := "42 USC § 1982", kind := .Incorporates }


def ref1988bFeesToSection1983 : Ref :=
  { source := "42 USC § 1988(b)", target := "42 USC § 1983", kind := .Incorporates }


def ref1988bFeesToSection1985 : Ref :=
  { source := "42 USC § 1988(b)", target := "42 USC § 1985", kind := .Incorporates }


def ref1988bFeesToSection1986 : Ref :=
  { source := "42 USC § 1988(b)", target := "42 USC § 1986", kind := .Incorporates }



def ref1988bFeesToTitleIx : Ref :=
  { source := "42 USC § 1988(b)", target := "20 USC § 1681 et seq.", kind := .Incorporates }



def ref1988bFeesToRfra : Ref :=
  { source := "42 USC § 1988(b)", target := "42 USC § 2000bb et seq.", kind := .Incorporates }



def ref1988bFeesToRluipa : Ref :=
  { source := "42 USC § 1988(b)", target := "42 USC § 2000cc et seq.", kind := .Incorporates }



def ref1988bFeesToTitleVi : Ref :=
  { source := "42 USC § 1988(b)", target := "42 USC § 2000d et seq.", kind := .Incorporates }


def ref1988bFeesToSection12361Title34 : Ref :=
  { source := "42 USC § 1988(b)", target := "34 USC § 12361", kind := .Incorporates }




def ref1988bJudicialOfficerProviso : Ref :=
  { source := "42 USC § 1988(b)"
  , target := "42 USC § 1988(b) (judicial-officer proviso)"
  , kind := .ExceptAsProvided }







def ref1988bProvisoParallelsSection1983 : Ref :=
  { source := "42 USC § 1988(b) (judicial-officer proviso)"
  , target := "42 USC § 1983 (judicial-officer proviso)"
  , kind := .LexSpecialis }


def ref1988cToSubsectionB : Ref :=
  { source := "42 USC § 1988(c)", target := "42 USC § 1988(b)", kind := .Incorporates }


def ref1988cExpertFeesSection1981 : Ref :=
  { source := "42 USC § 1988(c)", target := "42 USC § 1981", kind := .Incorporates }





def ref1988cExpertFeesSection1981a : Ref :=
  { source := "42 USC § 1988(c)", target := "42 USC § 1981a", kind := .Incorporates }








inductive Section1985RemedyRoute (c : ComplaintText) : Prop where
  | viaClause1 (h : IncorporationHonored ref1985Clause1ToRemedy c) : Section1985RemedyRoute c
  | viaClause2 (h : IncorporationHonored ref1985Clause2ToRemedy c) : Section1985RemedyRoute c
  | viaClause3 (h : IncorporationHonored ref1985Clause3ToRemedy c) : Section1985RemedyRoute c





inductive Section1988aGoverningLaw (c : ComplaintText) : Prop where
  | federalLawSuitable
      (hExists   : ReferencedSectionExists ref1988aToFederalLaw c)
      (hSuitable : BorrowedLawSuitable ref1988aToFederalLaw c)
      : Section1988aGoverningLaw c
  | stateLawGapFiller
      (hDeficient  : ExceptionApplies ref1988aToStateCommonLaw c)
      (hConsistent : BorrowedLawNotInconsistent ref1988aStateLawConsistencyFloor c)
      : Section1988aGoverningLaw c




structure Coherent1981 (c : ComplaintText) : Prop where
  contractTermGoverns : InternalDefinitionGoverns ref1981ContractDefinition c
  scopeClauseHonored  : IncorporationHonored ref1981ScopeClause c
  feeChannelExists    : ReferencedSectionExists ref1988bFeesToSection1981 c
  expertFeeChannel    : SectionEnumeratedInReferenceList ref1988cExpertFeesSection1981 c




structure Coherent1981a (c : ComplaintText) : Prop where
  titleVIIEnforcementExists   : ReferencedSectionExists ref1981aToTitleVIIEnforcement c
  titleVIIProhibitionsHonored : IncorporationHonored ref1981aToTitleVIIProhibitions c
  titleVIIReliefHonored       : IncorporationHonored ref1981aToTitleVIIRelief c
  section1981ProvisoRespected : ConstraintFromReferencedSectionRespected ref1981aSubordinateToSection1981 c
  capRespected                : ConstraintFromReferencedSectionRespected ref1981aDamagesCap c
  goodFaithCarveHonored       : ExceptionHonored ref1981aGoodFaithCarve c
  savingsForSection1981       : SavingsClausePreserves ref1981aSavingsForSection1981 c
  crossTitleRehabResolves     : CrossTitleReferenceResolves ref1981aToRehabActRemedies c
  complainingPartyDefined     : InternalDefinitionGoverns ref1981aComplainingPartyTitleVII c
  practiceDefined             : InternalDefinitionGoverns ref1981aDiscriminatoryPracticeDefinition c
  feeChannelExists            : ReferencedSectionExists ref1988bFeesToSection1981a c
  expertFeeChannel            : SectionEnumeratedInReferenceList ref1988cExpertFeesSection1981a c



structure Coherent1982 (c : ComplaintText) : Prop where
  feeChannelExists    : ReferencedSectionExists ref1988bFeesToSection1982 c
  enumeratedInFeeList : SectionEnumeratedInReferenceList ref1988bFeesToSection1982 c




structure Coherent1983 (c : ComplaintText) : Prop where
  federalRightAnchored        : OpenEndedIncorporationAnchored ref1983ToConstitutionAndLaws c
  judicialOfficerCarveHonored : ExceptionHonored ref1983JudicialOfficerProviso c
  districtOfColumbiaDeeming   : InternalDefinitionGoverns ref1983DistrictOfColumbiaDeeming c
  feeChannelExists            : ReferencedSectionExists ref1988bFeesToSection1983 c




structure Coherent1985 (c : ComplaintText) : Prop where
  remedyRoute      : Section1985RemedyRoute c
  feeChannelExists : ReferencedSectionExists ref1988bFeesToSection1985 c





structure Coherent1986 (c : ComplaintText) : Prop where
  antecedentWrongEstablished : AntecedentSectionSatisfied ref1986ToSection1985 c
  incorporationOf1985Honored : IncorporationHonored ref1986ToSection1985 c
  oneYearProvisoRespected    : ConstraintFromReferencedSectionRespected ref1986OneYearLimitation c
  displacesBorrowedPeriod    : OverrideTriggered ref1986LimitationDisplacesBorrowing c
  feeChannelExists           : ReferencedSectionExists ref1988bFeesToSection1986 c







structure Section1988IncorporationsResolve (c : ComplaintText) : Prop where
  revisedStatutesAnchored     : OpenEndedIncorporationAnchored ref1988aToRevisedStatutes c
  governingLaw                : Section1988aGoverningLaw c
  feeListSection1981          : SectionEnumeratedInReferenceList ref1988bFeesToSection1981 c
  feeListSection1981a         : SectionEnumeratedInReferenceList ref1988bFeesToSection1981a c
  feeListSection1982          : SectionEnumeratedInReferenceList ref1988bFeesToSection1982 c
  feeListSection1983          : SectionEnumeratedInReferenceList ref1988bFeesToSection1983 c
  feeListSection1985          : SectionEnumeratedInReferenceList ref1988bFeesToSection1985 c
  feeListSection1986          : SectionEnumeratedInReferenceList ref1988bFeesToSection1986 c
  titleIxResolves             : CrossTitleReferenceResolves ref1988bFeesToTitleIx c
  section12361Resolves        : CrossTitleReferenceResolves ref1988bFeesToSection12361Title34 c
  rfraResolves                : ReferencedSectionExists ref1988bFeesToRfra c
  rluipaResolves              : ReferencedSectionExists ref1988bFeesToRluipa c
  titleViResolves             : ReferencedSectionExists ref1988bFeesToTitleVi c
  judicialOfficerCarveHonored : ExceptionHonored ref1988bJudicialOfficerProviso c
  expertFeesTrackSubsectionB  : IncorporationHonored ref1988cToSubsectionB c





structure Chapter21EqualRightsCoherent (c : ComplaintText) : Prop where
  section1981  : Coherent1981 c
  section1981a : Coherent1981a c
  section1982  : Coherent1982 c
  section1983  : Coherent1983 c
  section1985  : Coherent1985 c
  section1986  : Coherent1986 c
  section1988  : Section1988IncorporationsResolve c

end Proving.USC.T42.EqualRights.Recert.Structure
