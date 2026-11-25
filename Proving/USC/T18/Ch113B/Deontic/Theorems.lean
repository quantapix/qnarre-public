













import Proving.USC.T18.Ch113B.Deontic.Types
import Proving.USC.T18.Ch113B.Deontic.Predicates
import Proving.USC.T18.Ch113B.Deontic.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Deontic

open Proving.USC.Common





theorem violated2332A_intro {p : Person} {c : ComplaintText}
    (hCond : NationalOutsideUnitedStates2332A c)
    (hAct : KillsNationalOfUnitedStates2332A p c) :
    Violated2332A p c :=
  ⟨⟨hCond⟩, hAct⟩


theorem violated2332B_intro {p : Person} {c : ComplaintText}
    (hCond : ConductOccurredOutsideUnitedStates p c)
    (hAct : AttemptsOrConspiresToKillNational2332B p c) :
    Violated2332B p c :=
  ⟨⟨hCond⟩, hAct⟩


theorem violated2332C_intro {p : Person} {c : ComplaintText}
    (hCond : ConductOccurredOutsideUnitedStates p c)
    (hInjury : IntendsOrCausesSeriousBodilyInjuryToNational2332C p c)
    (hAct : EngagesInPhysicalViolence2332C p c) :
    Violated2332C p c :=
  ⟨⟨hCond, hInjury⟩, hAct⟩



theorem violated2332D_intro {pr : Proceeding} {c : ComplaintText}
    (hCond : OffenseDescribedInSection2332D pr c)
    (hAct : ProsecutionUndertakenByUnitedStates2332D pr c)
    (hNoCert : ¬ AttorneyGeneralWrittenCertification2332D pr c) :
    Violated2332D pr c :=
  ⟨⟨hCond⟩, hAct, hNoCert⟩




theorem violated2332aA_intro {p : Person} {d : Device} {c : ComplaintText}
    (hWeapon : IsWeaponOfMassDestruction2332a d c)
    (hCirc : JurisdictionalCircumstance2332aA p c)
    (hAct : UsesThreatensAttemptsOrConspiresToUseWMD2332a p d c)
    (hNoAuth : ¬ HasLawfulAuthority2332a p c) :
    Violated2332aA p d c :=
  ⟨⟨hWeapon, hCirc⟩, hAct, hNoAuth⟩


theorem violated2332aB_intro {p : Person} {d : Device} {c : ComplaintText}
    (hAddr : IsNationalOfUnitedStates p c)
    (hWeapon : IsWeaponOfMassDestruction2332a d c)
    (hCond : ConductOccurredOutsideUnitedStates p c)
    (hAct : UsesThreatensAttemptsOrConspiresToUseWMD2332a p d c)
    (hNoAuth : ¬ HasLawfulAuthority2332a p c) :
    Violated2332aB p d c :=
  ⟨⟨hAddr, hWeapon, hCond⟩, hAct, hNoAuth⟩




theorem violated2332bA1_intro {p : Person} {c : ComplaintText}
    (hTrans : ConductTranscendsNationalBoundaries2332bA1 p c)
    (hCirc : JurisdictionalCircumstance2332bB1 p c)
    (hUnlawful : InViolationOfStateOrFederalLaw2332bA1 p c)
    (hAct : CommitsEnumeratedViolentAct2332bA1 p c) :
    Violated2332bA1 p c :=
  ⟨⟨hTrans, hCirc, hUnlawful⟩, hAct⟩


theorem violated2332bA2_intro {p : Person} {c : ComplaintText}
    (hTrans : ConductTranscendsNationalBoundaries2332bA1 p c)
    (hCirc : JurisdictionalCircumstance2332bB1 p c)
    (hAct : ThreatensAttemptsOrConspires2332bA2 p c) :
    Violated2332bA2 p c :=
  ⟨⟨hTrans, hCirc⟩, hAct⟩



theorem power2332bB2_intro {c : ComplaintText}
    (hCond : CircumstanceAppliesToAtLeastOneOffender2332bB2 c) :
    Power2332bB2 c :=
  ⟨hCond⟩


