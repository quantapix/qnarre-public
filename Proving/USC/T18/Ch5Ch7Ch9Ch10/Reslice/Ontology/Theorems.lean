




import Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Ontology.Types
import Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Ontology.Predicates
import Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Ontology.Statute

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Ontology

open Proving.USC.Common




theorem substantialBodilyInjuryMembership_intro_disfigurement
    {i : Injury} {c : ComplaintText}
    (h : IsTemporaryButSubstantialDisfigurement i c) :
    SubstantialBodilyInjuryMembership i c :=
  .disfigurement h


theorem substantialBodilyInjuryMembership_intro_lossOfFunction
    {i : Injury} {c : ComplaintText}
    (h : IsTemporaryButSubstantialLossOfBodilyFunction i c) :
    SubstantialBodilyInjuryMembership i c :=
  .lossOfFunction h


theorem stranglingMembership_intro {x : Conduct} {c : ComplaintText}
    (hMens : IsIntentionalKnowingOrReckless x c)
    (hManner : ImpedesBreathingOrCirculationByThroatPressure x c) :
    StranglingMembership x c :=
  ⟨hMens, hManner⟩


theorem suffocatingMembership_intro {x : Conduct} {c : ComplaintText}
    (hMens : IsIntentionalKnowingOrReckless x c)
    (hManner : ImpedesBreathingByCoveringMouthOrNose x c) :
    SuffocatingMembership x c :=
  ⟨hMens, hManner⟩


theorem immediateFamilyMembership_intro_closeRelative
    {p q : Person} {c : ComplaintText}
    (h : IsSpouseParentSiblingChildOrInLocoParentis p q c) :
    ImmediateFamilyMembership p q c :=
  .closeRelative h


theorem immediateFamilyMembership_intro_householdRelative
    {p q : Person} {c : ComplaintText}
    (h : IsHouseholdMemberRelatedByBloodOrMarriage p q c) :
    ImmediateFamilyMembership p q c :=
  .householdRelative h


theorem immediateFamilyAlias119_intro {p q : Person} {c : ComplaintText}
    (h : IsImmediateFamilyMemberOf p q c) : ImmediateFamilyAlias119 p q c :=
  ⟨h⟩


theorem protectedFederalOfficialClass_intro_usOfficial
    {p : Person} {c : ComplaintText} (h : IsUnitedStatesOfficial p c) :
    ProtectedFederalOfficialClass p c :=
  .usOfficial h


theorem protectedFederalOfficialClass_intro_usJudge
    {p : Person} {c : ComplaintText} (h : IsUnitedStatesJudge p c) :
    ProtectedFederalOfficialClass p c :=
  .usJudge h


theorem protectedFederalOfficialClass_intro_lawEnforcement
    {p : Person} {c : ComplaintText} (h : IsFederalLawEnforcementOfficer p c) :
    ProtectedFederalOfficialClass p c :=
  .lawEnforcement h


theorem protectedFederalOfficialClass_intro_section1114
    {p : Person} {c : ComplaintText} (h : IsPersonDesignatedInSection1114 p c) :
    ProtectedFederalOfficialClass p c :=
  .section1114 h


theorem femaleGenitalMutilationMembership_intro
    {pr : Procedure} {c : ComplaintText}
    (hNonMedical : IsPerformedForNonMedicalReasons pr c)
    (hAnatomical : IsRemovalOfOrInjuryToExternalFemaleGenitalia pr c) :
    FemaleGenitalMutilationMembership pr c :=
  ⟨hNonMedical, hAnatomical⟩


theorem fgmEnumeratedForm_intro_clitoridectomy
    {pr : Procedure} {c : ComplaintText} (h : IsClitoridectomy pr c) :
    FgmEnumeratedForm pr c :=
  .clitoridectomy h


theorem fgmEnumeratedForm_intro_labialExcision
    {pr : Procedure} {c : ComplaintText} (h : IsExcisionOfLabia pr c) :
    FgmEnumeratedForm pr c :=
  .labialExcision h


theorem fgmEnumeratedForm_intro_infibulation
    {pr : Procedure} {c : ComplaintText} (h : IsInfibulation pr c) :
    FgmEnumeratedForm pr c :=
  .infibulation h


theorem fgmEnumeratedForm_intro_otherHarmful
    {pr : Procedure} {c : ComplaintText} (h : IsOtherHarmfulGenitalProcedure pr c) :
    FgmEnumeratedForm pr c :=
  .otherHarmful h


theorem medicalExceptionCase_intro_healthNecessity
    {pr : Procedure} {p : Person} {c : ComplaintText}
    (hOp : IsMedicallyNecessaryOperation pr c)
    (hLic : IsLicensedMedicalPractitioner p c) : MedicalExceptionCase pr p c :=
  .healthNecessity hOp hLic


