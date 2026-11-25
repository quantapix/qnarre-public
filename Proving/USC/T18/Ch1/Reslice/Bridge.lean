













































import Proving.USC.T18.Ch1.Reslice.Elements.Statute
import Proving.USC.T18.Ch1.Reslice.Ontology.Statute
import Proving.USC.T18.Ch1.Reslice.Procedure.Statute
import Proving.USC.T18.Ch1.Reslice.Deontic.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch1.Reslice.Bridge

open Proving.USC.Common









namespace S20

axiom mapInstPE : Procedure.Institution → Elements.Institution
axiom mapInstEO : Elements.Institution → Entity



axiom corr_insuredDepository_PE {i : Procedure.Institution} {c : ComplaintText} :
    Procedure.IsInsuredDepositoryInstitution i c → Elements.IsInsuredDepositoryInstitution (mapInstPE i) c
axiom corr_creditUnion_PE {i : Procedure.Institution} {c : ComplaintText} :
    Procedure.IsCreditUnionInsuredByNCUSIF i c → Elements.IsFederallyInsuredCreditUnion (mapInstPE i) c
axiom corr_homeLoanBank_PE {i : Procedure.Institution} {c : ComplaintText} :
    Procedure.IsFederalHomeLoanBankOrMember i c → Elements.FederalHomeLoanBankEntity (mapInstPE i) c
axiom corr_farmCredit_PE {i : Procedure.Institution} {c : ComplaintText} :
    Procedure.IsFarmCreditSystemInstitution i c → Elements.IsFarmCreditSystemInstitution (mapInstPE i) c
axiom corr_sbic_PE {i : Procedure.Institution} {c : ComplaintText} :
    Procedure.IsSmallBusinessInvestmentCompany i c → Elements.IsSmallBusinessInvestmentCompany (mapInstPE i) c
axiom corr_holdingCompany_PE {i : Procedure.Institution} {c : ComplaintText} :
    Procedure.IsDepositoryInstitutionHoldingCompany i c →
      Elements.IsDepositoryInstitutionHoldingCompany (mapInstPE i) c
axiom corr_federalReserve_PE {i : Procedure.Institution} {c : ComplaintText} :
    Procedure.IsFederalReserveBankOrMemberBank i c → Elements.FederalReserveEntity (mapInstPE i) c
axiom corr_edgeAct_PE {i : Procedure.Institution} {c : ComplaintText} :
    Procedure.IsOrganizationOperatingUnderFederalReserveActSection25 i c →
      Elements.IsFederalReserveActSection25Organization (mapInstPE i) c
axiom corr_foreignBankBranch_PE {i : Procedure.Institution} {c : ComplaintText} :
    Procedure.IsBranchOrAgencyOfForeignBank i c → Elements.IsBranchOrAgencyOfForeignBank (mapInstPE i) c
axiom corr_mortgage_PE {i : Procedure.Institution} {c : ComplaintText} :
    Procedure.IsMortgageLendingBusinessOrFederallyRelatedMortgageLender i c →
      Elements.MortgageEntity (mapInstPE i) c



theorem s20_procedure_implies_elements
    {i : Procedure.Institution} {pr : Procedure.Prosecution} {c : ComplaintText}
    (h : Procedure.FinancialInstitutionStatusEstablished i pr c) :
    Elements.FinancialInstitution20 (mapInstPE i) c :=
  match h.category with
  | .insuredDepository hx => .insuredDepository (corr_insuredDepository_PE hx)
  | .creditUnion hx => .creditUnion (corr_creditUnion_PE hx)
  | .homeLoanBank hx => .homeLoanBank (corr_homeLoanBank_PE hx)
  | .farmCredit hx => .farmCredit (corr_farmCredit_PE hx)
  | .sbic hx => .smallBusinessInvestmentCompany (corr_sbic_PE hx)
  | .holdingCompany hx => .holdingCompany (corr_holdingCompany_PE hx)
  | .federalReserve hx => .federalReserve (corr_federalReserve_PE hx)
  | .edgeActOrganization hx => .edgeOrAgreementCorporation (corr_edgeAct_PE hx)
  | .foreignBankBranch hx => .foreignBankBranchOrAgency (corr_foreignBankBranch_PE hx)
  | .mortgageLender hx => .mortgage (corr_mortgage_PE hx)




axiom corr_insuredDepository_EO {i : Elements.Institution} {c : ComplaintText} :
    Elements.IsInsuredDepositoryInstitution i c → Ontology.IsInsuredDepositoryInstitution (mapInstEO i) c
axiom corr_creditUnion_EO {i : Elements.Institution} {c : ComplaintText} :
    Elements.IsFederallyInsuredCreditUnion i c → Ontology.IsCreditUnionWithInsuredAccounts (mapInstEO i) c
axiom corr_homeLoanBankProper_EO {i : Elements.Institution} {c : ComplaintText} :
    Elements.IsFederalHomeLoanBank i c → Ontology.IsFederalHomeLoanBankOrSystemMember (mapInstEO i) c
axiom corr_homeLoanBankMember_EO {i : Elements.Institution} {c : ComplaintText} :
    Elements.IsFederalHomeLoanBankSystemMember i c →
      Ontology.IsFederalHomeLoanBankOrSystemMember (mapInstEO i) c
axiom corr_farmCredit_EO {i : Elements.Institution} {c : ComplaintText} :
    Elements.IsFarmCreditSystemInstitution i c → Ontology.IsFarmCreditSystemInstitution (mapInstEO i) c
axiom corr_sbic_EO {i : Elements.Institution} {c : ComplaintText} :
    Elements.IsSmallBusinessInvestmentCompany i c → Ontology.IsSmallBusinessInvestmentCompany (mapInstEO i) c
axiom corr_holdingCompany_EO {i : Elements.Institution} {c : ComplaintText} :
    Elements.IsDepositoryInstitutionHoldingCompany i c →
      Ontology.IsDepositoryInstitutionHoldingCompany (mapInstEO i) c
axiom corr_reserveBank_EO {i : Elements.Institution} {c : ComplaintText} :
    Elements.IsFederalReserveBank i c → Ontology.IsFederalReserveBankOrMemberBank (mapInstEO i) c
axiom corr_memberBank_EO {i : Elements.Institution} {c : ComplaintText} :
    Elements.IsFederalReserveSystemMemberBank i c → Ontology.IsFederalReserveBankOrMemberBank (mapInstEO i) c
axiom corr_edgeAct_EO {i : Elements.Institution} {c : ComplaintText} :
    Elements.IsFederalReserveActSection25Organization i c →
      Ontology.IsOrganizationOperatingUnderFederalReserveActSection25 (mapInstEO i) c
axiom corr_foreignBankBranch_EO {i : Elements.Institution} {c : ComplaintText} :
    Elements.IsBranchOrAgencyOfForeignBank i c → Ontology.IsBranchOrAgencyOfForeignBank (mapInstEO i) c
axiom corr_mortgageBusiness_EO {i : Elements.Institution} {c : ComplaintText} :
    Elements.IsMortgageLendingBusiness i c → Ontology.IsMortgageLendingBusiness (mapInstEO i) c
axiom corr_mortgageLender_EO {i : Elements.Institution} {c : ComplaintText} :
    Elements.MakesFederallyRelatedMortgageLoan i c → Ontology.MakesFederallyRelatedMortgageLoan (mapInstEO i) c





theorem s20_elements_implies_ontology
    {i : Elements.Institution} {c : ComplaintText} (h : Elements.FinancialInstitution20 i c) :
    Ontology.FinancialInstitutionCase (mapInstEO i) c :=
  match h with
  | .insuredDepository hx => .insuredDepository (corr_insuredDepository_EO hx)
  | .creditUnion hx => .creditUnion (corr_creditUnion_EO hx)
  | .homeLoanBank hx =>
      match hx with
      | .bank hb => .homeLoanBank (corr_homeLoanBankProper_EO hb)
      | .member hm => .homeLoanBank (corr_homeLoanBankMember_EO hm)
  | .farmCredit hx => .farmCredit (corr_farmCredit_EO hx)
  | .smallBusinessInvestmentCompany hx => .sbic (corr_sbic_EO hx)
  | .holdingCompany hx => .holdingCompany (corr_holdingCompany_EO hx)
  | .federalReserve hx =>
      match hx with
      | .reserveBank hb => .federalReserve (corr_reserveBank_EO hb)
      | .memberBank hm => .federalReserve (corr_memberBank_EO hm)
  | .edgeOrAgreementCorporation hx => .edgeActOrganization (corr_edgeAct_EO hx)
  | .foreignBankBranchOrAgency hx => .foreignBankBranch (corr_foreignBankBranch_EO hx)
  | .mortgage hx =>
      match hx with
      | .lendingBusiness hb => .mortgageLending (.mortgageLendingBusiness (corr_mortgageBusiness_EO hb))
      | .federallyRelatedLender hl =>
          .mortgageLending (.federallyRelatedLender (corr_mortgageLender_EO hl))




axiom corr_insuredDepository_OD {e : Entity} {c : ComplaintText} :
    Ontology.IsInsuredDepositoryInstitution e c →
      Deontic.FinancialInstitutionCategoryHolds .insuredDepositoryInstitution e c
axiom corr_creditUnion_OD {e : Entity} {c : ComplaintText} :
    Ontology.IsCreditUnionWithInsuredAccounts e c →
      Deontic.FinancialInstitutionCategoryHolds .insuredCreditUnion e c
axiom corr_homeLoanBank_OD {e : Entity} {c : ComplaintText} :
    Ontology.IsFederalHomeLoanBankOrSystemMember e c →
      Deontic.FinancialInstitutionCategoryHolds .federalHomeLoanBankOrMember e c
axiom corr_farmCredit_OD {e : Entity} {c : ComplaintText} :
    Ontology.IsFarmCreditSystemInstitution e c →
      Deontic.FinancialInstitutionCategoryHolds .farmCreditSystemInstitution e c
axiom corr_sbic_OD {e : Entity} {c : ComplaintText} :
    Ontology.IsSmallBusinessInvestmentCompany e c →
      Deontic.FinancialInstitutionCategoryHolds .smallBusinessInvestmentCompany e c