theorem violated2332bC2Probation_intro {pr : Proceeding} {c : ComplaintText}
    (hCond : PersonConvictedUnderSection2332bC2 pr c)
    (hAct : PlacesConvictedPersonOnProbation2332bC2 pr c) :
    Violated2332bC2Probation pr c :=
  ⟨⟨hCond⟩, hAct⟩


theorem violated2332bC2Concurrent_intro {pr : Proceeding} {c : ComplaintText}
    (hCond : PersonConvictedUnderSection2332bC2 pr c)
    (hAct : ImposesConcurrentTermOfImprisonment2332bC2 pr c) :
    Violated2332bC2Concurrent pr c :=
  ⟨⟨hCond⟩, hAct⟩


theorem exercised2332bD1_intro {pr : Proceeding} {c : ComplaintText}
    (hCond : JurisdictionalBaseAllegedInIndictment2332bD1 pr c)
    (hAct : ProsecutionProceedsWithoutProvingJurisdictionalKnowledge2332bD1 pr c) :
    Exercised2332bD1 pr c :=
  ⟨⟨hCond⟩, hAct⟩


theorem power2332bE_intro {p : Person} {c : ComplaintText}
    (hCond : OffenseUnderSubsectionA2332bE p c) :
    Power2332bE p c :=
  ⟨hCond⟩


theorem breached2332bF1_intro {o : Official} {c : ComplaintText}
    (hAddr : IsAttorneyGeneral o c)
    (hCond : FederalCrimeOfTerrorismOrEnumeratedViolation2332bF c)
    (hOmission : ¬ ExercisesPrimaryInvestigativeResponsibility2332bF o c) :
    Breached2332bF1 o c :=
  ⟨⟨hAddr, hCond⟩, hOmission⟩


theorem breached2332bF2_intro {o ag : Official} {c : ComplaintText}
    (hAddr : IsSecretaryOfTheTreasury o c)
    (hReq : IsAttorneyGeneral ag c)
    (hRequest : AttorneyGeneralRequestsAssistance2332bF ag c)
    (hOmission : ¬ AssistsAttorneyGeneral2332bF o c) :
    Breached2332bF2 o ag c :=
  ⟨⟨hAddr, hReq, hRequest⟩, hOmission⟩




theorem violated2332d_intro {p : Person} {t : Transaction} {k : Country}
    {c : ComplaintText}
    (hAddr : IsUnitedStatesPerson p c)
    (hDesignated : CountryDesignatedAsSupportingInternationalTerrorism2332d k c)
    (hScienter : KnowsOrHasReasonableCauseToKnowDesignation2332d p k c)
    (hAct : EngagesInFinancialTransactionWithGovernment2332d p t k c)
    (hNoExempt : ¬ TreasuryRegulationExempts2332d p t c) :
    Violated2332d p t k c :=
  ⟨⟨hAddr, hDesignated, hScienter⟩, hAct, hNoExempt⟩


theorem exercised2332dRegulations_intro {o : Official} {c : ComplaintText}
    (hAddr : IsSecretaryOfTheTreasury o c)
    (hConsult : InConsultationWithSecretaryOfState2332d o c)
    (hAct : IssuesRegulationsUnderSection2332d o c) :
    Exercised2332dRegulations o c :=
  ⟨⟨hAddr, hConsult⟩, hAct⟩




theorem exercised2332e_intro {o : Official} {c : ComplaintText}
    (hAddr : IsAttorneyGeneral o c)
    (hEmergency : EmergencyInvolvingWeaponOfMassDestruction2332e c)
    (hEnforcement : SupportsEnforcementOfSection2332a c)
    (hAct : RequestsDefenseAssistanceUnderTitle10Section382 o c) :
    Exercised2332e o c :=
  ⟨⟨hAddr, hEmergency, hEnforcement⟩, hAct⟩



