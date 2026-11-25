import Proving.USC.T18.Ch1.Reslice.Ontology.Types
import Proving.USC.T18.Ch1.Reslice.Ontology.Predicates
import Proving.USC.T18.Ch1.Reslice.Ontology.Statute
import Proving.USC.Common.Types












set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T18.Ch1.Reslice.Ontology

open Proving.USC.Common




theorem admiraltyWatersLocus_intro {l : Locus} {c : ComplaintText}
    (hAdmiralty : IsWithinAdmiraltyAndMaritimeJurisdiction l c)
    (hOutside : IsOutOfJurisdictionOfAnyParticularState l c) :
    AdmiraltyWatersLocus l c := ⟨hAdmiralty, hOutside⟩


theorem unitedStatesConnectedVesselLocus_intro {l : Locus} {c : ComplaintText}
    (hVessel : IsVessel l c)
    (hBelonging : BelongsInWholeOrPartToUnitedStatesCitizenOrCorporation l c)
    (hAdmiralty : IsWithinAdmiraltyAndMaritimeJurisdiction l c)
    (hOutside : IsOutOfJurisdictionOfAnyParticularState l c) :
    UnitedStatesConnectedVesselLocus l c := ⟨hVessel, hBelonging, hAdmiralty, hOutside⟩

theorem paragraph1Locus_intro_highSeas {l : Locus} {c : ComplaintText}
    (h : IsHighSeas l c) : Paragraph1Locus l c := .highSeas h

theorem paragraph1Locus_intro_otherAdmiraltyWaters {l : Locus} {c : ComplaintText}
    (h : AdmiraltyWatersLocus l c) : Paragraph1Locus l c := .otherAdmiraltyWaters h

theorem paragraph1Locus_intro_unitedStatesVessel {l : Locus} {c : ComplaintText}
    (h : UnitedStatesConnectedVesselLocus l c) : Paragraph1Locus l c := .unitedStatesVessel h


theorem paragraph2Locus_intro {l : Locus} {c : ComplaintText}
    (hVessel : IsVessel l c)
    (hRegistration : IsRegisteredLicensedOrEnrolledUnderUnitedStatesLaws l c)
    (hVoyage : IsOnVoyageUponGreatLakesOrConnectingWatersOrSaintLawrenceBoundary l c) :
    Paragraph2Locus l c := ⟨hVessel, hRegistration, hVoyage⟩


theorem reservedOrAcquiredLandsLocus_intro {l : Locus} {c : ComplaintText}
    (hLands : IsLandReservedOrAcquiredForUseOfUnitedStates l c)
    (hJurisdiction : IsUnderExclusiveOrConcurrentUnitedStatesJurisdiction l c) :
    ReservedOrAcquiredLandsLocus l c := ⟨hLands, hJurisdiction⟩

theorem paragraph3Locus_intro_reservedOrAcquired {l : Locus} {c : ComplaintText}
    (h : ReservedOrAcquiredLandsLocus l c) : Paragraph3Locus l c := .reservedOrAcquired h

theorem paragraph3Locus_intro_purchasedWithStateConsent {l : Locus} {c : ComplaintText}
    (h : IsPlacePurchasedByConsentOfStateLegislatureForNeedfulBuilding l c) :
    Paragraph3Locus l c := .purchasedWithStateConsent h


theorem paragraph4Locus_intro {l : Locus} {c : ComplaintText}
    (h : IsGuanoIslandAppertainingToUnitedStates l c) : Paragraph4Locus l c := ⟨h⟩


theorem paragraph5Locus_intro {l : Locus} {c : ComplaintText}
    (hInFlight : IsAircraftInFlightOverHighSeasOrAdmiraltyWaters l c)
    (hBelonging : BelongsInWholeOrPartToUnitedStatesCitizenOrCorporation l c) :
    Paragraph5Locus l c := ⟨hInFlight, hBelonging⟩


theorem paragraph6Locus_intro {l : Locus} {c : ComplaintText}
    (h : IsUnitedStatesRegisteredSpaceVehicleInFlight l c) : Paragraph6Locus l c := ⟨h⟩


theorem paragraph7Locus_intro {l : Locus} {o : Offense} {c : ComplaintText}
    (hOutside : IsPlaceOutsideJurisdictionOfAnyNation l c)
    (hNexus : OffenseByOrAgainstNationalOfTheUnitedStates o c) :
    Paragraph7Locus l o c := ⟨hOutside, hNexus⟩