theorem medicalExceptionCase_intro_childbirth
    {pr : Procedure} {p : Person} {c : ComplaintText}
    (hOp : IsChildbirthRelatedOperation pr c)
    (hLic : IsLicensedMedicalPractitioner p c) : MedicalExceptionCase pr p c :=
  .childbirth hOp hLic


theorem domesticAssaultMembership_intro
    {x : Conduct} {p q : Person} {c : ComplaintText}
    (hAssault : IsAssault x c) (hRelation : IsDomesticRelationToVictim p q c) :
    DomesticAssaultMembership x p q c :=
  ⟨hAssault, hRelation⟩


theorem restrictedPersonalInformationMembership_intro
    {i : Information} {p : Person} {c : ComplaintText}
    (hItem : IsEnumeratedPersonalDataItem i c)
    (hIdent : IsIdentifiableToIndividual i p c) :
    RestrictedPersonalInformationMembership i p c :=
  ⟨hItem, hIdent⟩


theorem coveredPersonMembership_intro_designated1114
    {p : Person} {c : ComplaintText} (h : IsPersonDesignatedInSection1114 p c) :
    CoveredPersonMembership p c :=
  .designated1114 h


theorem coveredPersonMembership_intro_courtOfficer
    {p : Person} {c : ComplaintText} (h : IsCourtOfficerJurorOrWitness p c) :
    CoveredPersonMembership p c :=
  .courtOfficer h


theorem coveredPersonMembership_intro_informant
    {p : Person} {c : ComplaintText} (h : IsFederalInvestigationInformantOrWitness p c) :
    CoveredPersonMembership p c :=
  .informant h


theorem coveredPersonMembership_intro_stateOrLocal
    {p : Person} {c : ComplaintText}
    (h : IsStateOrLocalOfficerAssistingFederalInvestigation p c) :
    CoveredPersonMembership p c :=
  .stateOrLocal h




theorem debtorMembership_intro {p : Person} {d : Document} {c : ComplaintText}
    (hPetition : IsPetitionFiledUnderTitle11 d c)
    (hConcerns : PetitionConcernsPerson d p c) : DebtorMembership p d c :=
  ⟨hPetition, hConcerns⟩


theorem estateAdministrationInsiderMembership_intro
    {p : Person} {e : Estate} {c : ComplaintText}
    (hAccess : HasAccessToEstatePropertyOrDocuments p e c)
    (hPart : ParticipatesInEstateAdministration p e c) :
    EstateAdministrationInsiderMembership p e c :=
  ⟨hAccess, hPart⟩


theorem partyInInterestMembership_intro_debtor
    {p : Person} {c : ComplaintText} (h : IsDebtor p c) :
    PartyInInterestMembership p c :=
  .debtor h


theorem partyInInterestMembership_intro_creditor
    {p : Person} {c : ComplaintText} (h : IsCreditor p c) :
    PartyInInterestMembership p c :=
  .creditor h


theorem partyInInterestMembership_intro_receiver
    {p : Person} {c : ComplaintText} (h : IsReceiver p c) :
    PartyInInterestMembership p c :=
  .receiver h


theorem partyInInterestMembership_intro_trustee
    {p : Person} {c : ComplaintText} (h : IsCourtOfficerCustodianOrTrustee p c) :
    PartyInInterestMembership p c :=
  .trustee h


theorem partyInInterestMembership_intro_attorney
    {p q : Person} {c : ComplaintText} (h : IsAttorneyForPartyInInterest p q c) :
    PartyInInterestMembership p c :=
  .attorney q h


theorem documentForFilingMembership_intro
    {d : Document} {k : BankruptcyCase} {c : ComplaintText}
    (hDebtor : IsPreparedForFilingByDebtor d c)
    (hCourt : IsFiledInUnitedStatesBankruptcyOrDistrictCourt d c)
    (hCase : IsCaseUnderTitle11 k c) : DocumentForFilingMembership d k c :=
  ⟨hDebtor, hCourt, hCase⟩


theorem bankruptcyPetitionPreparerMembership_intro
    {p : Person} {d : Document} {c : ComplaintText}
    (hPrep : PreparesDocumentForCompensation p d c)
    (hTarget : IsDocumentForFiling d c)
    (hNotCounsel : ¬ IsDebtorsAttorneyOrEmployee p c) :
    BankruptcyPetitionPreparerMembership p d c :=
  ⟨hPrep, hTarget, hNotCounsel⟩




theorem biologicalAgentMembership_intro {a : Agent} {c : ComplaintText}
    (hGenus : IsMicroorganismOrInfectiousSubstance a c)
    (hCap : IsCapableOfCausingBiologicalHarm a c) : BiologicalAgentMembership a c :=
  ⟨hGenus, hCap⟩


theorem toxinMembership_intro {t : Toxin} {c : ComplaintText}
    (hTox : IsToxicMaterialOrProduct t c)
    (hOrigin : IsBiologicalOrSynthesizedOrigin t c) : ToxinMembership t c :=
  ⟨hTox, hOrigin⟩