theorem exercised2332eDelegated_intro {o : Official} {c : ComplaintText}
    (hAddr : IsDelegatedJusticeOfficial2332e o c)
    (hEmergency : EmergencyInvolvingWeaponOfMassDestruction2332e c)
    (hEnforcement : SupportsEnforcementOfSection2332a c)
    (hAct : RequestsDefenseAssistanceUnderTitle10Section382 o c) :
    Exercised2332eDelegated o c :=
  ⟨⟨hAddr, hEmergency, hEnforcement⟩, hAct⟩




theorem violated2332fA1_intro {p : Person} {d : Device} {f : Facility}
    {c : ComplaintText}
    (hDevice : IsExplosiveOrOtherLethalDevice2332f d c)
    (hTarget : IsCoveredPlaceOrFacility2332f f c)
    (hIntent : IntendsDeathInjuryOrExtensiveDestruction2332fA1 p c)
    (hJur : JurisdictionalCircumstance2332fB p c)
    (hAct : DeliversPlacesDischargesOrDetonates2332fA1 p d f c)
    (hNoExempt : ¬ SectionInapplicable2332fD p c) :
    Violated2332fA1 p d f c :=
  ⟨⟨hDevice, hTarget, hIntent, hJur⟩, hAct, hNoExempt⟩


theorem violated2332fA2_intro {p : Person} {c : ComplaintText}
    (hJur : JurisdictionalCircumstance2332fB p c)
    (hAct : AttemptsOrConspires2332fA2 p c)
    (hNoExempt : ¬ SectionInapplicable2332fD p c) :
    Violated2332fA2 p c :=
  ⟨⟨hJur⟩, hAct, hNoExempt⟩


theorem power2332fB_intro {p : Person} {c : ComplaintText}
    (hCond : JurisdictionalCircumstance2332fB p c) :
    Power2332fB p c :=
  ⟨hCond⟩




theorem violated2332gA1_intro {p : Person} {d : Device} {c : ComplaintText}
    (hItem : IsCoveredMissileSystemOrComponent2332g d c)
    (hJur : JurisdictionalCircumstance2332gB p c)
    (hAct : KnowinglyDealsInMissileSystem2332gA1 p d c)
    (hWeapon : ¬ DeviceNotDesignedOrRedesignedAsWeapon2332gA2 d c)
    (hNoGov : ¬ GovernmentAuthorityOrContract2332gA3 p c) :
    Violated2332gA1 p d c :=
  ⟨⟨hItem, hJur⟩, hAct, hWeapon, hNoGov⟩


theorem power2332gB_intro {p : Person} {c : ComplaintText}
    (hCond : JurisdictionalCircumstance2332gB p c) :
    Power2332gB p c :=
  ⟨hCond⟩


theorem breached2332gC1_intro {pr : Proceeding} {c : ComplaintText}
    (hCond : PersonConvictedUnderSubsectionA2332gC1 pr c)
    (hOmission : ¬ SentencesToImprisonmentNotLessThanTwentyFiveYears2332gC1 pr c) :
    Breached2332gC1 pr c :=
  ⟨⟨hCond⟩, hOmission⟩




theorem violated2332hA1_intro {p : Person} {d : Device} {c : ComplaintText}
    (hItem : IsRadiologicalWeaponOrDevice2332h d c)
    (hJur : JurisdictionalCircumstance2332hB p c)
    (hAct : KnowinglyDealsInRadiologicalDevice2332hA1 p d c)
    (hNoGov : ¬ GovernmentAuthorityOrContract2332hA2 p c) :
    Violated2332hA1 p d c :=
  ⟨⟨hItem, hJur⟩, hAct, hNoGov⟩


theorem power2332hB_intro {p : Person} {c : ComplaintText}
    (hCond : JurisdictionalCircumstance2332hB p c) :
    Power2332hB p c :=
  ⟨hCond⟩


theorem breached2332hC1_intro {pr : Proceeding} {c : ComplaintText}
    (hCond : PersonConvictedUnderSubsectionA2332hC1 pr c)
    (hOmission : ¬ SentencesToImprisonmentNotLessThanTwentyFiveYears2332hC1 pr c) :
    Breached2332hC1 pr c :=
  ⟨⟨hCond⟩, hOmission⟩




