









import Proving.USC.T18.Ch1.Reslice.Structure.Types
import Proving.USC.T18.Ch1.Reslice.Structure.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch1.Reslice.Structure

open Proving.USC.Common




def AllReferencedSectionsExist (rs : List Ref) (c : ComplaintText) : Prop :=
  ∀ r ∈ rs, ReferencedSectionExists r c


def AllIncorporationsHonored (rs : List Ref) (c : ComplaintText) : Prop :=
  ∀ r ∈ rs, IncorporationHonored r c


def NoReferenceDangles (rs : List Ref) (c : ComplaintText) : Prop :=
  ∀ r ∈ rs, ¬ ReferenceDangling r c





inductive Paragraph7_9Displaced (c : ComplaintText) : Prop where

  | byMejaException :
      ExceptionApplies edge_7_9_exceptAsProvided_3261a c → Paragraph7_9Displaced c

  | byConflictingTreaty :
      OverrideTriggered edge_7_9_savings_treaties c → Paragraph7_9Displaced c






structure Section7IncorporationsResolve (c : ComplaintText) : Prop where

  titleWideScope    : DefinitionScopeHonored edge_title18_incorporates_7 c

  ina101Exists      : ReferencedSectionExists edge_7_9_incorporates_ina101 c

  ina101Honored     : IncorporationHonored edge_7_9_incorporates_ina101 c

  spaceInstruments  : AllIncorporationsHonored refs_7_6_spaceTreaties c

  guanoReferent     : IncorporationHonored edge_7_4_incorporates_guanoAct c

  intlLawCeiling    : DefinitionScopeHonored edge_7_8_subjectTo_internationalLaw c

  treatySavings     : SavingsClausePreserves edge_7_9_savings_treaties c

  mejaCarveOutExists : ReferencedSectionExists edge_7_9_exceptAsProvided_3261a c








inductive Paragraph20_8Resolution (c : ComplaintText) : Prop where

  | asEnacted :
      ReferencedSectionExists edge_20_8_incorporates_fra25a c → Paragraph20_8Resolution c


  | viaRenumbering :
      ReferenceDangling edge_20_8_incorporates_fra25a c →
      EditorialCorrectionApplied note_20_8 c →
      ReferencedSectionExists edge_20_8_incorporates_fra25A_renumbered c →
      Paragraph20_8Resolution c





structure Section20IncorporationsResolve (c : ComplaintText) : Prop where

  titleWideScope    : DefinitionScopeHonored edge_title18_incorporates_20 c

  paragraphsExist   : AllReferencedSectionsExist refs_20_resolvable c

  paragraphsHonored : AllIncorporationsHonored refs_20_resolvable c

  edgeActLimb       : Paragraph20_8Resolution c








structure Section21IncorporationsResolve (c : ComplaintText) : Prop where

  titleWideAvailability : DefinitionScopeHonored edge_title18_incorporates_21 c

  proofRuleControls     : LexSpecialisControls edge_21_a_lexSpecialis_elementProof c

  s115Exists            : ReferencedSectionExists edge_21_b_incorporates_115 c

  s115Honored           : IncorporationHonored edge_21_b_incorporates_115 c

  sectionScopeHonored   : DefinitionScopeHonored edge_21_b_subjectTo_sectionScope c








inductive Section23ScopeStatus (c : ComplaintText) : Prop where

  | titleWide :
      DefinitionScopeHonored edge_title18_incorporates_23 c → Section23ScopeStatus c

  | displacedByExpressProvision :
      ExceptionApplies edge_23_exceptAsProvided_open c → Section23ScopeStatus c




structure Section23IncorporationsResolve (c : ComplaintText) : Prop where

  scope                    : Section23ScopeStatus c

  commaCorrection          : EditorialCorrectionApplied note_23 c

  courtsExist              : AllReferencedSectionsExist refs_23_courts c

  courtsHonored            : AllIncorporationsHonored refs_23_courts c

  extendsGeneralDefinition : LexSpecialisControls edge_23_lexSpecialis_28_451 c








structure Section24IncorporationsResolve (c : ComplaintText) : Prop where

  titleWideScope      : DefinitionScopeHonored edge_title18_incorporates_24 c

  a1Exist             : AllReferencedSectionsExist refs_24_a1 c

  a1Honored           : AllIncorporationsHonored refs_24_a1 c


  a2Exist             : AllReferencedSectionsExist refs_24_a2 c

  a2Honored           : AllIncorporationsHonored refs_24_a2 c

  commaCorrection     : EditorialCorrectionApplied note_24_a2 c

  benefitProgramNexus : IncorporationHonored edge_24_a2_subjectTo_24b c





structure Chapter1DefinitionsCohere (c : ComplaintText) : Prop where
  s7  : Section7IncorporationsResolve c
  s20 : Section20IncorporationsResolve c
  s21 : Section21IncorporationsResolve c
  s23 : Section23IncorporationsResolve c
  s24 : Section24IncorporationsResolve c

end Proving.USC.T18.Ch1.Reslice.Structure