theorem deliverySystemMembership_intro_designedApparatus
    {ds : DeliverySystem} {c : ComplaintText}
    (h : IsApparatusDesignedToDisseminate ds c) : DeliverySystemMembership ds c :=
  .designedApparatus h


theorem deliverySystemMembership_intro_vectorForm
    {ds : DeliverySystem} {c : ComplaintText}
    (h : IsVectorDeliverySystem ds c) : DeliverySystemMembership ds c :=
  .vectorForm h


theorem vectorMembership_intro {v : Vector} {c : ComplaintText}
    (hSub : IsLivingOrganismOrMolecule v c)
    (hCar : IsCapableOfCarryingAgentOrToxinToHost v c) : VectorMembership v c :=
  ⟨hSub, hCar⟩


theorem selectAgentMembership_intro {a : Agent} {c : ComplaintText}
    (hBase : IsBiologicalAgent a c)
    (hListed : IsListedSelectBiologicalAgentOrToxin a c)
    (hNotExempt : ¬ IsExcludedOrExemptedUnderPart73 a c)
    (hNotNatural : ¬ IsNaturallyOccurringUnextracted a c) : SelectAgentMembership a c :=
  ⟨hBase, hListed, hNotExempt, hNotNatural⟩


theorem restrictedPersonMembership_intro_underIndictment
    {p : Person} {c : ComplaintText} (h : IsUnderIndictmentForFelony p c) :
    RestrictedPersonMembership p c :=
  .underIndictment h


theorem restrictedPersonMembership_intro_convicted
    {p : Person} {c : ComplaintText} (h : IsConvictedOfFelony p c) :
    RestrictedPersonMembership p c :=
  .convicted h


theorem restrictedPersonMembership_intro_fugitive
    {p : Person} {c : ComplaintText} (h : IsFugitiveFromJustice p c) :
    RestrictedPersonMembership p c :=
  .fugitive h


theorem restrictedPersonMembership_intro_drugUser
    {p : Person} {c : ComplaintText} (h : IsUnlawfulUserOfControlledSubstance p c) :
    RestrictedPersonMembership p c :=
  .drugUser h


theorem restrictedPersonMembership_intro_unlawfulAlien
    {p : Person} {c : ComplaintText} (h : IsAlienUnlawfullyInTheUnitedStates p c) :
    RestrictedPersonMembership p c :=
  .unlawfulAlien h


theorem restrictedPersonMembership_intro_mentalAdjudication
    {p : Person} {c : ComplaintText} (h : IsAdjudicatedMentalDefectiveOrCommitted p c) :
    RestrictedPersonMembership p c :=
  .mentalAdjudication h


theorem restrictedPersonMembership_intro_designatedCountryNational
    {p : Person} {c : ComplaintText}
    (hAlien : IsAlien p c)
    (hNotLpr : ¬ IsLawfullyAdmittedForPermanentResidence p c)
    (h : IsNationalOfTerrorismSupportingCountry p c) : RestrictedPersonMembership p c :=
  .designatedCountryNational hAlien hNotLpr h


theorem restrictedPersonMembership_intro_dishonorableDischarge
    {p : Person} {c : ComplaintText} (h : IsDishonorablyDischarged p c) :
    RestrictedPersonMembership p c :=
  .dishonorableDischarge h


theorem restrictedPersonMembership_intro_terroristAffiliation
    {p : Person} {c : ComplaintText} (h : IsAffiliatedWithTerroristOrganization p c) :
    RestrictedPersonMembership p c :=
  .terroristAffiliation h


theorem variolaVirusMembership_intro_smallpoxCausing
    {v : Virus} {c : ComplaintText} (h : CausesHumanSmallpox v c) :
    VariolaVirusMembership v c :=
  .smallpoxCausing h


theorem variolaVirusMembership_intro_sequenceDerivative
    {v : Virus} {c : ComplaintText} (h : IsVariolaGeneSequenceDerivative v c) :
    VariolaVirusMembership v c :=
  .sequenceDerivative h


theorem forUseAsAWeaponMembership_intro
    {x : Conduct} {pu : Purpose} {c : ComplaintText}
    (hConduct : IsForUseAsAWeapon x c) (hNotPeaceful : ¬ IsPeacefulPurpose pu c) :
    ForUseAsAWeaponMembership x pu c :=
  ⟨hConduct, hNotPeaceful⟩


theorem peacefulPurposeDefence_intro
    {a : Agent} {pu : Purpose} {c : ComplaintText}
    (hPeaceful : IsPeacefulPurpose pu c)
    (hProp : IsReasonableTypeAndQuantityForPurpose a pu c) :
    PeacefulPurposeDefence a pu c :=
  ⟨hPeaceful, hProp⟩



#check (Person : Type)
#check (ComplaintText : Type)
#check @IsDebtor
#check @IsRestrictedPerson
#print axioms restrictedPersonMembership_intro_convicted
#print axioms debtorMembership_intro

end Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Ontology
