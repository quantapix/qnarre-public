










import Proving.USC.Common.Types
import Proving.USC.T22.Elements.Sub.Types
import Proving.USC.T22.Elements.Sub.Predicates

namespace Proving.USC.T22.Elements.Sub

open Proving.USC.Common





structure ProhibitsAndPunishes (g : CountryGovernment) (c : ComplaintText) : Prop where
  prohibits : ProhibitsSevereFormsTrafficking g c
  punishes  : PunishesActsOfTrafficking g c



abbrev CriminalizesSevereTrafficking (g : CountryGovernment) (c : ComplaintText) : Prop :=
  ProhibitsAndPunishes g c






structure Section7103 (c : ComplaintText) : Prop where
  taskForce      : TaskForceEstablished c
  members        : MembersAppointed c
  chaired        : ChairedBySecretaryOfState c
  activities     : CarriesOutActivities c
  office         : OfficeToMonitorEstablished c
  operatingGroup : SeniorPolicyOperatingGroupEstablished c







structure Section7106 (g : CountryGovernment) (c : ComplaintText) : Prop where
  criminalizes : CriminalizesSevereTrafficking g c
  graveCrime   : PrescribesGraveCrimePunishment g c
  stringent    : PrescribesStringentPunishment g c
  efforts      : MakesSeriousAndSustainedEfforts g c

end Proving.USC.T22.Elements.Sub
