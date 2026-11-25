





import Proving.USC.Common.Types
import Proving.USC.T18.Ch113B.Wmd.Part3.Deontic.Types
import Proving.USC.T18.Ch113B.Wmd.Part3.Deontic.Predicates
import Proving.USC.T18.Ch113B.Wmd.Part3.Deontic.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Part3.Deontic

open Proving.USC.Common




theorem prohibition2332aA_intro (p : Person) (w : Weapon) (v : Person) (pr : Property)
    (c : ComplaintText)
    (hAddr : ActedWithoutLawfulAuthority p c)
    (hWeapon : IsWeaponOfMassDestruction w c)
    (hCond : Condition2332aA p v pr c) : Prohibition2332aA p w v pr c :=
  ⟨hAddr, hWeapon, hCond⟩


theorem prohibition2332aAViolated_intro (p : Person) (w : Weapon) (v : Person)
    (pr : Property) (c : ComplaintText)
    (hAddr : ActedWithoutLawfulAuthority p c)
    (hWeapon : IsWeaponOfMassDestruction w c)
    (hCond : Condition2332aA p v pr c)
    (hAct : UsedThreatenedAttemptedOrConspiredToUseWmd p w c) :
    Prohibition2332aAViolated p w v pr c :=
  ⟨⟨hAddr, hWeapon, hCond⟩, hAct⟩




theorem prohibition2332aB_intro (p : Person) (w : Weapon) (c : ComplaintText)
    (hNational : IsNationalOfTheUnitedStates p c)
    (hAuthority : ActedWithoutLawfulAuthority p c)
    (hWeapon : IsWeaponOfMassDestruction w c)
    (hCond : ConductOccurredOutsideTheUnitedStates p c) : Prohibition2332aB p w c :=
  ⟨hNational, hAuthority, hWeapon, hCond⟩


theorem prohibition2332aBViolated_intro (p : Person) (w : Weapon) (c : ComplaintText)
    (hNational : IsNationalOfTheUnitedStates p c)
    (hAuthority : ActedWithoutLawfulAuthority p c)
    (hWeapon : IsWeaponOfMassDestruction w c)
    (hCond : ConductOccurredOutsideTheUnitedStates p c)
    (hAct : UsedThreatenedAttemptedOrConspiredToUseWmd p w c) :
    Prohibition2332aBViolated p w c :=
  ⟨⟨hNational, hAuthority, hWeapon, hCond⟩, hAct⟩




theorem prohibition2332bA1_intro (p : Person) (v : Person) (pr : Property)
    (c : ComplaintText)
    (hTrans : ConductTranscendsNationalBoundaries p c)
    (hCirc : Circumstance2332bB1 p v pr c)
    (hUnlawful : ConductViolatesLawsOfAStateOrTheUnitedStates p c) :
    Prohibition2332bA1 p v pr c :=
  ⟨hTrans, hCirc, hUnlawful⟩


theorem prohibition2332bA1Violated_intro (p : Person) (v : Person) (pr : Property)
    (c : ComplaintText)
    (hTrans : ConductTranscendsNationalBoundaries p c)
    (hCirc : Circumstance2332bB1 p v pr c)
    (hUnlawful : ConductViolatesLawsOfAStateOrTheUnitedStates p c)
    (hAct : Act2332bA1 p v pr c) : Prohibition2332bA1Violated p v pr c :=
  ⟨⟨hTrans, hCirc, hUnlawful⟩, hAct⟩




theorem prohibition2332bA2_intro (p : Person) (v : Person) (pr : Property)
    (c : ComplaintText) (hOffense : Prohibition2332bA1 p v pr c) :
    Prohibition2332bA2 p v pr c :=
  ⟨hOffense⟩


theorem prohibition2332bA2Violated_intro (p : Person) (v : Person) (pr : Property)
    (c : ComplaintText) (hOffense : Prohibition2332bA1 p v pr c)
    (hAct : ThreatenedAttemptedOrConspiredToCommitSection2332bOffense p c) :
    Prohibition2332bA2Violated p v pr c :=
  ⟨⟨hOffense⟩, hAct⟩




theorem power2332bB2_intro (p : Person) (o : Offense) (c : ComplaintText)
    (hAddr : IsPrincipalCoConspiratorOrAccessoryAfterTheFact p o c)
    (hCond : AtLeastOneCircumstanceAppliesToAtLeastOneOffender o c) :
    Power2332bB2 p o c :=
  ⟨hAddr, hCond⟩




theorem obligation2332bC1_intro (t : Tribunal) (p : Person) (c : ComplaintText)
    (hAddr : IsAdjudicatingCourt t c)
    (hCond : ConvictedOfViolatingSection2332b p c) : Obligation2332bC1 t p c :=
  ⟨hAddr, hCond⟩


theorem obligation2332bC1Satisfied_intro (t : Tribunal) (p : Person) (c : ComplaintText)
    (hAddr : IsAdjudicatingCourt t c)
    (hCond : ConvictedOfViolatingSection2332b p c)
    (hAct : PrescribedPunishmentImposed t p c) : Obligation2332bC1Satisfied t p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem obligation2332bC1Breached_intro (t : Tribunal) (p : Person) (c : ComplaintText)
    (hAddr : IsAdjudicatingCourt t c)
    (hCond : ConvictedOfViolatingSection2332b p c)
    (hOmission : ¬ PrescribedPunishmentImposed t p c) : Obligation2332bC1Breached t p c :=
  ⟨⟨hAddr, hCond⟩, hOmission⟩




