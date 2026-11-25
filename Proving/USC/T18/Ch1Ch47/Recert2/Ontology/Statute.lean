import Proving.USC.T18.Ch1Ch47.Recert2.Ontology.Predicates






















set_option autoImplicit false

namespace Proving.USC.T18.Ch1Ch47.Recert2.Ontology

open Proving.USC.Common




structure TermDecl where

  term       : String

  citeDefine : String

  scope      : String

  form       : String



structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String




structure DanglingRef where
  usedTerm  : String
  usedAt    : String
  definedAt : String


def termDecls : List TermDecl :=
  [ { term := "special maritime and territorial jurisdiction of the United States",
      citeDefine := "18 USC § 7", scope := "this title", form := "includes" },
    { term := "financial institution",
      citeDefine := "18 USC § 20", scope := "this title", form := "means" },
    { term := "official representation",
      citeDefine := "18 USC § 21(b)", scope := "this section", form := "means" },
    { term := "court of the United States",
      citeDefine := "18 USC § 23",
      scope := "this title, except where otherwise expressly provided",
      form := "includes" },
    { term := "Federal health care offense",
      citeDefine := "18 USC § 24(a)", scope := "this title", form := "means" },
    { term := "health care benefit program",
      citeDefine := "18 USC § 24(b)", scope := "this title", form := "means" },
    { term := "authentication feature",
      citeDefine := "18 USC § 1028(d)(1)",
      scope := "this section and section 1028A", form := "means" },
    { term := "document-making implement",
      citeDefine := "18 USC § 1028(d)(2)",
      scope := "this section and section 1028A", form := "means" },
    { term := "identification document",
      citeDefine := "18 USC § 1028(d)(3)",
      scope := "this section and section 1028A", form := "means" },
    { term := "false identification document",
      citeDefine := "18 USC § 1028(d)(4)",
      scope := "this section and section 1028A", form := "means" },
    { term := "false authentication feature",
      citeDefine := "18 USC § 1028(d)(5)",
      scope := "this section and section 1028A", form := "means" },
    { term := "issuing authority",
      citeDefine := "18 USC § 1028(d)(6)",
      scope := "this section and section 1028A", form := "means and includes" },
    { term := "means of identification",
      citeDefine := "18 USC § 1028(d)(7)",
      scope := "this section and section 1028A", form := "means" },
    { term := "personal identification card",
      citeDefine := "18 USC § 1028(d)(8)",
      scope := "this section and section 1028A", form := "means" },
    { term := "produce (§ 1028)",
      citeDefine := "18 USC § 1028(d)(9)",
      scope := "this section and section 1028A", form := "includes" },
    { term := "transfer (§ 1028)",
      citeDefine := "18 USC § 1028(d)(10)",
      scope := "this section and section 1028A", form := "includes" },
    { term := "State (§ 1028)",
      citeDefine := "18 USC § 1028(d)(11)",
      scope := "this section and section 1028A", form := "includes" },
    { term := "traffic (§ 1028)",
      citeDefine := "18 USC § 1028(d)(12)",
      scope := "this section and section 1028A", form := "means" },
    { term := "access device",
      citeDefine := "18 USC § 1029(e)(1)", scope := "this section", form := "means" },
    { term := "counterfeit access device",
      citeDefine := "18 USC § 1029(e)(2)", scope := "this section", form := "means" },
    { term := "unauthorized access device",
      citeDefine := "18 USC § 1029(e)(3)", scope := "this section", form := "means" },
    { term := "produce (§ 1029)",
      citeDefine := "18 USC § 1029(e)(4)", scope := "this section", form := "includes" },
    { term := "traffic (§ 1029)",
      citeDefine := "18 USC § 1029(e)(5)", scope := "this section", form := "means" },
    { term := "device-making equipment",
      citeDefine := "18 USC § 1029(e)(6)", scope := "this section", form := "means" },
    { term := "credit card system member",
      citeDefine := "18 USC § 1029(e)(7)", scope := "this section", form := "means" },
    { term := "scanning receiver",
      citeDefine := "18 USC § 1029(e)(8)", scope := "this section", form := "means" },
    { term := "telecommunications service",
      citeDefine := "18 USC § 1029(e)(9)", scope := "this section",
      form := "has the meaning given (delegated to 47 USC § 153)" },
    { term := "facilities-based carrier",
      citeDefine := "18 USC § 1029(e)(10)", scope := "this section", form := "means" },
    { term := "telecommunication identifying information",
      citeDefine := "18 USC § 1029(e)(11)", scope := "this section", form := "means" },
    { term := "State (§ 1029)",
      citeDefine := "18 USC § 1029(f)", scope := "this subsection", form := "includes" } ]


