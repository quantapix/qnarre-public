import Proving.USC.T18.Ch2Ch3.Ontology.Types
import Proving.USC.T18.Ch2Ch3.Ontology.Predicates
import Proving.USC.T18.Ch2Ch3.Ontology.Statute
import Proving.USC.Common.Types









set_option autoImplicit false

namespace Proving.USC.T18.Ch2Ch3.Ontology

open Proving.USC.Common



theorem majorDrugOffenseDef_intro_cce {o : Offense} {c : ComplaintText}
    (h : IsContinuingCriminalEnterprise o c) : MajorDrugOffenseDef o c :=
  .cce h

theorem majorDrugOffenseDef_intro_conspiracy {o : Offense} {c : ComplaintText}
    (h : IsConspiracyToDistributeControlledSubstances o c) : MajorDrugOffenseDef o c :=
  .conspiracy h

theorem majorDrugOffenseDef_intro_majorQuant {o : Offense} {c : ComplaintText}
    (h : IsMajorQuantityDrugOffense o c) : MajorDrugOffenseDef o c :=
  .majorQuant h

theorem stateDef_intro_state {e : Entity} {c : ComplaintText}
    (h : IsStateOfUnitedStates e c) : StateDef e c :=
  .state h

theorem stateDef_intro_dc {e : Entity} {c : ComplaintText}
    (h : IsDistrictOfColumbia e c) : StateDef e c :=
  .dc h

theorem stateDef_intro_insular {e : Entity} {c : ComplaintText}
    (h : IsInsularAreaOfUnitedStates e c) : StateDef e c :=
  .insular h

theorem animalEnterpriseDef_intro_commercialAcademic {e : Entity} {c : ComplaintText}
    (h : IsCommercialOrAcademicAnimalEnterprise e c) : AnimalEnterpriseDef e c :=
  .commercialAcademic h

theorem animalEnterpriseDef_intro_venue {e : Entity} {c : ComplaintText}
    (h : IsAnimalVenueEnterprise e c) : AnimalEnterpriseDef e c :=
  .venue h

theorem animalEnterpriseDef_intro_fair {e : Entity} {c : ComplaintText}
    (h : IsAgriculturalFairEvent e c) : AnimalEnterpriseDef e c :=
  .fair h



theorem runwayExclusionZoneDef_intro {z : RunwayExclusionZone} {c : ComplaintText}
    (hCentered : CenteredOnActiveRunwayInControlledAirspace z c)
    (hGeometry : WithinStatutoryRunwayGeometry z c) : RunwayExclusionZoneDef z c :=
  ⟨hCentered, hGeometry⟩

theorem courseOfConductDef_intro {x : Conduct} {c : ComplaintText}
    (hActs : ComposedOfTwoOrMoreActs x c)
    (hContinuity : EvidencesContinuityOfPurpose x c) : CourseOfConductDef x c :=
  ⟨hActs, hContinuity⟩

theorem economicDamageDef_intro {x : Damage} {c : ComplaintText}
    (hLoss : ConstitutesCompensableEconomicLoss x c)
    (hNotDisrupt : ¬ ConstitutesLawfulEconomicDisruption x c) : EconomicDamageDef x c :=
  ⟨hLoss, hNotDisrupt⟩

theorem wildlifeDef_intro {x : Creature} {c : ComplaintText}
    (hWild : IsWild x c) (hWildlife : IsWildlife x c) : WildlifeDef x c :=
  ⟨hWild, hWildlife⟩

theorem wildfireSuppressionDef_intro {s : SuppressionEffort} {w : Wildfire} {c : ComplaintText}
    (hSuppression : IsWildfireSuppression s c)
    (hTarget : IsWildfire w c) : WildfireSuppressionDef s w c :=
  ⟨hSuppression, hTarget⟩

end Proving.USC.T18.Ch2Ch3.Ontology
