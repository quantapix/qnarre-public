











import Proving.USC.T18.CommercePredicates.Procedure.Types
import Proving.USC.T18.CommercePredicates.Procedure.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T18.CommercePredicates.Procedure

open Proving.USC.Common



structure Transition : Type where
  frm   : ComplianceState
  to    : ComplianceState
  guard : Prop







structure UnlicensedOperation (b : MoneyTransmittingBusiness) (c : ComplaintText) : Prop where
  licenseRequired  : LicenseRequiredInState b c
  noLicenseObtained : ¬ LicenseObtained b c







structure RegistrationDefault (b : MoneyTransmittingBusiness) (c : ComplaintText) : Prop where
  required : RegistrationRequired b c
  notTimely : ¬ RegistrationFiled b c ∨ ¬ RegistrationWithinWindow b c






inductive OffendingComplianceState (b : MoneyTransmittingBusiness) (c : ComplaintText) : Prop
  | viaUnlicensed (h : UnlicensedOperation b c) : OffendingComplianceState b c
  | viaRegistration (h : RegistrationDefault b c) : OffendingComplianceState b c






structure FacilityUseOccurred (p : Person) (c : ComplaintText) : Prop where
  used : InterstateFacilityUsed p c

end Proving.USC.T18.CommercePredicates.Procedure
