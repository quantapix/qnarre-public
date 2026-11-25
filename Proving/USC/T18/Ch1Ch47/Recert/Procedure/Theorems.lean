



import Proving.USC.T18.Ch1Ch47.Recert.Procedure.Types
import Proving.USC.T18.Ch1Ch47.Recert.Procedure.Predicates
import Proving.USC.T18.Ch1Ch47.Recert.Procedure.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch1Ch47.Recert.Procedure

open Proving.USC.Common




theorem specialMaritimeAndTerritorialJurisdiction_intro
    {l : Locus} {ch : Charge} {c : ComplaintText}
    (h : SitusFederalEnclave l c) :
    SpecialMaritimeAndTerritorialJurisdiction l ch c :=
  SpecialMaritimeAndTerritorialJurisdiction.federalEnclave h



theorem specialMaritimeAndTerritorialJurisdictionMission_intro
    {l : Locus} {ch : Charge} {c : ComplaintText}
    (h : SitusUnitedStatesMissionPremisesOrResidence l c)
    (hn : OffenseByOrAgainstUnitedStatesNational ch c)
    (hEsc : ¬ CoveredBySection3261a ch c) :
    SpecialMaritimeAndTerritorialJurisdiction l ch c :=
  SpecialMaritimeAndTerritorialJurisdiction.unitedStatesMissionPremises h hn hEsc




theorem qualifyingOfficialRepresentation_intro
    {r : OfficialRepresentation} {c : ComplaintText}
    (h : RepresentationByFederalLawEnforcementOfficer r c) :
    QualifyingOfficialRepresentation r c :=
  QualifyingOfficialRepresentation.byOfficer h


theorem qualifyingOfficialRepresentationAtDirection_intro
    {r : OfficialRepresentation} {c : ComplaintText}
    (h : RepresentationAtDirectionOrApprovalOfOfficer r c) :
    QualifyingOfficialRepresentation r c :=
  QualifyingOfficialRepresentation.atDirection h


theorem section21ProofRoute_intro
    {p : Person} {pr : Property} {el : Element} {r : OfficialRepresentation}
    {ch : Charge} {c : ComplaintText}
    (hChar : ElementIsStolenOrCounterfeitCharacter el pr ch c)
    (hKnow : ElementIsDefendantKnowledgeOfCharacter el ch c)
    (hRep : OfficialRepresentationAsToNatureOfProperty r pr c)
    (hOff : QualifyingOfficialRepresentation r c)
    (hBel : DefendantBelievedPropertyOfSuchCharacter p pr c)
    (hCause : BeliefFollowedFromRepresentation p r c) :
    Section21ProofRoute p pr el r ch c :=
  ⟨hChar, hKnow, hRep, hOff, hBel, hCause⟩




theorem courtWithinSection23_intro
    {t : Tribunal} {c : ComplaintText}
    (h : IsListedTerritorialDistrictCourt t c) :
    CourtWithinSection23 t c :=
  CourtWithinSection23.listedTerritorial h


theorem courtWithinSection23Ordinary_intro
    {t : Tribunal} {c : ComplaintText}
    (h : IsOtherCourtOfTheUnitedStates t c) :
    CourtWithinSection23 t c :=
  CourtWithinSection23.ordinarySense h


theorem courtOfTheUnitedStates_intro
    {t : Tribunal} {ch : Charge} {c : ComplaintText}
    (hIn : CourtWithinSection23 t c)
    (hEsc : ¬ ExpresslyProvidedOtherwise t ch c) :
    CourtOfTheUnitedStates t ch c :=
  ⟨hIn, hEsc⟩




theorem chargedStatuteWithinSection24_intro
    {ch : Charge} {c : ComplaintText}
    (h : ViolationOfEnumeratedHealthCareStatute ch c) :
    ChargedStatuteWithinSection24 ch c :=
  Or.inl h


theorem chargedStatuteWithinSection24GeneralFraud_intro
    {ch : Charge} {c : ComplaintText}
    (h : ViolationOfEnumeratedGeneralFraudStatute ch c)
    (hn : RelatesToHealthCareBenefitProgram ch c) :
    ChargedStatuteWithinSection24 ch c :=
  Or.inr ⟨h, hn⟩


theorem federalHealthCareOffense_intro
    {ch : Charge} {c : ComplaintText}
    (h : ChargedStatuteWithinSection24 ch c) :
    FederalHealthCareOffense ch c :=
  FederalHealthCareOffense.directViolation h