theorem paragraph8Locus_intro {l : Locus} {o : Offense} {c : ComplaintText}
    (hIntlLaw : PermittedByInternationalLaw l c)
    (hForeignVessel : IsForeignVessel l c)
    (hVoyage : IsOnVoyageWithScheduledUnitedStatesDepartureOrArrival l c)
    (hNexus : OffenseByOrAgainstNationalOfTheUnitedStates o c) :
    Paragraph8Locus l o c := ⟨hIntlLaw, hForeignVessel, hVoyage, hNexus⟩

theorem paragraph9Site_intro_missionPremises {l : Locus} {c : ComplaintText}
    (h : IsUnitedStatesMissionPremises l c) : Paragraph9Site l c := .missionPremises h

theorem paragraph9Site_intro_missionResidence {l : Locus} {c : ComplaintText}
    (h : IsUnitedStatesMissionResidence l c) : Paragraph9Site l c := .missionResidence h


theorem paragraph9Locus_intro {l : Locus} {o : Offense} {d : Person} {c : ComplaintText}
    (hSite : Paragraph9Site l c)
    (hNexus : OffenseByOrAgainstNationalOfTheUnitedStates o c)
    (hNoTreatyConflict : ¬ ConflictsWithTreatyOrInternationalAgreement l c)
    (hNotCoveredPerson : ¬ IsPersonDescribedInSection3261a d c) :
    Paragraph9Locus l o d c := ⟨hSite, hNexus, hNoTreatyConflict, hNotCoveredPerson⟩

theorem smtjCase_intro_para1 {l : Locus} {o : Offense} {d : Person} {c : ComplaintText}
    (h : Paragraph1Locus l c) : SmtjCase l o d c := .para1 h

theorem smtjCase_intro_para2 {l : Locus} {o : Offense} {d : Person} {c : ComplaintText}
    (h : Paragraph2Locus l c) : SmtjCase l o d c := .para2 h

theorem smtjCase_intro_para3 {l : Locus} {o : Offense} {d : Person} {c : ComplaintText}
    (h : Paragraph3Locus l c) : SmtjCase l o d c := .para3 h

theorem smtjCase_intro_para4 {l : Locus} {o : Offense} {d : Person} {c : ComplaintText}
    (h : Paragraph4Locus l c) : SmtjCase l o d c := .para4 h

theorem smtjCase_intro_para5 {l : Locus} {o : Offense} {d : Person} {c : ComplaintText}
    (h : Paragraph5Locus l c) : SmtjCase l o d c := .para5 h

theorem smtjCase_intro_para6 {l : Locus} {o : Offense} {d : Person} {c : ComplaintText}
    (h : Paragraph6Locus l c) : SmtjCase l o d c := .para6 h

theorem smtjCase_intro_para7 {l : Locus} {o : Offense} {d : Person} {c : ComplaintText}
    (h : Paragraph7Locus l o c) : SmtjCase l o d c := .para7 h

theorem smtjCase_intro_para8 {l : Locus} {o : Offense} {d : Person} {c : ComplaintText}
    (h : Paragraph8Locus l o c) : SmtjCase l o d c := .para8 h

theorem smtjCase_intro_para9 {l : Locus} {o : Offense} {d : Person} {c : ComplaintText}
    (h : Paragraph9Locus l o d c) : SmtjCase l o d c := .para9 h



theorem smtjCase_intro_residualOther {l : Locus} {o : Offense} {d : Person} {c : ComplaintText}
    (h : IsSpecialMaritimeAndTerritorialJurisdiction l c) : SmtjCase l o d c := .residualOther h


theorem smtjMembership_intro {l : Locus} {o : Offense} {d : Person} {c : ComplaintText}
    (hCase : SmtjCase l o d c)
    (hMember : IsSpecialMaritimeAndTerritorialJurisdiction l c) :
    SmtjMembership l o d c := ⟨hCase, hMember⟩



theorem paragraph10Institution_intro_mortgageLendingBusiness
    {e : Entity} {c : ComplaintText}
    (h : IsMortgageLendingBusiness e c) : Paragraph10Institution e c := .mortgageLendingBusiness h

theorem paragraph10Institution_intro_federallyRelatedLender
    {e : Entity} {c : ComplaintText}
    (h : MakesFederallyRelatedMortgageLoan e c) : Paragraph10Institution e c :=
  .federallyRelatedLender h

theorem financialInstitutionCase_intro_insuredDepository {e : Entity} {c : ComplaintText}
    (h : IsInsuredDepositoryInstitution e c) : FinancialInstitutionCase e c := .insuredDepository h

