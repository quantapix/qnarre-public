













import Proving.USC.T18.Ch1.Reslice.Procedure.Types
import Proving.USC.T18.Ch1.Reslice.Procedure.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch1.Reslice.Procedure

open Proving.USC.Common






def OffenseWithinVesselAdmiraltyWindow
    (v : Vessel) (pr : Prosecution) (c : ComplaintText) : Prop :=
  VesselAdmiraltyWindowStart v c ≤ OffenseInstant pr c ∧
    OffenseInstant pr c < VesselAdmiraltyWindowEnd v c



def OffenseDuringVoyage
    (v : Vessel) (pr : Prosecution) (c : ComplaintText) : Prop :=
  VoyageWindowStart v c ≤ OffenseInstant pr c ∧
    OffenseInstant pr c < VoyageWindowEnd v c



def ConsentPrecedesAcquisition (loc : Locus) (c : ComplaintText) : Prop :=
  StateConsentInstant loc c ≤ AcquisitionInstant loc c



def PresidentialDeterminationEffectiveAtOffense
    (loc : Locus) (pr : Prosecution) (c : ComplaintText) : Prop :=
  PresidentialDeterminationInstant loc c ≤ OffenseInstant pr c



def OffenseDuringFlight
    (a : Aircraft) (pr : Prosecution) (c : ComplaintText) : Prop :=
  FlightWindowStart a c ≤ OffenseInstant pr c ∧
    OffenseInstant pr c < FlightWindowEnd a c






def OffenseWithinSpaceFlightWindow
    (sv : SpaceVehicle) (pr : Prosecution) (c : ComplaintText) : Prop :=
  SpaceDoorsClosedInstant sv c ≤ OffenseInstant pr c ∧
    ((¬ ForcedLandingOccurred sv c ∧
        OffenseInstant pr c < SpaceDoorOpenedInstant sv c) ∨
     (ForcedLandingOccurred sv c ∧
        OffenseInstant pr c < ForcedLandingHandoverInstant sv c))




def StatusEffectiveAtOffense
    (i : Institution) (pr : Prosecution) (c : ComplaintText) : Prop :=
  StatusEffectiveFrom i c ≤ OffenseInstant pr c ∧
    OffenseInstant pr c < StatusEffectiveUntil i c




def BeliefAfterOrResultingFromRepresentation
    (d : Person) (rep : Representation) (c : ComplaintText) : Prop :=
  RepresentationInstant rep c ≤ BeliefFormedInstant d c ∨
    BeliefResultedFromRepresentation d rep c






def WatersQualifyUnderParagraph1 (loc : Locus) (c : ComplaintText) : Prop :=
  LocusIsHighSeas loc c ∨
    (WatersWithinAdmiraltyJurisdiction loc c ∧ LocusOutsideAnyStateJurisdiction loc c)




def AircraftOverQualifyingWaters (a : Aircraft) (c : ComplaintText) : Prop :=
  AircraftOverHighSeas a c ∨
    (AircraftOverAdmiraltyWaters a c ∧ AircraftOutsideAnyStateJurisdiction a c)




structure Section7Para1Waters (loc : Locus) (c : ComplaintText) : Prop where
  qualifyingWaters : WatersQualifyUnderParagraph1 loc c


structure Section7Para1Vessel
    (v : Vessel) (pr : Prosecution) (c : ComplaintText) : Prop where
  usConnected : VesselUnitedStatesConnectedOwnership v c
  inWindow    : OffenseWithinVesselAdmiraltyWindow v pr c



structure Section7Para2
    (v : Vessel) (pr : Prosecution) (c : ComplaintText) : Prop where
  papered      : VesselRegisteredLicensedOrEnrolledUnderUnitedStatesLaw v c
  qualifyingRoute : VoyageOnGreatLakesConnectingWatersOrBoundaryStLawrence v c
  onVoyage     : OffenseDuringVoyage v pr c



structure Section7Para3Reserved (loc : Locus) (c : ComplaintText) : Prop where
  reservedOrAcquired : LandsReservedOrAcquiredForUnitedStatesUse loc c
  federalJurisdiction : UnderExclusiveOrConcurrentUnitedStatesJurisdiction loc c





