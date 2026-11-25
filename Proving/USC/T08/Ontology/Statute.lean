












import Proving.USC.T08.Ontology.Types
import Proving.USC.T08.Ontology.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T08.Ontology

open Proving.USC.Common





structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String



def edges : List DefEdge :=
  [
    { defined := "alien", dependsOn := "national of the United States",
      citeDefine := "8 USC § 1101(a)(3)" },
    { defined := "alien", dependsOn := "citizen [DANGLING — subch. III]",
      citeDefine := "8 USC § 1101(a)(3)" },
    { defined := "national of the United States",
      dependsOn := "citizen [DANGLING — subch. III]",
      citeDefine := "8 USC § 1101(a)(22)" },
    { defined := "national of the United States",
      dependsOn := "permanent allegiance (to the United States)",
      citeDefine := "8 USC § 1101(a)(22)" },
    { defined := "national", dependsOn := "permanent allegiance (to a state)",
      citeDefine := "8 USC § 1101(a)(21)" },
    { defined := "person", dependsOn := "individual",
      citeDefine := "8 USC § 1101(b)(3)" },
    { defined := "person", dependsOn := "organization",
      citeDefine := "8 USC § 1101(b)(3)" },
    { defined := "immigrant", dependsOn := "alien",
      citeDefine := "8 USC § 1101(a)(15)" },
    { defined := "immigrant", dependsOn := "nonimmigrant class",
      citeDefine := "8 USC § 1101(a)(15)" },
    { defined := "lawfully admitted for permanent residence",
      dependsOn := "immigrant", citeDefine := "8 USC § 1101(a)(20)" },
    { defined := "lawfully admitted for permanent residence",
      dependsOn := "immigration laws [defined (a)(17), not encoded here]",
      citeDefine := "8 USC § 1101(a)(20)" },
    { defined := "refugee", dependsOn := "nationality",
      citeDefine := "8 USC § 1101(a)(42)" },
    { defined := "aggravated felony", dependsOn := "conviction",
      citeDefine := "8 USC § 1101(a)(43)" },
    { defined := "United States (geographic)",
      dependsOn := "State [defined (a)(36), not encoded here]",
      citeDefine := "8 USC § 1101(a)(38)" },

    { defined := "§ 1324 (bringing in / harboring aliens)",
      dependsOn := "alien", citeDefine := "8 USC § 1324(a)" },
    { defined := "§ 1324(a)(3)(B)",
      dependsOn := "unauthorized alien [DANGLING — § 1324a(h)(3)]",
      citeDefine := "8 USC § 1324(a)(3)(B)" },
    { defined := "§ 1327 (aiding inadmissible aliens)",
      dependsOn := "alien", citeDefine := "8 USC § 1327" },
    { defined := "§ 1327 (aiding inadmissible aliens)",
      dependsOn := "aggravated felony", citeDefine := "8 USC § 1327" },
    { defined := "§ 1328 (importation for immoral purpose)",
      dependsOn := "alien", citeDefine := "8 USC § 1328" } ]






structure AlienMembership (p : Person) (c : ComplaintText) : Prop where
  isPerson        : IsPerson p c
  notNationalOfUS : ¬ IsNationalOfUS p c



inductive NationalOfUSMembership (p : Person) (c : ComplaintText) : Prop where
  | citizen             : IsCitizenOfUS p c → NationalOfUSMembership p c
  | permanentAllegiance : OwesPermanentAllegianceToUS p c → NationalOfUSMembership p c



inductive PersonMembership (p : Person) (c : ComplaintText) : Prop where
  | individual   : IsIndividual p c → PersonMembership p c
  | organization : (e : Entity) → IsOrganization e c → PersonMembership p c



structure ImmigrantMembership (p : Person) (c : ComplaintText) : Prop where
  isAlien       : IsAlien p c
  notNonimmigrant : ¬ IsNonimmigrant p c



structure LPRMembership (p : Person) (c : ComplaintText) : Prop where
  isLPR      : IsLawfulPermanentResident p c
  asImmigrant : IsImmigrant p c



structure RefugeeMembership (p : Person) (c : ComplaintText) : Prop where
  isPerson  : IsPerson p c
  isRefugee : IsRefugee p c




structure AggravatedFelonyMembership (o : Offense) (cv : Conviction)
    (c : ComplaintText) : Prop where
  isAggFelony  : IsAggravatedFelony o c
  isConviction : IsConviction cv c

end Proving.USC.T08.Ontology