def defEdges : List DefEdge :=
  [
    { defined := "special maritime and territorial jurisdiction of the United States",
      dependsOn := "national of the United States", citeDefine := "18 USC § 7(7)" },
    { defined := "special maritime and territorial jurisdiction of the United States",
      dependsOn := "national of the United States", citeDefine := "18 USC § 7(8)" },
    { defined := "special maritime and territorial jurisdiction of the United States",
      dependsOn := "national of the United States", citeDefine := "18 USC § 7(9)" },
    { defined := "special maritime and territorial jurisdiction of the United States",
      dependsOn := "person described in section 3261(a)", citeDefine := "18 USC § 7(9)" },
    { defined := "special maritime and territorial jurisdiction of the United States",
      dependsOn := "State", citeDefine := "18 USC § 7(1)" },

    { defined := "financial institution", dependsOn := "insured depository institution",
      citeDefine := "18 USC § 20(1)" },
    { defined := "financial institution",
      dependsOn := "member of the Federal home loan bank system",
      citeDefine := "18 USC § 20(3)" },
    { defined := "financial institution",
      dependsOn := "System institution of the Farm Credit System",
      citeDefine := "18 USC § 20(4)" },
    { defined := "financial institution", dependsOn := "small business investment company",
      citeDefine := "18 USC § 20(5)" },
    { defined := "financial institution",
      dependsOn := "depository institution holding company", citeDefine := "18 USC § 20(6)" },
    { defined := "financial institution", dependsOn := "branch or agency of a foreign bank",
      citeDefine := "18 USC § 20(9)" },
    { defined := "financial institution", dependsOn := "mortgage lending business",
      citeDefine := "18 USC § 20(10)" },
    { defined := "financial institution", dependsOn := "federally related mortgage loan",
      citeDefine := "18 USC § 20(10)" },

    { defined := "official representation", dependsOn := "Federal law enforcement officer",
      citeDefine := "18 USC § 21(b)" },

    { defined := "Federal health care offense", dependsOn := "health care benefit program",
      citeDefine := "18 USC § 24(a)(2)" },

    { defined := "authentication feature", dependsOn := "issuing authority",
      citeDefine := "18 USC § 1028(d)(1)" },
    { defined := "authentication feature", dependsOn := "identification document",
      citeDefine := "18 USC § 1028(d)(1)" },
    { defined := "authentication feature", dependsOn := "document-making implement",
      citeDefine := "18 USC § 1028(d)(1)" },
    { defined := "authentication feature", dependsOn := "means of identification",
      citeDefine := "18 USC § 1028(d)(1)" },
    { defined := "document-making implement", dependsOn := "identification document",
      citeDefine := "18 USC § 1028(d)(2)" },
    { defined := "document-making implement", dependsOn := "false identification document",
      citeDefine := "18 USC § 1028(d)(2)" },
    { defined := "identification document", dependsOn := "State (§ 1028)",
      citeDefine := "18 USC § 1028(d)(3)" },
    { defined := "identification document",
      dependsOn := "sponsoring entity of an event designated as a special event of national significance",
      citeDefine := "18 USC § 1028(d)(3)" },
    { defined := "false identification document", dependsOn := "State (§ 1028)",
      citeDefine := "18 USC § 1028(d)(4)" },
    { defined := "false authentication feature", dependsOn := "authentication feature",
      citeDefine := "18 USC § 1028(d)(5)" },
    { defined := "false authentication feature", dependsOn := "issuing authority",
      citeDefine := "18 USC § 1028(d)(5)" },
    { defined := "false authentication feature", dependsOn := "identification document",
      citeDefine := "18 USC § 1028(d)(5)(B)" },
    { defined := "false authentication feature", dependsOn := "document-making implement",
      citeDefine := "18 USC § 1028(d)(5)(B)" },
    { defined := "false authentication feature", dependsOn := "means of identification",
      citeDefine := "18 USC § 1028(d)(5)(B)" },
    { defined := "issuing authority", dependsOn := "identification document",
      citeDefine := "18 USC § 1028(d)(6)(A)" },
    { defined := "issuing authority", dependsOn := "means of identification",
      citeDefine := "18 USC § 1028(d)(6)(A)" },
    { defined := "issuing authority", dependsOn := "authentication feature",
      citeDefine := "18 USC § 1028(d)(6)(A)" },
    { defined := "issuing authority", dependsOn := "State (§ 1028)",
      citeDefine := "18 USC § 1028(d)(6)(B)" },
    { defined := "means of identification",
      dependsOn := "telecommunication identifying information",
      citeDefine := "18 USC § 1028(d)(7)(D)" },

    { defined := "means of identification", dependsOn := "access device",
      citeDefine := "18 USC § 1028(d)(7)(D)" },
    { defined := "personal identification card", dependsOn := "identification document",
      citeDefine := "18 USC § 1028(d)(8)" },
    { defined := "personal identification card", dependsOn := "State (§ 1028)",
      citeDefine := "18 USC § 1028(d)(8)" },
    { defined := "transfer (§ 1028)", dependsOn := "identification document",
      citeDefine := "18 USC § 1028(d)(10)" },
    { defined := "transfer (§ 1028)", dependsOn := "false identification document",
      citeDefine := "18 USC § 1028(d)(10)" },
    { defined := "transfer (§ 1028)", dependsOn := "document-making implement",
      citeDefine := "18 USC § 1028(d)(10)" },

    { defined := "access device", dependsOn := "telecommunications service",
      citeDefine := "18 USC § 1029(e)(1)" },
    { defined := "counterfeit access device", dependsOn := "access device",
      citeDefine := "18 USC § 1029(e)(2)" },
    { defined := "unauthorized access device", dependsOn := "access device",
      citeDefine := "18 USC § 1029(e)(3)" },
    { defined := "device-making equipment", dependsOn := "access device",
      citeDefine := "18 USC § 1029(e)(6)" },
    { defined := "device-making equipment", dependsOn := "counterfeit access device",
      citeDefine := "18 USC § 1029(e)(6)" },

    { defined := "credit card system member", dependsOn := "financial institution",
      citeDefine := "18 USC § 1029(e)(7)" },
    { defined := "credit card system member", dependsOn := "credit card system",
      citeDefine := "18 USC § 1029(e)(7)" },
    { defined := "scanning receiver", dependsOn := "telecommunications service",
      citeDefine := "18 USC § 1029(e)(8)" },
    { defined := "telecommunication identifying information",
      dependsOn := "telecommunications instrument", citeDefine := "18 USC § 1029(e)(11)" } ]



