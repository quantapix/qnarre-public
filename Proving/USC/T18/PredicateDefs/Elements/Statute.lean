



















import Proving.USC.Common.Types
import Proving.USC.T18.PredicateDefs.Elements.Types
import Proving.USC.T18.PredicateDefs.Elements.Predicates

namespace Proving.USC.T18.PredicateDefs.Elements

open Proving.USC.Common



inductive IsFinancialInstitution (i : Institution) (c : ComplaintText) : Prop where
  | insuredDepository  (h : FIInsuredDepository i c)
  | creditUnion        (h : FICreditUnion i c)
  | fhlBank            (h : FIFederalHomeLoanBank i c)
  | farmCredit         (h : FIFarmCreditSystem i c)
  | sbic               (h : FISmallBusinessInvestmentCompany i c)
  | holdingCompany     (h : FIDepositoryHoldingCompany i c)
  | federalReserve     (h : FIFederalReserveBank i c)
  | edgeAct            (h : FIEdgeActOrganization i c)
  | foreignBankBranch  (h : FIForeignBankBranch i c)
  | mortgageLending    (h : FIMortgageLendingBusiness i c)





abbrev SchemeToDefraud1346 (s : Scheme) (c : ComplaintText) : Prop :=
  DeprivesHonestServices s c



inductive IsOfficialProceeding (pr : Proceeding) (c : ComplaintText) : Prop where
  | federalCourt        (h : OPFederalCourt pr c)
  | congress            (h : OPCongress pr c)
  | federalAgency       (h : OPFederalAgency pr c)
  | insuranceRegulatory (h : OPInsuranceRegulatory pr c)





structure CorruptConductForProceeding
    (pa : Party) (pr : Proceeding) (c : ComplaintText) : Prop where
  proceeding   : IsOfficialProceeding pr c
  corruptly    : ActedCorruptly pa c
  notBonaFide  : ¬ BonaFideLegalRepresentation pa pr c

end Proving.USC.T18.PredicateDefs.Elements
