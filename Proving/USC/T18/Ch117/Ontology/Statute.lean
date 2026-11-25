import Proving.USC.Common.Types
import Proving.USC.T18.Ch117.Ontology.Types
import Proving.USC.T18.Ch117.Ontology.Predicates











namespace Proving.USC.T18.Ch117.Ontology

open Proving.USC.Common






structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String
deriving Repr


def edges : List DefEdge :=
  [
    { defined := "illicit sexual conduct",
      dependsOn := "sexual act (ch. 109A / § 2246)", citeDefine := "18 USC § 2423(g)(1)" },
    { defined := "illicit sexual conduct",
      dependsOn := "commercial sex act (§ 1591)", citeDefine := "18 USC § 2423(g)(2)" },
    { defined := "illicit sexual conduct",
      dependsOn := "production of child pornography (§ 2256(8))", citeDefine := "18 USC § 2423(g)(3)" },
    { defined := "illicit sexual conduct",
      dependsOn := "individual under 18 years of age", citeDefine := "18 USC § 2423(g)" },

    { defined := "intent",
      dependsOn := "prostitution", citeDefine := "18 USC § 2423(h)" },
    { defined := "intent",
      dependsOn := "sexual activity for which any person can be charged with a criminal offense",
      citeDefine := "18 USC § 2423(h)" },
    { defined := "intent",
      dependsOn := "illicit sexual conduct", citeDefine := "18 USC § 2423(h)" },

    { defined := "sexual activity for which any person can be charged with a criminal offense",
      dependsOn := "production of child pornography (§ 2256(8))", citeDefine := "18 USC § 2427" },

    { defined := "prior sex offense conviction",
      dependsOn := "conviction under a covered federal offense", citeDefine := "18 USC § 2426(b)(1)(A)" },
    { defined := "prior sex offense conviction",
      dependsOn := "conviction under State law or the UCMJ", citeDefine := "18 USC § 2426(b)(1)(B)" },
    { defined := "prior sex offense conviction",
      dependsOn := "State", citeDefine := "18 USC § 2426(b)(1)(B)" },

    { defined := "State",
      dependsOn := "a State of the United States", citeDefine := "18 USC § 2426(b)(2)" },
    { defined := "State",
      dependsOn := "the District of Columbia", citeDefine := "18 USC § 2426(b)(2)" },
    { defined := "State",
      dependsOn := "a commonwealth, territory, or possession", citeDefine := "18 USC § 2426(b)(2)" },

    { defined := "victim",
      dependsOn := "individual harmed by a crime under this chapter", citeDefine := "18 USC § 2429(d)" },

    { defined := "full amount of the victim's losses",
      dependsOn := "full amount of the victim's losses (§ 2259(b)(3))", citeDefine := "18 USC § 2429(b)(3)" },

    { defined := "interactive computer service",
      dependsOn := "interactive computer service (47 U.S.C. § 230(f))", citeDefine := "18 USC § 2421A(a)" } ]




inductive IllicitSexualConductDef (x : Conduct) (p : Person) (c : ComplaintText) : Prop where

  | sexualActUnder18 (hAct : IsSexualActCh109A x c) (hAge : IsUnderAge18 p c) :
      IllicitSexualConductDef x p c

  | commercialSexActUnder18 (hAct : IsCommercialSexAct x c) (hAge : IsUnderAge18 p c) :
      IllicitSexualConductDef x p c

  | childPornProduction (hCp : IsChildPornographyProduction x c) :
      IllicitSexualConductDef x p c



inductive PriorSexOffenseConvictionDef (v : Conviction) (c : ComplaintText) : Prop where

  | federalCovered (h : IsConvictionUnderCoveredFederalOffense v c) :
      PriorSexOffenseConvictionDef v c

  | stateOrMilitary (h : IsConvictionUnderStateOrMilitaryEquivalent v c) :
      PriorSexOffenseConvictionDef v c



inductive StateDef (j : Jurisdiction) (c : ComplaintText) : Prop where

  | ofTheUnitedStates (h : IsStateOfTheUnitedStates j c) : StateDef j c

  | districtOfColumbia (h : IsDistrictOfColumbia j c) : StateDef j c

  | commonwealthTerritoryOrPossession (h : IsCommonwealthTerritoryOrPossession j c) : StateDef j c





structure VictimDef (p : Person) (c : ComplaintText) : Prop where
  harmed : IsHarmedByChapterOffense p c

end Proving.USC.T18.Ch117.Ontology