def usingEdges : List DefEdge :=
  [ { defined := "18 USC § 1028(a)", dependsOn := "identification document",
      citeDefine := "18 USC § 1028(a)" },
    { defined := "18 USC § 1028(a)", dependsOn := "authentication feature",
      citeDefine := "18 USC § 1028(a)" },
    { defined := "18 USC § 1028(a)", dependsOn := "false identification document",
      citeDefine := "18 USC § 1028(a)" },
    { defined := "18 USC § 1028(a)", dependsOn := "document-making implement",
      citeDefine := "18 USC § 1028(a)(5)" },
    { defined := "18 USC § 1028(a)", dependsOn := "means of identification",
      citeDefine := "18 USC § 1028(a)(7)" },
    { defined := "18 USC § 1028(a)", dependsOn := "traffic (§ 1028)",
      citeDefine := "18 USC § 1028(a)(8)" },
    { defined := "18 USC § 1028(a)", dependsOn := "produce (§ 1028)",
      citeDefine := "18 USC § 1028(a)(1)" },
    { defined := "18 USC § 1028(a)", dependsOn := "transfer (§ 1028)",
      citeDefine := "18 USC § 1028(a)(2)" },
    { defined := "18 USC § 1028(b)", dependsOn := "personal identification card",
      citeDefine := "18 USC § 1028(b)(1)(A)(ii)" },
    { defined := "18 USC § 1028(c)", dependsOn := "identification document",
      citeDefine := "18 USC § 1028(c)(1)" },
    { defined := "18 USC § 1028(c)", dependsOn := "means of identification",
      citeDefine := "18 USC § 1028(c)(3)(B)" },
    { defined := "18 USC § 1028(e)", dependsOn := "State (§ 1028)",
      citeDefine := "18 USC § 1028(e)" },
    { defined := "18 USC § 1029(a)", dependsOn := "access device",
      citeDefine := "18 USC § 1029(a)" },
    { defined := "18 USC § 1029(a)", dependsOn := "counterfeit access device",
      citeDefine := "18 USC § 1029(a)(1)" },
    { defined := "18 USC § 1029(a)", dependsOn := "unauthorized access device",
      citeDefine := "18 USC § 1029(a)(2)" },
    { defined := "18 USC § 1029(a)", dependsOn := "device-making equipment",
      citeDefine := "18 USC § 1029(a)(4)" },
    { defined := "18 USC § 1029(a)", dependsOn := "scanning receiver",
      citeDefine := "18 USC § 1029(a)(8)" },
    { defined := "18 USC § 1029(a)", dependsOn := "telecommunication identifying information",
      citeDefine := "18 USC § 1029(a)(9)" },
    { defined := "18 USC § 1029(a)", dependsOn := "credit card system member",
      citeDefine := "18 USC § 1029(a)(10)" },
    { defined := "18 USC § 1029(a)", dependsOn := "traffic (§ 1029)",
      citeDefine := "18 USC § 1029(a)(1)" },
    { defined := "18 USC § 1029(a)", dependsOn := "produce (§ 1029)",
      citeDefine := "18 USC § 1029(a)(1)" },
    { defined := "18 USC § 1029(g)", dependsOn := "facilities-based carrier",
      citeDefine := "18 USC § 1029(g)(1)" },
    { defined := "18 USC § 1029(h)", dependsOn := "financial institution",
      citeDefine := "18 USC § 1029(h)" },
    { defined := "18 USC § 1029(h)", dependsOn := "credit card system member",
      citeDefine := "18 USC § 1029(h)" },
    { defined := "18 USC § 21(a)", dependsOn := "official representation",
      citeDefine := "18 USC § 21(a)" } ]


