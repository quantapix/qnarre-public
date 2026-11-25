import Proving.USC.T18.Ch1.Reslice.Ontology.Types
import Proving.USC.T18.Ch1.Reslice.Ontology.Predicates
import Proving.USC.Common.Types




















set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T18.Ch1.Reslice.Ontology

open Proving.USC.Common





structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String





structure DanglingTerm where
  term      : String
  usedIn    : String
  definedAt : String



def edge_smtj_dependsOn_vessel : DefEdge :=
  { defined := "special maritime and territorial jurisdiction of the United States",
    dependsOn := "vessel", citeDefine := "18 USC § 7(1)" }

def edge_smtj_dependsOn_citizen : DefEdge :=
  { defined := "special maritime and territorial jurisdiction of the United States",
    dependsOn := "citizen of the United States", citeDefine := "18 USC § 7(1)" }

def edge_smtj_dependsOn_corporation : DefEdge :=
  { defined := "special maritime and territorial jurisdiction of the United States",
    dependsOn := "corporation created by or under the laws of the United States or of any State",
    citeDefine := "18 USC § 7(1)" }

def edge_smtj_dependsOn_admiraltyJurisdiction : DefEdge :=
  { defined := "special maritime and territorial jurisdiction of the United States",
    dependsOn := "admiralty and maritime jurisdiction of the United States",
    citeDefine := "18 USC § 7(1)" }

def edge_smtj_dependsOn_national : DefEdge :=
  { defined := "special maritime and territorial jurisdiction of the United States",
    dependsOn := "national of the United States", citeDefine := "18 USC § 7(9)" }

def edge_smtj_dependsOn_section3261a : DefEdge :=
  { defined := "special maritime and territorial jurisdiction of the United States",
    dependsOn := "person described in section 3261(a)", citeDefine := "18 USC § 7(9)" }



def edge_financialInstitution_dependsOn_insuredDepository : DefEdge :=
  { defined := "financial institution", dependsOn := "insured depository institution",
    citeDefine := "18 USC § 20(1)" }

def edge_financialInstitution_dependsOn_homeLoanBankMember : DefEdge :=
  { defined := "financial institution", dependsOn := "member of the Federal home loan bank system",
    citeDefine := "18 USC § 20(3)" }

def edge_financialInstitution_dependsOn_farmCreditInstitution : DefEdge :=
  { defined := "financial institution", dependsOn := "System institution of the Farm Credit System",
    citeDefine := "18 USC § 20(4)" }

def edge_financialInstitution_dependsOn_sbic : DefEdge :=
  { defined := "financial institution", dependsOn := "small business investment company",
    citeDefine := "18 USC § 20(5)" }

def edge_financialInstitution_dependsOn_holdingCompany : DefEdge :=
  { defined := "financial institution", dependsOn := "depository institution holding company",
    citeDefine := "18 USC § 20(6)" }

def edge_financialInstitution_dependsOn_foreignBankBranch : DefEdge :=
  { defined := "financial institution", dependsOn := "branch or agency of a foreign bank",
    citeDefine := "18 USC § 20(9)" }

def edge_financialInstitution_dependsOn_mortgageLendingBusiness : DefEdge :=
  { defined := "financial institution", dependsOn := "mortgage lending business",
    citeDefine := "18 USC § 20(10)" }

def edge_financialInstitution_dependsOn_federallyRelatedMortgageLoan : DefEdge :=
  { defined := "financial institution", dependsOn := "federally related mortgage loan",
    citeDefine := "18 USC § 20(10)" }



def edge_officialRepresentation_dependsOn_fleo : DefEdge :=
  { defined := "official representation", dependsOn := "Federal law enforcement officer",
    citeDefine := "18 USC § 21(b)" }

def edge_proscribedCharacterElement_dependsOn_officialRepresentation : DefEdge :=
  { defined := "proscribed character of property (element substitution)",
    dependsOn := "official representation", citeDefine := "18 USC § 21(a)" }



def edge_federalHealthCareOffense_dependsOn_benefitProgram : DefEdge :=
  { defined := "Federal health care offense", dependsOn := "health care benefit program",
    citeDefine := "18 USC § 24(a)(2)" }

def edge_healthCareBenefitProgram_dependsOn_commerce : DefEdge :=
  { defined := "health care benefit program", dependsOn := "affecting commerce",
    citeDefine := "18 USC § 24(b)" }



