






import Proving.USC.T18.Ch1.Reslice.Procedure.Types
import Proving.USC.T18.Ch1.Reslice.Procedure.Predicates
import Proving.USC.T18.Ch1.Reslice.Procedure.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch1.Reslice.Procedure

open Proving.USC.Common




theorem offenseWithinVesselAdmiraltyWindow_intro
    {v : Vessel} {pr : Prosecution} {c : ComplaintText}
    (hLo : VesselAdmiraltyWindowStart v c ≤ OffenseInstant pr c)
    (hHi : OffenseInstant pr c < VesselAdmiraltyWindowEnd v c)
    : OffenseWithinVesselAdmiraltyWindow v pr c :=
  ⟨hLo, hHi⟩


theorem offenseDuringVoyage_intro
    {v : Vessel} {pr : Prosecution} {c : ComplaintText}
    (hLo : VoyageWindowStart v c ≤ OffenseInstant pr c)
    (hHi : OffenseInstant pr c < VoyageWindowEnd v c)
    : OffenseDuringVoyage v pr c :=
  ⟨hLo, hHi⟩


theorem consentPrecedesAcquisition_intro
    {loc : Locus} {c : ComplaintText}
    (h : StateConsentInstant loc c ≤ AcquisitionInstant loc c)
    : ConsentPrecedesAcquisition loc c :=
  h


theorem presidentialDeterminationEffectiveAtOffense_intro
    {loc : Locus} {pr : Prosecution} {c : ComplaintText}
    (h : PresidentialDeterminationInstant loc c ≤ OffenseInstant pr c)
    : PresidentialDeterminationEffectiveAtOffense loc pr c :=
  h


theorem offenseDuringFlight_intro
    {a : Aircraft} {pr : Prosecution} {c : ComplaintText}
    (hLo : FlightWindowStart a c ≤ OffenseInstant pr c)
    (hHi : OffenseInstant pr c < FlightWindowEnd a c)
    : OffenseDuringFlight a pr c :=
  ⟨hLo, hHi⟩


theorem offenseWithinSpaceFlightWindow_intro
    {sv : SpaceVehicle} {pr : Prosecution} {c : ComplaintText}
    (hLo : SpaceDoorsClosedInstant sv c ≤ OffenseInstant pr c)
    (hNoForced : ¬ ForcedLandingOccurred sv c)
    (hHi : OffenseInstant pr c < SpaceDoorOpenedInstant sv c)
    : OffenseWithinSpaceFlightWindow sv pr c :=
  ⟨hLo, Or.inl ⟨hNoForced, hHi⟩⟩


theorem offenseWithinSpaceFlightWindow_intro_forcedLanding
    {sv : SpaceVehicle} {pr : Prosecution} {c : ComplaintText}
    (hLo : SpaceDoorsClosedInstant sv c ≤ OffenseInstant pr c)
    (hForced : ForcedLandingOccurred sv c)
    (hHi : OffenseInstant pr c < ForcedLandingHandoverInstant sv c)
    : OffenseWithinSpaceFlightWindow sv pr c :=
  ⟨hLo, Or.inr ⟨hForced, hHi⟩⟩


theorem statusEffectiveAtOffense_intro
    {i : Institution} {pr : Prosecution} {c : ComplaintText}
    (hLo : StatusEffectiveFrom i c ≤ OffenseInstant pr c)
    (hHi : OffenseInstant pr c < StatusEffectiveUntil i c)
    : StatusEffectiveAtOffense i pr c :=
  ⟨hLo, hHi⟩


theorem beliefAfterOrResultingFromRepresentation_intro
    {d : Person} {rep : Representation} {c : ComplaintText}
    (h : RepresentationInstant rep c ≤ BeliefFormedInstant d c)
    : BeliefAfterOrResultingFromRepresentation d rep c :=
  Or.inl h


theorem beliefAfterOrResultingFromRepresentation_intro_causal
    {d : Person} {rep : Representation} {c : ComplaintText}
    (h : BeliefResultedFromRepresentation d rep c)
    : BeliefAfterOrResultingFromRepresentation d rep c :=
  Or.inr h