theorem federalHealthCareOffenseConspiracy_intro
    {ch : Charge} {c : ComplaintText}
    (h : ChargedStatuteWithinSection24 ch c)
    (hc : IsCriminalConspiracyToViolate ch c) :
    FederalHealthCareOffense ch c :=
  FederalHealthCareOffense.conspiracy h hc




theorem section1028Circumstance_intro
    {pgh : Paragraph1028a} {ch : Charge} {d : IdentificationDocument}
    {impl : DocumentMakingImplement} {c : ComplaintText}
    (h : DocumentAppearsIssuedByUnitedStatesOrSponsoringEntity d c) :
    Section1028Circumstance pgh ch d impl c :=
  Section1028Circumstance.unitedStatesDocument h



theorem section1028CircumstanceParagraphFour_intro
    {ch : Charge} {d : IdentificationDocument}
    {impl : DocumentMakingImplement} {c : ComplaintText} :
    Section1028Circumstance Paragraph1028a.p4 ch d impl c :=
  Section1028Circumstance.defraudUnitedStates rfl


theorem section1028CircumstanceCommerce_intro
    {pgh : Paragraph1028a} {ch : Charge} {d : IdentificationDocument}
    {impl : DocumentMakingImplement} {c : ComplaintText}
    (h : AffectsInterstateOrForeignCommerce ch c) :
    Section1028Circumstance pgh ch d impl c :=
  Section1028Circumstance.commerce (Or.inr h)


theorem section1028Offense_intro
    {pgh : Paragraph1028a} {p : Person} {ch : Charge} {d : IdentificationDocument}
    {impl : DocumentMakingImplement} {c : ComplaintText}
    (hConduct : OffenseUnderIdentificationParagraph pgh p ch c)
    (hCirc : Section1028Circumstance pgh ch d impl c)
    (hEsc : ¬ Section1028Exempt ch c) :
    Section1028Offense pgh p ch d impl c :=
  ⟨hConduct, hCirc, hEsc⟩


theorem section1028Inchoate_intro
    {p : Person} {ch : Charge} {c : ComplaintText}
    (h : AttemptedOffenseUnderSection1028 p ch c) :
    Section1028Inchoate p ch c :=
  Section1028Inchoate.attempt h


theorem section1028InchoateConspiracy_intro
    {p : Person} {ch : Charge} {c : ComplaintText}
    (h : ConspiredToCommitOffenseUnderSection1028 p ch c) :
    Section1028Inchoate p ch c :=
  Section1028Inchoate.conspiracy h



theorem punishmentTierSelected1028_intro
    {pgh : Paragraph1028a} {p : Person} {ch : Charge} {c : ComplaintText}
    (h : CommittedToFacilitateActOfTerrorism ch c) :
    PunishmentTierSelected1028 pgh p ch c PunishmentTier1028.thirtyYears :=
  PunishmentTierSelected1028.terrorism h



theorem punishmentTierSelected1028Fifteen_intro
    {pgh : Paragraph1028a} {p : Person} {ch : Charge} {c : ComplaintText}
    (h4 : ¬ CommittedToFacilitateActOfTerrorism ch c)
    (h3 : ¬ Aggravator1028b3 p ch c)
    (h : Tier1028b1Trigger pgh ch c) :
    PunishmentTierSelected1028 pgh p ch c PunishmentTier1028.fifteenYears :=
  PunishmentTierSelected1028.fifteen h4 h3 h


theorem punishmentTierSelected1028Residual_intro
    {pgh : Paragraph1028a} {p : Person} {ch : Charge} {c : ComplaintText}
    (h4 : ¬ CommittedToFacilitateActOfTerrorism ch c)
    (h3 : ¬ Aggravator1028b3 p ch c)
    (h1 : ¬ Tier1028b1Trigger pgh ch c)
    (h2 : ¬ Tier1028b2Trigger pgh ch c) :
    PunishmentTierSelected1028 pgh p ch c PunishmentTier1028.oneYear :=
  PunishmentTierSelected1028.residual h4 h3 h1 h2


theorem forfeitureProcedureConformity_intro
    {ch : Charge} {c : ComplaintText}
    (hGov : ForfeitureProceedingGovernedBySection853 ch c)
    (hEsc : ¬ ForfeitureProceedingAppliedSection853d ch c) :
    ForfeitureProcedureConformity ch c :=
  ⟨hGov, hEsc⟩