def dangling_nationalOfTheUnitedStates : DanglingTerm :=
  { term := "national of the United States", usedIn := "18 USC § 7(7), (8), (9)",
    definedAt := "Immigration and Nationality Act § 101 (8 U.S.C. 1101)" }

def dangling_personDescribedInSection3261a : DanglingTerm :=
  { term := "person described in section 3261(a)", usedIn := "18 USC § 7(9)",
    definedAt := "18 USC § 3261(a)" }

def dangling_vessel : DanglingTerm :=
  { term := "vessel", usedIn := "18 USC § 7(1), (2), (8)", definedAt := "1 U.S.C. § 3" }

def dangling_mortgageLendingBusiness : DanglingTerm :=
  { term := "mortgage lending business", usedIn := "18 USC § 20(10)",
    definedAt := "18 USC § 27" }

def dangling_federalLawEnforcementOfficer : DanglingTerm :=
  { term := "Federal law enforcement officer", usedIn := "18 USC § 21(b)",
    definedAt := "18 USC § 115(c)(1)" }

def dangling_insuredDepositoryInstitution : DanglingTerm :=
  { term := "insured depository institution", usedIn := "18 USC § 20(1)",
    definedAt := "Federal Deposit Insurance Act § 3(c)(2)" }

def dangling_citizenOfTheUnitedStates : DanglingTerm :=
  { term := "citizen of the United States", usedIn := "18 USC § 7(1), (5)",
    definedAt := "undefined in title 18" }





structure AdmiraltyWatersLocus (l : Locus) (c : ComplaintText) : Prop where
  admiralty    : IsWithinAdmiraltyAndMaritimeJurisdiction l c
  outsideState : IsOutOfJurisdictionOfAnyParticularState l c





structure UnitedStatesConnectedVesselLocus (l : Locus) (c : ComplaintText) : Prop where
  vessel       : IsVessel l c
  belonging    : BelongsInWholeOrPartToUnitedStatesCitizenOrCorporation l c
  admiralty    : IsWithinAdmiraltyAndMaritimeJurisdiction l c
  outsideState : IsOutOfJurisdictionOfAnyParticularState l c


inductive Paragraph1Locus (l : Locus) (c : ComplaintText) : Prop where
  | highSeas             : IsHighSeas l c → Paragraph1Locus l c
  | otherAdmiraltyWaters : AdmiraltyWatersLocus l c → Paragraph1Locus l c
  | unitedStatesVessel   : UnitedStatesConnectedVesselLocus l c → Paragraph1Locus l c



structure Paragraph2Locus (l : Locus) (c : ComplaintText) : Prop where
  vessel       : IsVessel l c
  registration : IsRegisteredLicensedOrEnrolledUnderUnitedStatesLaws l c
  voyage       : IsOnVoyageUponGreatLakesOrConnectingWatersOrSaintLawrenceBoundary l c



structure ReservedOrAcquiredLandsLocus (l : Locus) (c : ComplaintText) : Prop where
  lands        : IsLandReservedOrAcquiredForUseOfUnitedStates l c
  jurisdiction : IsUnderExclusiveOrConcurrentUnitedStatesJurisdiction l c



inductive Paragraph3Locus (l : Locus) (c : ComplaintText) : Prop where
  | reservedOrAcquired        : ReservedOrAcquiredLandsLocus l c → Paragraph3Locus l c
  | purchasedWithStateConsent :
      IsPlacePurchasedByConsentOfStateLegislatureForNeedfulBuilding l c → Paragraph3Locus l c



structure Paragraph4Locus (l : Locus) (c : ComplaintText) : Prop where
  guanoIsland : IsGuanoIslandAppertainingToUnitedStates l c



structure Paragraph5Locus (l : Locus) (c : ComplaintText) : Prop where
  inFlight  : IsAircraftInFlightOverHighSeasOrAdmiraltyWaters l c
  belonging : BelongsInWholeOrPartToUnitedStatesCitizenOrCorporation l c



structure Paragraph6Locus (l : Locus) (c : ComplaintText) : Prop where
  spaceVehicleInFlight : IsUnitedStatesRegisteredSpaceVehicleInFlight l c



