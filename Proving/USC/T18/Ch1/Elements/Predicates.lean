






import Proving.USC.Common.Types
import Proving.USC.T18.Ch1.Elements.Types

namespace Proving.USC.T18.Ch1.Elements
open Proving.USC.Common




axiom CommitsOffenseAgainstUS (p : Person) (c : ComplaintText) : Prop



axiom OffenseAgainstUSCommitted (c : ComplaintText) : Prop



axiom AidsAbetsOffense (p : Person) (c : ComplaintText) : Prop



axiom WillfullyCausesOffendingAct (p : Person) (c : ComplaintText) : Prop





axiom KnowsOffenseCommitted (p : Person) (c : ComplaintText) : Prop


axiom AssistsOffender (p : Person) (c : ComplaintText) : Prop



axiom IntendsToHinderApprehension (p : Person) (c : ComplaintText) : Prop





axiom KnowsOfFelonyCommission (p : Person) (c : ComplaintText) : Prop


axiom ConcealsFelony (p : Person) (c : ComplaintText) : Prop



axiom FailsToDiscloseToAuthority (p : Person) (c : ComplaintText) : Prop




axiom SubjectToUSJurisdiction (loc : Location) (c : ComplaintText) : Prop



axiom IsCanalZone (loc : Location) (c : ComplaintText) : Prop





axiom IsDepartmentOfUS (e : Entity) (c : ComplaintText) : Prop




axiom IsAgencyOfUS (e : Entity) (c : ComplaintText) : Prop





axiom OnHighSeasOrUSVessel (loc : Location) (c : ComplaintText) : Prop



axiom OnGreatLakesVessel (loc : Location) (c : ComplaintText) : Prop



axiom OnUSReservedLands (loc : Location) (c : ComplaintText) : Prop


axiom OnGuanoIsland (loc : Location) (c : ComplaintText) : Prop


axiom OnUSAircraftInFlight (loc : Location) (c : ComplaintText) : Prop


axiom OnUSSpacecraftInFlight (loc : Location) (c : ComplaintText) : Prop



axiom OutsideAnyNationOffenseByAgainstUSNational (loc : Location) (c : ComplaintText) : Prop



axiom OnForeignVesselScheduledUSVoyage (loc : Location) (c : ComplaintText) : Prop



axiom AtUSGovMissionPremisesAbroad (loc : Location) (c : ComplaintText) : Prop





axiom IsObligationOrSecurityOfUS (instr : Instrument) (c : ComplaintText) : Prop





axiom IsVesselOfUS (v : Vessel) (c : ComplaintText) : Prop





axiom InvolvesInterstateCommerce (c : ComplaintText) : Prop


axiom InvolvesForeignCommerce (c : ComplaintText) : Prop





axiom IsForeignGovernment (e : Entity) (c : ComplaintText) : Prop





axiom IsPostalService (e : Entity) (c : ComplaintText) : Prop





axiom WithinFederalEnclaveOrTerritorialSea (loc : Location) (c : ComplaintText) : Prop


axiom CommittedActOrOmission (p : Person) (c : ComplaintText) : Prop



axiom PunishableByCongressEnactment (p : Person) (c : ComplaintText) : Prop



axiom PunishableUnderAssimilatedStateLaw (p : Person) (c : ComplaintText) : Prop



axiom DuiOffenseCommitted (p : Person) (c : ComplaintText) : Prop



axiom PersonOtherThanOffenderPresentInVehicle (c : ComplaintText) : Prop




axiom StateProvidesAdditionalTerm (c : ComplaintText) : Prop



axiom AgeOfPresentPerson (c : ComplaintText) : Nat

end Proving.USC.T18.Ch1.Elements