theorem mandatoryForfeitureOrder1028_intro
    {p : Person} {ch : Charge} {c : ComplaintText}
    (hConv : ConvictedOfViolationOfSubsection1028a p ch c)
    (hOrd : CourtOrderedForfeitureAndDisposition ch c)
    (hConf : ForfeitureProcedureConformity ch c) :
    MandatoryForfeitureOrder1028 p ch c :=
  ⟨hConv, hOrd, hConf⟩


theorem section1028Prosecution_intro
    {pgh : Paragraph1028a} {p : Person} {ch : Charge} {d : IdentificationDocument}
    {impl : DocumentMakingImplement} {t : Tribunal} {c : ComplaintText}
    (hForum : CourtOfTheUnitedStates t ch c)
    (hOff : Section1028Offense pgh p ch d impl c)
    (hForf : MandatoryForfeitureOrder1028 p ch c) :
    Section1028Prosecution pgh p ch d impl t c :=
  ⟨hForum, hOff, hForf⟩




theorem section1029Offense_intro
    {pgh : Paragraph1029a} {p : Person} {ch : Charge} {c : ComplaintText}
    (hConduct : OffenseUnderAccessDeviceParagraph pgh p ch c)
    (hThresh : Paragraph1029Threshold pgh ch c)
    (hCommerce : AffectsInterstateOrForeignCommerce ch c)
    (hEsc : ¬ Section1029Exempt ch c)
    (hCarve : ¬ CarrierProtectiveCarveOut1029 pgh p ch c) :
    Section1029Offense pgh p ch c :=
  ⟨hConduct, hThresh, hCommerce, hEsc, hCarve⟩



theorem paragraph1029ThresholdParagraphOne_intro
    {ch : Charge} {c : ComplaintText} :
    Paragraph1029Threshold Paragraph1029a.p1 ch c :=
  trivial



theorem paragraph1029ThresholdParagraphThree_intro
    {ch : Charge} {c : ComplaintText}
    (h : accessDevicesPossessed ch c ≥ 15) :
    Paragraph1029Threshold Paragraph1029a.p3 ch c :=
  h


theorem section1029Conspiracy_intro
    {p : Person} {ch : Charge} {c : ComplaintText}
    (hParty : PartyToConspiracyOfTwoOrMore p ch c)
    (hAct : AnyPartyEngagedInConductInFurtherance ch c) :
    Section1029Conspiracy p ch c :=
  ⟨hParty, hAct⟩


theorem section1029Inchoate_intro
    {p : Person} {ch : Charge} {c : ComplaintText}
    (h : AttemptedOffenseUnderSection1029 p ch c) :
    Section1029Inchoate p ch c :=
  Section1029Inchoate.attempt h


theorem section1029InchoateConspiracy_intro
    {p : Person} {ch : Charge} {c : ComplaintText}
    (h : Section1029Conspiracy p ch c) :
    Section1029Inchoate p ch c :=
  Section1029Inchoate.conspiracy h



theorem conspiracyMaxImprisonmentMonths1029_paragraphFour :
    conspiracyMaxImprisonmentMonths1029 Paragraph1029a.p4 false = 90 := by decide


theorem conspiracyMaxImprisonmentMonths1029_recidivist
    {pgh : Paragraph1029a} :
    conspiracyMaxImprisonmentMonths1029 pgh true = 120 := by
  simp [conspiracyMaxImprisonmentMonths1029, maxImprisonmentMonths1029]


theorem researchAffirmativeDefense1029_intro
    {p : Person} {ch : Charge} {c : ComplaintText}
    (hNotPT : ¬ ChargedConductIsProducingOrTrafficking ch c)
    (hPurpose : ConductForResearchOrDevelopmentLawfulPurpose ch c)
    (hBurden : DefendantEstablishedByPreponderance p ch c) :
    ResearchAffirmativeDefense1029 Paragraph1029a.p9 p ch c :=
  ⟨rfl, hNotPT, hPurpose, hBurden⟩


theorem burdenStandard1029g2_isPreponderance :
    burdenStandard1029g2 = BurdenStandard.preponderanceOfTheEvidence := rfl


theorem burdenBearer1029g2_isDefendant :
    burdenBearer1029g2 = Party.defendant := rfl


theorem secretServiceInvestigativeAuthority1029_intro
    {ch : Charge} {c : ComplaintText}
    (hInv : InvestigationConductedBySecretService ch c)
    (hAgr : SecretServiceAgreementWithAttorneyGeneralInEffect c) :
    SecretServiceInvestigativeAuthority1029 ch c :=
  ⟨hInv, hAgr⟩


