


































import Proving.Rico.Statute
import Proving.USC.Common.Types
import Proving.USC.T18.Wave.Elements.Statute

namespace Proving.USC.T18.WaveCalibBridge

open Proving.USC.Common



axiom mapPerson    : Person                            → Proving.Rico.Person
axiom mapEntity    : Entity                            → Proving.Rico.Entity
axiom mapComplaint : ComplaintText                     → Proving.Rico.ComplaintText
axiom mapAgreement : Agreement                         → Proving.Rico.Agreement
axiom mapActs      : List Proving.USC.T18.Wave.Elements.Act → List Proving.Rico.Act



namespace C

axiom corr_culpable {p c} :
    Proving.USC.T18.Wave.Elements.CulpablePersonCapableOfIntent p c →
    Proving.Rico.CulpablePersonCapableOfIntent (mapPerson p) (mapComplaint c)
axiom corr_enterprise {e c} :
    Proving.USC.T18.Wave.Elements.IsEnterprise e c →
    Proving.Rico.IsEnterprise (mapEntity e) (mapComplaint c)
axiom corr_commerce {e c} :
    Proving.USC.Common.EngagedInInterstateCommerce e c →
    Proving.Rico.EngagedInInterstateCommerce (mapEntity e) (mapComplaint c)
axiom corr_distinct {p e c} :
    Proving.USC.T18.Wave.Elements.PersonEnterpriseDistinct p e c →
    Proving.Rico.PersonEnterpriseDistinct (mapPerson p) (mapEntity e) (mapComplaint c)
axiom corr_associated {p e c} :
    Proving.USC.T18.Wave.Elements.EmployedOrAssociated p e c →
    Proving.Rico.EmployedOrAssociated (mapPerson p) (mapEntity e) (mapComplaint c)
axiom corr_conducts {p e c} :
    Proving.USC.T18.Wave.Elements.ConductsOrParticipates p e c →
    Proving.Rico.ConductsOrParticipates (mapPerson p) (mapEntity e) (mapComplaint c)


axiom corr_pattern {acts c} :
    (Proving.USC.T18.Wave.Elements.PatternOfRacketeering acts c ∨
     Proving.USC.T18.Wave.Elements.CollectionOfUnlawfulDebt acts c) →
    Proving.Rico.PatternOfRacketeering (mapActs acts) (mapComplaint c)



theorem cand_c_implies_golden_c
    {p e acts c} (h : Proving.USC.T18.Wave.Elements.Section1962c p e acts c) :
    Proving.Rico.Section1962c (mapPerson p) (mapEntity e) (mapActs acts) (mapComplaint c) :=
  ⟨corr_culpable h.culpable, corr_enterprise h.enterprise, corr_commerce h.interstateCommerce,
   corr_distinct h.distinct, corr_associated h.associated, corr_conducts h.conducts,
   corr_pattern h.racketeering⟩

end C














namespace D

axiom corr_culpable {p c} :
    Proving.USC.T18.Wave.Elements.CulpablePersonCapableOfIntent p c →
    Proving.Rico.CulpablePersonCapableOfIntent (mapPerson p) (mapComplaint c)


axiom corr_agreed {ag p c} :
    Proving.USC.Common.AgreementAmongTwoOrMore ag c →
    Proving.Rico.AgreementToViolateRico (mapPerson p) (mapAgreement ag) (mapComplaint c)







theorem cand_d_implies_golden_d_modulo_gaps
    {p ag obj c} (h : Proving.USC.T18.Wave.Elements.Section1962d p ag c obj)
    (gap_knew : Proving.Rico.KnowledgeOfRicoObjective (mapPerson p) (mapAgreement ag) (mapComplaint c))
    (gap_underlying : Proving.Rico.UnderlyingSubstantiveViolationContemplated (mapAgreement ag) (mapComplaint c)) :
    Proving.Rico.Section1962d (mapPerson p) (mapAgreement ag) (mapComplaint c) :=
  ⟨corr_culpable h.culpable, corr_agreed h.agreement, gap_knew, gap_underlying⟩

end D

end Proving.USC.T18.WaveCalibBridge