axiom corr_holdingCompany_OD {e : Entity} {c : ComplaintText} :
    Ontology.IsDepositoryInstitutionHoldingCompany e c →
      Deontic.FinancialInstitutionCategoryHolds .depositoryInstitutionHoldingCompany e c
axiom corr_federalReserve_OD {e : Entity} {c : ComplaintText} :
    Ontology.IsFederalReserveBankOrMemberBank e c →
      Deontic.FinancialInstitutionCategoryHolds .federalReserveBankOrMemberBank e c
axiom corr_edgeAct_OD {e : Entity} {c : ComplaintText} :
    Ontology.IsOrganizationOperatingUnderFederalReserveActSection25 e c →
      Deontic.FinancialInstitutionCategoryHolds .federalReserveActSection25Organization e c
axiom corr_foreignBankBranch_OD {e : Entity} {c : ComplaintText} :
    Ontology.IsBranchOrAgencyOfForeignBank e c →
      Deontic.FinancialInstitutionCategoryHolds .foreignBankBranchOrAgency e c
axiom corr_mortgageBusiness_OD {e : Entity} {c : ComplaintText} :
    Ontology.IsMortgageLendingBusiness e c →
      Deontic.FinancialInstitutionCategoryHolds .mortgageLendingBusinessOrFederallyRelatedLender e c
axiom corr_mortgageLender_OD {e : Entity} {c : ComplaintText} :
    Ontology.MakesFederallyRelatedMortgageLoan e c →
      Deontic.FinancialInstitutionCategoryHolds .mortgageLendingBusinessOrFederallyRelatedLender e c




theorem s20_ontology_implies_deontic
    {e : Entity} {c : ComplaintText} (h : Ontology.FinancialInstitutionCase e c) :
    Deontic.IsFinancialInstitution e c :=
  match h with
  | .insuredDepository hx => ⟨_, corr_insuredDepository_OD hx⟩
  | .creditUnion hx => ⟨_, corr_creditUnion_OD hx⟩
  | .homeLoanBank hx => ⟨_, corr_homeLoanBank_OD hx⟩
  | .farmCredit hx => ⟨_, corr_farmCredit_OD hx⟩
  | .sbic hx => ⟨_, corr_sbic_OD hx⟩
  | .holdingCompany hx => ⟨_, corr_holdingCompany_OD hx⟩
  | .federalReserve hx => ⟨_, corr_federalReserve_OD hx⟩
  | .edgeActOrganization hx => ⟨_, corr_edgeAct_OD hx⟩
  | .foreignBankBranch hx => ⟨_, corr_foreignBankBranch_OD hx⟩
  | .mortgageLending hx =>
      match hx with
      | .mortgageLendingBusiness hb => ⟨_, corr_mortgageBusiness_OD hb⟩
      | .federallyRelatedLender hl => ⟨_, corr_mortgageLender_OD hl⟩




theorem s20_procedure_implies_ontology
    {i : Procedure.Institution} {pr : Procedure.Prosecution} {c : ComplaintText}
    (h : Procedure.FinancialInstitutionStatusEstablished i pr c) :
    Ontology.FinancialInstitutionCase (mapInstEO (mapInstPE i)) c :=
  s20_elements_implies_ontology (s20_procedure_implies_elements h)


theorem s20_elements_implies_deontic
    {i : Elements.Institution} {c : ComplaintText} (h : Elements.FinancialInstitution20 i c) :
    Deontic.IsFinancialInstitution (mapInstEO i) c :=
  s20_ontology_implies_deontic (s20_elements_implies_ontology h)


theorem s20_procedure_implies_deontic
    {i : Procedure.Institution} {pr : Procedure.Prosecution} {c : ComplaintText}
    (h : Procedure.FinancialInstitutionStatusEstablished i pr c) :
    Deontic.IsFinancialInstitution (mapInstEO (mapInstPE i)) c :=
  s20_ontology_implies_deontic (s20_procedure_implies_ontology h)

end S20

















namespace S23

axiom mapCourtED : Elements.Court → Deontic.Court
axiom mapProvED : Elements.Provision → Deontic.Provision
axiom mapCourtDP : Deontic.Court → Procedure.Forum
axiom mapProvPD : Procedure.Prosecution → Deontic.Provision
axiom mapForumPO : Procedure.Forum → Ontology.Court



axiom corr_guam_ED {ct : Elements.Court} {c : ComplaintText} :
    Elements.IsDistrictCourtOfGuam ct c → Deontic.IsTerritorialDistrictCourt .guam (mapCourtED ct) c
axiom corr_nmi_ED {ct : Elements.Court} {c : ComplaintText} :
    Elements.IsDistrictCourtForNorthernMarianaIslands ct c →
      Deontic.IsTerritorialDistrictCourt .northernMarianaIslands (mapCourtED ct) c
axiom corr_vi_ED {ct : Elements.Court} {c : ComplaintText} :
    Elements.IsDistrictCourtOfVirginIslands ct c →
      Deontic.IsTerritorialDistrictCourt .virginIslands (mapCourtED ct) c
axiom corr_expressly_DE {prov : Elements.Provision} {c : ComplaintText} :
    Deontic.ExpresslyProvidedOtherwise (mapProvED prov) c → Elements.ExpresslyProvidedOtherwise prov c




theorem s23_elements_implies_deontic
    {prov : Elements.Provision} {ct : Elements.Court} {c : ComplaintText}
    (h : Elements.CourtOfTheUnitedStates23 prov ct c) :
    Deontic.WithinCourtOfTheUnitedStates (mapCourtED ct) c ∧
      ¬ Deontic.ExpresslyProvidedOtherwise (mapProvED prov) c :=
  ⟨match h.territorial with
    | .guam hx => ⟨_, corr_guam_ED hx⟩
    | .northernMariana hx => ⟨_, corr_nmi_ED hx⟩
    | .virginIslands hx => ⟨_, corr_vi_ED hx⟩,
   fun hd => h.noContraryProvision (corr_expressly_DE hd)⟩



axiom corr_guam_DP {ct : Deontic.Court} {c : ComplaintText} :
    Deontic.IsTerritorialDistrictCourt .guam ct c → Procedure.IsDistrictCourtOfGuam (mapCourtDP ct) c
axiom corr_nmi_DP {ct : Deontic.Court} {c : ComplaintText} :
    Deontic.IsTerritorialDistrictCourt .northernMarianaIslands ct c →
      Procedure.IsDistrictCourtForNorthernMarianaIslands (mapCourtDP ct) c
axiom corr_vi_DP {ct : Deontic.Court} {c : ComplaintText} :
    Deontic.IsTerritorialDistrictCourt .virginIslands ct c →
      Procedure.IsDistrictCourtOfVirginIslands (mapCourtDP ct) c
axiom corr_expressly_PD {ct : Deontic.Court} {pr : Procedure.Prosecution} {c : ComplaintText} :
    Procedure.ExpresslyProvidedOtherwise (mapCourtDP ct) pr c →
      Deontic.ExpresslyProvidedOtherwise (mapProvPD pr) c




theorem s23_deontic_implies_procedure
    {ct : Deontic.Court} {pr : Procedure.Prosecution} {c : ComplaintText}
    (hIn : Deontic.WithinCourtOfTheUnitedStates ct c)
    (hNo : ¬ Deontic.ExpresslyProvidedOtherwise (mapProvPD pr) c) :
    Procedure.ForumIsCourtOfTheUnitedStates (mapCourtDP ct) pr c :=
  { member :=
      match hIn with
      | ⟨.guam, hx⟩ => .guam (corr_guam_DP hx)
      | ⟨.northernMarianaIslands, hx⟩ => .northernMariana (corr_nmi_DP hx)
      | ⟨.virginIslands, hx⟩ => .virginIslands (corr_vi_DP hx)
    noExpressException := fun hp => hNo (corr_expressly_PD hp) }



axiom corr_guam_PO {f : Procedure.Forum} {c : ComplaintText} :
    Procedure.IsDistrictCourtOfGuam f c → Ontology.IsDistrictCourtOfGuam (mapForumPO f) c
axiom corr_nmi_PO {f : Procedure.Forum} {c : ComplaintText} :
    Procedure.IsDistrictCourtForNorthernMarianaIslands f c →
      Ontology.IsDistrictCourtForNorthernMarianaIslands (mapForumPO f) c
axiom corr_vi_PO {f : Procedure.Forum} {c : ComplaintText} :
    Procedure.IsDistrictCourtOfVirginIslands f c → Ontology.IsDistrictCourtOfTheVirginIslands (mapForumPO f) c
axiom corr_residual_PO {f : Procedure.Forum} {c : ComplaintText} :
    Procedure.IsCourtOfTheUnitedStatesApartFromSection23 f c → Ontology.IsCourtOfTheUnitedStates (mapForumPO f) c
axiom corr_expressly_OP {f : Procedure.Forum} {pr : Procedure.Prosecution} {c : ComplaintText} :
    Ontology.ExpresslyProvidedOtherwise (mapForumPO f) c → Procedure.ExpresslyProvidedOtherwise f pr c




theorem s23_procedure_implies_ontology
    {f : Procedure.Forum} {pr : Procedure.Prosecution} {c : ComplaintText}
    (h : Procedure.ForumIsCourtOfTheUnitedStates f pr c) :
    Ontology.CourtOfTheUnitedStatesCase (mapForumPO f) c ∧
      ¬ Ontology.ExpresslyProvidedOtherwise (mapForumPO f) c :=
  ⟨match h.member with
    | .guam hx => .districtCourtOfGuam (corr_guam_PO hx)
    | .northernMariana hx => .districtCourtNorthernMarianaIslands (corr_nmi_PO hx)
    | .virginIslands hx => .districtCourtVirginIslands (corr_vi_PO hx)
    | .otherwiseIncluded hx => .residualOther (corr_residual_PO hx),
   fun ho => h.noExpressException (corr_expressly_OP (pr := pr) ho)⟩




