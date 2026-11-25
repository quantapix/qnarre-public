







import Proving.USC.Common.Types
import Proving.USC.T29.LMRA.Ontology.Types
import Proving.USC.T29.LMRA.Ontology.Predicates
import Proving.USC.T29.LMRA.Ontology.Statute

namespace Proving.USC.T29.LMRA.Ontology

open Proving.USC.Common


theorem isService_intro {s d c}
    (hS : IsService s c) (hD : IsDirector d c) : ServiceMembership s d c :=
  ⟨hS, hD⟩


theorem isLaborDispute_intro {disp e c}
    (hDisp : IsLaborDispute disp c) (hComm : AffectsCommerce e c)
    : LaborDisputeMembership disp e c :=
  ⟨hDisp, hComm⟩


theorem isNationalEmergency_intro {ned e b c}
    (hNed : IsNationalEmergencyDispute ned c) (hComm : AffectsCommerce e c)
    (hBoard : IsBoardOfInquiry b c)
    : NationalEmergencyMembership ned e b c :=
  ⟨hNed, hComm, hBoard⟩


theorem isHealthCareBoard_intro {b h c}
    (hBoard : IsBoardOfInquiry b c) (hInst : IsHealthCareInstitution h c)
    : HealthCareBoardMembership b h c :=
  ⟨hBoard, hInst⟩


theorem isCbaContract_intro {k emp org c}
    (hK : IsCbaContract k c) (hEmp : IsEmployerAffectingCommerce emp c)
    (hOrg : IsLaborOrganization org c)
    : CbaContractMembership k emp org c :=
  ⟨hK, hEmp, hOrg⟩


theorem isProhibitedPayment_intro {v r c}
    (hV : IsThingOfValue v c) (hR : IsEmployeeRepresentative r c)
    : ProhibitedPaymentMembership v r c :=
  ⟨hV, hR⟩


theorem isTrustFund_intro {tf r c}
    (hTf : IsTrustFund tf c) (hR : IsEmployeeRepresentative r c)
    : TrustFundMembership tf r c :=
  ⟨hTf, hR⟩


theorem isSection303_intro {org c}
    (hOrg : IsLaborOrganization org c) (hUlp : IsSection158b4UnfairLaborPractice c)
    : Section303Membership org c :=
  ⟨hOrg, hUlp⟩

end Proving.USC.T29.LMRA.Ontology