theorem watersQualifyUnderParagraph1_intro
    {loc : Locus} {c : ComplaintText} (h : LocusIsHighSeas loc c)
    : WatersQualifyUnderParagraph1 loc c :=
  Or.inl h


theorem watersQualifyUnderParagraph1_intro_admiralty
    {loc : Locus} {c : ComplaintText}
    (hAdm : WatersWithinAdmiraltyJurisdiction loc c)
    (hOut : LocusOutsideAnyStateJurisdiction loc c)
    : WatersQualifyUnderParagraph1 loc c :=
  Or.inr ⟨hAdm, hOut⟩


theorem aircraftOverQualifyingWaters_intro
    {a : Aircraft} {c : ComplaintText} (h : AircraftOverHighSeas a c)
    : AircraftOverQualifyingWaters a c :=
  Or.inl h


theorem aircraftOverQualifyingWaters_intro_admiralty
    {a : Aircraft} {c : ComplaintText}
    (hAdm : AircraftOverAdmiraltyWaters a c)
    (hOut : AircraftOutsideAnyStateJurisdiction a c)
    : AircraftOverQualifyingWaters a c :=
  Or.inr ⟨hAdm, hOut⟩




theorem section7Para1Waters_intro
    {loc : Locus} {c : ComplaintText}
    (h : WatersQualifyUnderParagraph1 loc c) : Section7Para1Waters loc c :=
  ⟨h⟩


theorem section7Para1Vessel_intro
    {v : Vessel} {pr : Prosecution} {c : ComplaintText}
    (hOwn : VesselUnitedStatesConnectedOwnership v c)
    (hWin : OffenseWithinVesselAdmiraltyWindow v pr c)
    : Section7Para1Vessel v pr c :=
  ⟨hOwn, hWin⟩


theorem section7Para2_intro
    {v : Vessel} {pr : Prosecution} {c : ComplaintText}
    (hPapers : VesselRegisteredLicensedOrEnrolledUnderUnitedStatesLaw v c)
    (hRoute : VoyageOnGreatLakesConnectingWatersOrBoundaryStLawrence v c)
    (hVoyage : OffenseDuringVoyage v pr c)
    : Section7Para2 v pr c :=
  ⟨hPapers, hRoute, hVoyage⟩


theorem section7Para3Reserved_intro
    {loc : Locus} {c : ComplaintText}
    (hLands : LandsReservedOrAcquiredForUnitedStatesUse loc c)
    (hJuris : UnderExclusiveOrConcurrentUnitedStatesJurisdiction loc c)
    : Section7Para3Reserved loc c :=
  ⟨hLands, hJuris⟩


theorem section7Para3Purchased_intro
    {loc : Locus} {c : ComplaintText}
    (hAcq : PlacePurchasedOrOtherwiseAcquiredByUnitedStates loc c)
    (hConsent : StateLegislatureConsentGiven loc c)
    (hOrder : ConsentPrecedesAcquisition loc c)
    (hPurpose : AcquiredForNeedfulBuildingPurpose loc c)
    : Section7Para3Purchased loc c :=
  ⟨hAcq, hConsent, hOrder, hPurpose⟩


theorem section7Para4_intro
    {loc : Locus} {pr : Prosecution} {c : ComplaintText}
    (hGuano : IslandRockOrKeyWithGuanoDeposits loc c)
    (hDeterm : PresidentialAppurtenanceDetermination loc c)
    (hEffect : PresidentialDeterminationEffectiveAtOffense loc pr c)
    : Section7Para4 loc pr c :=
  ⟨hGuano, hDeterm, hEffect⟩


theorem section7Para5_intro
    {a : Aircraft} {pr : Prosecution} {c : ComplaintText}
    (hOwn : AircraftUnitedStatesConnectedOwnership a c)
    (hWaters : AircraftOverQualifyingWaters a c)
    (hFlight : OffenseDuringFlight a pr c)
    : Section7Para5 a pr c :=
  ⟨hOwn, hWaters, hFlight⟩