theorem s23_elements_implies_procedure
    {prov : Elements.Provision} {ct : Elements.Court} {pr : Procedure.Prosecution} {c : ComplaintText}
    (h : Elements.CourtOfTheUnitedStates23 prov ct c)
    (hNo : ¬ Deontic.ExpresslyProvidedOtherwise (mapProvPD pr) c) :
    Procedure.ForumIsCourtOfTheUnitedStates (mapCourtDP (mapCourtED ct)) pr c :=
  s23_deontic_implies_procedure (s23_elements_implies_deontic h).1 hNo


theorem s23_elements_implies_ontology
    {prov : Elements.Provision} {ct : Elements.Court} {pr : Procedure.Prosecution} {c : ComplaintText}
    (h : Elements.CourtOfTheUnitedStates23 prov ct c)
    (hNo : ¬ Deontic.ExpresslyProvidedOtherwise (mapProvPD pr) c) :
    Ontology.CourtOfTheUnitedStatesCase (mapForumPO (mapCourtDP (mapCourtED ct))) c ∧
      ¬ Ontology.ExpresslyProvidedOtherwise (mapForumPO (mapCourtDP (mapCourtED ct))) c :=
  s23_procedure_implies_ontology (s23_elements_implies_procedure h hNo)


theorem s23_deontic_implies_ontology
    {ct : Deontic.Court} {pr : Procedure.Prosecution} {c : ComplaintText}
    (hIn : Deontic.WithinCourtOfTheUnitedStates ct c)
    (hNo : ¬ Deontic.ExpresslyProvidedOtherwise (mapProvPD pr) c) :
    Ontology.CourtOfTheUnitedStatesCase (mapForumPO (mapCourtDP ct)) c ∧
      ¬ Ontology.ExpresslyProvidedOtherwise (mapForumPO (mapCourtDP ct)) c :=
  s23_procedure_implies_ontology (s23_deontic_implies_procedure hIn hNo)








axiom mapCourtOE : Ontology.Court → Elements.Court

axiom corr_guam_OE {ct : Ontology.Court} {c : ComplaintText} :
    Ontology.IsDistrictCourtOfGuam ct c → Elements.IsDistrictCourtOfGuam (mapCourtOE ct) c
axiom corr_nmi_OE {ct : Ontology.Court} {c : ComplaintText} :
    Ontology.IsDistrictCourtForNorthernMarianaIslands ct c →
      Elements.IsDistrictCourtForNorthernMarianaIslands (mapCourtOE ct) c
axiom corr_vi_OE {ct : Ontology.Court} {c : ComplaintText} :
    Ontology.IsDistrictCourtOfTheVirginIslands ct c →
      Elements.IsDistrictCourtOfVirginIslands (mapCourtOE ct) c






theorem s23_ontology_implies_elements_modulo_gaps
    {prov : Elements.Provision} {ct : Ontology.Court} {c : ComplaintText}
    (gap_s23_residualCourt :
      Ontology.IsCourtOfTheUnitedStates ct c → Elements.IncludedTerritorialCourt (mapCourtOE ct) c)
    (hCase : Ontology.CourtOfTheUnitedStatesCase ct c)
    (hNo : ¬ Elements.ExpresslyProvidedOtherwise prov c) :
    Elements.CourtOfTheUnitedStates23 prov (mapCourtOE ct) c :=
  { noContraryProvision := hNo
    territorial :=
      match hCase with
      | .districtCourtOfGuam hx => .guam (corr_guam_OE hx)
      | .districtCourtNorthernMarianaIslands hx => .northernMariana (corr_nmi_OE hx)
      | .districtCourtVirginIslands hx => .virginIslands (corr_vi_OE hx)
      | .residualOther hx => gap_s23_residualCourt hx }

end S23


















namespace S7

axiom mapLocPE : Procedure.Locus → Elements.Locus
axiom mapVesselPE : Procedure.Vessel → Elements.Locus
axiom mapAircraftPE : Procedure.Aircraft → Elements.Locus


axiom mapAircraftWatersPE : Procedure.Aircraft → Elements.Locus
axiom mapSpacePE : Procedure.SpaceVehicle → Elements.Locus
axiom mapOffPE : Procedure.Prosecution → Elements.Offense



axiom corr_highSeas_PE {loc : Procedure.Locus} {c : ComplaintText} :
    Procedure.LocusIsHighSeas loc c → Elements.IsHighSeas (mapLocPE loc) c
axiom corr_admiralty_PE {loc : Procedure.Locus} {c : ComplaintText} :
    Procedure.WatersWithinAdmiraltyJurisdiction loc c →
      Elements.IsWithinAdmiraltyAndMaritimeJurisdiction (mapLocPE loc) c
axiom corr_outsideState_PE {loc : Procedure.Locus} {c : ComplaintText} :
    Procedure.LocusOutsideAnyStateJurisdiction loc c →
      Elements.IsOutsideJurisdictionOfAnyState (mapLocPE loc) c
axiom corr_p1vessel_PE {v : Procedure.Vessel} {pr : Procedure.Prosecution} {c : ComplaintText} :
    Procedure.VesselUnitedStatesConnectedOwnership v c →
      Procedure.OffenseWithinVesselAdmiraltyWindow v pr c →
      Elements.UnitedStatesVessel (mapVesselPE v) c
axiom corr_p2_PE {v : Procedure.Vessel} {pr : Procedure.Prosecution} {c : ComplaintText} :
    Procedure.Section7Para2 v pr c → Elements.Paragraph7_2 (mapVesselPE v) c
axiom corr_lands_PE {loc : Procedure.Locus} {c : ComplaintText} :
    Procedure.LandsReservedOrAcquiredForUnitedStatesUse loc c →
      Elements.IsLandReservedOrAcquiredForUnitedStatesUse (mapLocPE loc) c
axiom corr_fedJuris_PE {loc : Procedure.Locus} {c : ComplaintText} :
    Procedure.UnderExclusiveOrConcurrentUnitedStatesJurisdiction loc c →
      Elements.IsUnderExclusiveOrConcurrentUnitedStatesJurisdiction (mapLocPE loc) c
axiom corr_consentAcquired_PE {loc : Procedure.Locus} {c : ComplaintText} :
    Procedure.PlacePurchasedOrOtherwiseAcquiredByUnitedStates loc c →
      Procedure.StateLegislatureConsentGiven loc c →
      Procedure.ConsentPrecedesAcquisition loc c →
      Elements.IsPlaceAcquiredWithStateLegislativeConsent (mapLocPE loc) c
axiom corr_needful_PE {loc : Procedure.Locus} {c : ComplaintText} :
    Procedure.AcquiredForNeedfulBuildingPurpose loc c →
      Elements.IsForErectionOfNeedfulBuilding (mapLocPE loc) c
axiom corr_guano_PE {loc : Procedure.Locus} {c : ComplaintText} :
    Procedure.IslandRockOrKeyWithGuanoDeposits loc c →
      Elements.IsIslandRockOrKeyWithGuanoDeposits (mapLocPE loc) c
axiom corr_presidential_PE {loc : Procedure.Locus} {pr : Procedure.Prosecution}
    {c : ComplaintText} :
    Procedure.PresidentialAppurtenanceDetermination loc c →
      Procedure.PresidentialDeterminationEffectiveAtOffense loc pr c →
      Elements.IsPresidentiallyDeemedAppertainingToUnitedStates (mapLocPE loc) c
axiom corr_isAircraft_PE {a : Procedure.Aircraft} {c : ComplaintText} :
    Procedure.AircraftUnitedStatesConnectedOwnership a c → Elements.IsAircraft (mapAircraftPE a) c
axiom corr_aircraftOwner_PE {a : Procedure.Aircraft} {c : ComplaintText} :
    Procedure.AircraftUnitedStatesConnectedOwnership a c →
      Elements.HasUnitedStatesOwnershipInterest (mapAircraftPE a) c
axiom corr_inFlightOver_PE {a : Procedure.Aircraft} {pr : Procedure.Prosecution}
    {c : ComplaintText} :
    Procedure.OffenseDuringFlight a pr c →
      Elements.IsInFlightOver (mapAircraftPE a) (mapAircraftWatersPE a) c
axiom corr_overWaters_PE {a : Procedure.Aircraft} {c : ComplaintText} :
    Procedure.AircraftOverQualifyingWaters a c →
      Elements.AdmiraltyWaters (mapAircraftWatersPE a) c
axiom corr_spaceVehicle_PE {sv : Procedure.SpaceVehicle} {c : ComplaintText} :
    Procedure.VehicleUsedOrDesignedForSpaceFlight sv c → Elements.IsSpaceVehicle (mapSpacePE sv) c
axiom corr_spaceRegistry_PE {sv : Procedure.SpaceVehicle} {c : ComplaintText} :
    Procedure.OnUnitedStatesSpaceRegistry sv c →
      Elements.IsOnUnitedStatesSpaceRegistry (mapSpacePE sv) c




axiom corr_spaceWindow_PE {sv : Procedure.SpaceVehicle} {pr : Procedure.Prosecution}
    {c : ComplaintText} :
    Procedure.OffenseWithinSpaceFlightWindow sv pr c →
      Elements.SpaceVehicleInFlight (mapSpacePE sv) c
axiom corr_statelessPlace_PE {loc : Procedure.Locus} {c : ComplaintText} :
    Procedure.PlaceOutsideJurisdictionOfAnyNation loc c →
      Elements.IsOutsideJurisdictionOfAnyNation (mapLocPE loc) c
axiom corr_nationalNexus_PE {pr : Procedure.Prosecution} {c : ComplaintText} :
    Procedure.OffenseByOrAgainstUnitedStatesNational pr c →
      Elements.OffenseByOrAgainstUnitedStatesNational (mapOffPE pr) c
axiom corr_nationalNexusINA_PE {pr : Procedure.Prosecution} {c : ComplaintText} :
    Procedure.OffenseByOrAgainstUnitedStatesNationalUnderINA pr c →
      Elements.OffenseByOrAgainstUnitedStatesNational (mapOffPE pr) c
axiom corr_foreignVessel_PE {v : Procedure.Vessel} {c : ComplaintText} :
    Procedure.IsForeignVessel v c → Elements.IsForeignVessel (mapVesselPE v) c
