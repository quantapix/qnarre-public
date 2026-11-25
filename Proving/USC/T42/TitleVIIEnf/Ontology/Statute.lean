









import Proving.USC.T42.TitleVIIEnf.Ontology.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T42.TitleVIIEnf.Ontology

open Proving.USC.Common



structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String




def edge_charge_dependsOn_unlawfulPractice : DefEdge :=
  { defined := "charge", dependsOn := "unlawful employment practice",
    citeDefine := "42 USC § 2000e-5(b)" }


def edge_charge_dependsOn_aggrievedPerson : DefEdge :=
  { defined := "charge", dependsOn := "aggrieved person",
    citeDefine := "42 USC § 2000e-5(b)" }



def edge_respondent_dependsOn_employer : DefEdge :=
  { defined := "respondent", dependsOn := "employer",
    citeDefine := "42 USC § 2000e-5(b)" }


def edge_charge_dependsOn_respondent : DefEdge :=
  { defined := "charge", dependsOn := "respondent",
    citeDefine := "42 USC § 2000e-5(b)" }



def edge_conciliation_dependsOn_respondent : DefEdge :=
  { defined := "conciliation agreement", dependsOn := "respondent",
    citeDefine := "42 USC § 2000e-5(f)" }


def edge_generalCounsel_dependsOn_commission : DefEdge :=
  { defined := "General Counsel", dependsOn := "Commission",
    citeDefine := "42 USC § 2000e-4(b)(1)" }



def edge_patternPractice_dependsOn_unlawfulPractice : DefEdge :=
  { defined := "pattern or practice", dependsOn := "unlawful employment practice",
    citeDefine := "42 USC § 2000e-6(a)" }


def edge_personnelAction_dependsOn_employer : DefEdge :=
  { defined := "personnel action", dependsOn := "employer",
    citeDefine := "42 USC § 2000e-16(a)" }


def definitionalEdges : List DefEdge :=
  [ edge_charge_dependsOn_unlawfulPractice,
    edge_charge_dependsOn_aggrievedPerson,
    edge_respondent_dependsOn_employer,
    edge_charge_dependsOn_respondent,
    edge_conciliation_dependsOn_respondent,
    edge_generalCounsel_dependsOn_commission,
    edge_patternPractice_dependsOn_unlawfulPractice,
    edge_personnelAction_dependsOn_employer ]









structure ChargeMembership (x : Charge) (r : Respondent) (p : Person)
    (c : ComplaintText) : Prop where
  isCharge      : IsCharge x c
  allegesUEP    : IsUnlawfulEmploymentPractice p c
  namesResp     : IsRespondent r c
  byAggrieved   : IsAggrievedPerson p c





structure RespondentMembership (r : Respondent) (p : Person)
    (c : ComplaintText) : Prop where
  isResp      : IsRespondent r c
  isCovered   : IsEmployer p c



structure GeneralCounselMembership (p : Person) (x : Commission)
    (c : ComplaintText) : Prop where
  isGC        : IsGeneralCounsel p c
  ofCommission : IsCommission x c



structure PatternOrPracticeMembership (x : PatternOrPractice) (p : Person)
    (c : ComplaintText) : Prop where
  isPattern   : IsPatternOrPractice x c
  restsOnUEP  : IsUnlawfulEmploymentPractice p c



structure PersonnelActionMembership (x : PersonnelAction) (p : Person)
    (c : ComplaintText) : Prop where
  isAction    : IsPersonnelAction x c
  byEmployer  : IsEmployer p c



structure ConciliationAgreementMembership (x : ConciliationAgreement)
    (r : Respondent) (c : ComplaintText) : Prop where
  isAgreement : IsConciliationAgreement x c
  withResp    : IsRespondent r c

end Proving.USC.T42.TitleVIIEnf.Ontology
