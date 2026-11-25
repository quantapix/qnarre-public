



























































import Proving.USC.T18.Ch1.Reslice.Elements.Statute
import Proving.USC.T18.Ch1.Reslice.Ontology.Statute
import Proving.USC.T18.Ch1.Reslice.Procedure.Statute
import Proving.USC.T18.Ch1.Reslice.Deontic.Statute
import Proving.USC.T18.Ch1.Reslice.Bridge
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.Reconciled

open Proving.USC.Common
open Proving.USC.T18.Ch1.Reslice























abbrev T18Ch1_Section7
    (l : Ontology.Locus) (o : Ontology.Offense) (d : Person) (c : ComplaintText) : Prop :=
  Ontology.SmtjCase l o d c














abbrev T18Ch1_Section20 (i : Elements.Institution) (c : ComplaintText) : Prop :=
  Elements.FinancialInstitution20 i c



abbrev T18Ch1_Section20_asOfOffense
    (i : Procedure.Institution) (pr : Procedure.Prosecution) (c : ComplaintText) : Prop :=
  Procedure.FinancialInstitutionStatusEstablished i pr c












abbrev T18Ch1_Section21
    (p : Person) (prop : Elements.Property) (off : Elements.Offense)
    (c : ComplaintText) : Prop :=
  Elements.Section21a p prop off c


abbrev T18Ch1_Section21b (rep : Elements.Representation) (c : ComplaintText) : Prop :=
  Elements.OfficialRepresentation rep c













abbrev T18Ch1_Section23
    (f : Procedure.Forum) (pr : Procedure.Prosecution) (c : ComplaintText) : Prop :=
  Procedure.ForumIsCourtOfTheUnitedStates f pr c


















abbrev T18Ch1_Section24a (off : Elements.Offense) (c : ComplaintText) : Prop :=
  Elements.FederalHealthCareOffense24a off c


abbrev T18Ch1_Section24b (prog : Elements.Program) (c : ComplaintText) : Prop :=
  Elements.HealthCareBenefitProgram24b prog c















end Proving.USC.Reconciled