axiom corr_scheduledVoyage_PE {v : Procedure.Vessel} {c : ComplaintText} :
    Procedure.VoyageHasScheduledUnitedStatesDepartureOrArrival v c →
      Elements.IsOnVoyageScheduledToDepartFromOrArriveInUnitedStates (mapVesselPE v) c
axiom corr_intlLaw_PE {v : Procedure.Vessel} {pr : Procedure.Prosecution} {c : ComplaintText} :
    Procedure.PermittedByInternationalLaw v pr c →
      Elements.PermittedByInternationalLaw (mapVesselPE v) c
axiom corr_missionPremises_PE {loc : Procedure.Locus} {c : ComplaintText} :
    Procedure.PremisesOfUnitedStatesMissionInForeignState loc c →
      Elements.IsUnitedStatesMissionPremisesInForeignState (mapLocPE loc) c
axiom corr_missionResidence_PE {loc : Procedure.Locus} {c : ComplaintText} :
    Procedure.ResidenceInForeignStateUsedForMissionPurposes loc c →
      Elements.IsResidenceInForeignStateUsedForMissionPurposes (mapLocPE loc) c


axiom corr_treatyConflict_EP {loc : Procedure.Locus} {c : ComplaintText} :
    Elements.ConflictsWithTreatyOrInternationalAgreement (mapLocPE loc) c →
      Procedure.ConflictsWithTreatyOrInternationalAgreement loc c
axiom corr_meja_EP {d : Person} {c : ComplaintText} :
    Elements.OffenderDescribedInSection3261a d c → Procedure.OffenderDescribedInSection3261a d c





theorem s7_procedure_implies_elements
    {pr : Procedure.Prosecution} {c : ComplaintText} (p : Person)
    (h : Procedure.SmtjEstablished pr c) :
    ∃ (q : Person) (loc : Elements.Locus),
      Elements.SpecialMaritimeAndTerritorialJurisdiction q loc (mapOffPE pr) c :=
  match h with
  | .para1Waters loc hx =>
      ⟨p, mapLocPE loc, .watersOrVessel (.waters
        (match hx.qualifyingWaters with
         | Or.inl hh => .highSeas (corr_highSeas_PE hh)
         | Or.inr ho => .otherWaters (corr_admiralty_PE ho.1) (corr_outsideState_PE ho.2)))⟩
  | .para1Vessel v hx =>
      ⟨p, mapVesselPE v, .watersOrVessel (.vessel (corr_p1vessel_PE hx.usConnected hx.inWindow))⟩
  | .para2 v hx => ⟨p, mapVesselPE v, .greatLakesVessel (corr_p2_PE hx)⟩
  | .para3Reserved loc hx =>
      ⟨p, mapLocPE loc, .federalEnclave (.reserved
        { reserved := corr_lands_PE hx.reservedOrAcquired
          jurisdiction := corr_fedJuris_PE hx.federalJurisdiction })⟩
  | .para3Purchased loc hx =>
      ⟨p, mapLocPE loc, .federalEnclave (.enclave
        { consent := corr_consentAcquired_PE hx.acquired hx.stateConsent hx.consentAntecedent
          needfulBuilding := corr_needful_PE hx.needfulPurpose })⟩
  | .para4 loc hx =>
      ⟨p, mapLocPE loc, .guanoIsland
        { guano := corr_guano_PE hx.guanoIsland
          presidential := corr_presidential_PE hx.determination hx.inEffect }⟩
  | .para5 a hx =>
      ⟨p, mapAircraftPE a, .aircraft (mapAircraftWatersPE a)
        { aircraft := corr_isAircraft_PE hx.usConnected
          ownership := corr_aircraftOwner_PE hx.usConnected
          inFlightOver := corr_inFlightOver_PE hx.inFlight
          overWaters := corr_overWaters_PE hx.overWaters }⟩
  | .para6 sv hx =>
      ⟨p, mapSpacePE sv, .spaceVehicle
        { vehicle := corr_spaceVehicle_PE hx.spaceVehicle
          registry := corr_spaceRegistry_PE hx.onRegistry
          inFlight := corr_spaceWindow_PE hx.inFlight }⟩
  | .para7 loc hx =>
      ⟨p, mapLocPE loc, .outsideAnyNation
        { statelessPlace := corr_statelessPlace_PE hx.statelessPlace
          nationalNexus := corr_nationalNexus_PE hx.nationalNexus }⟩
  | .para8 v hx =>
      ⟨p, mapVesselPE v, .foreignVessel
        { foreignVessel := corr_foreignVessel_PE hx.foreignVessel
          scheduledVoyage := corr_scheduledVoyage_PE hx.scheduledUSLeg
          nationalNexus := corr_nationalNexus_PE hx.nationalNexus
          internationalLaw := corr_intlLaw_PE hx.intlLawPermits }⟩
  | .para9 loc d hx =>
      ⟨d, mapLocPE loc, .missionPremises
        { nationalNexus := corr_nationalNexusINA_PE hx.nationalNexus
          premises :=
            match hx.qualifyingLocus with
            | .premises hp => .mission (corr_missionPremises_PE hp)
            | .residence hr => .residence (corr_missionResidence_PE hr)
          noTreatyConflict := fun he => hx.noTreatyConflict (corr_treatyConflict_EP he)
          notMejaOffender := fun he => hx.notSection3261a (corr_meja_EP he) }⟩





axiom mapLocED : Elements.Locus → Deontic.Place
axiom mapOffED : Elements.Offense → Deontic.Offense

axiom corr_g1_ED {loc : Elements.Locus} {off : Elements.Offense} {c : ComplaintText} :
    Elements.Paragraph7_1 loc c →
      Deontic.SmtjGroundHolds .highSeasOrUsVessel (mapLocED loc) (mapOffED off) c
axiom corr_g2_ED {loc : Elements.Locus} {off : Elements.Offense} {c : ComplaintText} :
    Elements.Paragraph7_2 loc c →
      Deontic.SmtjGroundHolds .greatLakesVessel (mapLocED loc) (mapOffED off) c
axiom corr_g3_ED {loc : Elements.Locus} {off : Elements.Offense} {c : ComplaintText} :
    Elements.Paragraph7_3 loc c →
      Deontic.SmtjGroundHolds .federalEnclave (mapLocED loc) (mapOffED off) c
axiom corr_g4_ED {loc : Elements.Locus} {off : Elements.Offense} {c : ComplaintText} :
    Elements.Paragraph7_4 loc c →
      Deontic.SmtjGroundHolds .guanoIsland (mapLocED loc) (mapOffED off) c
axiom corr_g5_ED {loc waters : Elements.Locus} {off : Elements.Offense} {c : ComplaintText} :
    Elements.Paragraph7_5 loc waters c →
      Deontic.SmtjGroundHolds .usAircraftInFlight (mapLocED loc) (mapOffED off) c
axiom corr_g6_ED {loc : Elements.Locus} {off : Elements.Offense} {c : ComplaintText} :
    Elements.Paragraph7_6 loc c →
      Deontic.SmtjGroundHolds .spaceVehicleInFlight (mapLocED loc) (mapOffED off) c
axiom corr_g7_ED {loc : Elements.Locus} {off : Elements.Offense} {c : ComplaintText} :
    Elements.Paragraph7_7 loc off c →
      Deontic.SmtjGroundHolds .placeOutsideAnyNation (mapLocED loc) (mapOffED off) c
axiom corr_g8_ED {loc : Elements.Locus} {off : Elements.Offense} {c : ComplaintText} :
    Elements.Paragraph7_8 loc off c →
      Deontic.SmtjGroundHolds .foreignVesselScheduledUsVoyage (mapLocED loc) (mapOffED off) c
axiom corr_g9premises_ED {p : Person} {loc : Elements.Locus} {off : Elements.Offense}
    {c : ComplaintText} :
    Elements.Paragraph7_9 p loc off c →
      Elements.IsUnitedStatesMissionPremisesInForeignState loc c →
      Deontic.SmtjGroundHolds .usMissionPremises (mapLocED loc) (mapOffED off) c
axiom corr_g9residences_ED {p : Person} {loc : Elements.Locus} {off : Elements.Offense}
    {c : ComplaintText} :
    Elements.Paragraph7_9 p loc off c →
      Elements.IsResidenceInForeignStateUsedForMissionPurposes loc c →
      Deontic.SmtjGroundHolds .usMissionResidences (mapLocED loc) (mapOffED off) c


theorem s7_elements_implies_deontic
    {p : Person} {loc : Elements.Locus} {off : Elements.Offense} {c : ComplaintText}
    (h : Elements.SpecialMaritimeAndTerritorialJurisdiction p loc off c) :
    Deontic.WithinSpecialMaritimeAndTerritorialJurisdiction (mapLocED loc) (mapOffED off) c :=
  match h with
  | .watersOrVessel hx => ⟨_, corr_g1_ED hx⟩
  | .greatLakesVessel hx => ⟨_, corr_g2_ED hx⟩
  | .federalEnclave hx => ⟨_, corr_g3_ED hx⟩
  | .guanoIsland hx => ⟨_, corr_g4_ED hx⟩
  | .aircraft _ hx => ⟨_, corr_g5_ED hx⟩
  | .spaceVehicle hx => ⟨_, corr_g6_ED hx⟩
  | .outsideAnyNation hx => ⟨_, corr_g7_ED hx⟩
  | .foreignVessel hx => ⟨_, corr_g8_ED hx⟩
  | .missionPremises hx =>
      match hx.premises with
      | .mission hm => ⟨_, corr_g9premises_ED hx hm⟩
      | .residence hr => ⟨_, corr_g9residences_ED hx hr⟩





axiom mapPlaceDO : Deontic.Place → Ontology.Locus
axiom mapOffDO : Deontic.Offense → Ontology.Offense

axiom corr_o1_DO {pl : Deontic.Place} {o : Deontic.Offense} {c : ComplaintText} :
    Deontic.SmtjGroundHolds .highSeasOrUsVessel pl o c → Ontology.Paragraph1Locus (mapPlaceDO pl) c
