



















































import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.CommercePredicates.Elements.Predicates
import Proving.USC.T18.CommercePredicates.Ontology.Predicates
import Proving.USC.T18.CommercePredicates.Structure.Predicates

namespace Proving.USC.Common.CrossWaveT18Ch95

open Proving.USC.Common


















axiom mapPersonToEntity : Person → Entity

axiom mapFacilityToEntity : Proving.USC.T18.CommercePredicates.Elements.CommerceFacility → Entity

axiom corr_traveledInterstate_to_common {p : Person} {c : ComplaintText} :
    Proving.USC.T18.CommercePredicates.Elements.TraveledInInterstateCommerce p c →
    EngagedInInterstateCommerce (mapPersonToEntity p) c
axiom corr_usedFacility_to_common
    {f : Proving.USC.T18.CommercePredicates.Elements.CommerceFacility} {c : ComplaintText} :
    Proving.USC.T18.CommercePredicates.Elements.UsedInterstateCommerceFacility f c →
    EngagedInInterstateCommerce (mapFacilityToEntity f) c




theorem collapse_traveledInterstate {p : Person} {c : ComplaintText}
    (h : Proving.USC.T18.CommercePredicates.Elements.TraveledInInterstateCommerce p c) :
    EngagedInInterstateCommerce (mapPersonToEntity p) c :=
  corr_traveledInterstate_to_common h


theorem collapse_usedFacility
    {f : Proving.USC.T18.CommercePredicates.Elements.CommerceFacility} {c : ComplaintText}
    (h : Proving.USC.T18.CommercePredicates.Elements.UsedInterstateCommerceFacility f c) :
    EngagedInInterstateCommerce (mapFacilityToEntity f) c :=
  corr_usedFacility_to_common h














axiom corr_intentThatMurder_to_common {p : Person} {c : ComplaintText} :
    Proving.USC.T18.CommercePredicates.Elements.IntentThatMurderCommitted p c → ActedWithScienter p c
axiom corr_knowinglyConductsMTB_to_common
    {p : Person} {b : Proving.USC.T18.CommercePredicates.Elements.MoneyTransmittingBusiness} {c : ComplaintText} :
    Proving.USC.T18.CommercePredicates.Elements.KnowinglyConductsMTB p b c → ActedWithScienter p c



theorem collapse_intentThatMurder {p : Person} {c : ComplaintText}
    (h : Proving.USC.T18.CommercePredicates.Elements.IntentThatMurderCommitted p c) :
    ActedWithScienter p c :=
  corr_intentThatMurder_to_common h




theorem collapse_knowinglyConductsMTB
    {p : Person} {b : Proving.USC.T18.CommercePredicates.Elements.MoneyTransmittingBusiness} {c : ComplaintText}
    (h : Proving.USC.T18.CommercePredicates.Elements.KnowinglyConductsMTB p b c) :
    ActedWithScienter p c :=
  corr_knowinglyConductsMTB_to_common h















axiom mapPersonToAgreement : Person → Agreement

axiom corr_conspiredMurderForHire_to_common {p : Person} {c : ComplaintText} :
    Proving.USC.T18.CommercePredicates.Elements.ConspiredToCommitMurderForHire p c →
    AgreementAmongTwoOrMore (mapPersonToAgreement p) c


theorem collapse_conspiredMurderForHire {p : Person} {c : ComplaintText}
    (h : Proving.USC.T18.CommercePredicates.Elements.ConspiredToCommitMurderForHire p c) :
    AgreementAmongTwoOrMore (mapPersonToAgreement p) c :=
  corr_conspiredMurderForHire_to_common h















def kindTag_t18Ch95 : Proving.USC.T18.CommercePredicates.Structure.EdgeKind → String
  | .Incorporates     => "Incorporates"
  | .SubjectTo        => "SubjectTo"
  | .Notwithstanding  => "Notwithstanding"
  | .ExceptAsProvided => "ExceptAsProvided"
  | .Savings          => "Savings"
  | .LexSpecialis     => "LexSpecialis"


def mapRef_T18Ch95 (r : Proving.USC.T18.CommercePredicates.Structure.Ref) : StructRef :=
  { source := r.source, target := r.target, kind := kindTag_t18Ch95 r.kind }


axiom guard_targetResolves
    (r : Proving.USC.T18.CommercePredicates.Structure.Ref) (c : ComplaintText) : Prop

axiom corr_referencedExists_to_common
    {r : Proving.USC.T18.CommercePredicates.Structure.Ref} {c : ComplaintText} :
    Proving.USC.T18.CommercePredicates.Structure.ReferencedSectionExists r c →
    StructuralReferenceCoheres (mapRef_T18Ch95 r) c
axiom corr_incorporationHonored_to_common
    {r : Proving.USC.T18.CommercePredicates.Structure.Ref} {c : ComplaintText} :
    guard_targetResolves r c →
    Proving.USC.T18.CommercePredicates.Structure.IncorporationHonored r c →
    StructuralReferenceCoheres (mapRef_T18Ch95 r) c


theorem collapse_referencedExists
    {r : Proving.USC.T18.CommercePredicates.Structure.Ref} {c : ComplaintText}
    (h : Proving.USC.T18.CommercePredicates.Structure.ReferencedSectionExists r c) :
    StructuralReferenceCoheres (mapRef_T18Ch95 r) c :=
  corr_referencedExists_to_common h





theorem collapse_incorporationHonored_modulo_guard
    {r : Proving.USC.T18.CommercePredicates.Structure.Ref} {c : ComplaintText}
    (hg : guard_targetResolves r c)
    (h : Proving.USC.T18.CommercePredicates.Structure.IncorporationHonored r c) :
    StructuralReferenceCoheres (mapRef_T18Ch95 r) c :=
  corr_incorporationHonored_to_common hg h

end Proving.USC.Common.CrossWaveT18Ch95