theorem violated2332iA1_intro {p : Person} {d : Device} {c : ComplaintText}
    (hMens : HasRequisiteIntentOrKnowledge2332iA1 p c)
    (hJur : JurisdictionalCircumstance2332iB p c)
    (hAct : KnowinglyAndUnlawfullyPossessesOrUsesRadioactiveMaterial2332iA1 p d c)
    (hNoExempt : ¬ ArmedForcesOrMilitaryActivityExemption2332iD p c) :
    Violated2332iA1 p d c :=
  ⟨⟨hMens, hJur⟩, hAct, hNoExempt⟩


theorem violated2332iA2_intro {p : Person} {c : ComplaintText}
    (hCred : ThreatMayReasonablyBeBelieved2332iA2 p c)
    (hJur : JurisdictionalCircumstance2332iB p c)
    (hAct : ThreatensOrDemandsByThreatOrForce2332iA2 p c)
    (hNoExempt : ¬ ArmedForcesOrMilitaryActivityExemption2332iD p c) :
    Violated2332iA2 p c :=
  ⟨⟨hCred, hJur⟩, hAct, hNoExempt⟩


theorem violated2332iA3_intro {p : Person} {c : ComplaintText}
    (hJur : JurisdictionalCircumstance2332iB p c)
    (hAct : AttemptsOrConspires2332iA3 p c)
    (hNoExempt : ¬ ArmedForcesOrMilitaryActivityExemption2332iD p c) :
    Violated2332iA3 p c :=
  ⟨⟨hJur⟩, hAct, hNoExempt⟩


theorem power2332iB_intro {p : Person} {c : ComplaintText}
    (hCond : JurisdictionalCircumstance2332iB p c) :
    Power2332iB p c :=
  ⟨hCond⟩


theorem breached2332iC_intro {pr : Proceeding} {c : ComplaintText}
    (hCond : PersonConvictedUnderSection2332iC pr c)
    (hOmission : ¬ ImposesImprisonmentAndFine2332iC pr c) :
    Breached2332iC pr c :=
  ⟨⟨hCond⟩, hOmission⟩




theorem exercised2333A_intro {p : Person} {a : TerroristAct} {pr : Proceeding}
    {c : ComplaintText}
    (hAddr : IsNationalOfUnitedStates p c)
    (hTerror : IsActOfInternationalTerrorism2331 a c)
    (hInjury : InjuredByReasonOfActOfInternationalTerrorism2333A p a c)
    (hAct : SuesInDistrictCourt2333A p pr c) :
    Exercised2333A p a pr c :=
  ⟨⟨hAddr, hTerror, hInjury⟩, hAct⟩


theorem breached2333A_intro {p : Person} {pr : Proceeding} {c : ComplaintText}
    (hCond : PrevailsInSection2333Action2333A p pr c)
    (hOmission : ¬ AwardsThreefoldDamagesAndCosts2333A pr c) :
    Breached2333A p pr c :=
  ⟨⟨hCond⟩, hOmission⟩


theorem violated2333B_intro {p : Person} {pr : Proceeding} {c : ComplaintText}
    (hCond : FinalJudgmentForUnitedStates2333B pr c)
    (hAct : DeniesEssentialAllegations2333B p pr c) :
    Violated2333B p pr c :=
  ⟨⟨hCond⟩, hAct⟩


theorem violated2333C_intro {p : Person} {pr : Proceeding} {c : ComplaintText}
    (hJudgment : FinalJudgmentForForeignState2333C pr c)
    (hFullFaith : JudgmentEntitledToFullFaithAndCredit2333C pr c)
    (hAct : DeniesEssentialAllegations2333C p pr c) :
    Violated2333C p pr c :=
  ⟨⟨hJudgment, hFullFaith⟩, hAct⟩


theorem exercised2333D_intro {p : Person} {a : TerroristAct} {g : Organization}
    {pr : Proceeding} {c : ComplaintText}
    (hDesignated : OrganizationDesignatedForeignTerroristOrganization2333D g c)
    (hAttribution : ActCommittedPlannedOrAuthorizedByOrganization2333D a g c)
    (hParticipation : KnowinglyProvidesSubstantialAssistanceOrConspires2333D p c)
    (hAct : AssertsSecondaryLiability2333D p pr c) :
    Exercised2333D p a g pr c :=
  ⟨⟨hDesignated, hAttribution, hParticipation⟩, hAct⟩





