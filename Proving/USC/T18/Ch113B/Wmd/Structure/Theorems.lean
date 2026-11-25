




import Proving.USC.Common.Types
import Proving.USC.T18.Ch113B.Wmd.Structure.Types
import Proving.USC.T18.Ch113B.Wmd.Structure.Predicates
import Proving.USC.T18.Ch113B.Wmd.Structure.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Structure

open Proving.USC.Common


theorem section2332aCIncorporationsResolve_intro {c : ComplaintText}
    (hNatEx : ReferencedSectionExists edge2332aC1IncorporatesIna101a22 c)
    (hNat : IncorporationHonored edge2332aC1IncorporatesIna101a22 c)
    (hDevEx : ReferencedSectionExists edge2332aC2AIncorporates921 c)
    (hDev : IncorporationHonored edge2332aC2AIncorporates921 c)
    (hBioEx : ReferencedSectionExists edge2332aC2CIncorporates178 c)
    (hBio : IncorporationHonored edge2332aC2CIncorporates178 c)
    (hScope : DefinitionScopeRespected edge2332aCScopedToSection c)
    : Section2332aCIncorporationsResolve c :=
  ⟨hNatEx, hNat, hDevEx, hDev, hBioEx, hBio, hScope⟩



theorem wmdTermResolutionPath_intro_via921 {c : ComplaintText}
    (h : IncorporationHonored edge2332aC2AIncorporates921 c)
    : WmdTermResolutionPath c :=
  WmdTermResolutionPath.viaDestructiveDevice921 h



theorem wmdTermResolutionPath_intro_via178 {c : ComplaintText}
    (h : IncorporationHonored edge2332aC2CIncorporates178 c)
    : WmdTermResolutionPath c :=
  WmdTermResolutionPath.viaBiologicalAgent178 h


theorem coherent2332a_intro {c : ComplaintText}
    (hDefs : Section2332aCIncorporationsResolve c)
    (hOperative : IncorporationHonored edge2332aAIncorporatesC c)
    (hExtraterritorial : IncorporationHonored edge2332aBIncorporatesC c)
    (hWmd : WmdTermResolutionPath c)
    : Coherent2332a c :=
  ⟨hDefs, hOperative, hExtraterritorial, hWmd⟩


theorem section2332bG5IncorporationsResolve_intro {c : ComplaintText}
    (hT18Ex : AllReferencedSectionsExist edges2332bG5BiTitle18 c)
    (hT18 : AllIncorporationsHonored edges2332bG5BiTitle18 c)
    (hAeaEx : AllReferencedSectionsExist edges2332bG5BiiTitle42 c)
    (hAea : AllIncorporationsHonored edges2332bG5BiiTitle42 c)
    (hT49Ex : AllReferencedSectionsExist edges2332bG5BiiiTitle49 c)
    (hT49 : AllIncorporationsHonored edges2332bG5BiiiTitle49 c)
    (hNarco : AllIncorporationsHonored edges2332bG5BivActCite c)
    (hScope : DefinitionScopeRespected edge2332bGScopedToSection c)
    : Section2332bG5IncorporationsResolve c :=
  ⟨hT18Ex, hT18, hAeaEx, hAea, hT49Ex, hT49, hNarco, hScope⟩


theorem section2332bFInvestigativeRosterResolves_intro {c : ComplaintText}
    (hRosterEx : AllReferencedSectionsExist edges2332bFInvestigativeRoster c)
    (hRoster : AllIncorporationsHonored edges2332bFInvestigativeRoster c)
    (hSecretService : SavingsClauseRespected edge2332bFSavings3056 c)
    (hOther : SavingsClauseRespected edge2332bFSavingsOtherAuthority c)
    : Section2332bFInvestigativeRosterResolves c :=
  ⟨hRosterEx, hRoster, hSecretService, hOther⟩


theorem section2332bJurisdictionPath_intro_direct {c : ComplaintText}
    (h : IncorporationHonored edge2332bE1IncorporatesA c)
    : Section2332bJurisdictionPath c :=
  Section2332bJurisdictionPath.directOffense h



theorem section2332bJurisdictionPath_intro_accessory {c : ComplaintText}
    (h : IncorporationHonored edge2332bE2IncorporatesS3 c)
    : Section2332bJurisdictionPath c :=
  Section2332bJurisdictionPath.accessoryUnderSection3 h


theorem section2332bDanglingReference_intro {c : ComplaintText}
    (h : ¬ ReferencedSectionExists edge2332bG3Incorporates1365g3 c)
    : Section2332bDanglingReference c :=
  ⟨h⟩


theorem coherent2332b_intro {c : ComplaintText}
    (hCirc : IncorporationHonored edge2332bA1IncorporatesB c)
    (hPunish : IncorporationHonored edge2332bA1IncorporatesC c)
    (hState : IncorporationHonored edge2332bA1IncorporatesStateLaw c)
    (hCarve : ExceptionApplies edge2332bA1ExceptAsProvidedD2 c)
    (hDeriv : IncorporationHonored edge2332bA2IncorporatesA1 c)
    (hDerivPunish : IncorporationHonored edge2332bA2IncorporatesC c)
    (hEnum : IncorporationHonored edge2332bB2IncorporatesB1 c)
    (hRulesEx : ReferencedSectionExists edge2332bASubjectToD c)
    (hOverride : OverrideTriggered edge2332bC2NotwithstandingOtherLaw c)
    (hJuris : Section2332bJurisdictionPath c)
    (hInvestigative : Section2332bFInvestigativeRosterResolves c)
    (hFacility : IncorporationHonored edge2332bG2Incorporates1958b2 c)
    (hTerrorList : Section2332bG5IncorporationsResolve c)
    : Coherent2332b c :=
  ⟨hCirc, hPunish, hState, hCarve, hDeriv, hDerivPunish, hEnum, hRulesEx,
   hOverride, hJuris, hInvestigative, hFacility, hTerrorList⟩


theorem ch113BWmdSliceCoherent_intro {c : ComplaintText}
    (hA : Coherent2332a c) (hB : Coherent2332b c)
    : Ch113BWmdSliceCoherent c :=
  ⟨hA, hB⟩

end Proving.USC.T18.Ch113B.Wmd.Structure
