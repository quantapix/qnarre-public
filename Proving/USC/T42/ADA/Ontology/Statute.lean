









import Proving.USC.T42.ADA.Ontology.Predicates

namespace Proving.USC.T42.ADA.Ontology

open Proving.USC.Common





structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String


def edge_disability_dependsOn_impairment : DefEdge :=
  { defined := "disability", dependsOn := "physical or mental impairment",
    citeDefine := "42 USC § 12102(1)" }


def edge_disability_dependsOn_majorLifeActivity : DefEdge :=
  { defined := "disability", dependsOn := "major life activity",
    citeDefine := "42 USC § 12102(1)" }


def edge_qualifiedIndividual_dependsOn_reasonableAccommodation : DefEdge :=
  { defined := "qualified individual", dependsOn := "reasonable accommodation",
    citeDefine := "42 USC § 12111(8)" }


def edge_coveredEntity_dependsOn_employer : DefEdge :=
  { defined := "covered entity", dependsOn := "employer",
    citeDefine := "42 USC § 12111(2)" }



def edge_qualifiedIndividualWithDisability_dependsOn_disability : DefEdge :=
  { defined := "qualified individual with a disability", dependsOn := "disability",
    citeDefine := "42 USC § 12131(2)" }



def edge_qualifiedIndividualWithDisability_dependsOn_publicEntity : DefEdge :=
  { defined := "qualified individual with a disability", dependsOn := "public entity",
    citeDefine := "42 USC § 12131(2)" }



def edge_privateEntity_dependsOn_publicEntity : DefEdge :=
  { defined := "private entity", dependsOn := "public entity",
    citeDefine := "42 USC § 12181(6)" }



def edge_publicAccommodation_dependsOn_privateEntity : DefEdge :=
  { defined := "public accommodation", dependsOn := "private entity",
    citeDefine := "42 USC § 12181(7)" }






inductive DisabilityCase (i : Impairment) (a : MajorLifeActivity) (c : ComplaintText) : Prop

  | actual    (hImp : IsImpairment i c) (hMla : IsMajorLifeActivity a c)
              (hLim : SubstantiallyLimits i a c) : DisabilityCase i a c

  | recordOf  (hImp : IsImpairment i c) : DisabilityCase i a c

  | regardedAs (hImp : IsImpairment i c) : DisabilityCase i a c





inductive PublicEntityCase (pe : PublicEntity) (c : ComplaintText) : Prop

  | government (h : IsPublicEntity pe c) : PublicEntityCase pe c

  | instrumentality (h : IsPublicEntity pe c) : PublicEntityCase pe c

  | railPassengerCorp (h : IsPublicEntity pe c) : PublicEntityCase pe c






structure DisabilityMembershipActual (i : Impairment) (a : MajorLifeActivity)
    (c : ComplaintText) : Prop where
  impairment : IsImpairment i c
  activity   : IsMajorLifeActivity a c
  limits     : SubstantiallyLimits i a c



structure CoveredEntityMembership (ce : CoveredEntity) (c : ComplaintText) : Prop where
  covered : IsCoveredEntity ce c




structure PublicAccommodationMembership (prv : PrivateEntity) (pa : PublicAccommodation)
    (c : ComplaintText) : Prop where
  private_     : IsPrivateEntity prv c
  accommodation : IsPublicAccommodation pa c





structure Section12112TermsInhabited (ce : CoveredEntity) (p : Person)
    (i : Impairment) (a : MajorLifeActivity) (c : ComplaintText) : Prop where
  coveredEntity : IsCoveredEntity ce c
  qualified     : IsQualifiedIndividual p c
  disability    : DisabilityMembershipActual i a c



structure Section12132TermsInhabited (pe : PublicEntity) (p : Person)
    (c : ComplaintText) : Prop where
  publicEntity : IsPublicEntity pe c
  qualified    : IsQualifiedIndividualWithDisability p c



structure Section12182TermsInhabited (pa : PublicAccommodation) (prv : PrivateEntity)
    (i : Impairment) (a : MajorLifeActivity) (c : ComplaintText) : Prop where
  accommodation : IsPublicAccommodation pa c
  private_      : IsPrivateEntity prv c
  disability    : DisabilityMembershipActual i a c

end Proving.USC.T42.ADA.Ontology
