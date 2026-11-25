








import Proving.USC.T22.Ontology.Predicates

namespace Proving.USC.T22.Ontology
open Proving.USC.Common





structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String


def section7102Edges : List DefEdge :=
  [ { defined := "coercion", dependsOn := "abuse or threatened abuse of the legal process",
      citeDefine := "22 USC § 7102(3)(C)" },
    { defined := "involuntary servitude", dependsOn := "abuse or threatened abuse of the legal process",
      citeDefine := "22 USC § 7102(8)(B)" },
    { defined := "sex trafficking", dependsOn := "commercial sex act",
      citeDefine := "22 USC § 7102(12)" },
    { defined := "severe forms of trafficking in persons", dependsOn := "sex trafficking",
      citeDefine := "22 USC § 7102(11)(A)" },
    { defined := "severe forms of trafficking in persons", dependsOn := "commercial sex act",
      citeDefine := "22 USC § 7102(11)(A)" },
    { defined := "severe forms of trafficking in persons", dependsOn := "coercion",
      citeDefine := "22 USC § 7102(11)" },
    { defined := "severe forms of trafficking in persons", dependsOn := "involuntary servitude",
      citeDefine := "22 USC § 7102(11)(B)" },
    { defined := "severe forms of trafficking in persons", dependsOn := "debt bondage",
      citeDefine := "22 USC § 7102(11)(B)" },
    { defined := "concrete actions", dependsOn := "minimum standards for the elimination of trafficking",
      citeDefine := "22 USC § 7102(5)" },
    { defined := "concrete actions", dependsOn := "severe forms of trafficking in persons",
      citeDefine := "22 USC § 7102(5)(G)" },
    { defined := "credible information", dependsOn := "concrete actions",
      citeDefine := "22 USC § 7102(6)(H)" },
    { defined := "victim of a severe form of trafficking", dependsOn := "severe forms of trafficking in persons",
      citeDefine := "22 USC § 7102(16)" },
    { defined := "victim of trafficking", dependsOn := "severe forms of trafficking in persons",
      citeDefine := "22 USC § 7102(17)" },
    { defined := "victim of trafficking", dependsOn := "sex trafficking",
      citeDefine := "22 USC § 7102(17)" },

    { defined := "minimum standards for the elimination of trafficking", dependsOn := "22 USC § 7106",
      citeDefine := "22 USC § 7102(9)" },
    { defined := "Task Force", dependsOn := "22 USC § 7103",
      citeDefine := "22 USC § 7102(14)" },
    { defined := "grounds related to human trafficking", dependsOn := "8 USC § 1182(a)(2)(H)",
      citeDefine := "22 USC § 7102(18)" },
    { defined := "nonhumanitarian, nontrade-related foreign assistance",
      dependsOn := "Foreign Assistance Act of 1961 / Arms Export Control Act",
      citeDefine := "22 USC § 7102(10)" } ]



structure CoercionViaLegalProcess (cond : Condition) (lp : LegalProcess) (c : ComplaintText) : Prop where
  legalProcess : IsAbuseOfLegalProcess lp c
  coercion     : IsCoercion cond c



structure InvoluntaryServitudeViaLegalProcess (cond : Condition) (lp : LegalProcess) (c : ComplaintText) : Prop where
  legalProcess : IsAbuseOfLegalProcess lp c
  servitude    : IsInvoluntaryServitude cond c



structure SexTraffickingMembership (pr : Practice) (a : SexAct) (c : ComplaintText) : Prop where
  commercialSexAct : IsCommercialSexAct a c
  sexTrafficking   : IsSexTrafficking pr c





inductive SevereFormsCase (pr : Practice) (c : ComplaintText) : Prop where
  | sexTrafficking {a : SexAct}
      (hSex : IsSexTrafficking pr c) (hCsa : IsCommercialSexAct a c)
      (hSevere : IsSevereFormsOfTrafficking pr c) : SevereFormsCase pr c
  | laborTrafficking {cond : Condition}
      (hServ : IsInvoluntaryServitude cond c)
      (hSevere : IsSevereFormsOfTrafficking pr c) : SevereFormsCase pr c



structure VictimOfSevereFormMembership (p : Person) (pr : Practice) (c : ComplaintText) : Prop where
  severeForms : IsSevereFormsOfTrafficking pr c
  victim      : IsVictimOfSevereFormOfTrafficking p c




inductive VictimOfTraffickingCase (p : Person) (pr : Practice) (c : ComplaintText) : Prop where
  | viaSevereForm
      (hPractice : IsSevereFormsOfTrafficking pr c)
      (hVictim : IsVictimOfTrafficking p c) : VictimOfTraffickingCase p pr c
  | viaSexTrafficking
      (hPractice : IsSexTrafficking pr c)
      (hVictim : IsVictimOfTrafficking p c) : VictimOfTraffickingCase p pr c

end Proving.USC.T22.Ontology
