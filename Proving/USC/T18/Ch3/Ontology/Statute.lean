









import Proving.USC.T18.Ch3.Ontology.Predicates

namespace Proving.USC.T18.Ch3.Ontology

open Proving.USC.Common







structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String
  deriving Repr


def edge_wildlife_dependsOn_wild : DefEdge :=
  { defined := "wildlife", dependsOn := "wild", citeDefine := "18 USC § 42(a)(2)" }


def edge_wildlifeResources_dependsOn_wild : DefEdge :=
  { defined := "wildlife resources", dependsOn := "wild",
    citeDefine := "18 USC § 42(a)(2)" }



def edge_economicDamage_dependsOn_animalEnterprise : DefEdge :=
  { defined := "economic damage", dependsOn := "animal enterprise",
    citeDefine := "18 USC § 43(d)(3)" }




def edge_animalCrushing_dependsOn_seriousBodilyInjury : DefEdge :=
  { defined := "animal crushing", dependsOn := "serious bodily injury",
    citeDefine := "18 USC § 1365 (via § 48(f)(1))" }


def edge_animalCrushVideo_dependsOn_animalCrushing : DefEdge :=
  { defined := "animal crush video", dependsOn := "animal crushing",
    citeDefine := "18 USC § 48(f)(2)" }



def edge_animalCrushVideo_dependsOn_obscene : DefEdge :=
  { defined := "animal crush video", dependsOn := "obscene",
    citeDefine := "18 USC § 48(f)(2)(B) (undefined in-slice)" }


def defEdges : List DefEdge :=
  [ edge_wildlife_dependsOn_wild,
    edge_wildlifeResources_dependsOn_wild,
    edge_economicDamage_dependsOn_animalEnterprise,
    edge_animalCrushing_dependsOn_seriousBodilyInjury,
    edge_animalCrushVideo_dependsOn_animalCrushing,
    edge_animalCrushVideo_dependsOn_obscene ]





inductive AnimalEnterpriseMembership (e : Entity) (c : ComplaintText) : Prop where
  | commercialAcademic : IsCommercialOrAcademicEnterprise e c → AnimalEnterpriseMembership e c
  | display            : IsAnimalDisplayEnterprise e c → AnimalEnterpriseMembership e c
  | agriculturalFair   : IsAgriculturalFairEvent e c → AnimalEnterpriseMembership e c


inductive SeriousBodilyInjuryMembership (x : BodilyInjury) (c : ComplaintText) : Prop where
  | riskOfDeath    : InjuryPosesSubstantialRiskOfDeath x c → SeriousBodilyInjuryMembership x c
  | extremePain    : InjuryIsExtremePhysicalPain x c → SeriousBodilyInjuryMembership x c
  | disfigurement  : InjuryIsProtractedDisfigurement x c → SeriousBodilyInjuryMembership x c
  | lossOfFunction : InjuryIsProtractedLossOfFunction x c → SeriousBodilyInjuryMembership x c


inductive EuthanizingMembership (m : EuthanasiaMethod) (c : ComplaintText) : Prop where
  | rapidPainlessDeath : MethodProducesRapidPainlessDeath m c → EuthanizingMembership m c
  | painlessAnesthesia : MethodUsesPainlessAnesthesia m c → EuthanizingMembership m c





structure AnimalCrushVideoMembership (v : CrushVideo) (c : ComplaintText) : Prop where
  depicts : VideoDepictsAnimalCrushing v c
  obscene : VideoIsObscene v c

end Proving.USC.T18.Ch3.Ontology
