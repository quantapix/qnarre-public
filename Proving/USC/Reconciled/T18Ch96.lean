
































import Proving.USC.T18.Ch96.Elements.Statute
import Proving.USC.T18.Ch96.Deontic.Statute
import Proving.USC.T18.Ch96.Ontology.Statute
import Proving.USC.T18.Ch96.Procedure.Statute
import Proving.USC.T18.Ch96.Structure.Statute

namespace Proving.USC.Reconciled

open Proving.USC.T18.Ch96


abbrev T18_1961_pattern      := Elements.PatternOfRacketeering
abbrev T18_1961_enterprise   := Elements.EnterpriseUnder1961_4
abbrev T18_1961_unlawfulDebt := Elements.IsUnlawfulDebt
abbrev T18_1961_pattern_ont  := Ontology.PatternMembership


abbrev T18_1962a := Elements.Section1962a
abbrev T18_1962b := Elements.Section1962b
abbrev T18_1962c := Elements.Section1962c
abbrev T18_1962d := Elements.Section1962d
abbrev T18_1962_violation := Elements.ViolationOfSection1962
abbrev T18_1962c_deontic  := Deontic.Prohibition1962cViolated


abbrev T18_1963_forfeiture   := Elements.CriminalForfeiture
abbrev T18_1963_thirdParty   := Elements.ValidThirdPartyPetition
abbrev T18_1963_ancillary    := Procedure.AncillaryForfeitureAdjudication
abbrev T18_1963_substitute   := Elements.SubstituteAssetForfeiture


abbrev T18_1964c_claim   := Elements.ValidCivilRicoClaim
abbrev T18_1964a_equit   := Elements.EquitableRicoClaim
abbrev T18_1964c_timely  := Procedure.TimelyCivilRicoAction


abbrev T18_1965a_venue   := Elements.ProperVenue
abbrev T18_1965_service  := Procedure.ValidCivilSubpoenaService


abbrev T18_1966_expedite := Procedure.ExpeditionSequence


abbrev T18_1967_closure  := Procedure.DiscretionaryClosure


abbrev T18_1968_demand    := Elements.ValidCivilInvestigativeDemand
abbrev T18_1968_issuance  := Procedure.ValidDemandIssuanceAndService
abbrev T18_1968h_petition := Elements.ValidCIDPetition

end Proving.USC.Reconciled
