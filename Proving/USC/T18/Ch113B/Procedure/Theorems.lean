












import Proving.USC.Common.Types
import Proving.USC.T18.Ch113B.Procedure.Types
import Proving.USC.T18.Ch113B.Procedure.Predicates
import Proving.USC.T18.Ch113B.Procedure.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Procedure

open Proving.USC.Common





theorem militaryForceExclusion_intro {x : Person} {c : ComplaintText}
    (h : DesignatedForeignTerroristOrganization x c ∨
         DesignatedSpeciallyDesignatedGlobalTerrorist x c ∨
         CourtDeterminedNotMilitaryForce x c) :
    MilitaryForceExclusion x c :=
  h.elim
    (fun h1 => MilitaryForceExclusion.byForeignTerroristOrganizationDesignation h1)
    (fun h23 => h23.elim
      (fun h2 => MilitaryForceExclusion.bySpeciallyDesignatedGlobalTerroristDesignation h2)
      (fun h3 => MilitaryForceExclusion.byCourtDetermination h3))





theorem section2332ProsecutionAuthorized_intro
    {pr : Prosecution} {cert : Certification} {c : ComplaintText}
    (hUnd : ProsecutionUndertakenByUnitedStates pr c)
    (hCert : WrittenCertificationFiledForProsecution pr cert c)
    (hOff : CertifyingOfficialAuthorized cert c)
    (hRec : CertificationRecitesCoerciveIntentJudgment cert c)
    (hOrd : section2332CertificationPrecedesCommencement pr cert c) :
    Section2332ProsecutionAuthorized pr cert c :=
  ⟨hUnd, hCert, hOff, hRec, hOrd⟩



theorem section2332ProsecutionBarred_intro {pr : Prosecution} {c : ComplaintText}
    (hUnd : ProsecutionUndertakenByUnitedStates pr c)
    (hNo : ¬ ∃ cert : Certification, Section2332ProsecutionAuthorized pr cert c) :
    Section2332ProsecutionBarred pr c :=
  ⟨hUnd, hNo⟩




theorem section2332aJurisdiction_intro
    {x : Person} {o : Offense} {c : ComplaintText}
    (h : Section2332aJurisdictionalCircumstance o c ∨
         (IsNationalOfTheUnitedStates x c ∧ OffenseTakesPlaceOutsideUnitedStates o c)) :
    Section2332aJurisdiction x o c :=
  h.elim
    (fun h1 => Section2332aJurisdiction.byEnumeratedCircumstance h1)
    (fun h2 => Section2332aJurisdiction.byUnitedStatesNationalAbroad h2.1 h2.2)




theorem section2332bJurisdictionOverActor_intro
    {x : Person} {o : Offense} {c : ComplaintText}
    (hRole : IsPrincipalCoconspiratorOrAccessoryAfterTheFact x o c)
    (hCirc : Section2332bCircumstanceAppliesToAtLeastOneOffender o c) :
    Section2332bJurisdictionOverActor x o c :=
  ⟨hRole, hCirc⟩


theorem section2332bExtraterritorialJurisdiction_intro
    {x : Person} {o : Offense} {c : ComplaintText}
    (h : IsOffenseUnderSection2332bSubsectionA o c ∨
         IsAccessoryAfterTheFactUnderSection3 x o c) :
    Section2332bExtraterritorialJurisdiction x o c :=
  h.elim
    (fun h1 => Section2332bExtraterritorialJurisdiction.overSubsectionAOffense h1)
    (fun h2 => Section2332bExtraterritorialJurisdiction.overAccessoryAfterTheFact h2)


theorem section2332bProsecutionBurden_intro {o : Offense} {c : ComplaintText}
    (hAlleged : JurisdictionalBaseAllegedInIndictment o c)
    (hState : OffenseBasedOnAdoptedStateLaw o c → StateLawOffenseElementsProved o c) :
    Section2332bProsecutionBurden o c :=
  ⟨hAlleged, hState⟩



theorem section2332bKnowledgeOfJurisdictionalBaseNotRequired :
    ¬ section2332bKnowledgeOfJurisdictionalBaseRequired :=
  fun h => h



theorem section2332bStateProcedureOrEvidenceNotAdopted :
    ¬ section2332bStateProcedureOrEvidenceAdopted :=
  fun h => h


theorem section2332bLawfulSentence_intro
    {x : Person} {s : Sentencing} {c : ComplaintText}
    (hConv : ConvictedOfSection2332bViolation x c)
    (hNoProb : ¬ ProbationImposed s c)
    (hNotConc : ¬ TermOfImprisonmentRunsConcurrently s c) :
    Section2332bLawfulSentence x s c :=
  ⟨hConv, hNoProb, hNotConc⟩


theorem section2332bSentencingBreach_intro
    {x : Person} {s : Sentencing} {c : ComplaintText}
    (hConv : ConvictedOfSection2332bViolation x c)
    (hDefect : ProbationImposed s c ∨ TermOfImprisonmentRunsConcurrently s c) :
    Section2332bSentencingBreach x s c :=
  ⟨hConv, hDefect⟩