def danglingRefs : List DanglingRef :=
  [ { usedTerm := "national of the United States", usedAt := "18 USC § 7(7), (8), (9)",
      definedAt := "INA § 101 (8 USC § 1101) — outside Title 18" },
    { usedTerm := "person described in section 3261(a)", usedAt := "18 USC § 7(9)",
      definedAt := "18 USC § 3261(a) — in Title 18, outside this slice" },
    { usedTerm := "State", usedAt := "18 USC § 7(1), (3), (5)",
      definedAt := "(undefined) — § 1028(d)(11) and § 1029(f) bind only their own sections" },
    { usedTerm := "vessel", usedAt := "18 USC § 7(1), (2), (8)", definedAt := "(undefined)" },
    { usedTerm := "insured depository institution", usedAt := "18 USC § 20(1)",
      definedAt := "FDIA § 3(c)(2) (12 USC § 1813(c)(2)) — outside Title 18" },
    { usedTerm := "member of the Federal home loan bank system", usedAt := "18 USC § 20(3)",
      definedAt := "FHLB Act § 2 (12 USC § 1422) — outside Title 18" },
    { usedTerm := "System institution of the Farm Credit System", usedAt := "18 USC § 20(4)",
      definedAt := "Farm Credit Act of 1971 § 5.35(3) — outside Title 18" },
    { usedTerm := "small business investment company", usedAt := "18 USC § 20(5)",
      definedAt := "SBIA § 103 (15 USC § 662) — outside Title 18" },
    { usedTerm := "depository institution holding company", usedAt := "18 USC § 20(6)",
      definedAt := "FDIA § 3(w)(1) (12 USC § 1813(w)(1)) — outside Title 18" },
    { usedTerm := "organization operating under section 25 or 25(a) of the Federal Reserve Act",
      usedAt := "18 USC § 20(8)", definedAt := "Federal Reserve Act — outside Title 18" },
    { usedTerm := "branch or agency of a foreign bank", usedAt := "18 USC § 20(9)",
      definedAt := "IBA of 1978 § 1(b)(1), (3) (12 USC § 3101) — outside Title 18" },
    { usedTerm := "mortgage lending business", usedAt := "18 USC § 20(10)",
      definedAt := "18 USC § 27 — in Title 18, outside this slice" },
    { usedTerm := "federally related mortgage loan", usedAt := "18 USC § 20(10)",
      definedAt := "RESPA § 3 (12 USC § 2602) — outside Title 18" },
    { usedTerm := "Federal law enforcement officer", usedAt := "18 USC § 21(b)",
      definedAt := "18 USC § 115 — in Title 18, outside this slice" },
    { usedTerm := "the offenses enumerated in § 24(a)(1)–(2)", usedAt := "18 USC § 24(a)",
      definedAt := "18 USC §§ 287, 371, 664, 666, 669, 1001, 1027, 1035, 1341, 1343, 1347, 1349, 1518, 1954; 42 USC § 1320a–7b; 21 USC § 331; 29 USC § 1131; ERISA §§ 411, 511, 518 — all outside this slice" },
    { usedTerm := "sponsoring entity of an event designated as a special event of national significance",
      usedAt := "18 USC § 1028(c)(1), (d)(1), (3), (4)(B), (6)(B)",
      definedAt := "(undefined) — defined nowhere in § 1028 or this slice" },
    { usedTerm := "governmental entity", usedAt := "18 USC § 1028(d)(4)(A)",
      definedAt := "(undefined)" },
    { usedTerm := "drug trafficking crime", usedAt := "18 USC § 1028(b)(3)(A)",
      definedAt := "18 USC § 929(a)(2) — in Title 18, outside this slice" },
    { usedTerm := "crime of violence", usedAt := "18 USC § 1028(b)(3)(B)",
      definedAt := "18 USC § 924(c)(3) — in Title 18, outside this slice" },
    { usedTerm := "act of domestic terrorism / international terrorism",
      usedAt := "18 USC § 1028(b)(4)",
      definedAt := "18 USC § 2331(5), (1) — in Title 18, outside this slice" },
    { usedTerm := "telecommunications service", usedAt := "18 USC § 1029(e)(1), (8), (9)",
      definedAt := "Communications Act of 1934 § 3 (47 USC § 153) — outside Title 18" },
    { usedTerm := "credit card system", usedAt := "18 USC § 1029(e)(7)",
      definedAt := "(undefined) — defined nowhere in § 1029 or this slice" },
    { usedTerm := "telecommunications instrument",
      usedAt := "18 USC § 1029(a)(7), (9), (e)(11)", definedAt := "(undefined)" },
    { usedTerm := "issuer (of the access device)", usedAt := "18 USC § 1029(a)(6)",
      definedAt := "(undefined)" } ]






