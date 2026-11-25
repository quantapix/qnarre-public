
















import Proving.USC.T18.Ch1Ch47.Recert.Procedure.Types
import Proving.USC.T18.Ch1Ch47.Recert.Procedure.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch1Ch47.Recert.Procedure

open Proving.USC.Common





structure Transition (c : ComplaintText) : Type where
  source : Stage
  target : Stage
  guard  : Prop


inductive Reachable (c : ComplaintText) : Stage → Prop
  | start : Reachable c Stage.conductAlleged
  | step {s t : Stage} (tr : Transition c) (hs : tr.source = s) (ht : tr.target = t)
      (hg : tr.guard) (hr : Reachable c s) : Reachable c t








inductive SpecialMaritimeAndTerritorialJurisdiction (l : Locus) (ch : Charge)
    (c : ComplaintText) : Prop
  | highSeasOrUnitedStatesVessel (h : SitusHighSeasOrUnitedStatesVessel l c)
  | greatLakesVessel             (h : SitusGreatLakesVessel l c)
  | federalEnclave               (h : SitusFederalEnclave l c)
  | guanoIsland                  (h : SitusGuanoIsland l c)
  | unitedStatesAircraft         (h : SitusUnitedStatesAircraftInFlight l c)
  | unitedStatesSpaceVehicle     (h : SitusUnitedStatesSpaceVehicleInFlight l c)
  | outsideAnyNation             (h : SitusOutsideJurisdictionOfAnyNation l c)
                                 (hn : OffenseByOrAgainstUnitedStatesNational ch c)
  | foreignVesselUnitedStatesVoyage
                                 (h : SitusForeignVesselOnScheduledUnitedStatesVoyage l c)
                                 (hn : OffenseByOrAgainstUnitedStatesNational ch c)
  | unitedStatesMissionPremises  (h : SitusUnitedStatesMissionPremisesOrResidence l c)
                                 (hn : OffenseByOrAgainstUnitedStatesNational ch c)
                                 (hEsc : ¬ CoveredBySection3261a ch c)





inductive QualifyingOfficialRepresentation (r : OfficialRepresentation)
    (c : ComplaintText) : Prop
  | byOfficer   (h : RepresentationByFederalLawEnforcementOfficer r c)
  | atDirection (h : RepresentationAtDirectionOrApprovalOfOfficer r c)






structure Section21ProofRoute (p : Person) (pr : Property) (el : Element)
    (r : OfficialRepresentation) (ch : Charge) (c : ComplaintText) : Prop where
  characterElement : ElementIsStolenOrCounterfeitCharacter el pr ch c
  knowledgeElement : ElementIsDefendantKnowledgeOfCharacter el ch c
  representation   : OfficialRepresentationAsToNatureOfProperty r pr c
  official         : QualifyingOfficialRepresentation r c
  belief           : DefendantBelievedPropertyOfSuchCharacter p pr c
  causedByRep      : BeliefFollowedFromRepresentation p r c





inductive CourtWithinSection23 (t : Tribunal) (c : ComplaintText) : Prop
  | listedTerritorial (h : IsListedTerritorialDistrictCourt t c)
  | ordinarySense     (h : IsOtherCourtOfTheUnitedStates t c)





structure CourtOfTheUnitedStates (t : Tribunal) (ch : Charge) (c : ComplaintText) : Prop where
  within               : CourtWithinSection23 t c
  noContraryProvision  : ¬ ExpresslyProvidedOtherwise t ch c





def ChargedStatuteWithinSection24 (ch : Charge) (c : ComplaintText) : Prop :=
  ViolationOfEnumeratedHealthCareStatute ch c ∨
  (ViolationOfEnumeratedGeneralFraudStatute ch c ∧ RelatesToHealthCareBenefitProgram ch c)



inductive FederalHealthCareOffense (ch : Charge) (c : ComplaintText) : Prop
  | directViolation (h : ChargedStatuteWithinSection24 ch c)
  | conspiracy      (h : ChargedStatuteWithinSection24 ch c)
                    (hc : IsCriminalConspiracyToViolate ch c)




def MoreThanFiveDocumentsTransferred (ch : Charge) (c : ComplaintText) : Prop :=
  identificationDocumentsProducedOrTransferred ch c > 5


def FiveOrMoreDocumentsPossessed (ch : Charge) (c : ComplaintText) : Prop :=
  identificationDocumentsPossessed ch c ≥ 5



def OneOrMoreMeansOfIdentification (ch : Charge) (c : ComplaintText) : Prop :=
  meansOfIdentificationInvolved ch c ≥ 1



