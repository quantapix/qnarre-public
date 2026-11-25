




import Proving.USC.Common.Types
import Proving.USC.T18.Ch96.EchoReslice.Evidentiary.Types
import Proving.USC.T18.Ch96.EchoReslice.Evidentiary.Predicates
import Proving.USC.T18.Ch96.EchoReslice.Evidentiary.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch96.EchoReslice.Evidentiary

open Proving.USC.Common



theorem section1967Proceeding_civilAction_intro {c : ComplaintText}
    (h : CivilActionInstitutedByUnitedStates c) : Section1967Proceeding c :=
  Section1967Proceeding.civilAction h


theorem section1967Proceeding_ancillary_intro {c : ComplaintText}
    (h : ProceedingAncillaryToChapterAction c) : Section1967Proceeding c :=
  Section1967Proceeding.ancillary h



theorem presumptionSatisfied_of_none (c : ComplaintText) :
    PresumptionSatisfied Presumption.None c :=
  Or.inl (by intro h; cases h)


theorem proof1967Scope_intro {c : ComplaintText}
    (within : Section1967Proceeding c)
    (carried : BurdenCarried Allocation1967Scope.1 Allocation1967Scope.2.1 c) :
    Proof1967Scope c :=
  ⟨within, carried, presumptionSatisfied_of_none c⟩


theorem section1967RulingAuthorized_intro {r : AccessRuling} {c : ComplaintText}
    (scope : Proof1967Scope c)
    (considered : CourtConsideredRightsOfAffectedPersons c)
    (byCourt : AccessRulingMadeByCourt r c) :
    Section1967RulingAuthorized r c :=
  ⟨scope, considered, byCourt⟩


theorem section1967ConsiderationOmitted_intro {r : AccessRuling} {c : ComplaintText}
    (scope : Proof1967Scope c)
    (byCourt : AccessRulingMadeByCourt r c)
    (notConsidered : ¬ CourtConsideredRightsOfAffectedPersons c) :
    Section1967ConsiderationOmitted r c :=
  ⟨scope, byCourt, notConsidered⟩


theorem section1967ClosureGrounded_intro {c : ComplaintText} {p : Person}
    (scope : Proof1967Scope c)
    (affected : AffectedPersonRightsAtStake p c)
    (considered : CourtConsideredRightsOfAffectedPersons c)
    (closed : AccessRulingMadeByCourt AccessRuling.Closed c) :
    Section1967ClosureGrounded c :=
  ⟨scope, ⟨p, affected⟩, considered, closed⟩





theorem s1967_closure_unallocated :
    Allocation1967ClosureStatutory = Option.none := rfl




theorem s1967_closure_residual_fixed_beyond_bearer (c : ComplaintText) :
    (Allocation1967ClosureResidual c).2
      = (Standard.Preponderance, Presumption.None) := rfl




theorem s1967_authorization_ruling_independent
    {r r' : AccessRuling} {c : ComplaintText}
    (h : Section1967RulingAuthorized r c)
    (h' : AccessRulingMadeByCourt r' c) :
    Section1967RulingAuthorized r' c :=
  ⟨h.scope, h.considered, h'⟩




theorem s1967_authorized_excludes_omitted {r : AccessRuling} {c : ComplaintText}
    (h : Section1967RulingAuthorized r c)
    (d : Section1967ConsiderationOmitted r c) : False :=
  d.notConsidered h.considered

end Proving.USC.T18.Ch96.EchoReslice.Evidentiary