structure Paragraph7Locus (l : Locus) (o : Offense) (c : ComplaintText) : Prop where
  outsideAnyNation : IsPlaceOutsideJurisdictionOfAnyNation l c
  offenseNexus     : OffenseByOrAgainstNationalOfTheUnitedStates o c




structure Paragraph8Locus (l : Locus) (o : Offense) (c : ComplaintText) : Prop where
  internationalLaw : PermittedByInternationalLaw l c
  foreignVessel    : IsForeignVessel l c
  scheduledVoyage  : IsOnVoyageWithScheduledUnitedStatesDepartureOrArrival l c
  offenseNexus     : OffenseByOrAgainstNationalOfTheUnitedStates o c



inductive Paragraph9Site (l : Locus) (c : ComplaintText) : Prop where
  | missionPremises  : IsUnitedStatesMissionPremises l c → Paragraph9Site l c
  | missionResidence : IsUnitedStatesMissionResidence l c → Paragraph9Site l c










structure Paragraph9Locus (l : Locus) (o : Offense) (d : Person) (c : ComplaintText) : Prop where
  site             : Paragraph9Site l c
  offenseNexus     : OffenseByOrAgainstNationalOfTheUnitedStates o c
  noTreatyConflict : ¬ ConflictsWithTreatyOrInternationalAgreement l c
  notCoveredPerson : ¬ IsPersonDescribedInSection3261a d c



inductive SmtjCase (l : Locus) (o : Offense) (d : Person) (c : ComplaintText) : Prop where
  | para1         : Paragraph1Locus l c → SmtjCase l o d c
  | para2         : Paragraph2Locus l c → SmtjCase l o d c
  | para3         : Paragraph3Locus l c → SmtjCase l o d c
  | para4         : Paragraph4Locus l c → SmtjCase l o d c
  | para5         : Paragraph5Locus l c → SmtjCase l o d c
  | para6         : Paragraph6Locus l c → SmtjCase l o d c
  | para7         : Paragraph7Locus l o c → SmtjCase l o d c
  | para8         : Paragraph8Locus l o c → SmtjCase l o d c
  | para9         : Paragraph9Locus l o d c → SmtjCase l o d c
  | residualOther : IsSpecialMaritimeAndTerritorialJurisdiction l c → SmtjCase l o d c



structure SmtjMembership (l : Locus) (o : Offense) (d : Person) (c : ComplaintText) : Prop where
  case   : SmtjCase l o d c
  member : IsSpecialMaritimeAndTerritorialJurisdiction l c




inductive Paragraph10Institution (e : Entity) (c : ComplaintText) : Prop where
  | mortgageLendingBusiness : IsMortgageLendingBusiness e c → Paragraph10Institution e c
  | federallyRelatedLender  : MakesFederallyRelatedMortgageLoan e c → Paragraph10Institution e c



inductive FinancialInstitutionCase (e : Entity) (c : ComplaintText) : Prop where
  | insuredDepository   : IsInsuredDepositoryInstitution e c → FinancialInstitutionCase e c
  | creditUnion         : IsCreditUnionWithInsuredAccounts e c → FinancialInstitutionCase e c
  | homeLoanBank        : IsFederalHomeLoanBankOrSystemMember e c → FinancialInstitutionCase e c
  | farmCredit          : IsFarmCreditSystemInstitution e c → FinancialInstitutionCase e c
  | sbic                : IsSmallBusinessInvestmentCompany e c → FinancialInstitutionCase e c
  | holdingCompany      : IsDepositoryInstitutionHoldingCompany e c → FinancialInstitutionCase e c
  | federalReserve      : IsFederalReserveBankOrMemberBank e c → FinancialInstitutionCase e c
  | edgeActOrganization :
      IsOrganizationOperatingUnderFederalReserveActSection25 e c → FinancialInstitutionCase e c
  | foreignBankBranch   : IsBranchOrAgencyOfForeignBank e c → FinancialInstitutionCase e c
  | mortgageLending     : Paragraph10Institution e c → FinancialInstitutionCase e c


structure FinancialInstitutionMembership (e : Entity) (c : ComplaintText) : Prop where
  case   : FinancialInstitutionCase e c
  member : IsFinancialInstitution e c





structure ProscribedCharacterElement (d : Person) (p : Property) (c : ComplaintText) : Prop where
  character : IsPropertyOfProscribedCharacter p c
  knowledge : DefendantKnewPropertyCharacter d p c



