





























import Proving.USC.T18.Ch113.Elements.Statute
import Proving.USC.T18.Ch113.Deontic.Statute
import Proving.USC.T18.Ch113.Ontology.Statute
import Proving.USC.T18.Ch113.Procedure.Statute
import Proving.USC.T18.Ch113.Structure.Statute
import Proving.USC.Common.Predicates

namespace Proving.USC.T18.Ch113.Bridge
open Proving.USC.Common








axiom mapMV  : Elements.Instrument → Ontology.MotorVehicle
axiom mapVes : Elements.Instrument → Ontology.Vessel
axiom mapAir : Elements.Instrument → Ontology.Aircraft


axiom corr_mv {i : Elements.Instrument} {c : ComplaintText} :
    Elements.IsMotorVehicle i c → Ontology.IsMotorVehicle (mapMV i) c

axiom corr_ves {i : Elements.Instrument} {c : ComplaintText} :
    Elements.IsVessel i c → Ontology.IsVessel (mapVes i) c

axiom corr_air {i : Elements.Instrument} {c : ComplaintText} :
    Elements.IsAircraft i c → Ontology.IsAircraft (mapAir i) c




theorem s2311_elements_implies_ontology {i : Elements.Instrument} {c : ComplaintText}
    (h : Elements.IsCoveredInstrument i c) : Ontology.ProtectedConveyance c :=
  match h with
  | .motorVehicle hm => .motorVehicle (corr_mv hm)
  | .vessel       hv => .vessel       (corr_ves hv)
  | .aircraft     ha => .aircraft     (corr_air ha)




axiom mapConv : Elements.Instrument → Deontic.Conveyance


axiom corr_addr2312 (p : Person) (c : ComplaintText) : Deontic.AddresseeInClass2312 p c


axiom corr_act2312 {p : Person} {i : Elements.Instrument} {c : ComplaintText} :
    Elements.Transports p i c → Elements.TransportedInInterstateCommerce i c →
    Deontic.RegulatedActOccurred2312 p (mapConv i) c

axiom corr_cond2312 {p : Person} {i : Elements.Instrument} {c : ComplaintText} :
    Elements.InstrumentWasStolen i c → ActedWithScienter p c →
    Deontic.ConditionMet2312 p (mapConv i) c


theorem s2312_elements_implies_deontic {p : Person} {i : Elements.Instrument} {c : ComplaintText}
    (h : Elements.Section2312 p i c) : Deontic.ProhibitionViolated2312 p (mapConv i) c :=
  ⟨⟨corr_addr2312 p c, corr_cond2312 h.stolen h.scienter⟩, corr_act2312 h.transports h.commerce⟩


axiom corr_p_stolen2312 {p : Person} {i : Elements.Instrument} {c : ComplaintText} :
    Elements.InstrumentWasStolen i c → Procedure.PropertyStolen p c

axiom corr_p_trans2312 {p : Person} {i : Elements.Instrument} {c : ComplaintText} :
    Elements.TransportedInInterstateCommerce i c → Procedure.TransportedInInterstateCommerce p c


theorem s2312_elements_implies_procedure {p : Person} {i : Elements.Instrument} {c : ComplaintText}
    (h : Elements.Section2312 p i c) : Procedure.TransportationPenaltyReached p c :=
  ⟨corr_p_stolen2312 h.stolen, corr_p_trans2312 h.commerce⟩


axiom corr_dp_stolen2312 {p : Person} {v : Deontic.Conveyance} {c : ComplaintText} :
    Deontic.ConditionMet2312 p v c → Procedure.PropertyStolen p c

axiom corr_dp_trans2312 {p : Person} {v : Deontic.Conveyance} {c : ComplaintText} :
    Deontic.RegulatedActOccurred2312 p v c → Procedure.TransportedInInterstateCommerce p c


theorem s2312_deontic_implies_procedure {p : Person} {v : Deontic.Conveyance} {c : ComplaintText}
    (h : Deontic.ProhibitionViolated2312 p v c) : Procedure.TransportationPenaltyReached p c :=
  ⟨corr_dp_stolen2312 h.1.condition, corr_dp_trans2312 h.2⟩




axiom corr_addr2313 (p : Person) (c : ComplaintText) : Deontic.AddresseeInClass2313 p c

axiom corr_act2313 {p : Person} {i : Elements.Instrument} {c : ComplaintText} :
    Elements.Section2313Act p i c → Deontic.RegulatedActOccurred2313 p (mapConv i) c

axiom corr_cond2313 {p : Person} {i : Elements.Instrument} {c : ComplaintText} :
    Elements.InstrumentWasStolen i c → Elements.CrossedStateBoundary i c →
    ActedWithScienter p c → Deontic.ConditionMet2313 p (mapConv i) c


theorem s2313_elements_implies_deontic {p : Person} {i : Elements.Instrument} {c : ComplaintText}
    (h : Elements.Section2313 p i c) : Deontic.ProhibitionViolated2313 p (mapConv i) c :=
  ⟨⟨corr_addr2313 p c, corr_cond2313 h.stolen h.crossed h.scienter⟩, corr_act2313 h.act⟩


axiom corr_p_stolen2313 {p : Person} {i : Elements.Instrument} {c : ComplaintText} :
    Elements.InstrumentWasStolen i c → Procedure.PropertyStolen p c


axiom corr_p_crossed2313 {i : Elements.Instrument} {c : ComplaintText} :
    Elements.CrossedStateBoundary i c → Procedure.CrossedBoundaryAfterTheft c

axiom corr_p_poss2313 {p : Person} {i : Elements.Instrument} {c : ComplaintText} :
    Elements.Section2313Act p i c → Procedure.PossessoryActOccurred p c


theorem s2313_elements_implies_procedure {p : Person} {i : Elements.Instrument} {c : ComplaintText}
    (h : Elements.Section2313 p i c) : Procedure.ReceiptPenaltyReached p c :=
  ⟨corr_p_stolen2313 h.stolen, corr_p_crossed2313 h.crossed, corr_p_poss2313 h.act⟩


axiom corr_dp_stolen2313 {p : Person} {v : Deontic.Conveyance} {c : ComplaintText} :
    Deontic.ConditionMet2313 p v c → Procedure.PropertyStolen p c


axiom corr_dp_crossed2313 {p : Person} {v : Deontic.Conveyance} {c : ComplaintText} :
    Deontic.ConditionMet2313 p v c → Procedure.CrossedBoundaryAfterTheft c

axiom corr_dp_poss2313 {p : Person} {v : Deontic.Conveyance} {c : ComplaintText} :
    Deontic.RegulatedActOccurred2313 p v c → Procedure.PossessoryActOccurred p c


theorem s2313_deontic_implies_procedure {p : Person} {v : Deontic.Conveyance} {c : ComplaintText}
    (h : Deontic.ProhibitionViolated2313 p v c) : Procedure.ReceiptPenaltyReached p c :=
  ⟨corr_dp_stolen2313 h.1.condition, corr_dp_crossed2313 h.1.condition, corr_dp_poss2313 h.2⟩

end Proving.USC.T18.Ch113.Bridge