def ValueAggregatesOneThousandDollars1028 (ch : Charge) (c : ComplaintText) : Prop :=
  valueObtainedInAggregationPeriodCents ch c ≥ 100000




def WithinOneYearAggregationWindow (ch : Charge) (c : ComplaintText) : Prop :=
  daysSpannedByAggregatedConduct ch c ≤ 365






inductive Section1028Circumstance (pgh : Paragraph1028a) (ch : Charge)
    (d : IdentificationDocument) (impl : DocumentMakingImplement)
    (c : ComplaintText) : Prop
  | unitedStatesDocument (h : DocumentAppearsIssuedByUnitedStatesOrSponsoringEntity d c)
  | implementSuited      (h : ImplementSuitedForMakingUnitedStatesDocument impl c)
  | defraudUnitedStates  (h : pgh = Paragraph1028a.p4)
  | commerce             (h : ConductInInterstateOrForeignCommerce ch c ∨
                              AffectsInterstateOrForeignCommerce ch c)
  | mailed               (h : ItemTransportedInTheMail ch c)


def Section1028Exempt (ch : Charge) (c : ComplaintText) : Prop :=
  LawfullyAuthorizedInvestigativeOrProtectiveActivity ch c ∨
  ActivityAuthorizedUnderChapter224 ch c




structure Section1028Offense (pgh : Paragraph1028a) (p : Person) (ch : Charge)
    (d : IdentificationDocument) (impl : DocumentMakingImplement)
    (c : ComplaintText) : Prop where
  conduct      : OffenseUnderIdentificationParagraph pgh p ch c
  circumstance : Section1028Circumstance pgh ch d impl c
  notExempt    : ¬ Section1028Exempt ch c


inductive Section1028Inchoate (p : Person) (ch : Charge) (c : ComplaintText) : Prop
  | attempt    (h : AttemptedOffenseUnderSection1028 p ch c)
  | conspiracy (h : ConspiredToCommitOffenseUnderSection1028 p ch c)




def Aggravator1028b3 (p : Person) (ch : Charge) (c : ComplaintText) : Prop :=
  CommittedToFacilitateDrugTraffickingCrime ch c ∨
  CommittedInConnectionWithCrimeOfViolence ch c ∨
  PriorConvictionUnderSection1028Final p ch c


def Tier1028b1Trigger (pgh : Paragraph1028a) (ch : Charge) (c : ComplaintText) : Prop :=
  OffenseIsProductionOrTransferOfUnitedStatesTypeDocument ch c ∨
  MoreThanFiveDocumentsTransferred ch c ∨
  pgh = Paragraph1028a.p5 ∨
  (pgh = Paragraph1028a.p7 ∧ OneOrMoreMeansOfIdentification ch c ∧
     ValueAggregatesOneThousandDollars1028 ch c ∧ WithinOneYearAggregationWindow ch c)


def Tier1028b2Trigger (pgh : Paragraph1028a) (ch : Charge) (c : ComplaintText) : Prop :=
  OtherProductionTransferOrUseOfIdentificationItem ch c ∨
  pgh = Paragraph1028a.p3 ∨
  pgh = Paragraph1028a.p7


def maxImprisonmentYears1028 : PunishmentTier1028 → Nat
  | .thirtyYears  => 30
  | .twentyYears  => 20
  | .fifteenYears => 15
  | .fiveYears    => 5
  | .oneYear      => 1





inductive PunishmentTierSelected1028 (pgh : Paragraph1028a) (p : Person) (ch : Charge)
    (c : ComplaintText) : PunishmentTier1028 → Prop
  | terrorism (h : CommittedToFacilitateActOfTerrorism ch c) :
      PunishmentTierSelected1028 pgh p ch c PunishmentTier1028.thirtyYears
  | aggravated (h4 : ¬ CommittedToFacilitateActOfTerrorism ch c)
      (h : Aggravator1028b3 p ch c) :
      PunishmentTierSelected1028 pgh p ch c PunishmentTier1028.twentyYears
  | fifteen (h4 : ¬ CommittedToFacilitateActOfTerrorism ch c)
      (h3 : ¬ Aggravator1028b3 p ch c) (h : Tier1028b1Trigger pgh ch c) :
      PunishmentTierSelected1028 pgh p ch c PunishmentTier1028.fifteenYears
  | five (h4 : ¬ CommittedToFacilitateActOfTerrorism ch c)
      (h3 : ¬ Aggravator1028b3 p ch c) (h1 : ¬ Tier1028b1Trigger pgh ch c)
      (h : Tier1028b2Trigger pgh ch c) :
      PunishmentTierSelected1028 pgh p ch c PunishmentTier1028.fiveYears
  | residual (h4 : ¬ CommittedToFacilitateActOfTerrorism ch c)
      (h3 : ¬ Aggravator1028b3 p ch c) (h1 : ¬ Tier1028b1Trigger pgh ch c)
      (h2 : ¬ Tier1028b2Trigger pgh ch c) :
      PunishmentTierSelected1028 pgh p ch c PunishmentTier1028.oneYear