theorem section7Para6_intro
    {sv : SpaceVehicle} {pr : Prosecution} {c : ComplaintText}
    (hVehicle : VehicleUsedOrDesignedForSpaceFlight sv c)
    (hRegistry : OnUnitedStatesSpaceRegistry sv c)
    (hFlight : OffenseWithinSpaceFlightWindow sv pr c)
    : Section7Para6 sv pr c :=
  ⟨hVehicle, hRegistry, hFlight⟩


theorem section7Para7_intro
    {loc : Locus} {pr : Prosecution} {c : ComplaintText}
    (hPlace : PlaceOutsideJurisdictionOfAnyNation loc c)
    (hNexus : OffenseByOrAgainstUnitedStatesNational pr c)
    : Section7Para7 loc pr c :=
  ⟨hPlace, hNexus⟩


theorem section7Para8_intro
    {v : Vessel} {pr : Prosecution} {c : ComplaintText}
    (hIntl : PermittedByInternationalLaw v pr c)
    (hForeign : IsForeignVessel v c)
    (hSched : VoyageHasScheduledUnitedStatesDepartureOrArrival v c)
    (hVoyage : OffenseDuringVoyage v pr c)
    (hNexus : OffenseByOrAgainstUnitedStatesNational pr c)
    : Section7Para8 v pr c :=
  ⟨hIntl, hForeign, hSched, hVoyage, hNexus⟩


theorem section7Para9Locus_intro
    {loc : Locus} {c : ComplaintText}
    (h : PremisesOfUnitedStatesMissionInForeignState loc c)
    : Section7Para9Locus loc c :=
  Section7Para9Locus.premises h


theorem section7Para9Locus_intro_residence
    {loc : Locus} {c : ComplaintText}
    (h : ResidenceInForeignStateUsedForMissionPurposes loc c)
    : Section7Para9Locus loc c :=
  Section7Para9Locus.residence h


theorem section7Para9_intro
    {loc : Locus} {d : Person} {pr : Prosecution} {c : ComplaintText}
    (hLocus : Section7Para9Locus loc c)
    (hNexus : OffenseByOrAgainstUnitedStatesNationalUnderINA pr c)
    (hNoTreaty : ¬ ConflictsWithTreatyOrInternationalAgreement loc c)
    (hNot3261 : ¬ OffenderDescribedInSection3261a d c)
    : Section7Para9 loc d pr c :=
  ⟨hLocus, hNexus, hNoTreaty, hNot3261⟩




theorem smtjEstablished_intro
    {pr : Prosecution} {c : ComplaintText} (loc : Locus)
    (h : Section7Para1Waters loc c) : SmtjEstablished pr c :=
  SmtjEstablished.para1Waters loc h


theorem smtjEstablished_intro_para1Vessel
    {pr : Prosecution} {c : ComplaintText} (v : Vessel)
    (h : Section7Para1Vessel v pr c) : SmtjEstablished pr c :=
  SmtjEstablished.para1Vessel v h


theorem smtjEstablished_intro_para2
    {pr : Prosecution} {c : ComplaintText} (v : Vessel)
    (h : Section7Para2 v pr c) : SmtjEstablished pr c :=
  SmtjEstablished.para2 v h


theorem smtjEstablished_intro_para3Reserved
    {pr : Prosecution} {c : ComplaintText} (loc : Locus)
    (h : Section7Para3Reserved loc c) : SmtjEstablished pr c :=
  SmtjEstablished.para3Reserved loc h


theorem smtjEstablished_intro_para3Purchased
    {pr : Prosecution} {c : ComplaintText} (loc : Locus)
    (h : Section7Para3Purchased loc c) : SmtjEstablished pr c :=
  SmtjEstablished.para3Purchased loc h


theorem smtjEstablished_intro_para4
    {pr : Prosecution} {c : ComplaintText} (loc : Locus)
    (h : Section7Para4 loc pr c) : SmtjEstablished pr c :=
  SmtjEstablished.para4 loc h


theorem smtjEstablished_intro_para5
    {pr : Prosecution} {c : ComplaintText} (a : Aircraft)
    (h : Section7Para5 a pr c) : SmtjEstablished pr c :=
  SmtjEstablished.para5 a h


