

























































import Proving.USC.T42.Ch6ASchI.Part3.Elements.Statute
import Proving.USC.T42.Ch6ASchI.Part3.Ontology.Predicates
import Proving.USC.T42.Ch6ASchI.Part3.Procedure.Statute
import Proving.USC.Common.Types

namespace Proving.USC.Reconciled

open Proving.USC.Common (Person Entity ComplaintText)






abbrev Section233aExclusiveRemedy_p3 (p : Person) (c : ComplaintText) : Prop :=
  Proving.USC.T42.Ch6ASchI.Part3.Elements.Section233aExclusiveRemedy p c


abbrev Section233cFederalSubstitution_p3 (p : Person) (c : ComplaintText) : Prop :=
  Proving.USC.T42.Ch6ASchI.Part3.Elements.Section233cFederalSubstitution p c



abbrev Section234EmergencyResponderProtection_p3 (p : Person) (c : ComplaintText) : Prop :=
  Proving.USC.T42.Ch6ASchI.Part3.Elements.Section234EmergencyResponderProtection p c



abbrev Section238lRecovery_p3 (e : Entity) (c : ComplaintText) : Prop :=
  Proving.USC.T42.Ch6ASchI.Part3.Elements.Section238lRecovery e c



abbrev Section237ConteServiceMember_p3 (p : Person) (c : ComplaintText) : Prop :=
  Proving.USC.T42.Ch6ASchI.Part3.Ontology.IsConteServiceMember p c



abbrev Section218TimelyCouncilAppointment_p3 (c : ComplaintText) : Prop :=
  Proving.USC.T42.Ch6ASchI.Part3.Procedure.Sec218TimelyCouncilAppointment c





abbrev Section238gUniformViolation_p3 (p : Person) (c : ComplaintText) : Prop :=
  Proving.USC.T42.Ch6ASchI.Part3.Elements.Section238gUniformViolation p c

end Proving.USC.Reconciled