theorem financialInstitutionCase_intro_creditUnion {e : Entity} {c : ComplaintText}
    (h : IsCreditUnionWithInsuredAccounts e c) : FinancialInstitutionCase e c := .creditUnion h

theorem financialInstitutionCase_intro_homeLoanBank {e : Entity} {c : ComplaintText}
    (h : IsFederalHomeLoanBankOrSystemMember e c) : FinancialInstitutionCase e c := .homeLoanBank h

theorem financialInstitutionCase_intro_farmCredit {e : Entity} {c : ComplaintText}
    (h : IsFarmCreditSystemInstitution e c) : FinancialInstitutionCase e c := .farmCredit h

theorem financialInstitutionCase_intro_sbic {e : Entity} {c : ComplaintText}
    (h : IsSmallBusinessInvestmentCompany e c) : FinancialInstitutionCase e c := .sbic h

theorem financialInstitutionCase_intro_holdingCompany {e : Entity} {c : ComplaintText}
    (h : IsDepositoryInstitutionHoldingCompany e c) : FinancialInstitutionCase e c :=
  .holdingCompany h

theorem financialInstitutionCase_intro_federalReserve {e : Entity} {c : ComplaintText}
    (h : IsFederalReserveBankOrMemberBank e c) : FinancialInstitutionCase e c := .federalReserve h

theorem financialInstitutionCase_intro_edgeActOrganization {e : Entity} {c : ComplaintText}
    (h : IsOrganizationOperatingUnderFederalReserveActSection25 e c) :
    FinancialInstitutionCase e c := .edgeActOrganization h

theorem financialInstitutionCase_intro_foreignBankBranch {e : Entity} {c : ComplaintText}
    (h : IsBranchOrAgencyOfForeignBank e c) : FinancialInstitutionCase e c := .foreignBankBranch h

theorem financialInstitutionCase_intro_mortgageLending {e : Entity} {c : ComplaintText}
    (h : Paragraph10Institution e c) : FinancialInstitutionCase e c := .mortgageLending h


theorem financialInstitutionMembership_intro {e : Entity} {c : ComplaintText}
    (hCase : FinancialInstitutionCase e c) (hMember : IsFinancialInstitution e c) :
    FinancialInstitutionMembership e c := ⟨hCase, hMember⟩




theorem proscribedCharacterElement_intro {d : Person} {p : Property} {c : ComplaintText}
    (hCharacter : IsPropertyOfProscribedCharacter p c)
    (hKnowledge : DefendantKnewPropertyCharacter d p c) :
    ProscribedCharacterElement d p c := ⟨hCharacter, hKnowledge⟩

theorem officialRepresentationCase_intro_byOfficer
    {r : Representation} {o : Person} {c : ComplaintText}
    (hOfficer : IsFederalLawEnforcementOfficer o c)
    (hMade : MadeByFederalLawEnforcementOfficer r o c) :
    OfficialRepresentationCase r o c := .byOfficer hOfficer hMade

theorem officialRepresentationCase_intro_atDirectionOrApproval
    {r : Representation} {o : Person} {c : ComplaintText}
    (hOfficer : IsFederalLawEnforcementOfficer o c)
    (hMade : MadeAtDirectionOrWithApprovalOfOfficer r o c) :
    OfficialRepresentationCase r o c := .atDirectionOrApproval hOfficer hMade


theorem officialRepresentationMembership_intro
    {r : Representation} {o : Person} {c : ComplaintText}
    (hCase : OfficialRepresentationCase r o c) (hMember : IsOfficialRepresentation r c) :
    OfficialRepresentationMembership r o c := ⟨hCase, hMember⟩


theorem substituteProofOfProscribedCharacter_intro
    {d : Person} {p : Property} {r : Representation} {c : ComplaintText}
    (hOfficial : IsOfficialRepresentation r c)
    (hSequence : BeliefFollowedOfficialRepresentation d r c)
    (hBelief : DefendantBelievedPropertyCharacter d p c) :
    SubstituteProofOfProscribedCharacter d p r c := ⟨hOfficial, hSequence, hBelief⟩

theorem proscribedCharacterEstablished_intro_direct
    {d : Person} {p : Property} {r : Representation} {c : ComplaintText}
    (h : ProscribedCharacterElement d p c) : ProscribedCharacterEstablished d p r c := .direct h