theorem smtjEstablished_intro_para6
    {pr : Prosecution} {c : ComplaintText} (sv : SpaceVehicle)
    (h : Section7Para6 sv pr c) : SmtjEstablished pr c :=
  SmtjEstablished.para6 sv h


theorem smtjEstablished_intro_para7
    {pr : Prosecution} {c : ComplaintText} (loc : Locus)
    (h : Section7Para7 loc pr c) : SmtjEstablished pr c :=
  SmtjEstablished.para7 loc h


theorem smtjEstablished_intro_para8
    {pr : Prosecution} {c : ComplaintText} (v : Vessel)
    (h : Section7Para8 v pr c) : SmtjEstablished pr c :=
  SmtjEstablished.para8 v h


theorem smtjEstablished_intro_para9
    {pr : Prosecution} {c : ComplaintText} (loc : Locus) (d : Person)
    (h : Section7Para9 loc d pr c) : SmtjEstablished pr c :=
  SmtjEstablished.para9 loc d h




theorem financialInstitutionCategory_intro
    {i : Institution} {c : ComplaintText}
    (h : IsInsuredDepositoryInstitution i c) : FinancialInstitutionCategory i c :=
  FinancialInstitutionCategory.insuredDepository h


theorem financialInstitutionCategory_intro_creditUnion
    {i : Institution} {c : ComplaintText}
    (h : IsCreditUnionInsuredByNCUSIF i c) : FinancialInstitutionCategory i c :=
  FinancialInstitutionCategory.creditUnion h


theorem financialInstitutionCategory_intro_homeLoanBank
    {i : Institution} {c : ComplaintText}
    (h : IsFederalHomeLoanBankOrMember i c) : FinancialInstitutionCategory i c :=
  FinancialInstitutionCategory.homeLoanBank h


theorem financialInstitutionCategory_intro_farmCredit
    {i : Institution} {c : ComplaintText}
    (h : IsFarmCreditSystemInstitution i c) : FinancialInstitutionCategory i c :=
  FinancialInstitutionCategory.farmCredit h


theorem financialInstitutionCategory_intro_sbic
    {i : Institution} {c : ComplaintText}
    (h : IsSmallBusinessInvestmentCompany i c) : FinancialInstitutionCategory i c :=
  FinancialInstitutionCategory.sbic h


theorem financialInstitutionCategory_intro_holdingCompany
    {i : Institution} {c : ComplaintText}
    (h : IsDepositoryInstitutionHoldingCompany i c) : FinancialInstitutionCategory i c :=
  FinancialInstitutionCategory.holdingCompany h


theorem financialInstitutionCategory_intro_federalReserve
    {i : Institution} {c : ComplaintText}
    (h : IsFederalReserveBankOrMemberBank i c) : FinancialInstitutionCategory i c :=
  FinancialInstitutionCategory.federalReserve h


theorem financialInstitutionCategory_intro_edgeActOrganization
    {i : Institution} {c : ComplaintText}
    (h : IsOrganizationOperatingUnderFederalReserveActSection25 i c)
    : FinancialInstitutionCategory i c :=
  FinancialInstitutionCategory.edgeActOrganization h


theorem financialInstitutionCategory_intro_foreignBankBranch
    {i : Institution} {c : ComplaintText}
    (h : IsBranchOrAgencyOfForeignBank i c) : FinancialInstitutionCategory i c :=
  FinancialInstitutionCategory.foreignBankBranch h


theorem financialInstitutionCategory_intro_mortgageLender
    {i : Institution} {c : ComplaintText}
    (h : IsMortgageLendingBusinessOrFederallyRelatedMortgageLender i c)
    : FinancialInstitutionCategory i c :=
  FinancialInstitutionCategory.mortgageLender h


theorem financialInstitutionStatusEstablished_intro
    {i : Institution} {pr : Prosecution} {c : ComplaintText}
    (hCat : FinancialInstitutionCategory i c)
    (hTime : StatusEffectiveAtOffense i pr c)
    : FinancialInstitutionStatusEstablished i pr c :=
  ⟨hCat, hTime⟩