inductive SpecialMaritimeTerritorialJurisdictionCase
    (l : Locus) (p : Person) (o : Offense) (c : ComplaintText) : Prop where
  | highSeasOrUsVessel :
      IsHighSeasOrUsAdmiraltyWatersOrUsVessel l c →
      SpecialMaritimeTerritorialJurisdictionCase l p o c
  | greatLakesVessel :
      IsGreatLakesUsRegisteredVessel l c →
      SpecialMaritimeTerritorialJurisdictionCase l p o c
  | reservedOrAcquiredLands :
      IsUsReservedOrAcquiredLands l c →
      SpecialMaritimeTerritorialJurisdictionCase l p o c
  | guanoIsland :
      IsGuanoIslandAppertainingToUnitedStates l c →
      SpecialMaritimeTerritorialJurisdictionCase l p o c
  | usAircraftInFlight :
      IsUsAircraftInFlightOverAdmiraltyWaters l c →
      SpecialMaritimeTerritorialJurisdictionCase l p o c
  | spaceVehicleInFlight :
      IsUsRegisteredSpaceVehicleInFlight l c →
      SpecialMaritimeTerritorialJurisdictionCase l p o c
  | outsideAnyNation :
      IsPlaceOutsideJurisdictionOfAnyNation l c →
      IsNationalOfTheUnitedStates p c →
      OffenseIsByOrAgainstPerson o p c →
      SpecialMaritimeTerritorialJurisdictionCase l p o c
  | foreignVesselScheduledUsVoyage :
      IsForeignVesselOnScheduledUsVoyage l c →
      IsNationalOfTheUnitedStates p c →
      OffenseIsByOrAgainstPerson o p c →
      SpecialMaritimeTerritorialJurisdictionCase l p o c
  | usMissionPremisesAbroad :
      IsUsMissionPremisesOrResidenceInForeignState l c →
      IsNationalOfTheUnitedStates p c →
      OffenseIsByOrAgainstPerson o p c →
      ¬ OffenseCommittedByPersonDescribedInSection3261a o c →
      SpecialMaritimeTerritorialJurisdictionCase l p o c


structure SpecialMaritimeTerritorialJurisdictionMembership
    (l : Locus) (p : Person) (o : Offense) (c : ComplaintText) : Prop where
  qualifyingCase : SpecialMaritimeTerritorialJurisdictionCase l p o c
  member         : IsSpecialMaritimeAndTerritorialJurisdiction l c




