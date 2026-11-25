












import Proving.USC.T18.CommercePredicates.Procedure.Types
import Proving.USC.Common.Types

namespace Proving.USC.T18.CommercePredicates.Procedure

open Proving.USC.Common









axiom LicenseRequiredInState (b : MoneyTransmittingBusiness) (c : ComplaintText) : Prop






axiom LicenseObtained (b : MoneyTransmittingBusiness) (c : ComplaintText) : Prop





axiom RegistrationRequired (b : MoneyTransmittingBusiness) (c : ComplaintText) : Prop





axiom RegistrationFiled (b : MoneyTransmittingBusiness) (c : ComplaintText) : Prop







axiom RegistrationWithinWindow (b : MoneyTransmittingBusiness) (c : ComplaintText) : Prop








axiom InterstateFacilityUsed (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T18.CommercePredicates.Procedure