structure ForfeitureProcedureConformity (ch : Charge) (c : ComplaintText) : Prop where
  governedBySection853 : ForfeitureProceedingGovernedBySection853 ch c
  section853dExcluded  : ¬ ForfeitureProceedingAppliedSection853d ch c




structure MandatoryForfeitureOrder1028 (p : Person) (ch : Charge)
    (c : ComplaintText) : Prop where
  convicted : ConvictedOfViolationOfSubsection1028a p ch c
  ordered   : CourtOrderedForfeitureAndDisposition ch c
  conforms  : ForfeitureProcedureConformity ch c


structure Section1028Prosecution (pgh : Paragraph1028a) (p : Person) (ch : Charge)
    (d : IdentificationDocument) (impl : DocumentMakingImplement) (t : Tribunal)
    (c : ComplaintText) : Prop where
  forum      : CourtOfTheUnitedStates t ch c
  offense    : Section1028Offense pgh p ch d impl c
  forfeiture : MandatoryForfeitureOrder1028 p ch c






def Paragraph1029Threshold : Paragraph1029a → Charge → ComplaintText → Prop
  | .p2, ch, c => valueObtainedFromUnauthorizedDevicesCents ch c ≥ 100000 ∧
                  WithinOneYearAggregationWindow ch c
  | .p3, ch, c => accessDevicesPossessed ch c ≥ 15
  | .p5, ch, c => paymentsReceivedViaAnothersDevicesCents ch c ≥ 100000 ∧
                  WithinOneYearAggregationWindow ch c
  | _,   _,  _ => True


def Section1029Exempt (ch : Charge) (c : ComplaintText) : Prop :=
  LawfullyAuthorizedInvestigativeOrProtectiveActivity ch c ∨
  ActivityAuthorizedUnderChapter224 ch c



def CarrierProtectiveCarveOut1029 (pgh : Paragraph1029a) (p : Person) (ch : Charge)
    (c : ComplaintText) : Prop :=
  pgh = Paragraph1029a.p9 ∧ FacilitiesBasedCarrierProtectiveConduct p ch c ∧
  ¬ ConductForObtainingAnotherCarriersServiceWithoutAuthorization ch c



structure Section1029Offense (pgh : Paragraph1029a) (p : Person) (ch : Charge)
    (c : ComplaintText) : Prop where
  conduct     : OffenseUnderAccessDeviceParagraph pgh p ch c
  threshold   : Paragraph1029Threshold pgh ch c
  commerce    : AffectsInterstateOrForeignCommerce ch c
  notExempt   : ¬ Section1029Exempt ch c
  notCarveOut : ¬ CarrierProtectiveCarveOut1029 pgh p ch c



structure Section1029Conspiracy (p : Person) (ch : Charge) (c : ComplaintText) : Prop where
  party    : PartyToConspiracyOfTwoOrMore p ch c
  overtAct : AnyPartyEngagedInConductInFurtherance ch c


inductive Section1029Inchoate (p : Person) (ch : Charge) (c : ComplaintText) : Prop
  | attempt    (h : AttemptedOffenseUnderSection1029 p ch c)
  | conspiracy (h : Section1029Conspiracy p ch c)




def maxImprisonmentMonths1029 (pgh : Paragraph1029a) (recidivist : Bool) : Nat :=
  if recidivist then 240
  else
    match pgh with
    | .p1 | .p2 | .p3 | .p6 | .p7 | .p10 => 120
    | .p4 | .p5 | .p8  | .p9             => 180



def conspiracyMaxImprisonmentMonths1029 (pgh : Paragraph1029a) (recidivist : Bool) : Nat :=
  maxImprisonmentMonths1029 pgh recidivist / 2



def burdenStandard1029g2 : BurdenStandard := BurdenStandard.preponderanceOfTheEvidence


def burdenBearer1029g2 : Party := Party.defendant