structure Section7Para3Purchased (loc : Locus) (c : ComplaintText) : Prop where
  acquired         : PlacePurchasedOrOtherwiseAcquiredByUnitedStates loc c
  stateConsent     : StateLegislatureConsentGiven loc c
  consentAntecedent : ConsentPrecedesAcquisition loc c
  needfulPurpose   : AcquiredForNeedfulBuildingPurpose loc c




structure Section7Para4
    (loc : Locus) (pr : Prosecution) (c : ComplaintText) : Prop where
  guanoIsland   : IslandRockOrKeyWithGuanoDeposits loc c
  determination : PresidentialAppurtenanceDetermination loc c
  inEffect      : PresidentialDeterminationEffectiveAtOffense loc pr c



structure Section7Para5
    (a : Aircraft) (pr : Prosecution) (c : ComplaintText) : Prop where
  usConnected     : AircraftUnitedStatesConnectedOwnership a c
  overWaters      : AircraftOverQualifyingWaters a c
  inFlight        : OffenseDuringFlight a pr c



structure Section7Para6
    (sv : SpaceVehicle) (pr : Prosecution) (c : ComplaintText) : Prop where
  spaceVehicle : VehicleUsedOrDesignedForSpaceFlight sv c
  onRegistry   : OnUnitedStatesSpaceRegistry sv c
  inFlight     : OffenseWithinSpaceFlightWindow sv pr c



structure Section7Para7
    (loc : Locus) (pr : Prosecution) (c : ComplaintText) : Prop where
  statelessPlace : PlaceOutsideJurisdictionOfAnyNation loc c
  nationalNexus  : OffenseByOrAgainstUnitedStatesNational pr c



structure Section7Para8
    (v : Vessel) (pr : Prosecution) (c : ComplaintText) : Prop where
  intlLawPermits  : PermittedByInternationalLaw v pr c
  foreignVessel   : IsForeignVessel v c
  scheduledUSLeg  : VoyageHasScheduledUnitedStatesDepartureOrArrival v c
  onVoyage        : OffenseDuringVoyage v pr c
  nationalNexus   : OffenseByOrAgainstUnitedStatesNational pr c


inductive Section7Para9Locus (loc : Locus) (c : ComplaintText) : Prop where

  | premises  (h : PremisesOfUnitedStatesMissionInForeignState loc c)
      : Section7Para9Locus loc c

  | residence (h : ResidenceInForeignStateUsedForMissionPurposes loc c)
      : Section7Para9Locus loc c








