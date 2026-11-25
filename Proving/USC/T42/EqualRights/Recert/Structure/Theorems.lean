








import Proving.USC.Common.Types
import Proving.USC.T42.EqualRights.Recert.Structure.Types
import Proving.USC.T42.EqualRights.Recert.Structure.Predicates
import Proving.USC.T42.EqualRights.Recert.Structure.Statute

set_option autoImplicit false

namespace Proving.USC.T42.EqualRights.Recert.Structure

open Proving.USC.Common




theorem section1985RemedyRoute_viaClause1_intro {c : ComplaintText}
    (h : IncorporationHonored ref1985Clause1ToRemedy c) : Section1985RemedyRoute c :=
  .viaClause1 h


theorem section1985RemedyRoute_viaClause2_intro {c : ComplaintText}
    (h : IncorporationHonored ref1985Clause2ToRemedy c) : Section1985RemedyRoute c :=
  .viaClause2 h


theorem section1985RemedyRoute_viaClause3_intro {c : ComplaintText}
    (h : IncorporationHonored ref1985Clause3ToRemedy c) : Section1985RemedyRoute c :=
  .viaClause3 h


theorem section1988aGoverningLaw_federalLawSuitable_intro {c : ComplaintText}
    (hExists : ReferencedSectionExists ref1988aToFederalLaw c)
    (hSuitable : BorrowedLawSuitable ref1988aToFederalLaw c)
    : Section1988aGoverningLaw c :=
  .federalLawSuitable hExists hSuitable




theorem section1988aGoverningLaw_stateLawGapFiller_intro {c : ComplaintText}
    (hDeficient : ExceptionApplies ref1988aToStateCommonLaw c)
    (hConsistent : BorrowedLawNotInconsistent ref1988aStateLawConsistencyFloor c)
    : Section1988aGoverningLaw c :=
  .stateLawGapFiller hDeficient hConsistent




theorem coherent1981_intro {c : ComplaintText}
    (hDef : InternalDefinitionGoverns ref1981ContractDefinition c)
    (hScope : IncorporationHonored ref1981ScopeClause c)
    (hFee : ReferencedSectionExists ref1988bFeesToSection1981 c)
    (hExpert : SectionEnumeratedInReferenceList ref1988cExpertFeesSection1981 c)
    : Coherent1981 c :=
  ⟨hDef, hScope, hFee, hExpert⟩


theorem coherent1981a_intro {c : ComplaintText}
    (hEnf : ReferencedSectionExists ref1981aToTitleVIIEnforcement c)
    (hProhib : IncorporationHonored ref1981aToTitleVIIProhibitions c)
    (hRelief : IncorporationHonored ref1981aToTitleVIIRelief c)
    (hProviso : ConstraintFromReferencedSectionRespected ref1981aSubordinateToSection1981 c)
    (hCap : ConstraintFromReferencedSectionRespected ref1981aDamagesCap c)
    (hGoodFaith : ExceptionHonored ref1981aGoodFaithCarve c)
    (hSavings : SavingsClausePreserves ref1981aSavingsForSection1981 c)
    (hRehab : CrossTitleReferenceResolves ref1981aToRehabActRemedies c)
    (hParty : InternalDefinitionGoverns ref1981aComplainingPartyTitleVII c)
    (hPractice : InternalDefinitionGoverns ref1981aDiscriminatoryPracticeDefinition c)
    (hFee : ReferencedSectionExists ref1988bFeesToSection1981a c)
    (hExpert : SectionEnumeratedInReferenceList ref1988cExpertFeesSection1981a c)
    : Coherent1981a c :=
  ⟨hEnf, hProhib, hRelief, hProviso, hCap, hGoodFaith, hSavings, hRehab, hParty, hPractice,
   hFee, hExpert⟩



theorem coherent1982_intro {c : ComplaintText}
    (hFee : ReferencedSectionExists ref1988bFeesToSection1982 c)
    (hEnum : SectionEnumeratedInReferenceList ref1988bFeesToSection1982 c)
    : Coherent1982 c :=
  ⟨hFee, hEnum⟩