axiom corr_o2_DO {pl : Deontic.Place} {o : Deontic.Offense} {c : ComplaintText} :
    Deontic.SmtjGroundHolds .greatLakesVessel pl o c → Ontology.Paragraph2Locus (mapPlaceDO pl) c
axiom corr_o3_DO {pl : Deontic.Place} {o : Deontic.Offense} {c : ComplaintText} :
    Deontic.SmtjGroundHolds .federalEnclave pl o c → Ontology.Paragraph3Locus (mapPlaceDO pl) c
axiom corr_o4_DO {pl : Deontic.Place} {o : Deontic.Offense} {c : ComplaintText} :
    Deontic.SmtjGroundHolds .guanoIsland pl o c → Ontology.Paragraph4Locus (mapPlaceDO pl) c
axiom corr_o5_DO {pl : Deontic.Place} {o : Deontic.Offense} {c : ComplaintText} :
    Deontic.SmtjGroundHolds .usAircraftInFlight pl o c → Ontology.Paragraph5Locus (mapPlaceDO pl) c
axiom corr_o6_DO {pl : Deontic.Place} {o : Deontic.Offense} {c : ComplaintText} :
    Deontic.SmtjGroundHolds .spaceVehicleInFlight pl o c →
      Ontology.Paragraph6Locus (mapPlaceDO pl) c
axiom corr_o7_DO {pl : Deontic.Place} {o : Deontic.Offense} {c : ComplaintText} :
    Deontic.SmtjGroundHolds .placeOutsideAnyNation pl o c →
      Ontology.Paragraph7Locus (mapPlaceDO pl) (mapOffDO o) c
axiom corr_o8_DO {pl : Deontic.Place} {o : Deontic.Offense} {c : ComplaintText} :
    Deontic.SmtjGroundHolds .foreignVesselScheduledUsVoyage pl o c →
      Ontology.Paragraph8Locus (mapPlaceDO pl) (mapOffDO o) c
axiom corr_o9premises_DO {pl : Deontic.Place} {o : Deontic.Offense} {d : Person}
    {c : ComplaintText} :
    Deontic.SmtjGroundHolds .usMissionPremises pl o c →
      Ontology.Paragraph9Locus (mapPlaceDO pl) (mapOffDO o) d c
axiom corr_o9residences_DO {pl : Deontic.Place} {o : Deontic.Offense} {d : Person}
    {c : ComplaintText} :
    Deontic.SmtjGroundHolds .usMissionResidences pl o c →
      Ontology.Paragraph9Locus (mapPlaceDO pl) (mapOffDO o) d c



theorem s7_deontic_implies_ontology
    {pl : Deontic.Place} {o : Deontic.Offense} {c : ComplaintText} (d : Person)
    (h : Deontic.WithinSpecialMaritimeAndTerritorialJurisdiction pl o c) :
    Ontology.SmtjCase (mapPlaceDO pl) (mapOffDO o) d c :=
  match h with
  | ⟨.highSeasOrUsVessel, hx⟩ => .para1 (corr_o1_DO hx)
  | ⟨.greatLakesVessel, hx⟩ => .para2 (corr_o2_DO hx)
  | ⟨.federalEnclave, hx⟩ => .para3 (corr_o3_DO hx)
  | ⟨.guanoIsland, hx⟩ => .para4 (corr_o4_DO hx)
  | ⟨.usAircraftInFlight, hx⟩ => .para5 (corr_o5_DO hx)
  | ⟨.spaceVehicleInFlight, hx⟩ => .para6 (corr_o6_DO hx)
  | ⟨.placeOutsideAnyNation, hx⟩ => .para7 (corr_o7_DO hx)
  | ⟨.foreignVesselScheduledUsVoyage, hx⟩ => .para8 (corr_o8_DO hx)
  | ⟨.usMissionPremises, hx⟩ => .para9 (corr_o9premises_DO hx)
  | ⟨.usMissionResidences, hx⟩ => .para9 (corr_o9residences_DO hx)




theorem s7_elements_implies_ontology
    {p : Person} {loc : Elements.Locus} {off : Elements.Offense} {c : ComplaintText}
    (d : Person) (h : Elements.SpecialMaritimeAndTerritorialJurisdiction p loc off c) :
    Ontology.SmtjCase (mapPlaceDO (mapLocED loc)) (mapOffDO (mapOffED off)) d c :=
  s7_deontic_implies_ontology d (s7_elements_implies_deontic h)


theorem s7_procedure_implies_deontic
    {pr : Procedure.Prosecution} {c : ComplaintText} (p : Person)
    (h : Procedure.SmtjEstablished pr c) :
    ∃ loc : Elements.Locus,
      Deontic.WithinSpecialMaritimeAndTerritorialJurisdiction
        (mapLocED loc) (mapOffED (mapOffPE pr)) c :=
  match s7_procedure_implies_elements p h with
  | ⟨_, loc, hx⟩ => ⟨loc, s7_elements_implies_deontic hx⟩


theorem s7_procedure_implies_ontology
    {pr : Procedure.Prosecution} {c : ComplaintText} (p d : Person)
    (h : Procedure.SmtjEstablished pr c) :
    ∃ loc : Elements.Locus,
      Ontology.SmtjCase (mapPlaceDO (mapLocED loc)) (mapOffDO (mapOffED (mapOffPE pr))) d c :=
  match s7_procedure_implies_deontic p h with
  | ⟨loc, hx⟩ => ⟨loc, s7_deontic_implies_ontology d hx⟩









axiom mapLocOE : Ontology.Locus → Elements.Locus

axiom corr_p1_OE {l : Ontology.Locus} {c : ComplaintText} :
    Ontology.Paragraph1Locus l c → Elements.Paragraph7_1 (mapLocOE l) c
axiom corr_p2_OE {l : Ontology.Locus} {c : ComplaintText} :
    Ontology.Paragraph2Locus l c → Elements.Paragraph7_2 (mapLocOE l) c
axiom corr_p3_OE {l : Ontology.Locus} {c : ComplaintText} :
    Ontology.Paragraph3Locus l c → Elements.Paragraph7_3 (mapLocOE l) c
axiom corr_p4_OE {l : Ontology.Locus} {c : ComplaintText} :
    Ontology.Paragraph4Locus l c → Elements.Paragraph7_4 (mapLocOE l) c
axiom mapWatersOE : Ontology.Locus → Elements.Locus
axiom corr_p5_OE {l : Ontology.Locus} {c : ComplaintText} :
    Ontology.Paragraph5Locus l c → Elements.Paragraph7_5 (mapLocOE l) (mapWatersOE l) c
axiom corr_p6_OE {l : Ontology.Locus} {c : ComplaintText} :
    Ontology.Paragraph6Locus l c → Elements.Paragraph7_6 (mapLocOE l) c
axiom mapOffOE : Ontology.Offense → Elements.Offense
axiom corr_p7_OE {l : Ontology.Locus} {o : Ontology.Offense} {c : ComplaintText} :
    Ontology.Paragraph7Locus l o c → Elements.Paragraph7_7 (mapLocOE l) (mapOffOE o) c
axiom corr_p8_OE {l : Ontology.Locus} {o : Ontology.Offense} {c : ComplaintText} :
    Ontology.Paragraph8Locus l o c → Elements.Paragraph7_8 (mapLocOE l) (mapOffOE o) c
axiom corr_p9_OE {l : Ontology.Locus} {o : Ontology.Offense} {d : Person} {c : ComplaintText} :
    Ontology.Paragraph9Locus l o d c → Elements.Paragraph7_9 d (mapLocOE l) (mapOffOE o) c





theorem s7_ontology_implies_elements_modulo_gaps
    {l : Ontology.Locus} {o : Ontology.Offense} {c : ComplaintText} (d : Person)
    (gap_s7_residualSmtj :
      Ontology.IsSpecialMaritimeAndTerritorialJurisdiction l c →
        Elements.SpecialMaritimeAndTerritorialJurisdiction d (mapLocOE l) (mapOffOE o) c)
    (h : Ontology.SmtjCase l o d c) :
    Elements.SpecialMaritimeAndTerritorialJurisdiction d (mapLocOE l) (mapOffOE o) c :=
  match h with
  | .para1 hx => .watersOrVessel (corr_p1_OE hx)
  | .para2 hx => .greatLakesVessel (corr_p2_OE hx)
  | .para3 hx => .federalEnclave (corr_p3_OE hx)
  | .para4 hx => .guanoIsland (corr_p4_OE hx)
  | .para5 hx => .aircraft (mapWatersOE l) (corr_p5_OE hx)
  | .para6 hx => .spaceVehicle (corr_p6_OE hx)
  | .para7 hx => .outsideAnyNation (corr_p7_OE hx)
  | .para8 hx => .foreignVessel (corr_p8_OE hx)
  | .para9 hx => .missionPremises (corr_p9_OE hx)
  | .residualOther hx => gap_s7_residualSmtj hx

end S7










namespace S21

axiom mapPropDP : Deontic.Property → Procedure.Property
axiom mapRepDP : Deontic.Representation → Procedure.Representation
axiom mapOffDP : Deontic.Offense → Procedure.Prosecution

axiom corr_stolenElement_DP {o : Deontic.Offense} {pp : Deontic.Property} {c : ComplaintText} :
    Deontic.StolenNatureIsElementOfOffense o pp c →
      Procedure.OffenseHasStolenOrCounterfeitPropertyElement (mapOffDP o) c
axiom corr_knowledgeElement_DP {o : Deontic.Offense} {pp : Deontic.Property}
    {c : ComplaintText} :
    Deontic.DefendantKnowledgeOfCharacterIsElement o pp c →
      Procedure.OffenseHasKnowledgeOfCharacterElement (mapOffDP o) c
axiom corr_byOfficer_DP {r : Deontic.Representation} {officer : Person} {c : ComplaintText} :
    Deontic.MadeByFederalLawEnforcementOfficer r officer c →
      Procedure.MadeByFederalLawEnforcementOfficer (mapRepDP r) c
axiom corr_atDirection_DP {r : Deontic.Representation} {officer : Person} {c : ComplaintText} :
    Deontic.MadeAtDirectionOrWithApprovalOfOfficer r officer c →
      Procedure.MadeAtDirectionOfFederalLawEnforcementOfficer (mapRepDP r) c