theorem prohibition2332bC2_intro (t : Tribunal) (p : Person) (c : ComplaintText)
    (hAddr : IsAdjudicatingCourt t c)
    (hCond : ConvictedOfViolatingSection2332b p c) : Prohibition2332bC2 t p c :=
  ⟨hAddr, hCond⟩


theorem prohibition2332bC2Violated_intro (t : Tribunal) (p : Person) (c : ComplaintText)
    (hAddr : IsAdjudicatingCourt t c)
    (hCond : ConvictedOfViolatingSection2332b p c)
    (hAct : Act2332bC2 t p c) : Prohibition2332bC2Violated t p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩




theorem permission2332bD1_intro (p : Person) (c : ComplaintText)
    (hCond : ProsecutionUnderSection2332bPending p c) : Permission2332bD1 p c :=
  ⟨hCond⟩


theorem permission2332bD1Exercised_intro (p : Person) (c : ComplaintText)
    (hCond : ProsecutionUnderSection2332bPending p c)
    (hAct : ProofOfDefendantKnowledgeOfJurisdictionalBaseOmitted p c) :
    Permission2332bD1Exercised p c :=
  ⟨⟨hCond⟩, hAct⟩




theorem prohibition2332bD2_intro (t : Tribunal) (p : Person) (c : ComplaintText)
    (hAddr : IsAdjudicatingCourt t c)
    (hCond : ProsecutionBasedOnAdoptionOfStateLaw p c) : Prohibition2332bD2 t p c :=
  ⟨hAddr, hCond⟩


theorem prohibition2332bD2Violated_intro (t : Tribunal) (p : Person) (c : ComplaintText)
    (hAddr : IsAdjudicatingCourt t c)
    (hCond : ProsecutionBasedOnAdoptionOfStateLaw p c)
    (hAct : StateCriminalProcedureOrEvidenceProvisionsAdopted t p c) :
    Prohibition2332bD2Violated t p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩




theorem power2332bE_intro (p : Person) (o : Offense) (c : ComplaintText)
    (hGround : Ground2332bE p o c) : Power2332bE p o c :=
  ⟨hGround⟩




theorem obligation2332bFAttorneyGeneral_intro (e : Entity) (o : Offense)
    (c : ComplaintText)
    (hAddr : IsAttorneyGeneral e c)
    (hCond : Scope2332bF o c) : Obligation2332bFAttorneyGeneral e o c :=
  ⟨hAddr, hCond⟩


theorem obligation2332bFAttorneyGeneralSatisfied_intro (e : Entity) (o : Offense)
    (c : ComplaintText)
    (hAddr : IsAttorneyGeneral e c)
    (hCond : Scope2332bF o c)
    (hAct : PrimaryInvestigativeResponsibilityExercised e o c) :
    Obligation2332bFAttorneyGeneralSatisfied e o c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem obligation2332bFAttorneyGeneralBreached_intro (e : Entity) (o : Offense)
    (c : ComplaintText)
    (hAddr : IsAttorneyGeneral e c)
    (hCond : Scope2332bF o c)
    (hOmission : ¬ PrimaryInvestigativeResponsibilityExercised e o c) :
    Obligation2332bFAttorneyGeneralBreached e o c :=
  ⟨⟨hAddr, hCond⟩, hOmission⟩


theorem obligation2332bFTreasury_intro (e : Entity) (c : ComplaintText)
    (hAddr : IsSecretaryOfTheTreasury e c)
    (hCond : AssistanceRequestedByAttorneyGeneral e c) : Obligation2332bFTreasury e c :=
  ⟨hAddr, hCond⟩


theorem obligation2332bFTreasurySatisfied_intro (e : Entity) (c : ComplaintText)
    (hAddr : IsSecretaryOfTheTreasury e c)
    (hCond : AssistanceRequestedByAttorneyGeneral e c)
    (hAct : AssistanceToAttorneyGeneralRendered e c) :
    Obligation2332bFTreasurySatisfied e c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem obligation2332bFTreasuryBreached_intro (e : Entity) (c : ComplaintText)
    (hAddr : IsSecretaryOfTheTreasury e c)
    (hCond : AssistanceRequestedByAttorneyGeneral e c)
    (hOmission : ¬ AssistanceToAttorneyGeneralRendered e c) :
    Obligation2332bFTreasuryBreached e c :=
  ⟨⟨hAddr, hCond⟩, hOmission⟩


theorem prohibition2332bFConstruction_intro (t : Tribunal) (c : ComplaintText)
    (hAddr : IsAdjudicatingCourt t c) : Prohibition2332bFConstruction t c :=
  ⟨hAddr⟩


theorem prohibition2332bFConstructionViolated_intro (t : Tribunal) (c : ComplaintText)
    (hAddr : IsAdjudicatingCourt t c)
    (hAct : ConstructionInterferesWithSecretServiceAuthority t c) :
    Prohibition2332bFConstructionViolated t c :=
  ⟨⟨hAddr⟩, hAct⟩

end Proving.USC.T18.Ch113B.Wmd.Part3.Deontic
