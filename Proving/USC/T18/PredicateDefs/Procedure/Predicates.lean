













import Proving.USC.Common.Types
import Proving.USC.T18.PredicateDefs.Procedure.Types

namespace Proving.USC.T18.PredicateDefs.Procedure

open Proving.USC.Common






axiom IsOfficialProceeding (op : OfficialProceeding) (c : ComplaintText) : Prop







axiom BonaFideLegalRepresentation (op : OfficialProceeding) (c : ComplaintText) : Prop







axiom IsFinancialInstitution (e : Entity) (c : ComplaintText) : Prop





axiom IsSchemeToDefraud (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T18.PredicateDefs.Procedure
