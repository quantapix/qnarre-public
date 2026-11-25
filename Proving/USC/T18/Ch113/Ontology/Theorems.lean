






import Proving.USC.T18.Ch113.Ontology.Types
import Proving.USC.T18.Ch113.Ontology.Predicates
import Proving.USC.T18.Ch113.Ontology.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch113.Ontology

open Proving.USC.Common



theorem livestockMembership_intro {l ct c}
    (hCattle : IsCattle ct c) (hLivestock : IsLivestock l c)
    : LivestockMembership l ct c := ⟨hCattle, hLivestock⟩


theorem valueMembership_intro {v s m c}
    (hSec : IsSecurity s c) (hMoney : IsMoney m c) (hVal : IsValue v c)
    : ValueMembership v s m c := ⟨hSec, hMoney, hVal⟩


theorem protectedConveyance_motorVehicle_intro {mv : MotorVehicle} {c}
    (h : IsMotorVehicle mv c) : ProtectedConveyance c :=
  ProtectedConveyance.motorVehicle h


theorem protectedConveyance_vessel_intro {v : Vessel} {c}
    (h : IsVessel v c) : ProtectedConveyance c :=
  ProtectedConveyance.vessel h


theorem protectedConveyance_aircraft_intro {a : Aircraft} {c}
    (h : IsAircraft a c) : ProtectedConveyance c :=
  ProtectedConveyance.aircraft h

end Proving.USC.T18.Ch113.Ontology
