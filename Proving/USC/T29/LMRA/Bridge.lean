
























import Proving.USC.T29.LMRA.Elements.Statute
import Proving.USC.T29.LMRA.Deontic.Statute
import Proving.USC.T29.LMRA.Ontology.Statute
import Proving.USC.T29.LMRA.Procedure.Statute
import Proving.USC.T29.LMRA.Structure.Statute
import Proving.USC.Common.Predicates

namespace Proving.USC.T29.LMRA.Bridge
open Proving.USC.Common








axiom corr187_addressee {p : Person} {c : ComplaintText} :
    Elements.EngagedInSection158b4Conduct p c → Deontic.IsLaborOrganizationAddressee p c



axiom corr187_act {p : Person} {c : ComplaintText} :
    Elements.EngagedInSection158b4Conduct p c → Deontic.SecondaryBoycottActOccurred p c




theorem s187_elements_implies_deontic
    {p : Person} {lo : Entity} {c : ComplaintText}
    (h : Elements.Section187 p lo c)
    : Deontic.Prohibition187aViolated p c :=
  ⟨⟨corr187_addressee h.unlawfulConduct⟩, corr187_act h.unlawfulConduct⟩


axiom corr187_o_ulp {p : Person} {c : ComplaintText} :
    Elements.EngagedInSection158b4Conduct p c → Ontology.IsSection158b4UnfairLaborPractice c


axiom corr187_o_laborOrg {lo : Entity} {c : ComplaintText} :
    Ontology.IsLaborOrganization lo c




theorem s187_elements_implies_ontology
    {p : Person} {lo : Entity} {c : ComplaintText}
    (h : Elements.Section187 p lo c)
    : Ontology.Section303Membership lo c :=
  ⟨corr187_o_laborOrg, corr187_o_ulp h.unlawfulConduct⟩


axiom corr187_do_ulp {p : Person} {c : ComplaintText} :
    Deontic.SecondaryBoycottActOccurred p c → Ontology.IsSection158b4UnfairLaborPractice c



theorem s187_deontic_implies_ontology
    {p : Person} {lo : Entity} {c : ComplaintText}
    (h : Deontic.Prohibition187aViolated p c)
    : Ontology.Section303Membership lo c :=
  ⟨corr187_o_laborOrg, corr187_do_ulp h.2⟩








axiom corr186_addressee {p : Person} {pay : Elements.Payment} {c : ComplaintText} :
    Elements.CoveredPayerAndPayee pay c → Deontic.IsEmployerSidePayor p c



axiom corr186_noExemption {pay : Elements.Payment} {t : Deontic.ThingOfValue} {c : ComplaintText} :
    Elements.NotWithinSection186cException pay c → ¬ Deontic.Section186cExemptionApplies t c



axiom corr186_act {p : Person} {pay : Elements.Payment} {t : Deontic.ThingOfValue} {c : ComplaintText} :
    Elements.IsProhibitedPayment pay c → Deontic.PaymentActOccurred p t c





theorem s186_elements_implies_deontic
    {p : Person} {pay : Elements.Payment} {t : Deontic.ThingOfValue} {c : ComplaintText}
    (h : Elements.Section186 p pay c)
    : Deontic.Prohibition186aViolated p t c :=
  ⟨⟨corr186_addressee h.covered, corr186_noExemption h.noException⟩,
   corr186_act h.prohibited⟩


axiom corr186_o_value {pay : Elements.Payment} {v : Ontology.ThingOfValue} {c : ComplaintText} :
    Elements.IsProhibitedPayment pay c → Ontology.IsThingOfValue v c


axiom corr186_o_rep {pay : Elements.Payment} {r : Ontology.EmployeeRepresentative} {c : ComplaintText} :
    Elements.CoveredPayerAndPayee pay c → Ontology.IsEmployeeRepresentative r c




theorem s186_elements_implies_ontology
    {p : Person} {pay : Elements.Payment} {v : Ontology.ThingOfValue}
    {r : Ontology.EmployeeRepresentative} {c : ComplaintText}
    (h : Elements.Section186 p pay c)
    : Ontology.ProhibitedPaymentMembership v r c :=
  ⟨corr186_o_value h.prohibited, corr186_o_rep h.covered⟩







