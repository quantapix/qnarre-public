








import Proving.USC.T18.Ch42.Ontology.Predicates

namespace Proving.USC.T18.Ch42.Ontology
open Proving.USC.Common



structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String


def edge_creditor_dependsOn_extension : DefEdge :=
  { defined := "creditor", dependsOn := "extension of credit",
    citeDefine := "18 USC § 891(2)" }


def edge_debtor_dependsOn_extension : DefEdge :=
  { defined := "debtor", dependsOn := "extension of credit",
    citeDefine := "18 USC § 891(3)" }


def edge_repayment_dependsOn_extension : DefEdge :=
  { defined := "repayment of an extension of credit", dependsOn := "extension of credit",
    citeDefine := "18 USC § 891(4)" }


def edge_collect_dependsOn_repayment : DefEdge :=
  { defined := "to collect an extension of credit", dependsOn := "repayment of an extension of credit",
    citeDefine := "18 USC § 891(5)" }



def edge_extortionateExtension_dependsOn_extension : DefEdge :=
  { defined := "extortionate extension of credit", dependsOn := "extension of credit",
    citeDefine := "18 USC § 891(6)" }


def edge_s894_dependsOn_extortionateMeans : DefEdge :=
  { defined := "collection of extensions of credit by extortionate means (§ 894)",
    dependsOn := "extortionate means", citeDefine := "18 USC § 894(a)" }




inductive ExtortionateMeansKind
  | actualUse
  | expressThreat
  | implicitThreat
  deriving DecidableEq, Repr



structure ExtortionateExtensionInhabited
    (x : ExtensionOfCredit) (cr dr : Person) (c : ComplaintText) : Prop where
  extension  : IsExtensionOfCredit x c
  creditor   : IsCreditor cr c
  debtor     : IsDebtor dr c
  extortion  : IsExtortionateExtensionOfCredit x c



structure CollectionByExtortionateMeansInhabited
    (x : ExtensionOfCredit) (m : Means) (c : ComplaintText) : Prop where
  extension  : IsExtensionOfCredit x c
  collection : IsCollectionOfExtension x c
  means      : IsExtortionateMeans m c

end Proving.USC.T18.Ch42.Ontology