structure Section7Para9
    (loc : Locus) (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop where
  qualifyingLocus : Section7Para9Locus loc c
  nationalNexus   : OffenseByOrAgainstUnitedStatesNationalUnderINA pr c
  noTreatyConflict : ¬ ConflictsWithTreatyOrInternationalAgreement loc c
  notSection3261a  : ¬ OffenderDescribedInSection3261a d c



inductive SmtjEstablished (pr : Prosecution) (c : ComplaintText) : Prop where

  | para1Waters (loc : Locus) (h : Section7Para1Waters loc c) : SmtjEstablished pr c

  | para1Vessel (v : Vessel) (h : Section7Para1Vessel v pr c) : SmtjEstablished pr c

  | para2 (v : Vessel) (h : Section7Para2 v pr c) : SmtjEstablished pr c

  | para3Reserved (loc : Locus) (h : Section7Para3Reserved loc c) : SmtjEstablished pr c

  | para3Purchased (loc : Locus) (h : Section7Para3Purchased loc c) : SmtjEstablished pr c

  | para4 (loc : Locus) (h : Section7Para4 loc pr c) : SmtjEstablished pr c

  | para5 (a : Aircraft) (h : Section7Para5 a pr c) : SmtjEstablished pr c

  | para6 (sv : SpaceVehicle) (h : Section7Para6 sv pr c) : SmtjEstablished pr c

  | para7 (loc : Locus) (h : Section7Para7 loc pr c) : SmtjEstablished pr c

  | para8 (v : Vessel) (h : Section7Para8 v pr c) : SmtjEstablished pr c

  | para9 (loc : Locus) (d : Person) (h : Section7Para9 loc d pr c) : SmtjEstablished pr c




inductive FinancialInstitutionCategory (i : Institution) (c : ComplaintText) : Prop where

  | insuredDepository (h : IsInsuredDepositoryInstitution i c) : FinancialInstitutionCategory i c

  | creditUnion (h : IsCreditUnionInsuredByNCUSIF i c) : FinancialInstitutionCategory i c

  | homeLoanBank (h : IsFederalHomeLoanBankOrMember i c) : FinancialInstitutionCategory i c

  | farmCredit (h : IsFarmCreditSystemInstitution i c) : FinancialInstitutionCategory i c

  | sbic (h : IsSmallBusinessInvestmentCompany i c) : FinancialInstitutionCategory i c

  | holdingCompany (h : IsDepositoryInstitutionHoldingCompany i c) : FinancialInstitutionCategory i c

  | federalReserve (h : IsFederalReserveBankOrMemberBank i c) : FinancialInstitutionCategory i c

  | edgeActOrganization
      (h : IsOrganizationOperatingUnderFederalReserveActSection25 i c)
      : FinancialInstitutionCategory i c

  | foreignBankBranch (h : IsBranchOrAgencyOfForeignBank i c) : FinancialInstitutionCategory i c

  | mortgageLender
      (h : IsMortgageLendingBusinessOrFederallyRelatedMortgageLender i c)
      : FinancialInstitutionCategory i c



structure FinancialInstitutionStatusEstablished
    (i : Institution) (pr : Prosecution) (c : ComplaintText) : Prop where
  category  : FinancialInstitutionCategory i c
  asOfTime  : StatusEffectiveAtOffense i pr c




inductive OfficialRepresentation (rep : Representation) (c : ComplaintText) : Prop where

  | byOfficer (h : MadeByFederalLawEnforcementOfficer rep c) : OfficialRepresentation rep c

  | atDirection (h : MadeAtDirectionOfFederalLawEnforcementOfficer rep c)
      : OfficialRepresentation rep c

  | withApproval (h : MadeWithApprovalOfFederalLawEnforcementOfficer rep c)
      : OfficialRepresentation rep c



structure Section21Applicability (pr : Prosecution) (c : ComplaintText) : Prop where
  propertyElement  : OffenseHasStolenOrCounterfeitPropertyElement pr c
  knowledgeElement : OffenseHasKnowledgeOfCharacterElement pr c




structure Section21AlternativeProof
    (d : Person) (prop : Property) (rep : Representation)
    (pr : Prosecution) (c : ComplaintText) : Prop where
  applicable     : Section21Applicability pr c
  official       : OfficialRepresentation rep c
  asToNature     : RepresentationAsToNatureOfProperty rep prop c
  belief         : DefendantBelievedPropertyOfProscribedCharacter d prop c
  sequencing     : BeliefAfterOrResultingFromRepresentation d rep c






inductive CourtOfTheUnitedStatesMember (f : Forum) (c : ComplaintText) : Prop where

  | guam (h : IsDistrictCourtOfGuam f c) : CourtOfTheUnitedStatesMember f c

  | northernMariana (h : IsDistrictCourtForNorthernMarianaIslands f c)
      : CourtOfTheUnitedStatesMember f c

  | virginIslands (h : IsDistrictCourtOfVirginIslands f c) : CourtOfTheUnitedStatesMember f c

  | otherwiseIncluded (h : IsCourtOfTheUnitedStatesApartFromSection23 f c)
      : CourtOfTheUnitedStatesMember f c





structure ForumIsCourtOfTheUnitedStates
    (f : Forum) (pr : Prosecution) (c : ComplaintText) : Prop where
  member             : CourtOfTheUnitedStatesMember f c
  noExpressException : ¬ ExpresslyProvidedOtherwise f pr c




inductive ViolationOrConspiracy (ch : Charge) (c : ComplaintText) : Prop where

  | violation (h : IsSubstantiveViolation ch c) : ViolationOrConspiracy ch c

  | conspiracy (h : IsCriminalConspiracyToViolate ch c) : ViolationOrConspiracy ch c


structure Section24a1Offense (ch : Charge) (c : ComplaintText) : Prop where
  mode   : ViolationOrConspiracy ch c
  listed : ChargedUnderSection24a1Provision ch c



structure Section24a2Offense (ch : Charge) (c : ComplaintText) : Prop where
  mode    : ViolationOrConspiracy ch c
  listed  : ChargedUnderSection24a2Provision ch c
  related : RelatesToHealthCareBenefitProgram ch c


inductive FederalHealthCareOffense (ch : Charge) (c : ComplaintText) : Prop where

  | undera1 (h : Section24a1Offense ch c) : FederalHealthCareOffense ch c

  | undera2 (h : Section24a2Offense ch c) : FederalHealthCareOffense ch c



structure Section24bPlan (bp : BenefitProgram) (c : ComplaintText) : Prop where
  planOrContract  : IsPublicOrPrivatePlanOrContract bp c
  affectsCommerce : AffectsCommerce bp c
  providesMedical : ProvidesMedicalBenefitItemOrService bp c


inductive HealthCareBenefitProgram (bp : BenefitProgram) (c : ComplaintText) : Prop where

  | plan (h : Section24bPlan bp c) : HealthCareBenefitProgram bp c

  | provider (h : IsProviderUnderPlanOrContract bp c) : HealthCareBenefitProgram bp c





structure Transition where

  source : Stage

  target : Stage

  guard  : Prop


def Enabled (t : Transition) : Prop := t.guard


def stepAllege (pr : Prosecution) (c : ComplaintText) : Transition :=
  { source := Stage.Alleged, target := Stage.Alleged, guard := ConductAlleged pr c }


def stepFixLocus (loc : Locus) (pr : Prosecution) (c : ComplaintText) : Transition :=
  { source := Stage.Alleged, target := Stage.LocusFixed, guard := LocusIdentified loc pr c }


def stepAttachJurisdiction (pr : Prosecution) (c : ComplaintText) : Transition :=
  { source := Stage.LocusFixed, target := Stage.JurisdictionAttached,
    guard := SmtjEstablished pr c }


def stepEstablishForum (f : Forum) (pr : Prosecution) (c : ComplaintText) : Transition :=
  { source := Stage.JurisdictionAttached, target := Stage.ForumCompetent,
    guard := ForumIsCourtOfTheUnitedStates f pr c }


def stepProveElement
    (d : Person) (prop : Property) (rep : Representation)
    (pr : Prosecution) (c : ComplaintText) : Transition :=
  { source := Stage.ForumCompetent, target := Stage.ElementEstablished,
    guard := Section21AlternativeProof d prop rep pr c }


def stepClassifyOffense (ch : Charge) (c : ComplaintText) : Transition :=
  { source := Stage.ForumCompetent, target := Stage.OffenseClassified,
    guard := FederalHealthCareOffense ch c }



inductive Reachable (pr : Prosecution) (c : ComplaintText) : Stage → Prop where

  | start (h : ConductAlleged pr c) : Reachable pr c Stage.Alleged

  | fixLocus (loc : Locus) (prev : Reachable pr c Stage.Alleged)
      (h : LocusIdentified loc pr c) : Reachable pr c Stage.LocusFixed

  | attach (prev : Reachable pr c Stage.LocusFixed)
      (h : SmtjEstablished pr c) : Reachable pr c Stage.JurisdictionAttached

  | forum (f : Forum) (prev : Reachable pr c Stage.JurisdictionAttached)
      (h : ForumIsCourtOfTheUnitedStates f pr c) : Reachable pr c Stage.ForumCompetent

  | proveElement (d : Person) (prop : Property) (rep : Representation)
      (prev : Reachable pr c Stage.ForumCompetent)
      (h : Section21AlternativeProof d prop rep pr c) : Reachable pr c Stage.ElementEstablished

  | classify (ch : Charge) (prev : Reachable pr c Stage.ForumCompetent)
      (h : FederalHealthCareOffense ch c) : Reachable pr c Stage.OffenseClassified




structure ProceduralPostureWithInstitution
    (i : Institution) (pr : Prosecution) (c : ComplaintText) : Prop where
  forumReached : Reachable pr c Stage.ForumCompetent
  institution  : FinancialInstitutionStatusEstablished i pr c

end Proving.USC.T18.Ch1.Reslice.Procedure
