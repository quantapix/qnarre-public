












import Proving.USC.T18.PredicateDefs.Ontology.Types
import Proving.USC.Common.Types

namespace Proving.USC.T18.PredicateDefs.Ontology

open Proving.USC.Common





axiom IsFinancialInstitution (x : FinancialInstitution) (c : ComplaintText) : Prop



axiom IsInsuredDepositoryInstitution (x : FinancialInstitution) (c : ComplaintText) : Prop



axiom IsInsuredCreditUnion (x : FinancialInstitution) (c : ComplaintText) : Prop



axiom IsFederalHomeLoanBank (x : FinancialInstitution) (c : ComplaintText) : Prop



axiom IsFarmCreditSystemInstitution (x : FinancialInstitution) (c : ComplaintText) : Prop



axiom IsSmallBusinessInvestmentCompany (x : FinancialInstitution) (c : ComplaintText) : Prop



axiom IsDepositoryHoldingCompany (x : FinancialInstitution) (c : ComplaintText) : Prop



axiom IsFederalReserveBank (x : FinancialInstitution) (c : ComplaintText) : Prop




axiom IsEdgeActOrganization (x : FinancialInstitution) (c : ComplaintText) : Prop



axiom IsForeignBankBranch (x : FinancialInstitution) (c : ComplaintText) : Prop



axiom IsMortgageLendingBusiness (x : FinancialInstitution) (c : ComplaintText) : Prop






axiom IsSchemeToDefraud (s : Scheme) (c : ComplaintText) : Prop




axiom IsHonestServicesDeprivation (s : Scheme) (c : ComplaintText) : Prop





axiom IsOfficialProceeding (x : OfficialProceeding) (c : ComplaintText) : Prop


axiom IsCourtProceeding (x : OfficialProceeding) (c : ComplaintText) : Prop

axiom IsCongressionalProceeding (x : OfficialProceeding) (c : ComplaintText) : Prop

axiom IsAgencyProceeding (x : OfficialProceeding) (c : ComplaintText) : Prop


axiom IsInsuranceProceeding (x : OfficialProceeding) (c : ComplaintText) : Prop




axiom IsPhysicalForce (x : PhysicalForceAct) (c : ComplaintText) : Prop



axiom IsMisleadingConduct (x : MisleadingConductAct) (c : ComplaintText) : Prop


axiom IsFalseStatement (x : MisleadingConductAct) (c : ComplaintText) : Prop


axiom IsMaterialOmission (x : MisleadingConductAct) (c : ComplaintText) : Prop

axiom IsFalseWritingReliance (x : MisleadingConductAct) (c : ComplaintText) : Prop

axiom IsMisleadingObjectReliance (x : MisleadingConductAct) (c : ComplaintText) : Prop

axiom IsTrickSchemeOrDevice (x : MisleadingConductAct) (c : ComplaintText) : Prop



axiom IsLawEnforcementOfficer (x : LawEnforcementOfficer) (c : ComplaintText) : Prop



axiom IsBodilyInjury (x : BodilyInjury) (c : ComplaintText) : Prop




axiom CorruptlyPersuades (x : CorruptPersuasionAct) (c : ComplaintText) : Prop




axiom IsMisleadingButForStateOfMind (x : CorruptPersuasionAct) (c : ComplaintText) : Prop



axiom IsCorruptly (x : CorruptlyAct) (c : ComplaintText) : Prop

end Proving.USC.T18.PredicateDefs.Ontology