theorem coherent1983_intro {c : ComplaintText}
    (hAnchor : OpenEndedIncorporationAnchored ref1983ToConstitutionAndLaws c)
    (hCarve : ExceptionHonored ref1983JudicialOfficerProviso c)
    (hDeem : InternalDefinitionGoverns ref1983DistrictOfColumbiaDeeming c)
    (hFee : ReferencedSectionExists ref1988bFeesToSection1983 c)
    : Coherent1983 c :=
  ⟨hAnchor, hCarve, hDeem, hFee⟩


theorem coherent1985_intro {c : ComplaintText}
    (hRoute : Section1985RemedyRoute c)
    (hFee : ReferencedSectionExists ref1988bFeesToSection1985 c)
    : Coherent1985 c :=
  ⟨hRoute, hFee⟩


theorem coherent1986_intro {c : ComplaintText}
    (hAntecedent : AntecedentSectionSatisfied ref1986ToSection1985 c)
    (hIncorp : IncorporationHonored ref1986ToSection1985 c)
    (hOneYear : ConstraintFromReferencedSectionRespected ref1986OneYearLimitation c)
    (hDisplace : OverrideTriggered ref1986LimitationDisplacesBorrowing c)
    (hFee : ReferencedSectionExists ref1988bFeesToSection1986 c)
    : Coherent1986 c :=
  ⟨hAntecedent, hIncorp, hOneYear, hDisplace, hFee⟩



theorem section1988IncorporationsResolve_intro {c : ComplaintText}
    (hRs : OpenEndedIncorporationAnchored ref1988aToRevisedStatutes c)
    (hGoverning : Section1988aGoverningLaw c)
    (hFee1981 : SectionEnumeratedInReferenceList ref1988bFeesToSection1981 c)
    (hFee1981a : SectionEnumeratedInReferenceList ref1988bFeesToSection1981a c)
    (hFee1982 : SectionEnumeratedInReferenceList ref1988bFeesToSection1982 c)
    (hFee1983 : SectionEnumeratedInReferenceList ref1988bFeesToSection1983 c)
    (hFee1985 : SectionEnumeratedInReferenceList ref1988bFeesToSection1985 c)
    (hFee1986 : SectionEnumeratedInReferenceList ref1988bFeesToSection1986 c)
    (hTitleIx : CrossTitleReferenceResolves ref1988bFeesToTitleIx c)
    (h12361 : CrossTitleReferenceResolves ref1988bFeesToSection12361Title34 c)
    (hRfra : ReferencedSectionExists ref1988bFeesToRfra c)
    (hRluipa : ReferencedSectionExists ref1988bFeesToRluipa c)
    (hTitleVi : ReferencedSectionExists ref1988bFeesToTitleVi c)
    (hCarve : ExceptionHonored ref1988bJudicialOfficerProviso c)
    (hExpert : IncorporationHonored ref1988cToSubsectionB c)
    : Section1988IncorporationsResolve c :=
  ⟨hRs, hGoverning, hFee1981, hFee1981a, hFee1982, hFee1983, hFee1985, hFee1986,
   hTitleIx, h12361, hRfra, hRluipa, hTitleVi, hCarve, hExpert⟩


theorem chapter21EqualRightsCoherent_intro {c : ComplaintText}
    (h1981 : Coherent1981 c)
    (h1981a : Coherent1981a c)
    (h1982 : Coherent1982 c)
    (h1983 : Coherent1983 c)
    (h1985 : Coherent1985 c)
    (h1986 : Coherent1986 c)
    (h1988 : Section1988IncorporationsResolve c)
    : Chapter21EqualRightsCoherent c :=
  ⟨h1981, h1981a, h1982, h1983, h1985, h1986, h1988⟩

end Proving.USC.T42.EqualRights.Recert.Structure
