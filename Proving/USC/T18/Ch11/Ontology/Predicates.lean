







import Proving.USC.T18.Ch11.Ontology.Types

namespace Proving.USC.T18.Ch11.Ontology

open Proving.USC.Common







axiom IsPublicOfficial (p : Person) (c : ComplaintText) : Prop




axiom IsPersonSelectedToBePublicOfficial (p : Person) (c : ComplaintText) : Prop





axiom IsSpecialGovernmentEmployee (p : Person) (c : ComplaintText) : Prop




axiom IsOfficerOrEmployee (p : Person) (c : ComplaintText) : Prop




axiom IsMemberOfCongress (p : Person) (c : ComplaintText) : Prop



axiom IsSenator (p : Person) (c : ComplaintText) : Prop



axiom IsRepresentativeDelegateOrResidentCommissioner (p : Person) (c : ComplaintText) : Prop




axiom IsExaminer (p : Person) (c : ComplaintText) : Prop




axiom IsCoveredGovernmentPerson (p : Person) (c : ComplaintText) : Prop



axiom IsCongressionalEmployee (p : Person) (c : ComplaintText) : Prop




axiom IsExecutiveBranchEmployee (p : Person) (c : ComplaintText) : Prop




axiom IsCandidate (p : Person) (c : ComplaintText) : Prop







axiom IsOfficialAct (m : Matter) (c : ComplaintText) : Prop




axiom IsOfficialResponsibility (m : Matter) (c : ComplaintText) : Prop





axiom IsCoveredMatter (m : Matter) (c : ComplaintText) : Prop





axiom IsParticularMatter (m : Matter) (c : ComplaintText) : Prop





axiom IsParticipation (m : Matter) (c : ComplaintText) : Prop




axiom IsTradeNegotiation (m : Matter) (c : ComplaintText) : Prop




axiom IsTreaty (m : Matter) (c : ComplaintText) : Prop






axiom IsExecutiveBranch (e : Entity) (c : ComplaintText) : Prop




axiom IsJudicialBranch (e : Entity) (c : ComplaintText) : Prop




axiom IsLegislativeBranch (e : Entity) (c : ComplaintText) : Prop




axiom IsFederalFinancialInstitutionRegulatoryAgency (e : Entity) (c : ComplaintText) : Prop





axiom IsFinancialInstitution (e : Entity) (c : ComplaintText) : Prop





axiom IsClinicalTreatmentFacility (e : Entity) (c : ComplaintText) : Prop




axiom IsLaboratory (e : Entity) (c : ComplaintText) : Prop




axiom IsRecoveryHome (e : Entity) (c : ComplaintText) : Prop




axiom IsHealthCareBenefitProgram (e : Entity) (c : ComplaintText) : Prop





axiom IsForeignEntity (e : Entity) (c : ComplaintText) : Prop




axiom IsContinuingFinancialCrimesEnterprise (e : Entity) (c : ComplaintText) : Prop




axiom IsSportingContest (e : Entity) (c : ComplaintText) : Prop




axiom IsSchemeInCommerce (m : Matter) (c : ComplaintText) : Prop




axiom IsPerson (e : Entity) (c : ComplaintText) : Prop




axiom IsSecureOrRestrictedArea (e : Entity) (c : ComplaintText) : Prop






axiom IsLoan (t : Thing) (c : ComplaintText) : Prop




axiom IsRemuneration (t : Thing) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch11.Ontology
