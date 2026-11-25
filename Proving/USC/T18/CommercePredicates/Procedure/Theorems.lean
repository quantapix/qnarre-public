







import Proving.USC.T18.CommercePredicates.Procedure.Statute
import Proving.USC.T18.CommercePredicates.Procedure.Predicates
import Proving.USC.T18.CommercePredicates.Procedure.Types
import Proving.USC.Common.Types

namespace Proving.USC.T18.CommercePredicates.Procedure

open Proving.USC.Common



theorem unlicensedOperation_intro {b c}
    (hReq : LicenseRequiredInState b c) (hNo : ¬ LicenseObtained b c) :
    UnlicensedOperation b c :=
  ⟨hReq, hNo⟩



theorem registrationDefault_intro {b c}
    (hReq : RegistrationRequired b c)
    (hNot : ¬ RegistrationFiled b c ∨ ¬ RegistrationWithinWindow b c) :
    RegistrationDefault b c :=
  ⟨hReq, hNot⟩



theorem offendingComplianceState_viaUnlicensed_intro {b c}
    (h : UnlicensedOperation b c) : OffendingComplianceState b c :=
  .viaUnlicensed h



theorem offendingComplianceState_viaRegistration_intro {b c}
    (h : RegistrationDefault b c) : OffendingComplianceState b c :=
  .viaRegistration h



theorem facilityUseOccurred_intro {p c}
    (hUsed : InterstateFacilityUsed p c) : FacilityUseOccurred p c :=
  ⟨hUsed⟩

end Proving.USC.T18.CommercePredicates.Procedure