structure ResearchAffirmativeDefense1029 (pgh : Paragraph1029a) (p : Person) (ch : Charge)
    (c : ComplaintText) : Prop where
  paragraphNine             : pgh = Paragraph1029a.p9
  notProducingOrTrafficking : ¬ ChargedConductIsProducingOrTrafficking ch c
  lawfulPurpose             : ConductForResearchOrDevelopmentLawfulPurpose ch c
  burdenCarried             : DefendantEstablishedByPreponderance p ch c



structure SecretServiceInvestigativeAuthority1029 (ch : Charge) (c : ComplaintText) : Prop where
  investigated : InvestigationConductedBySecretService ch c
  agreement    : SecretServiceAgreementWithAttorneyGeneralInEffect c




inductive UnitedStatesEntityNexus1029h (ad : AccessDevice) (fi : FinancialInstitution)
    (c : ComplaintText) : Prop
  | financialInstitution (h : IsFinancialInstitution fi c)
                         (hd : AccessDeviceIssuedOrControlledByInstitution ad fi c)
  | otherUnitedStatesEntity (h : AccessDeviceControlledByUnitedStatesOrganizedEntity ad c)


structure ExtraterritorialReach1029 (ad : AccessDevice) (fi : FinancialInstitution)
    (ch : Charge) (c : ComplaintText) : Prop where
  outside         : ConductOutsideJurisdictionOfUnitedStates ch c
  wouldConstitute : WouldConstituteOffenseIfCommittedWithinUnitedStates ch c
  nexus           : UnitedStatesEntityNexus1029h ad fi c



structure ForfeitureOnConviction1029 (p : Person) (ch : Charge) (c : ComplaintText) : Prop where
  convicted : ConvictedOfViolationOfSubsection1029a p ch c
  ordered   : CourtOrderedForfeitureAndDisposition ch c
  conforms  : ForfeitureProcedureConformity ch c


structure Section1029Prosecution (pgh : Paragraph1029a) (p : Person) (ch : Charge)
    (t : Tribunal) (c : ComplaintText) : Prop where
  forum      : CourtOfTheUnitedStates t ch c
  offense    : Section1029Offense pgh p ch c
  forfeiture : ForfeitureOnConviction1029 p ch c




def smtjTransition (l : Locus) (ch : Charge) (c : ComplaintText) : Transition c :=
  { source := Stage.conductAlleged
    target := Stage.federallyCognizable
    guard  := SpecialMaritimeAndTerritorialJurisdiction l ch c }


def cognizable1028Transition (pgh : Paragraph1028a) (p : Person) (ch : Charge)
    (d : IdentificationDocument) (impl : DocumentMakingImplement)
    (c : ComplaintText) : Transition c :=
  { source := Stage.conductAlleged
    target := Stage.federallyCognizable
    guard  := Section1028Offense pgh p ch d impl c }


def cognizable1029Transition (pgh : Paragraph1029a) (p : Person) (ch : Charge)
    (c : ComplaintText) : Transition c :=
  { source := Stage.conductAlleged
    target := Stage.federallyCognizable
    guard  := Section1029Offense pgh p ch c }


def chargingTransition (t : Tribunal) (ch : Charge) (c : ComplaintText) : Transition c :=
  { source := Stage.federallyCognizable
    target := Stage.charged
    guard  := CourtOfTheUnitedStates t ch c }



def section21ProofTransition (p : Person) (pr : Property) (el : Element)
    (r : OfficialRepresentation) (ch : Charge) (c : ComplaintText) : Transition c :=
  { source := Stage.charged
    target := Stage.elementsProved
    guard  := Section21ProofRoute p pr el r ch c }


def sentencing1028Transition (pgh : Paragraph1028a) (p : Person) (ch : Charge)
    (tier : PunishmentTier1028) (c : ComplaintText) : Transition c :=
  { source := Stage.convicted
    target := Stage.sentenced
    guard  := PunishmentTierSelected1028 pgh p ch c tier }


def forfeiture1028Transition (p : Person) (ch : Charge) (c : ComplaintText) : Transition c :=
  { source := Stage.convicted
    target := Stage.forfeitureOrdered
    guard  := MandatoryForfeitureOrder1028 p ch c }


def forfeiture1029Transition (p : Person) (ch : Charge) (c : ComplaintText) : Transition c :=
  { source := Stage.convicted
    target := Stage.forfeitureOrdered
    guard  := ForfeitureOnConviction1029 p ch c }

end Proving.USC.T18.Ch1Ch47.Recert.Procedure
