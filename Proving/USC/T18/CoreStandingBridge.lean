













































import Proving.USC.T18.Core.Elements.Statute
import Proving.USC.T18.Enf.Elements.Statute
import Proving.Rico.Statute

namespace Proving.USC.T18.CoreStandingBridge

open Proving.USC.Common









axiom mapPerson    : Person                       → Proving.Rico.Person
axiom mapEntity    : Entity                       → Proving.Rico.Entity
axiom mapComplaint : ComplaintText                → Proving.Rico.ComplaintText
axiom mapActs      : List Core.Elements.Act        → List Proving.Rico.Act



axiom corr_culpable {p c} : Core.Elements.CulpablePersonCapableOfIntent p c →
    Proving.Rico.CulpablePersonCapableOfIntent (mapPerson p) (mapComplaint c)
axiom corr_enterprise {e c} : Core.Elements.IsEnterprise e c →
    Proving.Rico.IsEnterprise (mapEntity e) (mapComplaint c)
axiom corr_commerce {e c} : EngagedInInterstateCommerce e c →
    Proving.Rico.EngagedInInterstateCommerce (mapEntity e) (mapComplaint c)
axiom corr_distinct {p e c} : Core.Elements.PersonEnterpriseDistinct p e c →
    Proving.Rico.PersonEnterpriseDistinct (mapPerson p) (mapEntity e) (mapComplaint c)
axiom corr_associated {p e c} : Core.Elements.EmployedOrAssociated p e c →
    Proving.Rico.EmployedOrAssociated (mapPerson p) (mapEntity e) (mapComplaint c)
axiom corr_conducts {p e c} : Core.Elements.ConductsOrParticipates p e c →
    Proving.Rico.ConductsOrParticipates (mapPerson p) (mapEntity e) (mapComplaint c)
axiom corr_pattern {acts c} : Core.Elements.PatternOfRacketeering acts c →
    Proving.Rico.PatternOfRacketeering (mapActs acts) (mapComplaint c)
axiom corr_debtAsPattern {acts : List Core.Elements.Act}
    {d : Core.Elements.UnlawfulDebt} {c : ComplaintText} :
    Core.Elements.CollectionOfUnlawfulDebt d c →
    Proving.Rico.PatternOfRacketeering (mapActs acts) (mapComplaint c)

theorem basis_toGoldenPattern {acts : List Core.Elements.Act}
    {d : Core.Elements.UnlawfulDebt} {c : ComplaintText}
    (h : Core.Elements.PredicateBasis acts d c) :
    Proving.Rico.PatternOfRacketeering (mapActs acts) (mapComplaint c) := by
  cases h with
  | pattern hp      => exact corr_pattern hp
  | unlawfulDebt hd => exact corr_debtAsPattern hd





theorem core_elements_implies_golden_1962c
    {d : Person} {e : Entity} {acts : List Core.Elements.Act}
    {dbt : Core.Elements.UnlawfulDebt} {c : ComplaintText}
    (h : Core.Elements.Section1962c d e acts dbt c) :
    Proving.Rico.Section1962c (mapPerson d) (mapEntity e) (mapActs acts) (mapComplaint c) :=
  ⟨corr_culpable h.culpable, corr_enterprise h.enterprise,
   corr_commerce h.interstateCommerce, corr_distinct h.distinct,
   corr_associated h.associated, corr_conducts h.conducts,
   basis_toGoldenPattern h.basis⟩








axiom corr_injury {pl c} :
    Enf.Elements.InjuredInBusinessOrProperty pl c →
    Proving.Rico.BusinessOrPropertyInjury (mapPerson pl) (mapComplaint c)
axiom corr_causation {pl c} {acts : List Core.Elements.Act} :
    ProximateCause pl c →
    Proving.Rico.ProximateCause (mapPerson pl) (mapActs acts) (mapComplaint c)
axiom corr_timely {pl c} :
    WithinLimitations pl c →
    Proving.Rico.WithinFourYearLimitationsPeriod (mapPerson pl) (mapComplaint c)














theorem s1964c_standing_implies_golden_FULL
    {pl defendant : Person} {e : Entity}
    {acts : List Core.Elements.Act}
    {dbt : Core.Elements.UnlawfulDebt} {c : ComplaintText}
    (violation : Core.Elements.Section1962c defendant e acts dbt c)
    (standing : Enf.Elements.Section1964c pl c) :
    Proving.Rico.ValidCivilRicoComplaint1962c
      (mapPerson pl) (mapPerson defendant) (mapEntity e) (mapActs acts) (mapComplaint c) :=
  ⟨core_elements_implies_golden_1962c violation,
   corr_injury standing.injury,
   corr_causation standing.byReasonOf,
   corr_timely standing.timely⟩

end Proving.USC.T18.CoreStandingBridge
