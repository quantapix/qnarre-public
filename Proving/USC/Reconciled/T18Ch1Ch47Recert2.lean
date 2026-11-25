

















































































































import Proving.USC.T18.Ch1Ch47.Recert2.Elements.Statute
import Proving.USC.T18.Ch1Ch47.Recert2.Deontic.Statute
import Proving.USC.T18.Ch1Ch47.Recert2.Ontology.Statute
import Proving.USC.T18.Ch1Ch47.Recert2.Procedure.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.Reconciled

open Proving.USC.Common
open Proving.USC.T18.Ch1Ch47.Recert2









abbrev T18_s7_WithinSpecialMaritimeAndTerritorialJurisdiction
    (p : Person) (l : Elements.Locus) (o : Elements.Offense) (c : ComplaintText) : Prop :=
  Elements.SpecialMaritimeAndTerritorialJurisdiction p l o c



abbrev T18_s24a_IsFederalHealthCareOffense
    (o : Elements.Offense) (c : ComplaintText) : Prop :=
  Elements.FederalHealthCareOffense o c



abbrev T18_s24b_IsHealthCareBenefitProgram
    (hp : Elements.HealthCareProgram) (c : ComplaintText) : Prop :=
  Elements.HealthCareBenefitProgram hp c




abbrev T18_s1028a_ViolatesSection1028a
    (p : Person) (d : Elements.Document) (m : Elements.MeansOfIdentification)
    (o : Elements.Offense) (c : ComplaintText) : Prop :=
  Elements.Section1028a p d m o c




abbrev T18_s1029a_ViolatesSection1029a
    (p : Person) (ad : Elements.AccessDevice) (eq : Elements.Equipment)
    (o : Elements.Offense) (c : ComplaintText) : Prop :=
  Elements.Section1029a p ad eq o c








abbrev T18_s20_IsFinancialInstitution
    (i : Elements.Institution) (c : ComplaintText) : Prop :=
  Elements.FinancialInstitution i c




abbrev T18_s21_StolenOrCounterfeitNatureEstablished
    (p : Person) (pr : Elements.Property) (c : ComplaintText) : Prop :=
  Elements.StolenOrCounterfeitNatureElement p pr c




abbrev T18_s23_IsCourtOfTheUnitedStates
    (t : Elements.Tribunal) (c : ComplaintText) : Prop :=
  Elements.CourtOfTheUnitedStates t c

end Proving.USC.Reconciled
