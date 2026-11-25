






















































































import Proving.USC.T18.Ch77.Part3.Elements.Statute
import Proving.USC.T18.Ch77.Part3.Procedure.Statute
import Proving.USC.T18.Ch77.Part3.Deontic.Statute
import Proving.USC.T18.Ch77.Part3.Ontology.Statute
import Proving.USC.T18.Ch77.Part3.Structure.Statute
import Proving.USC.T18.Ch77.Part3.Bridge
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.Reconciled

open Proving.USC.Common













abbrev Section1593
    (d : Person) (o : T18.Ch77.Part3.Elements.Offense) (payee harmed : Person)
    (ord : T18.Ch77.Part3.Elements.RestitutionOrder) (c : ComplaintText) : Prop :=
  T18.Ch77.Part3.Elements.Section1593 d o payee harmed ord c











abbrev Section1593b4 (pr : T18.Ch77.Part3.Elements.Property) (c : ComplaintText) : Prop :=
  T18.Ch77.Part3.Elements.Section1593b4 pr c





abbrev Section1593Process
    (d payee victim : Person) (ord : T18.Ch77.Part3.Procedure.RestitutionOrder)
    (c : ComplaintText) : Prop :=
  T18.Ch77.Part3.Procedure.Section1593Compliant d payee victim ord c








theorem s1593_entitlement_discharges_courts_duty
    {d payee harmed : Person} {o : T18.Ch77.Part3.Elements.Offense}
    {ord : T18.Ch77.Part3.Elements.RestitutionOrder} {c : ComplaintText}
    (h : Section1593 d o payee harmed ord c) :
    T18.Ch77.Part3.Deontic.ObligationSatisfied1593b1
        (T18.Ch77.Part3.Bridge.mapOrderED ord) (T18.Ch77.Part3.Bridge.mapOffenceED o) d payee c
      ∧ T18.Ch77.Part3.Deontic.ObligationSatisfied1593b2 (T18.Ch77.Part3.Bridge.mapOrderED ord) c
      ∧ T18.Ch77.Part3.Deontic.ObligationSatisfied1593b3
          (T18.Ch77.Part3.Bridge.mapOrderED ord) (T18.Ch77.Part3.Bridge.mapOffenceED o) d harmed c :=
  T18.Ch77.Part3.Bridge.s1593_elements_implies_deontic_orderContent h

end Proving.USC.Reconciled