inductive OfficialRepresentationCase (r : Representation) (o : Person) (c : ComplaintText) : Prop where
  | byOfficer :
      IsFederalLawEnforcementOfficer o c → MadeByFederalLawEnforcementOfficer r o c →
        OfficialRepresentationCase r o c
  | atDirectionOrApproval :
      IsFederalLawEnforcementOfficer o c → MadeAtDirectionOrWithApprovalOfOfficer r o c →
        OfficialRepresentationCase r o c


structure OfficialRepresentationMembership
    (r : Representation) (o : Person) (c : ComplaintText) : Prop where
  case   : OfficialRepresentationCase r o c
  member : IsOfficialRepresentation r c




structure SubstituteProofOfProscribedCharacter
    (d : Person) (p : Property) (r : Representation) (c : ComplaintText) : Prop where
  official : IsOfficialRepresentation r c
  sequence : BeliefFollowedOfficialRepresentation d r c
  belief   : DefendantBelievedPropertyCharacter d p c



inductive ProscribedCharacterEstablished
    (d : Person) (p : Property) (r : Representation) (c : ComplaintText) : Prop where
  | direct     : ProscribedCharacterElement d p c → ProscribedCharacterEstablished d p r c
  | substitute :
      SubstituteProofOfProscribedCharacter d p r c → ProscribedCharacterEstablished d p r c






inductive CourtOfTheUnitedStatesCase (ct : Court) (c : ComplaintText) : Prop where
  | districtCourtOfGuam    : IsDistrictCourtOfGuam ct c → CourtOfTheUnitedStatesCase ct c
  | districtCourtNorthernMarianaIslands :
      IsDistrictCourtForNorthernMarianaIslands ct c → CourtOfTheUnitedStatesCase ct c
  | districtCourtVirginIslands :
      IsDistrictCourtOfTheVirginIslands ct c → CourtOfTheUnitedStatesCase ct c
  | residualOther          : IsCourtOfTheUnitedStates ct c → CourtOfTheUnitedStatesCase ct c




structure CourtOfTheUnitedStatesMembership (ct : Court) (c : ComplaintText) : Prop where
  notOtherwiseProvided : ¬ ExpresslyProvidedOtherwise ct c
  case                 : CourtOfTheUnitedStatesCase ct c
  member               : IsCourtOfTheUnitedStates ct c





structure ConditionalPredicateOffense
    (o : Offense) (b : BenefitProgram) (c : ComplaintText) : Prop where
  listed      : IsSubsectionA2PredicateOffense o c
  relatedness : RelatesToHealthCareBenefitProgram o b c
  program     : IsHealthCareBenefitProgram b c



inductive FederalHealthCareOffenseCase
    (o : Offense) (b : BenefitProgram) (c : ComplaintText) : Prop where
  | unconditional : IsSubsectionA1PredicateOffense o c → FederalHealthCareOffenseCase o b c
  | conditional   : ConditionalPredicateOffense o b c → FederalHealthCareOffenseCase o b c


structure FederalHealthCareOffenseMembership
    (o : Offense) (b : BenefitProgram) (c : ComplaintText) : Prop where
  violationOrConspiracy : IsViolationOrCriminalConspiracyToViolate o c
  case                  : FederalHealthCareOffenseCase o b c
  member                : IsFederalHealthCareOffense o c




structure HealthCareBenefitPlan (b : BenefitProgram) (c : ComplaintText) : Prop where
  planOrContract : IsPublicOrPrivatePlanOrContract b c
  commerce       : AffectsCommerce b c
  medicalBenefit : ProvidesMedicalBenefitItemOrServiceToIndividual b c



inductive HealthCareBenefitProgramCase
    (b : BenefitProgram) (e : Entity) (c : ComplaintText) : Prop where
  | plan     : HealthCareBenefitPlan b c → HealthCareBenefitProgramCase b e c
  | provider :
      IsProviderOfMedicalBenefitItemOrServicePayableUnderPlan e b c →
        HealthCareBenefitProgramCase b e c


structure HealthCareBenefitProgramMembership
    (b : BenefitProgram) (e : Entity) (c : ComplaintText) : Prop where
  case   : HealthCareBenefitProgramCase b e c
  member : IsHealthCareBenefitProgram b c

end Proving.USC.T18.Ch1.Reslice.Ontology