theorem unitedStatesEntityNexus1029h_intro
    {ad : AccessDevice} {fi : FinancialInstitution} {c : ComplaintText}
    (hFi : IsFinancialInstitution fi c)
    (hDev : AccessDeviceIssuedOrControlledByInstitution ad fi c) :
    UnitedStatesEntityNexus1029h ad fi c :=
  UnitedStatesEntityNexus1029h.financialInstitution hFi hDev


theorem unitedStatesEntityNexus1029hOther_intro
    {ad : AccessDevice} {fi : FinancialInstitution} {c : ComplaintText}
    (h : AccessDeviceControlledByUnitedStatesOrganizedEntity ad c) :
    UnitedStatesEntityNexus1029h ad fi c :=
  UnitedStatesEntityNexus1029h.otherUnitedStatesEntity h


theorem extraterritorialReach1029_intro
    {ad : AccessDevice} {fi : FinancialInstitution} {ch : Charge} {c : ComplaintText}
    (hOut : ConductOutsideJurisdictionOfUnitedStates ch c)
    (hWould : WouldConstituteOffenseIfCommittedWithinUnitedStates ch c)
    (hNexus : UnitedStatesEntityNexus1029h ad fi c) :
    ExtraterritorialReach1029 ad fi ch c :=
  ⟨hOut, hWould, hNexus⟩


theorem forfeitureOnConviction1029_intro
    {p : Person} {ch : Charge} {c : ComplaintText}
    (hConv : ConvictedOfViolationOfSubsection1029a p ch c)
    (hOrd : CourtOrderedForfeitureAndDisposition ch c)
    (hConf : ForfeitureProcedureConformity ch c) :
    ForfeitureOnConviction1029 p ch c :=
  ⟨hConv, hOrd, hConf⟩


theorem section1029Prosecution_intro
    {pgh : Paragraph1029a} {p : Person} {ch : Charge} {t : Tribunal} {c : ComplaintText}
    (hForum : CourtOfTheUnitedStates t ch c)
    (hOff : Section1029Offense pgh p ch c)
    (hForf : ForfeitureOnConviction1029 p ch c) :
    Section1029Prosecution pgh p ch t c :=
  ⟨hForum, hOff, hForf⟩




theorem reachableFederallyCognizableSmtj
    {l : Locus} {ch : Charge} {c : ComplaintText}
    (h : SpecialMaritimeAndTerritorialJurisdiction l ch c) :
    Reachable c Stage.federallyCognizable :=
  Reachable.step (smtjTransition l ch c) rfl rfl h Reachable.start



theorem reachableFederallyCognizable1028
    {pgh : Paragraph1028a} {p : Person} {ch : Charge} {d : IdentificationDocument}
    {impl : DocumentMakingImplement} {c : ComplaintText}
    (h : Section1028Offense pgh p ch d impl c) :
    Reachable c Stage.federallyCognizable :=
  Reachable.step (cognizable1028Transition pgh p ch d impl c) rfl rfl h Reachable.start



theorem reachableFederallyCognizable1029
    {pgh : Paragraph1029a} {p : Person} {ch : Charge} {c : ComplaintText}
    (h : Section1029Offense pgh p ch c) :
    Reachable c Stage.federallyCognizable :=
  Reachable.step (cognizable1029Transition pgh p ch c) rfl rfl h Reachable.start


theorem reachableCharged1029
    {pgh : Paragraph1029a} {p : Person} {ch : Charge} {t : Tribunal} {c : ComplaintText}
    (hOff : Section1029Offense pgh p ch c)
    (hForum : CourtOfTheUnitedStates t ch c) :
    Reachable c Stage.charged :=
  Reachable.step (chargingTransition t ch c) rfl rfl hForum
    (reachableFederallyCognizable1029 hOff)



theorem reachableElementsProved1029ViaSection21
    {pgh : Paragraph1029a} {p : Person} {pr : Property} {el : Element}
    {r : OfficialRepresentation} {ch : Charge} {t : Tribunal} {c : ComplaintText}
    (hOff : Section1029Offense pgh p ch c)
    (hForum : CourtOfTheUnitedStates t ch c)
    (hProof : Section21ProofRoute p pr el r ch c) :
    Reachable c Stage.elementsProved :=
  Reachable.step (section21ProofTransition p pr el r ch c) rfl rfl hProof
    (reachableCharged1029 hOff hForum)

end Proving.USC.T18.Ch1Ch47.Recert.Procedure