axiom corr_asToNature_DP {r : Deontic.Representation} {pp : Deontic.Property}
    {c : ComplaintText} :
    Deontic.RepresentationAsToNatureOfProperty r pp c →
      Procedure.RepresentationAsToNatureOfProperty (mapRepDP r) (mapPropDP pp) c
axiom corr_belief_DP {d : Person} {pp : Deontic.Property} {r : Deontic.Representation}
    {c : ComplaintText} :
    Deontic.DefendantBelievedPropertyOfSuchCharacter d pp r c →
      Procedure.DefendantBelievedPropertyOfProscribedCharacter d (mapPropDP pp) c



axiom corr_sequence_DP {d : Person} {pp : Deontic.Property} {r : Deontic.Representation}
    {c : ComplaintText} :
    Deontic.DefendantBelievedPropertyOfSuchCharacter d pp r c →
      Procedure.BeliefAfterOrResultingFromRepresentation d (mapRepDP r) c



theorem s21_deontic_implies_procedure
    {p d : Person} {o : Deontic.Offense} {pp : Deontic.Property}
    {r : Deontic.Representation} {c : ComplaintText}
    (h : Deontic.Permission21a p d o pp r c) :
    Procedure.Section21AlternativeProof d (mapPropDP pp) (mapRepDP r) (mapOffDP o) c :=
  { applicable :=
      { propertyElement := corr_stolenElement_DP h.stolenNatureElement
        knowledgeElement := corr_knowledgeElement_DP h.knowledgeElement }
    official :=
      match h.representationOfficial with
      | ⟨_, Or.inl hb⟩ => .byOfficer (corr_byOfficer_DP hb)
      | ⟨_, Or.inr ha⟩ => .atDirection (corr_atDirection_DP ha)
    asToNature := corr_asToNature_DP h.representationSubject
    belief := corr_belief_DP h.belief
    sequencing := corr_sequence_DP h.belief }

axiom mapPropPE : Procedure.Property → Elements.Property
axiom mapRepPE : Procedure.Representation → Elements.Representation
axiom mapOffPE21 : Procedure.Prosecution → Elements.Offense

axiom corr_offenseElement_PE {pr : Procedure.Prosecution} {c : ComplaintText} :
    Procedure.Section21Applicability pr c →
      Elements.OffenseHasStolenOrCounterfeitNatureElement (mapOffPE21 pr) c
axiom corr_byOfficer_PE {rep : Procedure.Representation} {c : ComplaintText} :
    Procedure.MadeByFederalLawEnforcementOfficer rep c →
      Elements.RepresentationMadeByFederalLawEnforcementOfficer (mapRepPE rep) c
axiom corr_atDirection_PE {rep : Procedure.Representation} {c : ComplaintText} :
    Procedure.MadeAtDirectionOfFederalLawEnforcementOfficer rep c →
      Elements.RepresentationMadeAtDirectionOrWithApprovalOfOfficer (mapRepPE rep) c
axiom corr_withApproval_PE {rep : Procedure.Representation} {c : ComplaintText} :
    Procedure.MadeWithApprovalOfFederalLawEnforcementOfficer rep c →
      Elements.RepresentationMadeAtDirectionOrWithApprovalOfOfficer (mapRepPE rep) c
axiom corr_asToNature_PE {rep : Procedure.Representation} {prop : Procedure.Property}
    {c : ComplaintText} :
    Procedure.RepresentationAsToNatureOfProperty rep prop c →
      Elements.RepresentationConcernsNatureOfProperty (mapRepPE rep) (mapPropPE prop) c
axiom corr_sequence_PE {d : Person} {rep : Procedure.Representation} {c : ComplaintText} :
    Procedure.BeliefAfterOrResultingFromRepresentation d rep c →
      Elements.BeliefFollowedOrResultedFromRepresentation d (mapRepPE rep) c
axiom corr_belief_PE {d : Person} {prop : Procedure.Property} {c : ComplaintText} :
    Procedure.DefendantBelievedPropertyOfProscribedCharacter d prop c →
      Elements.BelievedPropertyToBeOfProscribedCharacter d (mapPropPE prop) c




theorem s21_procedure_implies_elements
    {d : Person} {prop : Procedure.Property} {rep : Procedure.Representation}
    {pr : Procedure.Prosecution} {c : ComplaintText}
    (h : Procedure.Section21AlternativeProof d prop rep pr c) :
    Elements.Section21a d (mapPropPE prop) (mapOffPE21 pr) c :=
  { offenseElement := corr_offenseElement_PE h.applicable
    established := .officialRepresentation (mapRepPE rep)
      { official :=
          match h.official with
          | .byOfficer hb => .byOfficer (corr_byOfficer_PE hb)
          | .atDirection ha => .atOfficerDirection (corr_atDirection_PE ha)
          | .withApproval hw => .atOfficerDirection (corr_withApproval_PE hw)
        concernsProperty := corr_asToNature_PE h.asToNature
        nexus := corr_sequence_PE h.sequencing
        belief := corr_belief_PE h.belief } }

axiom mapPropEO : Elements.Property → Ontology.Property
axiom mapRepEO : Elements.Representation → Ontology.Representation

axiom corr_character_EO {prop : Elements.Property} {c : ComplaintText} :
    Elements.PropertyWasOfProscribedCharacter prop c →
      Ontology.IsPropertyOfProscribedCharacter (mapPropEO prop) c
axiom corr_knowledge_EO {p : Person} {prop : Elements.Property} {c : ComplaintText} :
    Elements.ActedWithScienterAsToPropertyCharacter p prop c →
      Ontology.DefendantKnewPropertyCharacter p (mapPropEO prop) c
axiom corr_officialByOfficer_EO {rep : Elements.Representation} {c : ComplaintText} :
    Elements.RepresentationMadeByFederalLawEnforcementOfficer rep c →
      Ontology.IsOfficialRepresentation (mapRepEO rep) c
axiom corr_officialAtDirection_EO {rep : Elements.Representation} {c : ComplaintText} :
    Elements.RepresentationMadeAtDirectionOrWithApprovalOfOfficer rep c →
      Ontology.IsOfficialRepresentation (mapRepEO rep) c
axiom corr_sequence_EO {p : Person} {rep : Elements.Representation} {c : ComplaintText} :
    Elements.BeliefFollowedOrResultedFromRepresentation p rep c →
      Ontology.BeliefFollowedOfficialRepresentation p (mapRepEO rep) c
axiom corr_beliefChar_EO {p : Person} {prop : Elements.Property} {c : ComplaintText} :
    Elements.BelievedPropertyToBeOfProscribedCharacter p prop c →
      Ontology.DefendantBelievedPropertyCharacter p (mapPropEO prop) c






theorem s21_elements_implies_ontology
    {p : Person} {prop : Elements.Property} {c : ComplaintText}
    (r0 : Ontology.Representation) (h : Elements.StolenOrCounterfeitNature p prop c) :
    ∃ r : Ontology.Representation,
      Ontology.ProscribedCharacterEstablished p (mapPropEO prop) r c :=
  match h with
  | .actual hx =>
      ⟨r0, .direct
        { character := corr_character_EO hx.character
          knowledge := corr_knowledge_EO hx.knowledge }⟩
  | .officialRepresentation rep hx =>
      ⟨mapRepEO rep, .substitute
        { official :=
            match hx.official with
            | .byOfficer hb => corr_officialByOfficer_EO hb
            | .atOfficerDirection ha => corr_officialAtDirection_EO ha
          sequence := corr_sequence_EO hx.nexus
          belief := corr_beliefChar_EO hx.belief }⟩




theorem s21_deontic_implies_elements
    {p d : Person} {o : Deontic.Offense} {pp : Deontic.Property}
    {r : Deontic.Representation} {c : ComplaintText}
    (h : Deontic.Permission21a p d o pp r c) :
    Elements.Section21a d (mapPropPE (mapPropDP pp)) (mapOffPE21 (mapOffDP o)) c :=
  s21_procedure_implies_elements (s21_deontic_implies_procedure h)


theorem s21_procedure_implies_ontology
    {d : Person} {prop : Procedure.Property} {rep : Procedure.Representation}
    {pr : Procedure.Prosecution} {c : ComplaintText}
    (r0 : Ontology.Representation) (h : Procedure.Section21AlternativeProof d prop rep pr c) :
    ∃ r : Ontology.Representation,
      Ontology.ProscribedCharacterEstablished d (mapPropEO (mapPropPE prop)) r c :=
  s21_elements_implies_ontology r0 (s21_procedure_implies_elements h).established


theorem s21_deontic_implies_ontology
    {p d : Person} {o : Deontic.Offense} {pp : Deontic.Property}
    {r : Deontic.Representation} {c : ComplaintText}
    (r0 : Ontology.Representation) (h : Deontic.Permission21a p d o pp r c) :
    ∃ rr : Ontology.Representation,
      Ontology.ProscribedCharacterEstablished d (mapPropEO (mapPropPE (mapPropDP pp))) rr c :=
  s21_procedure_implies_ontology r0 (s21_deontic_implies_procedure h)



axiom mapPropEP : Elements.Property → Procedure.Property
axiom mapRepEP : Elements.Representation → Procedure.Representation
axiom mapOffEP : Elements.Offense → Procedure.Prosecution

axiom corr_applicability_EP {off : Elements.Offense} {c : ComplaintText} :
    Elements.OffenseHasStolenOrCounterfeitNatureElement off c →
      Procedure.Section21Applicability (mapOffEP off) c
axiom corr_byOfficer_EP {rep : Elements.Representation} {c : ComplaintText} :
    Elements.RepresentationMadeByFederalLawEnforcementOfficer rep c →
      Procedure.MadeByFederalLawEnforcementOfficer (mapRepEP rep) c
axiom corr_atDirection_EP {rep : Elements.Representation} {c : ComplaintText} :
    Elements.RepresentationMadeAtDirectionOrWithApprovalOfOfficer rep c →
      Procedure.MadeAtDirectionOfFederalLawEnforcementOfficer (mapRepEP rep) c