theorem violated2332D_certification_not_violated {pr : Proceeding} {c : ComplaintText}
    (hCert : AttorneyGeneralWrittenCertification2332D pr c) :
    ¬ Violated2332D pr c :=
  fun h => h.2.2 hCert


theorem violated2332aA_lawfulAuthority_not_violated {p : Person} {d : Device}
    {c : ComplaintText} (hAuth : HasLawfulAuthority2332a p c) :
    ¬ Violated2332aA p d c :=
  fun h => h.2.2 hAuth


theorem violated2332aB_lawfulAuthority_not_violated {p : Person} {d : Device}
    {c : ComplaintText} (hAuth : HasLawfulAuthority2332a p c) :
    ¬ Violated2332aB p d c :=
  fun h => h.2.2 hAuth



theorem violated2332d_treasuryRegulation_not_violated {p : Person} {t : Transaction}
    {k : Country} {c : ComplaintText} (hExempt : TreasuryRegulationExempts2332d p t c) :
    ¬ Violated2332d p t k c :=
  fun h => h.2.2 hExempt



theorem violated2332fA1_inapplicable_not_violated {p : Person} {d : Device}
    {f : Facility} {c : ComplaintText} (hExempt : SectionInapplicable2332fD p c) :
    ¬ Violated2332fA1 p d f c :=
  fun h => h.2.2 hExempt



theorem violated2332fA2_inapplicable_not_violated {p : Person} {c : ComplaintText}
    (hExempt : SectionInapplicable2332fD p c) :
    ¬ Violated2332fA2 p c :=
  fun h => h.2.2 hExempt



theorem violated2332gA1_nonWeapon_not_violated {p : Person} {d : Device}
    {c : ComplaintText} (hNonWeapon : DeviceNotDesignedOrRedesignedAsWeapon2332gA2 d c) :
    ¬ Violated2332gA1 p d c :=
  fun h => h.2.2.1 hNonWeapon



theorem violated2332gA1_governmentAuthority_not_violated {p : Person} {d : Device}
    {c : ComplaintText} (hGov : GovernmentAuthorityOrContract2332gA3 p c) :
    ¬ Violated2332gA1 p d c :=
  fun h => h.2.2.2 hGov




theorem violated2332hA1_governmentAuthority_not_violated {p : Person} {d : Device}
    {c : ComplaintText} (hGov : GovernmentAuthorityOrContract2332hA2 p c) :
    ¬ Violated2332hA1 p d c :=
  fun h => h.2.2 hGov



theorem violated2332iA1_armedForces_not_violated {p : Person} {d : Device}
    {c : ComplaintText} (hExempt : ArmedForcesOrMilitaryActivityExemption2332iD p c) :
    ¬ Violated2332iA1 p d c :=
  fun h => h.2.2 hExempt



theorem violated2332iA2_armedForces_not_violated {p : Person} {c : ComplaintText}
    (hExempt : ArmedForcesOrMilitaryActivityExemption2332iD p c) :
    ¬ Violated2332iA2 p c :=
  fun h => h.2.2 hExempt



theorem violated2332iA3_armedForces_not_violated {p : Person} {c : ComplaintText}
    (hExempt : ArmedForcesOrMilitaryActivityExemption2332iD p c) :
    ¬ Violated2332iA3 p c :=
  fun h => h.2.2 hExempt



example : Norm113B.modality .proh2332A = Modality.prohibition := rfl
example : Norm113B.modality .obl2333A = Modality.obligation := rfl
example : Norm113B.modality .perm2332bD1 = Modality.permission := rfl
example : Norm113B.modality .powr2332bE = Modality.power := rfl
example : Norm113B.modality .dfn2331 = Modality.definition := rfl

end Proving.USC.T18.Ch113B.Deontic
