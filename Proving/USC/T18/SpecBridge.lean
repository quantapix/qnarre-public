


























import Proving.USC.T18.Spec.Remedy.Statute
import Proving.USC.T18.Spec.Scienter.Statute
import Proving.USC.T18.Spec.Sanction.Statute
import Proving.USC.T18.Remedy.Statute
import Proving.USC.T18.Elements.Statute
import Proving.USC.T18.Procedure.Statute
import Proving.USC.T18.Enf.Elements.Statute
import Proving.Rico.Statute

namespace Proving.USC.T18.SpecBridge
open Proving.USC.Common



















axiom corrR_privateRight {p : Person} {c : ComplaintText} :
    Spec.Remedy.HasPrivateRightOfAction p c → Remedy.HasPrivateRightOfAction p c

axiom corrR_injury {p : Person} {c : ComplaintText} :
    Spec.Remedy.InjuryCognizable p c → Remedy.InjuryCognizable p c

axiom corrR_causation {p : Person} {c : ComplaintText} :
    Spec.Remedy.CausedByViolation p c → Remedy.CausedByViolation p c







theorem remedy_blind_implies_anchor_standing
    {p : Person} {c : ComplaintText}
    (h : Spec.Remedy.Standing1964c p c) :
    Remedy.Standing1964c p c :=
  ⟨corrR_privateRight h.privateRight, corrR_injury h.injury, corrR_causation h.causation⟩









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

private theorem elements_implies_golden_violation
    {d : Person} {e : Entity} {acts : List Elements.Act} {c : ComplaintText}
    (h : Elements.Section1962c d e acts c) :
    Proving.Rico.Section1962c (mapPerson d) (mapEntity e) (mapActs acts) (mapComplaint c) :=
  ⟨corr_culpable h.culpable, corr_enterprise h.enterprise, corr_commerce h.interstateCommerce,
   corr_distinct h.distinct, corr_associated h.associated, corr_conducts h.conducts,
   corr_pattern h.pattern⟩


axiom corrG_injury {pl c} : Spec.Remedy.InjuryCognizable pl c →
    Proving.Rico.BusinessOrPropertyInjury (mapPerson pl) (mapComplaint c)


axiom corrG_causation {pl c} {acts : List Elements.Act} : Spec.Remedy.CausedByViolation pl c →
    Proving.Rico.ProximateCause (mapPerson pl) (mapActs acts) (mapComplaint c)

axiom corrG_timely {pl c} : Procedure.WithinFourYearWindow pl c →
    Proving.Rico.WithinFourYearLimitationsPeriod (mapPerson pl) (mapComplaint c)









theorem remedy_blind_implies_golden_standing_1962c
    {pl d : Person} {e : Entity} {acts : List Elements.Act} {c : ComplaintText}
    (violation : Elements.Section1962c d e acts c)
    (standing : Spec.Remedy.Standing1964c pl c)
    (timely : Procedure.TimelyFiling pl c) :
    Proving.Rico.ValidCivilRicoComplaint1962c
      (mapPerson pl) (mapPerson d) (mapEntity e) (mapActs acts) (mapComplaint c) :=
  ⟨elements_implies_golden_violation violation,
   corrG_injury standing.injury,
   @corrG_causation pl c acts standing.causation,
   corrG_timely timely.inWindow⟩











axiom corrS_culpable {p : Person} {c : ComplaintText} :
    Spec.Scienter.Scienter1962c p c →
    Proving.Rico.CulpablePersonCapableOfIntent (mapPerson p) (mapComplaint c)






theorem scienter_blind_implies_golden_culpable
    {p : Person} {c : ComplaintText}
    (h : Spec.Scienter.Scienter1962c p c) :
    Proving.Rico.CulpablePersonCapableOfIntent (mapPerson p) (mapComplaint c) :=
  corrS_culpable h














axiom corrSanc_property {p : Person} {prop : Enf.Elements.Property} {c : ComplaintText} :
    Spec.Sanction.WithinForfeitureReach c →
    Enf.Elements.PropertySubjectToForfeiture prop p c









theorem sanction_blind_implies_enf_section1963_modulo_gaps
    {p : Person} {prop : Enf.Elements.Property} {c : ComplaintText}
    (h : Spec.Sanction.Sanction1963aForfeiture c)
    (gap_conviction : Enf.Elements.ConvictedOfSection1962 p c) :
    Enf.Elements.Section1963 p prop c :=
  ⟨gap_conviction, corrSanc_property h.inReach⟩




















end Proving.USC.T18.SpecBridge