theorem proscribedCharacterEstablished_intro_substitute
    {d : Person} {p : Property} {r : Representation} {c : ComplaintText}
    (h : SubstituteProofOfProscribedCharacter d p r c) :
    ProscribedCharacterEstablished d p r c := .substitute h



theorem courtOfTheUnitedStatesCase_intro_districtCourtOfGuam
    {ct : Court} {c : ComplaintText}
    (h : IsDistrictCourtOfGuam ct c) : CourtOfTheUnitedStatesCase ct c := .districtCourtOfGuam h

theorem courtOfTheUnitedStatesCase_intro_districtCourtNorthernMarianaIslands
    {ct : Court} {c : ComplaintText}
    (h : IsDistrictCourtForNorthernMarianaIslands ct c) :
    CourtOfTheUnitedStatesCase ct c := .districtCourtNorthernMarianaIslands h

theorem courtOfTheUnitedStatesCase_intro_districtCourtVirginIslands
    {ct : Court} {c : ComplaintText}
    (h : IsDistrictCourtOfTheVirginIslands ct c) :
    CourtOfTheUnitedStatesCase ct c := .districtCourtVirginIslands h



theorem courtOfTheUnitedStatesCase_intro_residualOther
    {ct : Court} {c : ComplaintText}
    (h : IsCourtOfTheUnitedStates ct c) : CourtOfTheUnitedStatesCase ct c := .residualOther h



theorem courtOfTheUnitedStatesMembership_intro {ct : Court} {c : ComplaintText}
    (hNotOtherwise : ¬ ExpresslyProvidedOtherwise ct c)
    (hCase : CourtOfTheUnitedStatesCase ct c)
    (hMember : IsCourtOfTheUnitedStates ct c) :
    CourtOfTheUnitedStatesMembership ct c := ⟨hNotOtherwise, hCase, hMember⟩




theorem conditionalPredicateOffense_intro
    {o : Offense} {b : BenefitProgram} {c : ComplaintText}
    (hListed : IsSubsectionA2PredicateOffense o c)
    (hRelated : RelatesToHealthCareBenefitProgram o b c)
    (hProgram : IsHealthCareBenefitProgram b c) :
    ConditionalPredicateOffense o b c := ⟨hListed, hRelated, hProgram⟩

theorem federalHealthCareOffenseCase_intro_unconditional
    {o : Offense} {b : BenefitProgram} {c : ComplaintText}
    (h : IsSubsectionA1PredicateOffense o c) :
    FederalHealthCareOffenseCase o b c := .unconditional h

theorem federalHealthCareOffenseCase_intro_conditional
    {o : Offense} {b : BenefitProgram} {c : ComplaintText}
    (h : ConditionalPredicateOffense o b c) :
    FederalHealthCareOffenseCase o b c := .conditional h


theorem federalHealthCareOffenseMembership_intro
    {o : Offense} {b : BenefitProgram} {c : ComplaintText}
    (hViolation : IsViolationOrCriminalConspiracyToViolate o c)
    (hCase : FederalHealthCareOffenseCase o b c)
    (hMember : IsFederalHealthCareOffense o c) :
    FederalHealthCareOffenseMembership o b c := ⟨hViolation, hCase, hMember⟩


theorem healthCareBenefitPlan_intro {b : BenefitProgram} {c : ComplaintText}
    (hPlan : IsPublicOrPrivatePlanOrContract b c)
    (hCommerce : AffectsCommerce b c)
    (hBenefit : ProvidesMedicalBenefitItemOrServiceToIndividual b c) :
    HealthCareBenefitPlan b c := ⟨hPlan, hCommerce, hBenefit⟩

theorem healthCareBenefitProgramCase_intro_plan
    {b : BenefitProgram} {e : Entity} {c : ComplaintText}
    (h : HealthCareBenefitPlan b c) : HealthCareBenefitProgramCase b e c := .plan h


theorem healthCareBenefitProgramCase_intro_provider
    {b : BenefitProgram} {e : Entity} {c : ComplaintText}
    (h : IsProviderOfMedicalBenefitItemOrServicePayableUnderPlan e b c) :
    HealthCareBenefitProgramCase b e c := .provider h


theorem healthCareBenefitProgramMembership_intro
    {b : BenefitProgram} {e : Entity} {c : ComplaintText}
    (hCase : HealthCareBenefitProgramCase b e c) (hMember : IsHealthCareBenefitProgram b c) :
    HealthCareBenefitProgramMembership b e c := ⟨hCase, hMember⟩

end Proving.USC.T18.Ch1.Reslice.Ontology
