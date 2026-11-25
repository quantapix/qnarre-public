







import Proving.USC.T29.SelfOrgRep.Ontology.Types
import Proving.USC.T29.SelfOrgRep.Ontology.Predicates
import Proving.USC.T29.SelfOrgRep.Ontology.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T29.SelfOrgRep.Ontology

open Proving.USC.Common



theorem exclusiveRepresentativeMembership_intro
    {r : Representative} {u : BargainingUnit} {c : ComplaintText}
    (hRep : IsRepresentative r c)
    (hUnit : IsAppropriateBargainingUnit u c)
    (hExcl : IsExclusiveRepresentative r u c)
    : ExclusiveRepresentativeMembership r u c :=
  { isRep := hRep, unitAppropriate := hUnit, exclusive := hExcl }



theorem representationQuestionMembership_intro
    {q : RepresentationQuestion} {e : Entity} {c : ComplaintText}
    (hQuestion : IsRepresentationQuestion q c)
    (hCommerce : AffectsCommerce e c)
    : RepresentationQuestionMembership q e c :=
  { isQuestion := hQuestion, affectsCommerce := hCommerce }



theorem section157RightExercise_intro
    {p : Person} {c : ComplaintText}
    (hEmp : IsEmployee p c)
    (hConcerted : IsConcertedActivity p c)
    : Section157RightExercise p c :=
  { employee := hEmp, concerted := hConcerted }

end Proving.USC.T29.SelfOrgRep.Ontology
