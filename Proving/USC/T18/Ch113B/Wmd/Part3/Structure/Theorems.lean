


import Proving.USC.T18.Ch113B.Wmd.Part3.Structure.Types
import Proving.USC.T18.Ch113B.Wmd.Part3.Structure.Predicates
import Proving.USC.T18.Ch113B.Wmd.Part3.Structure.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Part3.Structure

open Proving.USC.Common


theorem coherent2332a_intro {c : ComplaintText}
    (hDefs : IncorporationHonored e2332a_ab_defs_c c)
    (hNatExists : ReferencedSectionExists e2332a_c1_ina c)
    (hNatResolves : IncorporationHonored e2332a_c1_ina c)
    (hNatCross : CrossTitleReferenceResolves e2332a_c1_ina c)
    (hDevExists : ReferencedSectionExists e2332a_c2A_s921 c)
    (hDevResolves : IncorporationHonored e2332a_c2A_s921 c)
    (hBioExists : ReferencedSectionExists e2332a_c2C_s178 c)
    (hBioResolves : IncorporationHonored e2332a_c2C_s178 c)
    (hCarveA : ExceptionApplies e2332a_a_lawfulAuthority c →
               ExceptionHonored e2332a_a_lawfulAuthority c)
    (hCarveB : ExceptionApplies e2332a_b_lawfulAuthority c →
               ExceptionHonored e2332a_b_lawfulAuthority c)
    : Coherent2332a c :=
  { definitionsScopeResolves := hDefs
    nationalDefExists := hNatExists
    nationalDefResolves := hNatResolves
    nationalDefCrossTitle := hNatCross
    destructiveDeviceExists := hDevExists
    destructiveDeviceResolves := hDevResolves
    bioTermsExist := hBioExists
    bioTermsResolve := hBioResolves
    lawfulAuthorityCarveA := hCarveA
    lawfulAuthorityCarveB := hCarveB }


theorem section2332bCircumstanceIncorporation_intro_commerceFacility {c : ComplaintText}
    (h : IncorporationHonored e2332b_a1_b1A c) : Section2332bCircumstanceIncorporation c :=
  .commerceFacility h


theorem section2332bCircumstanceIncorporation_intro_commerceEffect {c : ComplaintText}
    (h : IncorporationHonored e2332b_a1_b1B c) : Section2332bCircumstanceIncorporation c :=
  .commerceEffect h


theorem section2332bCircumstanceIncorporation_intro_federalVictim {c : ComplaintText}
    (h : IncorporationHonored e2332b_a1_b1C c) : Section2332bCircumstanceIncorporation c :=
  .federalVictim h


theorem section2332bCircumstanceIncorporation_intro_federalProperty {c : ComplaintText}
    (h : IncorporationHonored e2332b_a1_b1D c) : Section2332bCircumstanceIncorporation c :=
  .federalProperty h


theorem section2332bCircumstanceIncorporation_intro_territorialSea {c : ComplaintText}
    (h : IncorporationHonored e2332b_a1_b1E c) : Section2332bCircumstanceIncorporation c :=
  .territorialSea h


theorem section2332bCircumstanceIncorporation_intro_specialMaritimeJurisdiction
    {c : ComplaintText}
    (h : IncorporationHonored e2332b_a1_b1F c) : Section2332bCircumstanceIncorporation c :=
  .specialMaritimeJurisdiction h


theorem section2332bg5IncorporationsResolve_intro {c : ComplaintText}
    (hT18 : EnumeratedIncorporationsResolve fctTitle18Targets c)
    (hSelf : ReferencedSectionExists e2332b_g5_self c)
    (hWmd : ReferencedSectionExists e2332b_g5_2332a c)
    (hAea : EnumeratedIncorporationsResolve fctAtomicEnergyTargets c)
    (hAeaCross : CrossTitleReferenceResolves e2332b_g5_atomicEnergyAct c)
    (hT49 : EnumeratedIncorporationsResolve fctTitle49Targets c)
    (hT49Cross : CrossTitleReferenceResolves e2332b_g5_title49 c)
    (hT21 : EnumeratedIncorporationsResolve fctTitle21Targets c)
    (hT21Cross : CrossTitleReferenceResolves e2332b_g5_csiea c)
    : Section2332bg5IncorporationsResolve c :=
  { title18Enum := hT18
    selfReferenceExists := hSelf
    wmdReferenceExists := hWmd
    atomicEnergyEnum := hAea
    atomicEnergyCrossTitle := hAeaCross
    title49Enum := hT49
    title49CrossTitle := hT49Cross
    narcoTerrorEnum := hT21
    narcoTerrorCrossTitle := hT21Cross }


theorem coherent2332b_intro {c : ComplaintText}
    (hCircExists : ReferencedSectionExists e2332b_a1_circ_b c)
    (hCircPath : Section2332bCircumstanceIncorporation c)
    (hCircAll : JurisdictionalCircumstanceAttaches e2332b_b2_circ_b1 c)
    (hProofRule : ConstraintHonored e2332b_b1_subjectTo_d1 c)
    (hStateLaw : IncorporationHonored e2332b_a1_stateLaw c)
    (hStateLimited : ConstraintHonored e2332b_a1_subjectTo_d2 c)
    (hElementsOnly : AdoptedStateLawElementsOnly e2332b_a1_stateLaw c)
    (hPenA1 : ReferencedSectionExists e2332b_a1_penalty_c c)
    (hPenA2 : ReferencedSectionExists e2332b_a2_penalty_c c)
    (hDerivative : IncorporationHonored e2332b_a2_offense_a1 c)
    (hOverride : OverrideTriggered e2332b_c2_notwithstanding c)
    (hExtraterritorial : IncorporationHonored e2332b_e1_extraterritorial_a c)
    (hAccessoryExists : ReferencedSectionExists e2332b_e2_accessory_s3 c)
    (hAccessoryResolves : IncorporationHonored e2332b_e2_accessory_s3 c)
    (hAgRoster : EnumeratedIncorporationsResolve agInvestigativeTargets c)
    (hSavings : SavingsClauseRespected e2332b_f_savings_s3056 c)
    (hFacility : IncorporationHonored e2332b_g2_s1958b2 c)
    (hSbi : IncorporationHonored e2332b_g3_s1365g3 c)
    (hSbiCurrent : ReferenceTargetIsCurrent e2332b_g3_s1365g3 c)
    (hFct : Section2332bg5IncorporationsResolve c)
    : Coherent2332b c :=
  { circumstanceRefExists := hCircExists
    circumstancePath := hCircPath
    circumstanceReachesAllOffenders := hCircAll
    jurisdictionalProofRule := hProofRule
    stateLawAdoptionResolves := hStateLaw
    stateLawAdoptionLimited := hStateLimited
    stateLawElementsOnly := hElementsOnly
    penaltyRefExistsA1 := hPenA1
    penaltyRefExistsA2 := hPenA2
    derivativeOffenseRef := hDerivative
    sentencingOverride := hOverride
    extraterritorialReach := hExtraterritorial
    accessoryRefExists := hAccessoryExists
    accessoryRefResolves := hAccessoryResolves
    agPredicateOffensesResolve := hAgRoster
    secretServiceSavings := hSavings
    facilityDefResolves := hFacility
    seriousBodilyInjuryDefResolves := hSbi
    seriousBodilyInjuryTargetCurrent := hSbiCurrent
    federalCrimeOfTerrorismIncorporations := hFct }

end Proving.USC.T18.Ch113B.Wmd.Part3.Structure
