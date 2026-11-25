import Proving.USC.T42.Ch6ASchI.Part2.Ontology.Predicates
import Proving.USC.Common.Types








namespace Proving.USC.T42.Ch6ASchI.Part2.Ontology
open Proving.USC.Common



structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String
deriving Repr


def edge_restrictedGrade_dependsOn_grade : DefEdge :=
  { defined := "restricted grade", dependsOn := "grade", citeDefine := "42 USC § 211(b)" }


def edge_permanentPromotion_dependsOn_promotion : DefEdge :=
  { defined := "permanent promotion", dependsOn := "promotion", citeDefine := "42 USC § 211(a)" }


def edge_temporaryPromotion_dependsOn_promotion : DefEdge :=
  { defined := "temporary promotion", dependsOn := "promotion", citeDefine := "42 USC § 211(a)" }


def edge_activeService_dependsOn_uniformedService : DefEdge :=
  { defined := "active service", dependsOn := "uniformed service", citeDefine := "42 USC § 212(d)" }


def edge_activeService_dependsOn_comparablePHSService : DefEdge :=
  { defined := "active service", dependsOn := "comparable Public Health Service service",
    citeDefine := "42 USC § 212(d)" }


def edge_activeService_dependsOn_seniorBiomedical : DefEdge :=
  { defined := "active service", dependsOn := "Senior Biomedical Research Service",
    citeDefine := "42 USC § 212(d)" }


def edge_activeMilitaryService_dependsOn_activeService : DefEdge :=
  { defined := "active military service", dependsOn := "active service",
    citeDefine := "42 USC § 213(d)" }


def edge_militaryBenefit_dependsOn_activeService : DefEdge :=
  { defined := "military benefit", dependsOn := "active service", citeDefine := "42 USC § 213(a)" }


def defEdges : List DefEdge :=
  [ edge_restrictedGrade_dependsOn_grade,
    edge_permanentPromotion_dependsOn_promotion,
    edge_temporaryPromotion_dependsOn_promotion,
    edge_activeService_dependsOn_uniformedService,
    edge_activeService_dependsOn_comparablePHSService,
    edge_activeService_dependsOn_seniorBiomedical,
    edge_activeMilitaryService_dependsOn_activeService,
    edge_militaryBenefit_dependsOn_activeService ]




structure RestrictedGrade (g : Grade) (c : ComplaintText) : Prop where
  regulationsIssued : IsPromotionRestrictingRegulationIssued g c


inductive PromotionKind (p : Promotion) (c : ComplaintText) : Prop where
  | permanent (h : IsPermanentPromotion p c) : PromotionKind p c
  | temporary (h : IsTemporaryPromotion p c) : PromotionKind p c



inductive ActiveService (s : ServicePeriod) (c : ComplaintText) : Prop where
  | uniformedService     (h : IsUniformedServiceActiveService s c) : ActiveService s c
  | comparablePHSService (h : IsComparablePHSService s c)          : ActiveService s c
  | otherCreditable      (h : IsOtherCreditableService s c)        : ActiveService s c
  | seniorBiomedical     (h : IsSeniorBiomedicalResearchService s c) : ActiveService s c




structure ActiveMilitaryService (s : ServicePeriod) (c : ComplaintText) : Prop where
  activeService : ActiveService s c
  deemed        : IsActiveMilitaryServiceEquivalent s c

end Proving.USC.T42.Ch6ASchI.Part2.Ontology