inductive FinancialInstitutionCase (e : Entity) (c : ComplaintText) : Prop where
  | insuredDepositoryInstitution : IsInsuredDepositoryInstitution e c → FinancialInstitutionCase e c
  | insuredCreditUnion : IsNcusifInsuredCreditUnion e c → FinancialInstitutionCase e c
  | homeLoanBankOrMember : IsFederalHomeLoanBankOrSystemMember e c → FinancialInstitutionCase e c
  | farmCreditSystemInstitution : IsFarmCreditSystemInstitution e c → FinancialInstitutionCase e c
  | smallBusinessInvestmentCompany : IsSmallBusinessInvestmentCompany e c → FinancialInstitutionCase e c
  | depositoryInstitutionHoldingCompany : IsDepositoryInstitutionHoldingCompany e c → FinancialInstitutionCase e c
  | federalReserveBankOrMemberBank : IsFederalReserveBankOrMemberBank e c → FinancialInstitutionCase e c
  | edgeActOrAgreementCorporation : IsEdgeActOrAgreementCorporation e c → FinancialInstitutionCase e c
  | branchOrAgencyOfForeignBank : IsBranchOrAgencyOfForeignBank e c → FinancialInstitutionCase e c
  | mortgageLendingBusiness : IsMortgageLendingBusinessOrFederallyRelatedMortgageLender e c → FinancialInstitutionCase e c


structure FinancialInstitutionMembership (e : Entity) (c : ComplaintText) : Prop where
  qualifyingCase : FinancialInstitutionCase e c
  member         : IsFinancialInstitution e c





inductive OfficialRepresentationCase
    (r : Representation) (p : Person) (c : ComplaintText) : Prop where
  | madeByOfficer :
      IsFederalLawEnforcementOfficer p c →
      RepresentationMadeByFederalLawEnforcementOfficer r p c →
      OfficialRepresentationCase r p c
  | madeAtDirectionOfOfficer :
      IsFederalLawEnforcementOfficer p c →
      RepresentationMadeAtDirectionOrApprovalOfOfficer r p c →
      OfficialRepresentationCase r p c


structure OfficialRepresentationMembership
    (r : Representation) (p : Person) (c : ComplaintText) : Prop where
  qualifyingCase : OfficialRepresentationCase r p c
  member         : IsOfficialRepresentation r c





inductive StolenOrCounterfeitNatureElement
    (d : Person) (x : PropertyItem) (r : Representation) (c : ComplaintText) : Prop where
  | actualCharacterAndKnowledge :
      HasStolenOrCounterfeitCharacter x c →
      DefendantKnewStolenOrCounterfeitCharacter d x c →
      StolenOrCounterfeitNatureElement d x r c
  | beliefAfterOfficialRepresentation :
      IsOfficialRepresentation r c →
      DefendantBelievedStolenOrCounterfeitCharacter d x c →
      StolenOrCounterfeitNatureElement d x r c






inductive CourtOfTheUnitedStatesInclusion (ct : Court) (c : ComplaintText) : Prop where
  | districtCourtOfGuam : IsDistrictCourtOfGuam ct c → CourtOfTheUnitedStatesInclusion ct c
  | districtCourtNorthernMarianaIslands :
      IsDistrictCourtForNorthernMarianaIslands ct c → CourtOfTheUnitedStatesInclusion ct c
  | districtCourtVirginIslands :
      IsDistrictCourtOfVirginIslands ct c → CourtOfTheUnitedStatesInclusion ct c


structure CourtOfTheUnitedStatesMembership (ct : Court) (c : ComplaintText) : Prop where
  inclusion : CourtOfTheUnitedStatesInclusion ct c
  member    : IsCourtOfTheUnitedStates ct c





structure FederalHealthCareOffenseRelatedArm
    (o : Offense) (b : BenefitProgram) (c : ComplaintText) : Prop where
  enumeratedStatute : IsRelatedStatuteViolationOrConspiracy o c
  program           : IsHealthCareBenefitProgram b c
  relatedness       : OffenseRelatesToHealthCareBenefitProgram o b c


inductive FederalHealthCareOffenseCase
    (o : Offense) (b : BenefitProgram) (c : ComplaintText) : Prop where
  | coreStatute :
      IsCoreHealthCareStatuteViolationOrConspiracy o c →
      FederalHealthCareOffenseCase o b c
  | relatedStatute :
      FederalHealthCareOffenseRelatedArm o b c →
      FederalHealthCareOffenseCase o b c


structure FederalHealthCareOffenseMembership
    (o : Offense) (b : BenefitProgram) (c : ComplaintText) : Prop where
  qualifyingCase : FederalHealthCareOffenseCase o b c
  member         : IsFederalHealthCareOffense o c