axiom corr_asToNature_EP {rep : Elements.Representation} {prop : Elements.Property}
    {c : ComplaintText} :
    Elements.RepresentationConcernsNatureOfProperty rep prop c →
      Procedure.RepresentationAsToNatureOfProperty (mapRepEP rep) (mapPropEP prop) c
axiom corr_beliefBack_EP {p : Person} {prop : Elements.Property} {c : ComplaintText} :
    Elements.BelievedPropertyToBeOfProscribedCharacter p prop c →
      Procedure.DefendantBelievedPropertyOfProscribedCharacter p (mapPropEP prop) c
axiom corr_sequenceBack_EP {p : Person} {rep : Elements.Representation} {c : ComplaintText} :
    Elements.BeliefFollowedOrResultedFromRepresentation p rep c →
      Procedure.BeliefAfterOrResultingFromRepresentation p (mapRepEP rep) c






theorem s21_elements_implies_procedure_modulo_gaps
    {p : Person} {prop : Elements.Property} {off : Elements.Offense} {c : ComplaintText}
    (gap_s21_directRoute :
      Elements.ActualCharacterRoute p prop c →
        ∃ rep : Procedure.Representation,
          Procedure.Section21AlternativeProof p (mapPropEP prop) rep (mapOffEP off) c)
    (h : Elements.Section21a p prop off c) :
    ∃ rep : Procedure.Representation,
      Procedure.Section21AlternativeProof p (mapPropEP prop) rep (mapOffEP off) c :=
  match h.established with
  | .actual hx => gap_s21_directRoute hx
  | .officialRepresentation rep hx =>
      ⟨mapRepEP rep,
        { applicable := corr_applicability_EP h.offenseElement
          official :=
            match hx.official with
            | .byOfficer hb => .byOfficer (corr_byOfficer_EP hb)
            | .atOfficerDirection ha => .atDirection (corr_atDirection_EP ha)
          asToNature := corr_asToNature_EP hx.concernsProperty
          belief := corr_beliefBack_EP hx.belief
          sequencing := corr_sequenceBack_EP hx.nexus }⟩

end S21














namespace S24

axiom mapProgDE : Deontic.Program → Elements.Program
axiom mapProgEO : Elements.Program → Ontology.BenefitProgram
axiom mapProgOP : Ontology.BenefitProgram → Procedure.BenefitProgram
axiom mapProgPD : Procedure.BenefitProgram → Deontic.Program


axiom mapProviderEO : Elements.Program → Entity



axiom corr_planOrContract_DE {pg : Deontic.Program} {c : ComplaintText} :
    Deontic.IsPublicOrPrivatePlanOrContract pg c →
      Elements.IsPublicOrPrivatePlanOrContract (mapProgDE pg) c
axiom corr_commerce_DE {pg : Deontic.Program} {c : ComplaintText} :
    Deontic.AffectsCommerce pg c → Elements.AffectsInterstateCommerce (mapProgDE pg) c
axiom corr_medical_DE {pg : Deontic.Program} {c : ComplaintText} :
    Deontic.MedicalBenefitItemOrServiceProvided pg c →
      Elements.ProvidesMedicalBenefitItemOrService (mapProgDE pg) c


theorem s24b_deontic_implies_elements
    {pg : Deontic.Program} {c : ComplaintText}
    (h : Deontic.IsHealthCareBenefitPlanOrContract pg c) :
    Elements.HealthCareBenefitProgram24b (mapProgDE pg) c :=
  .plan
    { planOrContract := corr_planOrContract_DE h.1
      commerce := corr_commerce_DE h.2.1
      medicalBenefit := corr_medical_DE h.2.2 }



axiom corr_planOrContract_EO {prog : Elements.Program} {c : ComplaintText} :
    Elements.IsPublicOrPrivatePlanOrContract prog c →
      Ontology.IsPublicOrPrivatePlanOrContract (mapProgEO prog) c
axiom corr_commerce_EO {prog : Elements.Program} {c : ComplaintText} :
    Elements.AffectsInterstateCommerce prog c → Ontology.AffectsCommerce (mapProgEO prog) c
axiom corr_medical_EO {prog : Elements.Program} {c : ComplaintText} :
    Elements.ProvidesMedicalBenefitItemOrService prog c →
      Ontology.ProvidesMedicalBenefitItemOrServiceToIndividual (mapProgEO prog) c
axiom corr_provider_EO {prog : Elements.Program} {c : ComplaintText} :
    Elements.IsProviderOfMedicalBenefitPayableUnderPlan prog c →
      Ontology.IsProviderOfMedicalBenefitItemOrServicePayableUnderPlan
        (mapProviderEO prog) (mapProgEO prog) c



theorem s24b_elements_implies_ontology
    {prog : Elements.Program} {c : ComplaintText} (e0 : Entity)
    (h : Elements.HealthCareBenefitProgram24b prog c) :
    ∃ e : Entity, Ontology.HealthCareBenefitProgramCase (mapProgEO prog) e c :=
  match h with
  | .plan hx =>
      ⟨e0, .plan
        { planOrContract := corr_planOrContract_EO hx.planOrContract
          commerce := corr_commerce_EO hx.commerce
          medicalBenefit := corr_medical_EO hx.medicalBenefit }⟩
  | .provider hx => ⟨mapProviderEO prog, .provider (corr_provider_EO hx)⟩



axiom corr_planOrContract_OP {b : Ontology.BenefitProgram} {c : ComplaintText} :
    Ontology.IsPublicOrPrivatePlanOrContract b c →
      Procedure.IsPublicOrPrivatePlanOrContract (mapProgOP b) c
axiom corr_commerce_OP {b : Ontology.BenefitProgram} {c : ComplaintText} :
    Ontology.AffectsCommerce b c → Procedure.AffectsCommerce (mapProgOP b) c
axiom corr_medical_OP {b : Ontology.BenefitProgram} {c : ComplaintText} :
    Ontology.ProvidesMedicalBenefitItemOrServiceToIndividual b c →
      Procedure.ProvidesMedicalBenefitItemOrService (mapProgOP b) c
axiom corr_provider_OP {b : Ontology.BenefitProgram} {e : Entity} {c : ComplaintText} :
    Ontology.IsProviderOfMedicalBenefitItemOrServicePayableUnderPlan e b c →
      Procedure.IsProviderUnderPlanOrContract (mapProgOP b) c


theorem s24b_ontology_implies_procedure
    {b : Ontology.BenefitProgram} {e : Entity} {c : ComplaintText}
    (h : Ontology.HealthCareBenefitProgramCase b e c) :
    Procedure.HealthCareBenefitProgram (mapProgOP b) c :=
  match h with
  | .plan hx =>
      .plan
        { planOrContract := corr_planOrContract_OP hx.planOrContract
          affectsCommerce := corr_commerce_OP hx.commerce
          providesMedical := corr_medical_OP hx.medicalBenefit }
  | .provider hx => .provider (corr_provider_OP hx)


theorem s24b_deontic_implies_ontology
    {pg : Deontic.Program} {c : ComplaintText} (e0 : Entity)
    (h : Deontic.IsHealthCareBenefitPlanOrContract pg c) :
    ∃ e : Entity, Ontology.HealthCareBenefitProgramCase (mapProgEO (mapProgDE pg)) e c :=
  s24b_elements_implies_ontology e0 (s24b_deontic_implies_elements h)


theorem s24b_elements_implies_procedure
    {prog : Elements.Program} {c : ComplaintText} (e0 : Entity)
    (h : Elements.HealthCareBenefitProgram24b prog c) :
    Procedure.HealthCareBenefitProgram (mapProgOP (mapProgEO prog)) c :=
  match s24b_elements_implies_ontology e0 h with
  | ⟨_, hx⟩ => s24b_ontology_implies_procedure hx


theorem s24b_deontic_implies_procedure
    {pg : Deontic.Program} {c : ComplaintText} (e0 : Entity)
    (h : Deontic.IsHealthCareBenefitPlanOrContract pg c) :
    Procedure.HealthCareBenefitProgram (mapProgOP (mapProgEO (mapProgDE pg))) c :=
  s24b_elements_implies_procedure e0 (s24b_deontic_implies_elements h)



axiom corr_planOrContract_PD {bp : Procedure.BenefitProgram} {c : ComplaintText} :
    Procedure.IsPublicOrPrivatePlanOrContract bp c →
      Deontic.IsPublicOrPrivatePlanOrContract (mapProgPD bp) c
axiom corr_commerce_PD {bp : Procedure.BenefitProgram} {c : ComplaintText} :
    Procedure.AffectsCommerce bp c → Deontic.AffectsCommerce (mapProgPD bp) c
axiom corr_medical_PD {bp : Procedure.BenefitProgram} {c : ComplaintText} :
    Procedure.ProvidesMedicalBenefitItemOrService bp c →
      Deontic.MedicalBenefitItemOrServiceProvided (mapProgPD bp) c








theorem s24b_procedure_implies_deontic_modulo_gaps
    {bp : Procedure.BenefitProgram} {c : ComplaintText}
    (gap_s24b_providerRoute :
      Procedure.IsProviderUnderPlanOrContract bp c →
        Deontic.IsHealthCareBenefitPlanOrContract (mapProgPD bp) c)
    (h : Procedure.HealthCareBenefitProgram bp c) :
    Deontic.IsHealthCareBenefitPlanOrContract (mapProgPD bp) c :=
  match h with
  | .plan hx =>
      ⟨corr_planOrContract_PD hx.planOrContract,
       corr_commerce_PD hx.affectsCommerce,
       corr_medical_PD hx.providesMedical⟩
  | .provider hx => gap_s24b_providerRoute hx



axiom mapOffEO24 : Elements.Offense → Ontology.Offense
axiom mapOffOD24 : Ontology.Offense → Deontic.Offense
axiom mapOffDP24 : Deontic.Offense → Procedure.Charge
axiom mapProgOD24 : Ontology.BenefitProgram → Deontic.Program

axiom corr_violation_EO {off : Elements.Offense} {c : ComplaintText} :
    Elements.IsSubstantiveViolation off c →
      Ontology.IsViolationOrCriminalConspiracyToViolate (mapOffEO24 off) c
