


















import Proving.USC.Common.Types
import Proving.USC.T18.PredicateDefs.Elements.Types

namespace Proving.USC.T18.PredicateDefs.Elements

open Proving.USC.Common





axiom FIInsuredDepository (i : Institution) (c : ComplaintText) : Prop


axiom FICreditUnion (i : Institution) (c : ComplaintText) : Prop


axiom FIFederalHomeLoanBank (i : Institution) (c : ComplaintText) : Prop


axiom FIFarmCreditSystem (i : Institution) (c : ComplaintText) : Prop


axiom FISmallBusinessInvestmentCompany (i : Institution) (c : ComplaintText) : Prop


axiom FIDepositoryHoldingCompany (i : Institution) (c : ComplaintText) : Prop


axiom FIFederalReserveBank (i : Institution) (c : ComplaintText) : Prop


axiom FIEdgeActOrganization (i : Institution) (c : ComplaintText) : Prop


axiom FIForeignBankBranch (i : Institution) (c : ComplaintText) : Prop



axiom FIMortgageLendingBusiness (i : Institution) (c : ComplaintText) : Prop







axiom DeprivesHonestServices (s : Scheme) (c : ComplaintText) : Prop






axiom OPFederalCourt (pr : Proceeding) (c : ComplaintText) : Prop


axiom OPCongress (pr : Proceeding) (c : ComplaintText) : Prop



axiom OPFederalAgency (pr : Proceeding) (c : ComplaintText) : Prop



axiom OPInsuranceRegulatory (pr : Proceeding) (c : ComplaintText) : Prop







axiom ActedCorruptly (pa : Party) (c : ComplaintText) : Prop









axiom BonaFideLegalRepresentation (pa : Party) (pr : Proceeding) (c : ComplaintText) : Prop

end Proving.USC.T18.PredicateDefs.Elements