theorem section2332bTreasuryAssistanceDuty_intro {o : Offense} {c : ComplaintText}
    (hResp : section2332bAttorneyGeneralPrimaryInvestigativeResponsibility o c)
    (hReq : AttorneyGeneralRequestedTreasuryAssistance o c) :
    Section2332bTreasuryAssistanceDuty o c :=
  ⟨hResp, hReq⟩


theorem section2332bSecretServiceSavingsClause_intro
    (h : ∀ (o : Offense) (c : ComplaintText), ¬ SecretServiceAuthorityDisplaced o c) :
    section2332bSecretServiceSavingsClause :=
  h




theorem section2332dRegulatoryException_intro
    {r : Regulation} {x : Person} {s : ForeignState} {c : ComplaintText}
    (hIssued : TreasuryRegulationIssued r c)
    (hConsulted : TreasurySecretaryConsultedSecretaryOfState r c)
    (hAuth : TransactionAuthorizedByTreasuryRegulation r x s c) :
    Section2332dRegulatoryException r x s c :=
  ⟨hIssued, hConsulted, hAuth⟩


theorem section2332dProsecutionPredicate_intro
    {x : Person} {s : ForeignState} {c : ComplaintText}
    (hPerson : IsUnitedStatesPerson x c)
    (hDesig : CountryDesignatedAsSupportingInternationalTerrorism s c)
    (hInForce : section2332dDesignationInForceAtTransaction x s c)
    (hNoExc : ¬ ∃ r : Regulation, Section2332dRegulatoryException r x s c) :
    Section2332dProsecutionPredicate x s c :=
  ⟨hPerson, hDesig, hInForce, hNoExc⟩




theorem section2332eValidAssistanceRequest_intro
    {r : AssistanceRequest} {c : ComplaintText}
    (hWho : RequestMadeByAttorneyGeneral r c ∨ RequestMadeByDelegatedJusticeOfficial r c)
    (hPurpose : RequestSupportsSection2332aEnforcement r c)
    (hEmerg : EmergencySituationInvolvingWeaponOfMassDestruction c) :
    Section2332eValidAssistanceRequest r c :=
  ⟨hWho, hPurpose, hEmerg⟩




theorem section2332fSectionApplies_intro {o : Offense} {c : ComplaintText}
    (hJur : section2332fJurisdiction o c)
    (hNotBarred : ¬ section2332fInapplicable o c) :
    Section2332fSectionApplies o c :=
  ⟨hJur, hNotBarred⟩




theorem section2332gSectionApplies_intro {o : Offense} {c : ComplaintText}
    (hJur : Section2332gJurisdictionalCircumstance o c)
    (hNotExcepted : ¬ section2332gAuthorizationException o c) :
    Section2332gSectionApplies o c :=
  ⟨hJur, hNotExcepted⟩


theorem section2332gDeathResultSentence_intro
    {o : Offense} {s : Sentencing} {c : ComplaintText}
    (hDeath : DeathResultedFromViolation o c)
    (hLife : LifeImprisonmentImposed s c)
    (hFine : fineImposedDollars s c ≤ 2000000) :
    Section2332gDeathResultSentence o s c :=
  ⟨hDeath, hLife, hFine⟩




theorem section2332hSectionApplies_intro {o : Offense} {c : ComplaintText}
    (hJur : Section2332hJurisdictionalCircumstance o c)
    (hNotExcepted : ¬ section2332hAuthorizationException o c) :
    Section2332hSectionApplies o c :=
  ⟨hJur, hNotExcepted⟩


theorem section2332hDeathResultSentence_intro
    {o : Offense} {s : Sentencing} {c : ComplaintText}
    (hDeath : DeathResultedFromViolation o c)
    (hLife : LifeImprisonmentImposed s c)
    (hFine : fineImposedDollars s c ≤ 2000000) :
    Section2332hDeathResultSentence o s c :=
  ⟨hDeath, hLife, hFine⟩




theorem section2332iSectionApplies_intro {o : Offense} {c : ComplaintText}
    (hJur : Section2332iJurisdictionalCircumstance o c)
    (hNotBarred : ¬ section2332iInapplicable o c) :
    Section2332iSectionApplies o c :=
  ⟨hJur, hNotBarred⟩




theorem section2333Standing_intro {x : Person} {c : ComplaintText}
    (h : (IsNationalOfTheUnitedStates x c ∧ Section2333ClaimAccrued x c) ∨
         IsEstateSurvivorOrHeirOfInjuredNational x c) :
    Section2333Standing x c :=
  h.elim
    (fun h1 => Section2333Standing.asInjuredNational h1.1 h1.2)
    (fun h2 => Section2333Standing.asEstateSurvivorOrHeir h2)


theorem section2333ActionProperlyCommenced_intro
    {x : Person} {a : CivilAction} {c : ComplaintText}
    (hStanding : Section2333Standing x c)
    (hCommenced : CivilActionCommenced a x c)
    (hForum : FiledInAppropriateDistrictCourt a c) :
    Section2333ActionProperlyCommenced x a c :=
  ⟨hStanding, hCommenced, hForum⟩