theorem officialRepresentation_intro
    {rep : Representation} {c : ComplaintText}
    (h : MadeByFederalLawEnforcementOfficer rep c) : OfficialRepresentation rep c :=
  OfficialRepresentation.byOfficer h


theorem officialRepresentation_intro_atDirection
    {rep : Representation} {c : ComplaintText}
    (h : MadeAtDirectionOfFederalLawEnforcementOfficer rep c)
    : OfficialRepresentation rep c :=
  OfficialRepresentation.atDirection h


theorem officialRepresentation_intro_withApproval
    {rep : Representation} {c : ComplaintText}
    (h : MadeWithApprovalOfFederalLawEnforcementOfficer rep c)
    : OfficialRepresentation rep c :=
  OfficialRepresentation.withApproval h


theorem section21Applicability_intro
    {pr : Prosecution} {c : ComplaintText}
    (hProp : OffenseHasStolenOrCounterfeitPropertyElement pr c)
    (hKnow : OffenseHasKnowledgeOfCharacterElement pr c)
    : Section21Applicability pr c :=
  ⟨hProp, hKnow⟩


theorem section21AlternativeProof_intro
    {d : Person} {prop : Property} {rep : Representation}
    {pr : Prosecution} {c : ComplaintText}
    (hApplicable : Section21Applicability pr c)
    (hOfficial : OfficialRepresentation rep c)
    (hNature : RepresentationAsToNatureOfProperty rep prop c)
    (hBelief : DefendantBelievedPropertyOfProscribedCharacter d prop c)
    (hSeq : BeliefAfterOrResultingFromRepresentation d rep c)
    : Section21AlternativeProof d prop rep pr c :=
  ⟨hApplicable, hOfficial, hNature, hBelief, hSeq⟩




theorem courtOfTheUnitedStatesMember_intro
    {f : Forum} {c : ComplaintText}
    (h : IsDistrictCourtOfGuam f c) : CourtOfTheUnitedStatesMember f c :=
  CourtOfTheUnitedStatesMember.guam h


theorem courtOfTheUnitedStatesMember_intro_northernMariana
    {f : Forum} {c : ComplaintText}
    (h : IsDistrictCourtForNorthernMarianaIslands f c)
    : CourtOfTheUnitedStatesMember f c :=
  CourtOfTheUnitedStatesMember.northernMariana h


theorem courtOfTheUnitedStatesMember_intro_virginIslands
    {f : Forum} {c : ComplaintText}
    (h : IsDistrictCourtOfVirginIslands f c) : CourtOfTheUnitedStatesMember f c :=
  CourtOfTheUnitedStatesMember.virginIslands h



theorem courtOfTheUnitedStatesMember_intro_otherwiseIncluded
    {f : Forum} {c : ComplaintText}
    (h : IsCourtOfTheUnitedStatesApartFromSection23 f c)
    : CourtOfTheUnitedStatesMember f c :=
  CourtOfTheUnitedStatesMember.otherwiseIncluded h


theorem forumIsCourtOfTheUnitedStates_intro
    {f : Forum} {pr : Prosecution} {c : ComplaintText}
    (hMember : CourtOfTheUnitedStatesMember f c)
    (hNoExcept : ¬ ExpresslyProvidedOtherwise f pr c)
    : ForumIsCourtOfTheUnitedStates f pr c :=
  ⟨hMember, hNoExcept⟩




theorem violationOrConspiracy_intro
    {ch : Charge} {c : ComplaintText}
    (h : IsSubstantiveViolation ch c) : ViolationOrConspiracy ch c :=
  ViolationOrConspiracy.violation h


theorem violationOrConspiracy_intro_conspiracy
    {ch : Charge} {c : ComplaintText}
    (h : IsCriminalConspiracyToViolate ch c) : ViolationOrConspiracy ch c :=
  ViolationOrConspiracy.conspiracy h


theorem section24a1Offense_intro
    {ch : Charge} {c : ComplaintText}
    (hMode : ViolationOrConspiracy ch c)
    (hListed : ChargedUnderSection24a1Provision ch c)
    : Section24a1Offense ch c :=
  ⟨hMode, hListed⟩


