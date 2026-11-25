
















import Proving.USC.T18.PredicateDefs.Ontology.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T18.PredicateDefs.Ontology

open Proving.USC.Common





structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String



def edge_scheme_dependsOn_honestServices : DefEdge :=
  { defined := "scheme or artifice to defraud", dependsOn := "intangible right of honest services",
    citeDefine := "18 USC § 1346" }



def edge_officialProceeding_dependsOn_interstateCommerce : DefEdge :=
  { defined := "official proceeding", dependsOn := "interstate commerce",
    citeDefine := "18 USC § 1515(a)(1)(D)" }


def edge_physicalForce_dependsOn_confinement : DefEdge :=
  { defined := "physical force", dependsOn := "confinement",
    citeDefine := "18 USC § 1515(a)(2)" }




def edge_corruptlyPersuades_dependsOn_misleadingConduct : DefEdge :=
  { defined := "corruptly persuades", dependsOn := "misleading conduct",
    citeDefine := "18 USC § 1515(a)(6)" }


def defEdges : List DefEdge :=
  [ edge_scheme_dependsOn_honestServices,
    edge_officialProceeding_dependsOn_interstateCommerce,
    edge_physicalForce_dependsOn_confinement,
    edge_corruptlyPersuades_dependsOn_misleadingConduct ]






inductive FinancialInstitutionCase (x : FinancialInstitution) (c : ComplaintText) : Prop where
  | insuredDepository : IsInsuredDepositoryInstitution x c → IsFinancialInstitution x c → FinancialInstitutionCase x c
  | insuredCreditUnion : IsInsuredCreditUnion x c → IsFinancialInstitution x c → FinancialInstitutionCase x c
  | federalHomeLoanBank : IsFederalHomeLoanBank x c → IsFinancialInstitution x c → FinancialInstitutionCase x c
  | farmCreditSystem : IsFarmCreditSystemInstitution x c → IsFinancialInstitution x c → FinancialInstitutionCase x c
  | smallBusinessInvestment : IsSmallBusinessInvestmentCompany x c → IsFinancialInstitution x c → FinancialInstitutionCase x c
  | depositoryHoldingCompany : IsDepositoryHoldingCompany x c → IsFinancialInstitution x c → FinancialInstitutionCase x c
  | federalReserveBank : IsFederalReserveBank x c → IsFinancialInstitution x c → FinancialInstitutionCase x c
  | edgeActOrganization : IsEdgeActOrganization x c → IsFinancialInstitution x c → FinancialInstitutionCase x c
  | foreignBankBranch : IsForeignBankBranch x c → IsFinancialInstitution x c → FinancialInstitutionCase x c
  | mortgageLendingBusiness : IsMortgageLendingBusiness x c → IsFinancialInstitution x c → FinancialInstitutionCase x c






structure HonestServicesSchemeMembership (s : Scheme) (c : ComplaintText) : Prop where
  deprivesHonestServices : IsHonestServicesDeprivation s c
  isScheme               : IsSchemeToDefraud s c




inductive OfficialProceedingCase (x : OfficialProceeding) (c : ComplaintText) : Prop where
  | court     : IsCourtProceeding x c → IsOfficialProceeding x c → OfficialProceedingCase x c
  | congress  : IsCongressionalProceeding x c → IsOfficialProceeding x c → OfficialProceedingCase x c
  | agency    : IsAgencyProceeding x c → IsOfficialProceeding x c → OfficialProceedingCase x c
  | insurance : IsInsuranceProceeding x c → IsOfficialProceeding x c → OfficialProceedingCase x c




inductive MisleadingConductCase (x : MisleadingConductAct) (c : ComplaintText) : Prop where
  | falseStatement      : IsFalseStatement x c → IsMisleadingConduct x c → MisleadingConductCase x c
  | materialOmission    : IsMaterialOmission x c → IsMisleadingConduct x c → MisleadingConductCase x c
  | falseWriting        : IsFalseWritingReliance x c → IsMisleadingConduct x c → MisleadingConductCase x c
  | misleadingObject    : IsMisleadingObjectReliance x c → IsMisleadingConduct x c → MisleadingConductCase x c
  | trickSchemeOrDevice : IsTrickSchemeOrDevice x c → IsMisleadingConduct x c → MisleadingConductCase x c




inductive BodilyInjuryCase (x : BodilyInjury) (c : ComplaintText) : Prop where
  | cutBruiseEtc      : IsBodilyInjury x c → BodilyInjuryCase x c
  | physicalPain      : IsBodilyInjury x c → BodilyInjuryCase x c
  | illness           : IsBodilyInjury x c → BodilyInjuryCase x c
  | impairment        : IsBodilyInjury x c → BodilyInjuryCase x c
  | otherInjury       : IsBodilyInjury x c → BodilyInjuryCase x c





structure CorruptPersuasionMembership (x : CorruptPersuasionAct) (c : ComplaintText) : Prop where
  persuades   : CorruptlyPersuades x c
  notExcluded : ¬ IsMisleadingButForStateOfMind x c

end Proving.USC.T18.PredicateDefs.Ontology
