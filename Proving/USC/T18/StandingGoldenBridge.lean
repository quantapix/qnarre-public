


























import Proving.USC.T18.Elements.Statute
import Proving.USC.T18.Remedy.Statute
import Proving.USC.T18.Procedure.Statute
import Proving.Rico.Statute

namespace Proving.USC.T18.StandingBridge
open Proving.USC.Common







axiom mapPerson    : Person                → Proving.Rico.Person
axiom mapEntity    : Entity                → Proving.Rico.Entity
axiom mapComplaint : ComplaintText         → Proving.Rico.ComplaintText
axiom mapActs      : List Elements.Act     → List Proving.Rico.Act



axiom corr_culpable {d c} : Elements.CulpablePersonCapableOfIntent d c →
    Proving.Rico.CulpablePersonCapableOfIntent (mapPerson d) (mapComplaint c)
axiom corr_enterprise {e c} : Elements.IsEnterprise e c →
    Proving.Rico.IsEnterprise (mapEntity e) (mapComplaint c)
axiom corr_commerce {e c} : Elements.EngagedInInterstateCommerce e c →
    Proving.Rico.EngagedInInterstateCommerce (mapEntity e) (mapComplaint c)
axiom corr_distinct {d e c} : Elements.PersonEnterpriseDistinct d e c →
    Proving.Rico.PersonEnterpriseDistinct (mapPerson d) (mapEntity e) (mapComplaint c)
axiom corr_associated {d e c} : Elements.EmployedOrAssociated d e c →
    Proving.Rico.EmployedOrAssociated (mapPerson d) (mapEntity e) (mapComplaint c)
axiom corr_conducts {d e c} : Elements.ConductsOrParticipates d e c →
    Proving.Rico.ConductsOrParticipates (mapPerson d) (mapEntity e) (mapComplaint c)
axiom corr_pattern {acts c} : Elements.PatternOfRacketeering acts c →
    Proving.Rico.PatternOfRacketeering (mapActs acts) (mapComplaint c)


theorem elements_implies_golden_violation
    {d : Person} {e : Entity} {acts : List Elements.Act} {c : ComplaintText}
    (h : Elements.Section1962c d e acts c) :
    Proving.Rico.Section1962c (mapPerson d) (mapEntity e) (mapActs acts) (mapComplaint c) :=
  ⟨corr_culpable h.culpable, corr_enterprise h.enterprise, corr_commerce h.interstateCommerce,
   corr_distinct h.distinct, corr_associated h.associated, corr_conducts h.conducts,
   corr_pattern h.pattern⟩









axiom corr_injury {pl c} : Remedy.InjuryCognizable pl c →
    Proving.Rico.BusinessOrPropertyInjury (mapPerson pl) (mapComplaint c)
axiom corr_causation {pl c} {acts : List Elements.Act} : Remedy.CausedByViolation pl c →
    Proving.Rico.ProximateCause (mapPerson pl) (mapActs acts) (mapComplaint c)
axiom corr_timely {pl c} : Procedure.WithinFourYearWindow pl c →
    Proving.Rico.WithinFourYearLimitationsPeriod (mapPerson pl) (mapComplaint c)







theorem cand_standing_implies_golden_1962c
    {pl d : Person} {e : Entity} {acts : List Elements.Act} {c : ComplaintText}
    (violation : Elements.Section1962c d e acts c)
    (standing : Remedy.Standing1964c pl c)
    (timely : Procedure.TimelyFiling pl c) :
    Proving.Rico.ValidCivilRicoComplaint1962c
      (mapPerson pl) (mapPerson d) (mapEntity e) (mapActs acts) (mapComplaint c) :=
  ⟨elements_implies_golden_violation violation,
   corr_injury standing.injury,
   corr_causation standing.causation,
   corr_timely timely.inWindow⟩

end Proving.USC.T18.StandingBridge
