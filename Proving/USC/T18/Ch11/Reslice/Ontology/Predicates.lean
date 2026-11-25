import Proving.USC.Common.Types
import Proving.USC.T18.Ch11.Reslice.Ontology.Types

set_option autoImplicit false
set_option relaxedAutoImplicit false











namespace Proving.USC.T18.Ch11.Reslice.Ontology

open Proving.USC.Common





axiom IsPublicOfficial (p : Person) (c : ComplaintText) : Prop



axiom IsPersonSelectedToBePublicOfficial (p : Person) (c : ComplaintText) : Prop



axiom IsSpecialGovernmentEmployee (p : Person) (c : ComplaintText) : Prop




axiom IsOfficerOrEmployee (p : Person) (c : ComplaintText) : Prop



axiom IsMemberOfCongress (p : Person) (c : ComplaintText) : Prop



axiom IsExaminer (p : Person) (c : ComplaintText) : Prop



axiom IsCoveredGovernmentPerson (p : Person) (c : ComplaintText) : Prop







axiom IsFinancialInstitution (o : Organization) (c : ComplaintText) : Prop



axiom IsFederalFinancialInstitutionRegulatoryAgency (o : Organization) (c : ComplaintText) : Prop




axiom IsForeignEntity (o : Organization) (c : ComplaintText) : Prop



axiom IsHealthCareBenefitProgram (o : Organization) (c : ComplaintText) : Prop



axiom IsClinicalTreatmentFacility (o : Organization) (c : ComplaintText) : Prop



axiom IsRecoveryHome (o : Organization) (c : ComplaintText) : Prop



axiom IsLaboratory (o : Organization) (c : ComplaintText) : Prop




axiom IsContinuingFinancialCrimesEnterprise (o : Organization) (c : ComplaintText) : Prop



axiom IsPoliticalParty (o : Organization) (c : ComplaintText) : Prop





axiom IsOfficialAct (a : OfficialAct) (c : ComplaintText) : Prop



axiom IsOfficialResponsibility (r : OfficialResponsibility) (c : ComplaintText) : Prop



axiom IsCoveredMatter (m : Matter) (c : ComplaintText) : Prop



axiom IsParticularMatter (m : Matter) (c : ComplaintText) : Prop




axiom IsThingOfValue (t : ThingOfValue) (c : ComplaintText) : Prop



axiom IsSchemeInCommerce (s : SchemeInCommerce) (c : ComplaintText) : Prop



axiom IsSportingContest (s : SportingContest) (c : ComplaintText) : Prop



axiom IsSecureOrRestrictedArea (a : SecureOrRestrictedArea) (c : ComplaintText) : Prop



axiom IsTradeNegotiation (t : TradeNegotiation) (c : ComplaintText) : Prop



axiom IsTreaty (t : Treaty) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch11.Reslice.Ontology