theorem section2333JudgmentConforms_intro {a : CivilAction} {c : ComplaintText}
    (hAmount :
      judgmentAmountEnteredDollars a c = section2333TrebleAward a c + costOfSuitDollars a c) :
    Section2333JudgmentConforms a c :=
  ⟨hAmount⟩


theorem section2333UnitedStatesJudgmentEstoppel_intro
    {x : Person} {j : CriminalJudgment} {a : CivilAction} {c : ComplaintText}
    (hFinal : FinalJudgmentForUnitedStatesInCriminalProceeding j c)
    (hEnum : CriminalProceedingUnderSection2333bEnumeratedOffense j c)
    (hSame : SameDefendantInCriminalAndCivilProceeding x j a c)
    (hSubseq : section2333CivilActionIsSubsequent j a c) :
    Section2333UnitedStatesJudgmentEstoppel x j a c :=
  ⟨hFinal, hEnum, hSame, hSubseq⟩


theorem section2333ForeignJudgmentEstoppel_intro
    {x : Person} {j : CriminalJudgment} {a : CivilAction} {c : ComplaintText}
    (hFinal : FinalJudgmentForForeignStateInCriminalProceeding j c)
    (hFfc : JudgmentAccordedFullFaithAndCredit j c)
    (hSame : SameDefendantInCriminalAndCivilProceeding x j a c)
    (hSubseq : section2333CivilActionIsSubsequent j a c) :
    Section2333ForeignJudgmentEstoppel x j a c :=
  ⟨hFinal, hFfc, hSame, hSubseq⟩


theorem section2333SecondaryTheory_intro
    {x : Person} {a : CivilAction} {c : ComplaintText}
    (h : KnowinglyProvidedSubstantialAssistance x a c ∨
         ConspiredWithPersonWhoCommittedAct x a c) :
    Section2333SecondaryTheory x a c :=
  h.elim
    (fun h1 => Section2333SecondaryTheory.aidingAndAbetting h1)
    (fun h2 => Section2333SecondaryTheory.conspiracy h2)


theorem section2333SecondaryLiabilityAvailable_intro
    {x : Person} {org : Person} {d : Designation} {a : CivilAction} {c : ComplaintText}
    (hDesig : DesignatedForeignTerroristOrganization org c)
    (hInForce : section2333DesignationInForceAtActDate d a c)
    (hAct : ActCommittedPlannedOrAuthorizedByOrganization org a c)
    (hTheory : Section2333SecondaryTheory x a c) :
    Section2333SecondaryLiabilityAvailable x org d a c :=
  ⟨hDesig, hInForce, hAct, hTheory⟩


theorem section2333BlockedAssetAvailable_intro
    {x : Person} {a : CivilAction} {as_ : Asset} {c : ComplaintText}
    (hJudg : ObtainedJudgmentAgainstTerroristParty x a c)
    (hAsset : IsAssetOfTerroristParty as_ a c)
    (hSeized : AssetSeizedOrFrozenUnderKingpinAct as_ c) :
    Section2333BlockedAssetAvailable x a as_ c :=
  ⟨hJudg, hAsset, hSeized⟩





theorem section2332ProsecutionCommenced_reachable
    {pr : Prosecution} {cert : Certification} {c : ComplaintText}
    (hCertStep : CertifyingOfficialAuthorized cert c ∧
                 CertificationRecitesCoerciveIntentJudgment cert c)
    (hAuth : Section2332ProsecutionAuthorized pr cert c) :
    Reaches State.UnderInvestigation State.ProsecutionCommenced :=
  Reaches.step (section2332CertificationStep cert c) rfl hCertStep
    (Reaches.step (section2332CommencementStep pr cert c) rfl hAuth
      (Reaches.refl State.ProsecutionCommenced))



theorem section2333BlockedAssets_reachable
    {x : Person} {a : CivilAction} {as_ : Asset} {c : ComplaintText}
    (hFile : Section2333ActionProperlyCommenced x a c)
    (hJudg : Section2333JudgmentConforms a c)
    (hExec : Section2333BlockedAssetAvailable x a as_ c) :
    Reaches State.InjuryAccrued State.BlockedAssetsAttached :=
  Reaches.step (section2333FilingStep x a c) rfl hFile
    (Reaches.step (section2333JudgmentStep a c) rfl hJudg
      (Reaches.step (section2333ExecutionStep x a as_ c) rfl hExec
        (Reaches.refl State.BlockedAssetsAttached)))



theorem section2332bSentenced_reachable
    {x : Person} {s : Sentencing} {c : ComplaintText}
    (hSentence : Section2332bLawfulSentence x s c) :
    Reaches State.Convicted State.Sentenced :=
  Reaches.step (section2332bSentencingStep x s c) rfl hSentence
    (Reaches.refl State.Sentenced)

end Proving.USC.T18.Ch113B.Procedure
