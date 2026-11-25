



import Proving.USC.T18.Ch42Ch95.Structure.Types
import Proving.USC.T18.Ch42Ch95.Structure.Predicates
import Proving.USC.T18.Ch42Ch95.Structure.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch42Ch95.Structure

open Proving.USC.Common


theorem coherent892_intro {c : ComplaintText}
    (hDefsExist : ReferencedSectionExists edge_892a_incorporates_891 c)
    (hDefs : IncorporationHonored edge_892a_incorporates_891 c)
    (hFine : ReferencedSectionExists edge_892a_incorporates_fineRegime c)
    (hSave : SavingsClausePreserves edge_892b_savings_892a c)
    (hRep : IncorporationHonored edge_892c_incorporates_892b c)
    : Coherent892 c :=
  { definitionsExist := hDefsExist, definitionsHonored := hDefs,
    fineRegimeExists := hFine, primaFacieNonexclusive := hSave,
    reputationRuleHonored := hRep }


theorem coherent894_intro {c : ComplaintText}
    (hDefsExist : ReferencedSectionExists edge_894a_incorporates_891 c)
    (hDefs : IncorporationHonored edge_894a_incorporates_891 c)
    (hFine : ReferencedSectionExists edge_894a_incorporates_fineRegime c)
    (hB1Exists : ReferencedSectionExists edge_894c_incorporates_892b1 c)
    (hB1 : IncorporationHonored edge_894c_incorporates_892b1 c)
    (hB2 : IncorporationHonored edge_894c_incorporates_892b2 c)
    : Coherent894 c :=
  { definitionsExist := hDefsExist, definitionsHonored := hDefs,
    fineRegimeExists := hFine, s892b1Exists := hB1Exists,
    s892b1Honored := hB1, s892b2Honored := hB2 }


theorem coherent1952_intro {c : ComplaintText}
    (hFine : ReferencedSectionExists edge_1952a_incorporates_fineRegime c)
    (hCsa : IncorporationHonored edge_1952b_incorporates_csa102_6 c)
    (hBsa : IncorporationHonored edge_1952b_incorporates_t31ch53subchII c)
    (h1956Exists : ReferencedSectionExists edge_1952b_incorporates_1956 c)
    (h1956 : IncorporationHonored edge_1952b_incorporates_1956 c)
    (h1957Exists : ReferencedSectionExists edge_1952b_incorporates_1957 c)
    (h670 : IncorporationHonored edge_1952d_incorporates_670 c)
    : Coherent1952 c :=
  { fineRegimeExists := hFine, csaDefinitionHonored := hCsa,
    bsaIncorporationHonored := hBsa, s1956Exists := h1956Exists,
    s1956Honored := h1956, s1957Exists := h1957Exists,
    preRetailDefinitionHonored := h670 }



theorem displacement1952_preRetail_intro {c : ComplaintText}
    (hFires : OverrideTriggered edge_1952d_lexSpecialis_670 c)
    (hControls : SpecificProvisionControls edge_1952d_lexSpecialis_670 c)
    : Displacement1952 c :=
  .preRetailMedicalProduct hFires hControls


theorem displacement1952_raffle_intro {c : ComplaintText}
    (hExc : ExceptionApplies edge_1952a_exceptAsProvided_1952e c)
    (hCu : IncorporationHonored edge_1952e_incorporates_fcua101 c)
    (hIdi : IncorporationHonored edge_1952e_incorporates_fdia3 c)
    : Displacement1952 c :=
  .savingsPromotionRaffle hExc hCu hIdi


theorem coherent1956_intro {c : ComplaintText}
    (hRosterExists : ReferencedSectionExists edge_1956c7A_incorporates_1961_1 c)
    (hRoster : IncorporationHonored edge_1956c7A_incorporates_1961_1 c)
    (hCarve : ExceptionApplies edge_1956c7A_exceptAsProvided_t31ch53subchII c)
    (hEnum : IncorporationHonored edge_1956c7D_incorporates_enumerated c)
    (hFi : IncorporationHonored edge_1956c6_incorporates_t31s5312 c)
    (hCivil : IncorporationHonored edge_1956b1_incorporates_1956a c)
    (h1957Exists : ReferencedSectionExists edge_1956b1_incorporates_1957 c)
    (hReceiver : ReferencedSectionExists edge_1956b4_incorporates_t28s754 c)
    (hSavings : SavingsClausePreserves edge_1956d_savings_otherLaw c)
    (hVenue : ExceptionApplies edge_1956i1_exceptAsProvided_1956i2 c)
    (hConducts : IncorporationHonored edge_1956i3_incorporates_1956c2 c)
    : Coherent1956 c :=
  { s1961RosterExists := hRosterExists, s1961RosterHonored := hRoster,
    bsaCarveOutHonored := hCarve, enumeratedOffensesHonored := hEnum,
    financialInstitutionDefHonored := hFi, civilPenaltyBaseHonored := hCivil,
    s1957Exists := h1957Exists, receiverPowersExist := hReceiver,
    nonSupersessionPreserved := hSavings, venueExceptionHonored := hVenue,
    conductsDefinitionHonored := hConducts }


theorem limitationsRegime1956_general_intro {c : ComplaintText}
    (hExists : ReferencedSectionExists edge_1956j_notwithstanding_3282 c)
    (hNo : ¬ OverrideTriggered edge_1956j_notwithstanding_3282 c)
    : LimitationsRegime1956 c :=
  .generalPeriodGoverns hExists hNo


theorem limitationsRegime1956_sevenYear_intro {c : ComplaintText}
    (hExists : ReferencedSectionExists edge_1956j_notwithstanding_3282 c)
    (hYes : OverrideTriggered edge_1956j_notwithstanding_3282 c)
    : LimitationsRegime1956 c :=
  .sevenYearPeriodGoverns hExists hYes



theorem sliceCrossReferencesResolve_intro {c : ComplaintText}
    (h894b1 : IncorporationHonored edge_894c_incorporates_892b1 c)
    (h894b2 : IncorporationHonored edge_894c_incorporates_892b2 c)
    (h1952 : IncorporationHonored edge_1952b_incorporates_1956 c)
    (hSave : SavingsClausePreserves edge_892b_savings_892a c)
    (h892c : IncorporationHonored edge_892c_incorporates_892b c)
    (h1956b1 : IncorporationHonored edge_1956b1_incorporates_1956a c)
    (h1956e : IncorporationHonored edge_1956e_incorporates_1956c7E c)
    (h1956i3 : IncorporationHonored edge_1956i3_incorporates_1956c2 c)
    (hB1Exists : ReferencedSectionExists edge_894c_incorporates_892b1 c)
    (h1956Exists : ReferencedSectionExists edge_1952b_incorporates_1956 c)
    : SliceCrossReferencesResolve c :=
  { s894c_to_892b1 := h894b1, s894c_to_892b2 := h894b2,
    s1952b_to_1956 := h1952, s892b_saves_892a := hSave,
    s892c_to_892b := h892c, s1956b1_to_1956a := h1956b1,
    s1956e_to_1956c7E := h1956e, s1956i3_to_1956c2 := h1956i3,
    s892b1Exists := hB1Exists, s1956Exists := h1956Exists }

end Proving.USC.T18.Ch42Ch95.Structure
