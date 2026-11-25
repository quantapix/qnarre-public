










import Proving.USC.Common.Types
import Proving.USC.T22.Elements.Predicates

namespace Proving.USC.T22.Elements
open Proving.USC.Common






inductive Coercion (pr : Practice) (c : ComplaintText) : Prop where
  | threats      (h : CoercionThreatOfSeriousHarmOrRestraint pr c)
  | scheme       (h : CoercionSchemeToInduceFearOfHarm pr c)
  | legalProcess (h : IsAbuseOfLegalProcess pr c)


abbrev IsCoercion (pr : Practice) (c : ComplaintText) : Prop := Coercion pr c






inductive InvoluntaryServitude (pr : Practice) (c : ComplaintText) : Prop where
  | scheme       (h : ServitudeSchemeToInduceFearOfHarm pr c)
  | legalProcess (h : IsAbuseOfLegalProcess pr c)


abbrev IsInvoluntaryServitude (pr : Practice) (c : ComplaintText) : Prop :=
  InvoluntaryServitude pr c






inductive SexTraffickingSevere (pr : Practice) (c : ComplaintText) : Prop where
  | induced (hST : IsSexTrafficking pr c)
            (hForce : CommercialSexActInducedByForceFraudCoercion pr c)
  | minor   (hST : IsSexTrafficking pr c)
            (hAge : VictimUnderEighteen pr c)




structure LaborTraffickingSevere (pr : Practice) (c : ComplaintText) : Prop where
  act     : LaborServicesAct pr c
  means   : ThroughForceFraudCoercion pr c
  purpose : ForServitudePeonageDebtBondageOrSlavery pr c



inductive SevereFormOfTrafficking (pr : Practice) (c : ComplaintText) : Prop where
  | sex   (h : SexTraffickingSevere pr c)
  | labor (h : LaborTraffickingSevere pr c)


abbrev IsSevereFormOfTrafficking (pr : Practice) (c : ComplaintText) : Prop :=
  SevereFormOfTrafficking pr c





structure VictimOfSevereForm (p : Person) (pr : Practice) (c : ComplaintText) : Prop where
  subject : PersonSubjectToPractice p pr c
  severe  : SevereFormOfTrafficking pr c


abbrev IsVictimOfSevereFormOfTrafficking
    (p : Person) (pr : Practice) (c : ComplaintText) : Prop :=
  VictimOfSevereForm p pr c



inductive VictimOfTrafficking (p : Person) (pr : Practice) (c : ComplaintText) : Prop where
  | severe (h : VictimOfSevereForm p pr c)
  | sex    (hSubj : PersonSubjectToPractice p pr c) (hST : IsSexTrafficking pr c)


abbrev IsVictimOfTrafficking
    (p : Person) (pr : Practice) (c : ComplaintText) : Prop :=
  VictimOfTrafficking p pr c

end Proving.USC.T22.Elements