axiom corr_conspiracy_EO {off : Elements.Offense} {c : ComplaintText} :
    Elements.IsCriminalConspiracyToViolate off c →
      Ontology.IsViolationOrCriminalConspiracyToViolate (mapOffEO24 off) c
axiom corr_a1_EO {off : Elements.Offense} {c : ComplaintText} :
    Elements.TargetsParagraph1EnumeratedStatute off c →
      Ontology.IsSubsectionA1PredicateOffense (mapOffEO24 off) c
axiom corr_a2_EO {off : Elements.Offense} {c : ComplaintText} :
    Elements.TargetsParagraph2EnumeratedStatute off c →
      Ontology.IsSubsectionA2PredicateOffense (mapOffEO24 off) c
axiom corr_related_EO {off : Elements.Offense} {prog : Elements.Program} {c : ComplaintText} :
    Elements.RelatesToHealthCareBenefitProgram off prog c →
      Ontology.RelatesToHealthCareBenefitProgram (mapOffEO24 off) (mapProgEO prog) c
axiom corr_programQualifies_EO {prog : Elements.Program} {c : ComplaintText} :
    Elements.HealthCareBenefitProgram24b prog c →
      Ontology.IsHealthCareBenefitProgram (mapProgEO prog) c





theorem s24a_elements_implies_ontology
    {off : Elements.Offense} {c : ComplaintText} (b0 : Ontology.BenefitProgram)
    (h : Elements.FederalHealthCareOffense24a off c) :
    Ontology.IsViolationOrCriminalConspiracyToViolate (mapOffEO24 off) c ∧
      ∃ b : Ontology.BenefitProgram,
        Ontology.FederalHealthCareOffenseCase (mapOffEO24 off) b c :=
  match h with
  | .perSe hx =>
      ⟨match hx.mode with
        | .violation hv => corr_violation_EO hv
        | .conspiracy hk => corr_conspiracy_EO hk,
       ⟨b0, .unconditional (corr_a1_EO hx.enumerated)⟩⟩
  | .related prog hx =>
      ⟨match hx.mode with
        | .violation hv => corr_violation_EO hv
        | .conspiracy hk => corr_conspiracy_EO hk,
       ⟨mapProgEO prog, .conditional
         { listed := corr_a2_EO hx.enumerated
           relatedness := corr_related_EO hx.relatedness
           program := corr_programQualifies_EO hx.program }⟩⟩



axiom corr_mode_OD {o : Ontology.Offense} {c : ComplaintText} :
    Ontology.IsViolationOrCriminalConspiracyToViolate o c →
      Deontic.ViolationOrConspiracyToViolate (mapOffOD24 o) c
axiom corr_a1_OD {o : Ontology.Offense} {c : ComplaintText} :
    Ontology.IsSubsectionA1PredicateOffense o c →
      Deontic.PredicateStatuteInUnconditionalList (mapOffOD24 o) c
axiom corr_a2_OD {o : Ontology.Offense} {c : ComplaintText} :
    Ontology.IsSubsectionA2PredicateOffense o c →
      Deontic.PredicateStatuteInConditionalList (mapOffOD24 o) c
axiom corr_related_OD {o : Ontology.Offense} {b : Ontology.BenefitProgram}
    {c : ComplaintText} :
    Ontology.RelatesToHealthCareBenefitProgram o b c →
      Deontic.RelatesToHealthCareBenefitProgram (mapOffOD24 o) (mapProgOD24 b) c





theorem s24a_ontology_implies_deontic
    {o : Ontology.Offense} {b : Ontology.BenefitProgram} {c : ComplaintText}
    (hMode : Ontology.IsViolationOrCriminalConspiracyToViolate o c)
    (hCase : Ontology.FederalHealthCareOffenseCase o b c) :
    Deontic.IsFederalHealthCareOffense (mapOffOD24 o) (mapProgOD24 b) c :=
  ⟨corr_mode_OD hMode,
   match hCase with
   | .unconditional hx => ⟨.unconditional, corr_a1_OD hx⟩
   | .conditional hx =>
       ⟨.conditionalOnHealthCareRelation, corr_a2_OD hx.listed, corr_related_OD hx.relatedness⟩⟩



axiom corr_mode_DP {o : Deontic.Offense} {c : ComplaintText} :
    Deontic.ViolationOrConspiracyToViolate o c →
      Procedure.IsSubstantiveViolation (mapOffDP24 o) c ∨
        Procedure.IsCriminalConspiracyToViolate (mapOffDP24 o) c
axiom corr_a1_DP {o : Deontic.Offense} {c : ComplaintText} :
    Deontic.PredicateStatuteInUnconditionalList o c →
      Procedure.ChargedUnderSection24a1Provision (mapOffDP24 o) c
axiom corr_a2_DP {o : Deontic.Offense} {c : ComplaintText} :
    Deontic.PredicateStatuteInConditionalList o c →
      Procedure.ChargedUnderSection24a2Provision (mapOffDP24 o) c
axiom corr_related_DP {o : Deontic.Offense} {pg : Deontic.Program} {c : ComplaintText} :
    Deontic.RelatesToHealthCareBenefitProgram o pg c →
      Procedure.RelatesToHealthCareBenefitProgram (mapOffDP24 o) c



theorem s24a_deontic_implies_procedure
    {o : Deontic.Offense} {pg : Deontic.Program} {c : ComplaintText}
    (h : Deontic.IsFederalHealthCareOffense o pg c) :
    Procedure.FederalHealthCareOffense (mapOffDP24 o) c :=
  match h.2 with
  | ⟨.unconditional, hx⟩ =>
      .undera1
        { mode :=
            match corr_mode_DP h.1 with
            | Or.inl hv => .violation hv
            | Or.inr hk => .conspiracy hk
          listed := corr_a1_DP hx }
  | ⟨.conditionalOnHealthCareRelation, hx⟩ =>
      .undera2
        { mode :=
            match corr_mode_DP h.1 with
            | Or.inl hv => .violation hv
            | Or.inr hk => .conspiracy hk
          listed := corr_a2_DP hx.1
          related := corr_related_DP hx.2 }


theorem s24a_elements_implies_deontic
    {off : Elements.Offense} {c : ComplaintText} (b0 : Ontology.BenefitProgram)
    (h : Elements.FederalHealthCareOffense24a off c) :
    ∃ b : Ontology.BenefitProgram,
      Deontic.IsFederalHealthCareOffense (mapOffOD24 (mapOffEO24 off)) (mapProgOD24 b) c :=
  match s24a_elements_implies_ontology b0 h with
  | ⟨hMode, ⟨b, hCase⟩⟩ => ⟨b, s24a_ontology_implies_deontic hMode hCase⟩


theorem s24a_ontology_implies_procedure
    {o : Ontology.Offense} {b : Ontology.BenefitProgram} {c : ComplaintText}
    (hMode : Ontology.IsViolationOrCriminalConspiracyToViolate o c)
    (hCase : Ontology.FederalHealthCareOffenseCase o b c) :
    Procedure.FederalHealthCareOffense (mapOffDP24 (mapOffOD24 o)) c :=
  s24a_deontic_implies_procedure (s24a_ontology_implies_deontic hMode hCase)


theorem s24a_elements_implies_procedure
    {off : Elements.Offense} {c : ComplaintText} (b0 : Ontology.BenefitProgram)
    (h : Elements.FederalHealthCareOffense24a off c) :
    Procedure.FederalHealthCareOffense (mapOffDP24 (mapOffOD24 (mapOffEO24 off))) c :=
  match s24a_elements_implies_deontic b0 h with
  | ⟨_, hx⟩ => s24a_deontic_implies_procedure hx



axiom mapChargePE : Procedure.Charge → Elements.Offense
axiom mapProgChargePE : Procedure.Charge → Elements.Program

axiom corr_violation_PE {ch : Procedure.Charge} {c : ComplaintText} :
    Procedure.IsSubstantiveViolation ch c → Elements.IsSubstantiveViolation (mapChargePE ch) c
axiom corr_conspiracy_PE {ch : Procedure.Charge} {c : ComplaintText} :
    Procedure.IsCriminalConspiracyToViolate ch c →
      Elements.IsCriminalConspiracyToViolate (mapChargePE ch) c
axiom corr_a1_PE {ch : Procedure.Charge} {c : ComplaintText} :
    Procedure.ChargedUnderSection24a1Provision ch c →
      Elements.TargetsParagraph1EnumeratedStatute (mapChargePE ch) c
axiom corr_a2_PE {ch : Procedure.Charge} {c : ComplaintText} :
    Procedure.ChargedUnderSection24a2Provision ch c →
      Elements.TargetsParagraph2EnumeratedStatute (mapChargePE ch) c







theorem s24a_procedure_implies_elements_modulo_gaps
    {ch : Procedure.Charge} {c : ComplaintText}
    (gap_s24a_programQualifies :
      Procedure.Section24a2Offense ch c →
        Elements.RelatesToHealthCareBenefitProgram
            (mapChargePE ch) (mapProgChargePE ch) c ∧
          Elements.HealthCareBenefitProgram24b (mapProgChargePE ch) c)
    (h : Procedure.FederalHealthCareOffense ch c) :
    Elements.FederalHealthCareOffense24a (mapChargePE ch) c :=
  match h with
  | .undera1 hx =>
      .perSe
        { mode :=
            match hx.mode with
            | .violation hv => .violation (corr_violation_PE hv)
            | .conspiracy hk => .conspiracy (corr_conspiracy_PE hk)
          enumerated := corr_a1_PE hx.listed }
  | .undera2 hx =>
      .related (mapProgChargePE ch)
        { mode :=
            match hx.mode with
            | .violation hv => .violation (corr_violation_PE hv)
            | .conspiracy hk => .conspiracy (corr_conspiracy_PE hk)
          enumerated := corr_a2_PE hx.listed
          relatedness := (gap_s24a_programQualifies hx).1
          program := (gap_s24a_programQualifies hx).2 }

end S24

end Proving.USC.T18.Ch1.Reslice.Bridge