axiom corr185_o_contract {k : Elements.LaborContract} {k' : Ontology.CbaContract} {c : ComplaintText} :
    Elements.IsSection301Contract k c → Ontology.IsCbaContract k' c


axiom corr185_o_employer {e : Entity} {emp : Ontology.Employer} {c : ComplaintText} :
    EngagedInInterstateCommerce e c → Ontology.IsEmployerAffectingCommerce emp c


axiom corr185_o_laborOrg {org : Ontology.LaborOrganization} {c : ComplaintText} :
    Ontology.IsLaborOrganization org c




theorem s185_elements_implies_ontology
    {p : Person} {e : Entity} {k : Elements.LaborContract}
    {k' : Ontology.CbaContract} {emp : Ontology.Employer} {org : Ontology.LaborOrganization}
    {c : ComplaintText}
    (h : Elements.Section185 p e k c)
    : Ontology.CbaContractMembership k' emp org c :=
  ⟨corr185_o_contract h.coveredContract, corr185_o_employer h.industryCommerce,
   corr185_o_laborOrg⟩








axiom corr178_industry {cp : Procedure.CourtProceeding} {w : Elements.WorkStoppage} {c : ComplaintText} :
    Procedure.EmergencyFindingsMade cp c → Elements.AffectsEntireIndustry w c


axiom corr178_imperils {cp : Procedure.CourtProceeding} {w : Elements.WorkStoppage} {c : ComplaintText} :
    Procedure.EmergencyFindingsMade cp c → Elements.ImperilsNationalHealthOrSafety w c


axiom corr178_procedure {pr : Procedure.EmergencyProceeding} {b : Procedure.BoardOfInquiry}
    {cp : Procedure.CourtProceeding} {c : ComplaintText} :
    Procedure.AppointBoardStep pr b c → Procedure.EnterInjunctionStep pr b cp c →
    Elements.BoardOfInquiryReportAndPetition c





theorem s178_procedure_implies_elements
    {pr : Procedure.EmergencyProceeding} {b : Procedure.BoardOfInquiry}
    {cp : Procedure.CourtProceeding} {w : Elements.WorkStoppage} {c : ComplaintText}
    (hAppoint : Procedure.AppointBoardStep pr b c)
    (hEnter : Procedure.EnterInjunctionStep pr b cp c)
    : Elements.Section178 w c :=
  ⟨corr178_industry hEnter.findings, corr178_imperils hEnter.findings,
   corr178_procedure hAppoint hEnter⟩









def kindTag : Structure.EdgeKind → String
  | .Incorporates     => "Incorporates"
  | .SubjectTo        => "SubjectTo"
  | .Notwithstanding  => "Notwithstanding"
  | .ExceptAsProvided => "ExceptAsProvided"
  | .Savings          => "Savings"
  | .LexSpecialis     => "LexSpecialis"



def toStructRef (r : Structure.Ref) : StructRef :=
  { source := r.source, target := r.target, kind := kindTag r.kind }



axiom corr_struct_referencedExists {r : Structure.Ref} {c : ComplaintText} :
    Structure.ReferencedSectionExists r c → StructuralReferenceCoheres (toStructRef r) c

axiom corr_struct_incorporation {r : Structure.Ref} {c : ComplaintText} :
    Structure.IncorporationHonored r c → StructuralReferenceCoheres (toStructRef r) c





theorem s187_structure_implies_common
    {c : ComplaintText} (h : Structure.Coherent187 c)
    : StructuralReferenceCoheres (toStructRef Structure.edge_187a_incorporates_158b4) c
      ∧ StructuralReferenceCoheres (toStructRef Structure.edge_187b_subjectTo_185) c :=
  ⟨corr_struct_incorporation h.ulpDefIncorporated,
   corr_struct_referencedExists h.s185Limitations⟩

end Proving.USC.T29.LMRA.Bridge
