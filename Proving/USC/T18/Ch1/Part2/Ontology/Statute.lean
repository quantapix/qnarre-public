












import Proving.USC.T18.Ch1.Part2.Ontology.Predicates

namespace Proving.USC.T18.Ch1.Part2.Ontology

open Proving.USC.Common





structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String
  deriving Repr



def defEdges : List DefEdge :=
  [
    { defined := "financial institution", dependsOn := "mortgage lending business",
      citeDefine := "18 USC § 20" },
    { defined := "mortgage lending business", dependsOn := "organization",
      citeDefine := "18 USC § 27" },
    { defined := "Federal health care offense", dependsOn := "health care benefit program",
      citeDefine := "18 USC § 24" },
    { defined := "crime of violence (§ 25)", dependsOn := "crime of violence (§ 16)",
      citeDefine := "18 USC § 25" },

    { defined := "organization", dependsOn := "person",
      citeDefine := "18 USC § 18" },
    { defined := "petty offense", dependsOn := "§ 3571 fine schedule",
      citeDefine := "18 USC § 19" },
    { defined := "official representation", dependsOn := "Federal law enforcement officer",
      citeDefine := "18 USC § 21" },
    { defined := "covered Federal offense", dependsOn := "level A / level B offense",
      citeDefine := "18 USC § 28" },
    { defined := "victim of trafficking", dependsOn := "TVPA § 103 victim",
      citeDefine := "18 USC § 28" } ]



def danglingTerms : List String :=
  [ "person (1 USC § 1)",
    "Federal law enforcement officer (18 USC § 115)",
    "§ 3571 fine schedule",
    "insured depository institution (FDI Act § 3(c)(2))",
    "level A / level B offense (18 USC § 3771A)",
    "victim of trafficking (22 USC § 7102 / TVPA § 103)",
    "foreign government (§ 15)",
    "vessel (§ 26)" ]






inductive CrimeOfViolenceCase (o : Offense) (c : ComplaintText) : Prop
  | forceElement (h : HasPhysicalForceElement o c)
  | felonyRisk   (h : IsFelonyRiskingPhysicalForce o c)



structure CrimeOfViolenceMembership (o : Offense) (c : ComplaintText) : Prop where
  member  : IsCrimeOfViolence o c
  witness : CrimeOfViolenceCase o c



structure OrganizationMembership (p : Person) (c : ComplaintText) : Prop where
  member        : IsOrganization p c
  notIndividual : ¬ IsIndividual p c




inductive PettyOffenseClass (o : Offense) (c : ComplaintText) : Prop
  | classB     (h : IsClassBMisdemeanor o c)
  | classC     (h : IsClassCMisdemeanor o c)
  | infraction (h : IsInfraction o c)

structure PettyOffenseMembership (o : Offense) (c : ComplaintText) : Prop where
  member  : IsPettyOffense o c
  witness : PettyOffenseClass o c
  fineCap : WithinPettyOffenseFineCap o c



structure FinancialInstitutionMembership (e : Entity) (c : ComplaintText) : Prop where
  member     : IsFinancialInstitution e c
  enumerated : IsEnumeratedFinancialInstitutionKind e c



structure StolenOrCounterfeitPropertyMembership (pr : Property) (c : ComplaintText) : Prop where
  member : IsStolenOrCounterfeitProperty pr c
  stolen : WasStolenOrCounterfeited pr c
  knew   : DefendantKnewStolenCharacter pr c



structure FederalHealthCareOffenseMembership (o : Offense) (c : ComplaintText) : Prop where
  member   : IsFederalHealthCareOffense o c
  violates : ViolatesEnumeratedHealthCareStatute o c
  relates  : RelatesToHealthCareBenefitProgram o c



structure MortgageLendingBusinessMembership (p : Person) (c : ComplaintText) : Prop where
  member       : IsMortgageLendingBusiness p c
  organization : IsOrganization p c
  finances     : FinancesOrRefinancesRealEstateDebt p c
  commerce     : AffectsInterstateOrForeignCommerce p c

end Proving.USC.T18.Ch1.Part2.Ontology