theorem section24a2Offense_intro
    {ch : Charge} {c : ComplaintText}
    (hMode : ViolationOrConspiracy ch c)
    (hListed : ChargedUnderSection24a2Provision ch c)
    (hRelated : RelatesToHealthCareBenefitProgram ch c)
    : Section24a2Offense ch c :=
  ⟨hMode, hListed, hRelated⟩


theorem federalHealthCareOffense_intro
    {ch : Charge} {c : ComplaintText}
    (h : Section24a1Offense ch c) : FederalHealthCareOffense ch c :=
  FederalHealthCareOffense.undera1 h


theorem federalHealthCareOffense_intro_undera2
    {ch : Charge} {c : ComplaintText}
    (h : Section24a2Offense ch c) : FederalHealthCareOffense ch c :=
  FederalHealthCareOffense.undera2 h


theorem section24bPlan_intro
    {bp : BenefitProgram} {c : ComplaintText}
    (hPlan : IsPublicOrPrivatePlanOrContract bp c)
    (hCommerce : AffectsCommerce bp c)
    (hMedical : ProvidesMedicalBenefitItemOrService bp c)
    : Section24bPlan bp c :=
  ⟨hPlan, hCommerce, hMedical⟩


theorem healthCareBenefitProgram_intro
    {bp : BenefitProgram} {c : ComplaintText}
    (h : Section24bPlan bp c) : HealthCareBenefitProgram bp c :=
  HealthCareBenefitProgram.plan h


theorem healthCareBenefitProgram_intro_provider
    {bp : BenefitProgram} {c : ComplaintText}
    (h : IsProviderUnderPlanOrContract bp c) : HealthCareBenefitProgram bp c :=
  HealthCareBenefitProgram.provider h




theorem enabled_intro {t : Transition} (h : t.guard) : Enabled t := h


theorem reachable_intro
    {pr : Prosecution} {c : ComplaintText}
    (h : ConductAlleged pr c) : Reachable pr c Stage.Alleged :=
  Reachable.start h


theorem reachable_intro_locusFixed
    {pr : Prosecution} {c : ComplaintText} (loc : Locus)
    (prev : Reachable pr c Stage.Alleged) (h : LocusIdentified loc pr c)
    : Reachable pr c Stage.LocusFixed :=
  Reachable.fixLocus loc prev h


theorem reachable_intro_jurisdictionAttached
    {pr : Prosecution} {c : ComplaintText}
    (prev : Reachable pr c Stage.LocusFixed) (h : SmtjEstablished pr c)
    : Reachable pr c Stage.JurisdictionAttached :=
  Reachable.attach prev h


theorem reachable_intro_forumCompetent
    {pr : Prosecution} {c : ComplaintText} (f : Forum)
    (prev : Reachable pr c Stage.JurisdictionAttached)
    (h : ForumIsCourtOfTheUnitedStates f pr c)
    : Reachable pr c Stage.ForumCompetent :=
  Reachable.forum f prev h


theorem reachable_intro_elementEstablished
    {pr : Prosecution} {c : ComplaintText}
    (d : Person) (prop : Property) (rep : Representation)
    (prev : Reachable pr c Stage.ForumCompetent)
    (h : Section21AlternativeProof d prop rep pr c)
    : Reachable pr c Stage.ElementEstablished :=
  Reachable.proveElement d prop rep prev h


theorem reachable_intro_offenseClassified
    {pr : Prosecution} {c : ComplaintText} (ch : Charge)
    (prev : Reachable pr c Stage.ForumCompetent)
    (h : FederalHealthCareOffense ch c)
    : Reachable pr c Stage.OffenseClassified :=
  Reachable.classify ch prev h



theorem proceduralPostureWithInstitution_intro
    {i : Institution} {pr : Prosecution} {c : ComplaintText}
    (hForum : Reachable pr c Stage.ForumCompetent)
    (hInst : FinancialInstitutionStatusEstablished i pr c)
    : ProceduralPostureWithInstitution i pr c :=
  ⟨hForum, hInst⟩

end Proving.USC.T18.Ch1.Reslice.Procedure