inductive HealthCareBenefitProgramCase (b : BenefitProgram) (c : ComplaintText) : Prop where
  | planOrContract :
      IsPlanOrContractAffectingCommerceProvidingMedicalBenefit b c →
      HealthCareBenefitProgramCase b c
  | providerInclusion :
      IsProviderOfMedicalBenefitUnderPlanOrContract b c →
      HealthCareBenefitProgramCase b c


structure HealthCareBenefitProgramMembership (b : BenefitProgram) (c : ComplaintText) : Prop where
  qualifyingCase : HealthCareBenefitProgramCase b c
  member         : IsHealthCareBenefitProgram b c





structure IdentificationDocumentDefinition (d : Document) (c : ComplaintText) : Prop where
  governmentalIssuance : IsIssuedUnderGovernmentalAuthority d c
  commonlyAcceptedType : IsOfTypeCommonlyAcceptedForIdentification d c


structure IdentificationDocumentMembership (d : Document) (c : ComplaintText) : Prop where
  definition : IdentificationDocumentDefinition d c
  member     : IsIdentificationDocument d c



structure FalseIdentificationDocumentDefinition (d : Document) (c : ComplaintText) : Prop where
  commonlyAcceptedType : IsOfTypeCommonlyAcceptedForIdentification d c
  notGenuinelyIssued   : LacksGenuineGovernmentalIssuance d c
  appearsOfficial      : AppearsIssuedUnderGovernmentalAuthority d c


structure FalseIdentificationDocumentMembership (d : Document) (c : ComplaintText) : Prop where
  definition : FalseIdentificationDocumentDefinition d c
  member     : IsFalseIdentificationDocument d c


inductive FalseAuthenticationFeatureCase (f : Feature) (c : ComplaintText) : Prop where
  | genuineButTampered :
      IsGenuineButTamperedWithoutAuthorization f c → FalseAuthenticationFeatureCase f c
  | genuineButUnauthorizedDistribution :
      IsGenuineButDistributedWithoutAuthorization f c → FalseAuthenticationFeatureCase f c
  | apparentButNotGenuine :
      AppearsGenuineButIsNot f c → FalseAuthenticationFeatureCase f c



structure FalseAuthenticationFeatureMembership (f : Feature) (c : ComplaintText) : Prop where
  baseFeature    : IsAuthenticationFeature f c
  qualifyingCase : FalseAuthenticationFeatureCase f c
  member         : IsFalseAuthenticationFeature f c


inductive IssuingAuthorityCase (a : Authority) (c : ComplaintText) : Prop where
  | authorizedGovernmentalEntity :
      IsGovernmentalEntityAuthorizedToIssue a c → IssuingAuthorityCase a c
  | enumeratedGovernmentalIssuer :
      IsEnumeratedGovernmentalIssuer a c → IssuingAuthorityCase a c


structure IssuingAuthorityMembership (a : Authority) (c : ComplaintText) : Prop where
  qualifyingCase : IssuingAuthorityCase a c
  member         : IsIssuingAuthority a c



inductive MeansOfIdentificationKind (m : Identifier) (c : ComplaintText) : Prop where
  | nameOrGovernmentNumber : IsNameOrGovernmentIssuedNumber m c → MeansOfIdentificationKind m c
  | biometric : IsUniqueBiometricData m c → MeansOfIdentificationKind m c
  | electronicIdentifier : IsUniqueElectronicIdentifier m c → MeansOfIdentificationKind m c
  | telecomOrAccessDevice :
      IsTelecomIdentifyingInformationOrAccessDeviceIdentifier m c → MeansOfIdentificationKind m c




structure MeansOfIdentificationEnumeratedInstance (m : Identifier) (c : ComplaintText) : Prop where
  identifiesIndividual : IdentifiesSpecificIndividual m c
  enumeratedKind       : MeansOfIdentificationKind m c


structure MeansOfIdentificationMembership (m : Identifier) (c : ComplaintText) : Prop where
  enumerated : MeansOfIdentificationEnumeratedInstance m c
  member     : IsMeansOfIdentification m c




structure AccessDeviceAsMeansOfIdentification
    (m : Identifier) (a : AccessDevice) (c : ComplaintText) : Prop where
  device               : IsAccessDevice a c
  identifierForm       : IsTelecomIdentifyingInformationOrAccessDeviceIdentifier m c
  identifiesIndividual : IdentifiesSpecificIndividual m c
  member               : IsMeansOfIdentification m c



structure PersonalIdentificationCardDefinition (d : Document) (c : ComplaintText) : Prop where
  identificationDocument : IsIdentificationDocument d c
  soleIdentificationUse  : IsIssuedByStateOrLocalGovernmentSolelyForIdentification d c


