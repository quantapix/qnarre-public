


























import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T09.Elements.Predicates
import Proving.USC.T09.Ontology.Predicates
import Proving.USC.T09.Procedure.Predicates
import Proving.USC.T18.Wave.Deontic.Predicates

namespace Proving.USC.Common.CrossWave

open Proving.USC.Common





















axiom mapCommerceTxn_T09 : Proving.USC.T09.Elements.CommerceTransaction → Entity

axiom mapOntCommerceTxn_T09 : Proving.USC.T09.Ontology.CommerceTransaction → Entity


axiom mapEnterprise_T18 : Proving.USC.T18.Wave.Deontic.Enterprise → Entity





axiom bridge_maritimeOrCommerce_to_common
    {a : Proving.USC.T09.Elements.ArbitrationAgreement}
    {t : Proving.USC.T09.Elements.CommerceTransaction}
    {c : ComplaintText} :
    Proving.USC.T09.Elements.MaritimeOrCommerceTransaction a t c →
    EngagedInInterstateCommerce (mapCommerceTxn_T09 t) c





axiom guard_notTransportationWorker
    (t : Proving.USC.T09.Ontology.CommerceTransaction) (c : ComplaintText) : Prop






axiom bridge_isCommerceTransaction_to_common
    {t : Proving.USC.T09.Ontology.CommerceTransaction} {c : ComplaintText} :
    guard_notTransportationWorker t c →
    Proving.USC.T09.Ontology.IsCommerceTransaction t c →
    EngagedInInterstateCommerce (mapOntCommerceTxn_T09 t) c






axiom bridge_enterpriseAffectsCommerce_to_common
    {e : Proving.USC.T18.Wave.Deontic.Enterprise} {c : ComplaintText} :
    Proving.USC.T18.Wave.Deontic.EnterpriseAffectsCommerce e c →
    EngagedInInterstateCommerce (mapEnterprise_T18 e) c






















axiom mapAwardMovant_T09 : Proving.USC.T09.Elements.Award → Person
axiom mapAwardMovantProc_T09 : Proving.USC.T09.Procedure.Award → Person




axiom guard_oneYearWindowMet (p : Person) (c : ComplaintText) : Prop




axiom bridge_withinOneYearOfAward_to_common
    {w : Proving.USC.T09.Elements.Award} {c : ComplaintText} :
    guard_oneYearWindowMet (mapAwardMovant_T09 w) c →
    Proving.USC.T09.Elements.WithinOneYearOfAward w c →
    WithinLimitations (mapAwardMovant_T09 w) c




axiom bridge_withinOneYearWindow_to_common
    {aw : Proving.USC.T09.Procedure.Award}
    {app : Proving.USC.T09.Procedure.Application} {c : ComplaintText} :
    guard_oneYearWindowMet (mapAwardMovantProc_T09 aw) c →
    Proving.USC.T09.Procedure.WithinOneYearWindow aw app c →
    WithinLimitations (mapAwardMovantProc_T09 aw) c
















axiom mapConspiracy_T18 : Person → Agreement







axiom bridge_conspiredToViolate1962d_to_common
    {p : Person} {c : ComplaintText} :
    Proving.USC.T18.Wave.Deontic.ConspiredToViolate1962d p c →
    AgreementAmongTwoOrMore (mapConspiracy_T18 p) c










theorem collapse_A1_clean
    {a : Proving.USC.T09.Elements.ArbitrationAgreement}
    {t : Proving.USC.T09.Elements.CommerceTransaction} {c : ComplaintText}
    (h : Proving.USC.T09.Elements.MaritimeOrCommerceTransaction a t c) :
    EngagedInInterstateCommerce (mapCommerceTxn_T09 t) c :=
  bridge_maritimeOrCommerce_to_common h

theorem collapse_A2_modulo_guard
    {t : Proving.USC.T09.Ontology.CommerceTransaction} {c : ComplaintText}
    (guard : guard_notTransportationWorker t c)
    (h : Proving.USC.T09.Ontology.IsCommerceTransaction t c) :
    EngagedInInterstateCommerce (mapOntCommerceTxn_T09 t) c :=
  bridge_isCommerceTransaction_to_common guard h

theorem collapse_A3_clean
    {e : Proving.USC.T18.Wave.Deontic.Enterprise} {c : ComplaintText}
    (h : Proving.USC.T18.Wave.Deontic.EnterpriseAffectsCommerce e c) :
    EngagedInInterstateCommerce (mapEnterprise_T18 e) c :=
  bridge_enterpriseAffectsCommerce_to_common h

theorem collapse_B1_modulo_guard
    {w : Proving.USC.T09.Elements.Award} {c : ComplaintText}
    (guard : guard_oneYearWindowMet (mapAwardMovant_T09 w) c)
    (h : Proving.USC.T09.Elements.WithinOneYearOfAward w c) :
    WithinLimitations (mapAwardMovant_T09 w) c :=
  bridge_withinOneYearOfAward_to_common guard h

theorem collapse_B2_modulo_guard
    {aw : Proving.USC.T09.Procedure.Award}
    {app : Proving.USC.T09.Procedure.Application} {c : ComplaintText}
    (guard : guard_oneYearWindowMet (mapAwardMovantProc_T09 aw) c)
    (h : Proving.USC.T09.Procedure.WithinOneYearWindow aw app c) :
    WithinLimitations (mapAwardMovantProc_T09 aw) c :=
  bridge_withinOneYearWindow_to_common guard h

theorem collapse_C1_clean
    {p : Person} {c : ComplaintText}
    (h : Proving.USC.T18.Wave.Deontic.ConspiredToViolate1962d p c) :
    AgreementAmongTwoOrMore (mapConspiracy_T18 p) c :=
  bridge_conspiredToViolate1962d_to_common h

end Proving.USC.Common.CrossWave