structure PersonalIdentificationCardMembership (d : Document) (c : ComplaintText) : Prop where
  definition : PersonalIdentificationCardDefinition d c
  member     : IsPersonalIdentificationCard d c


inductive TrafficConductCaseUnderSection1028 (k : Conduct) (c : ComplaintText) : Prop where
  | disposalForConsideration :
      IsDisposalToAnotherForConsideration k c → TrafficConductCaseUnderSection1028 k c
  | controlWithIntentToDispose :
      IsControlObtainedWithIntentToDispose k c → TrafficConductCaseUnderSection1028 k c


structure TrafficConductMembershipUnderSection1028 (k : Conduct) (c : ComplaintText) : Prop where
  qualifyingCase : TrafficConductCaseUnderSection1028 k c
  member         : IsTrafficConductUnderSection1028 k c






structure AccessDeviceDefinition (a : AccessDevice) (c : ComplaintText) : Prop where
  identifierForm : IsCardPlateCodeOrAccountIdentifier a c
  capability     : CanBeUsedToObtainValueOrInitiateFundsTransfer a c


structure AccessDeviceMembership (a : AccessDevice) (c : ComplaintText) : Prop where
  definition : AccessDeviceDefinition a c
  member     : IsAccessDevice a c



inductive CounterfeitAccessDeviceCase (a : AccessDevice) (c : ComplaintText) : Prop where
  | counterfeitDevice :
      IsAccessDevice a c → IsCounterfeitFictitiousAlteredOrForged a c →
      CounterfeitAccessDeviceCase a c
  | identifiableComponent :
      IsIdentifiableComponentOfAccessDevice a c → CounterfeitAccessDeviceCase a c


structure CounterfeitAccessDeviceMembership (a : AccessDevice) (c : ComplaintText) : Prop where
  qualifyingCase : CounterfeitAccessDeviceCase a c
  member         : IsCounterfeitAccessDevice a c



inductive UnauthorizedAccessDeviceCase (a : AccessDevice) (c : ComplaintText) : Prop where
  | lostStolenExpiredRevokedCanceled :
      IsAccessDevice a c → IsLostStolenExpiredRevokedOrCanceled a c →
      UnauthorizedAccessDeviceCase a c
  | obtainedWithIntentToDefraud :
      IsAccessDevice a c → WasObtainedWithIntentToDefraud a c →
      UnauthorizedAccessDeviceCase a c


structure UnauthorizedAccessDeviceMembership (a : AccessDevice) (c : ComplaintText) : Prop where
  qualifyingCase : UnauthorizedAccessDeviceCase a c
  member         : IsUnauthorizedAccessDevice a c



inductive TrafficConductCaseUnderSection1029 (k : Conduct) (c : ComplaintText) : Prop where
  | transferOrDisposal :
      IsTransferOrDisposalToAnother k c → TrafficConductCaseUnderSection1029 k c
  | controlWithIntent :
      IsControlObtainedWithIntentToTransferOrDispose k c → TrafficConductCaseUnderSection1029 k c


structure TrafficConductMembershipUnderSection1029 (k : Conduct) (c : ComplaintText) : Prop where
  qualifyingCase : TrafficConductCaseUnderSection1029 k c
  member         : IsTrafficConductUnderSection1029 k c



structure CreditCardSystemMemberMembership (e : Entity) (c : ComplaintText) : Prop where
  systemMembership : IsMemberOfCreditCardSystem e c
  member           : IsCreditCardSystemMember e c




structure FinancialInstitutionCreditCardSystemMember (e : Entity) (c : ComplaintText) : Prop where
  financialInstitution : IsFinancialInstitution e c
  systemMembership     : IsMemberOfCreditCardSystem e c
  member               : IsCreditCardSystemMember e c


structure FacilitiesBasedCarrierDefinition (car : Carrier) (c : ComplaintText) : Prop where
  ownsFacilities      : OwnsCommunicationsTransmissionFacilities car c
  operatesAndMaintains : IsResponsibleForFacilityOperationAndMaintenance car c
  fccLicense          : HoldsFccOperatingLicense car c


structure FacilitiesBasedCarrierMembership (car : Carrier) (c : ComplaintText) : Prop where
  definition : FacilitiesBasedCarrierDefinition car c
  member     : IsFacilitiesBasedCarrier car c

end Proving.USC.T18.Ch1Ch47.Recert2.Ontology
