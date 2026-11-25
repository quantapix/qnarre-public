




import Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Procedure.Types
import Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Procedure.Predicates
import Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Procedure.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Procedure

open Proving.USC.Common



theorem section111ReachUnlimitedByLocus_intro {c : ComplaintText}
    (h : ConductOccurredOutsideUnitedStates c ∨ WithinUnitedStates c) :
    Section111ReachUnlimitedByLocus c := h

theorem section115ReachUnlimitedByLocus_intro {c : ComplaintText}
    (h : ConductOccurredOutsideUnitedStates c ∨ WithinUnitedStates c) :
    Section115ReachUnlimitedByLocus c := h

theorem section112JurisdictionAbroad_intro {c : ComplaintText}
    (hVictim : VictimIsInternationallyProtectedPersonAbroad c)
    (hAbroad : ConductOccurredOutsideUnitedStates c)
    (hBasis : Section112JurisdictionBasis c) :
    Section112JurisdictionAbroad c :=
  ⟨hVictim, hAbroad, hBasis⟩

theorem section112AssistanceRequest_intro {c : ComplaintText}
    (hEnf : EnforcementOfSection112Underway c)
    (hReq : AttorneyGeneralRequestedAgencyAssistance c) :
    Section112AssistanceRequest c :=
  ⟨hEnf, hReq⟩

theorem section112ApplicationPermitted_intro {c : ComplaintText}
    (h : ¬ ApplicationWouldAbridgeFirstAmendmentRights c) :
    Section112ApplicationPermitted c := ⟨h⟩

theorem section116ProsecutionUnbarred_intro {c : ComplaintText}
    (hCirc : Section116Circumstance c)
    (hNoExc : ¬ MedicalNecessityExceptionApplies c) :
    Section116ProsecutionUnbarred c :=
  ⟨hCirc, hNoExc⟩




theorem section116CustomAssertionDoesNotBar {c : ComplaintText}
    (_hAsserted : ReligiousCustomJustificationAsserted c)
    (hCirc : Section116Circumstance c)
    (hNoExc : ¬ MedicalNecessityExceptionApplies c) :
    Section116ProsecutionUnbarred c :=
  ⟨hCirc, hNoExc⟩

theorem twoPriorOccasionsEstablished_intro {p : Person} {c : ComplaintText}
    (h : 2 ≤ PriorQualifyingConvictionOccasions p c) :
    TwoPriorOccasionsEstablished p c := h



theorem twoPriorOccasionsEstablished_ofCount {p : Person} {c : ComplaintText}
    {n : Nat} (hCount : PriorQualifyingConvictionOccasions p c = n) (hn : 2 ≤ n) :
    TwoPriorOccasionsEstablished p c := by
  unfold TwoPriorOccasionsEstablished
  omega

theorem section117HabitualPredicate_intro {p : Person} {c : ComplaintText}
    (hLocus : Section117Locus c)
    (hOcc : TwoPriorOccasionsEstablished p c)
    (hFinal : PriorConvictionsAreFinal p c)
    (hPrior : PriorConvictionsPrecedeInstantOffense p c) :
    Section117HabitualPredicate p c :=
  ⟨hLocus, hOcc, hFinal, hPrior⟩

theorem section115NonInterference_intro {c : ComplaintText}
    (h : SecretServiceProtectiveAuthorityUnimpaired c) :
    Section115NonInterference c := ⟨h⟩

theorem section118ProtectiveSetting_intro {c : ComplaintText}
    (hLocus : Section118Locus c) (hAuth : ProtectiveFunctionAuthorized c) :
    Section118ProtectiveSetting c :=
  ⟨hLocus, hAuth⟩

theorem section119CoveredRole_intro {p : Person} {c : ComplaintText}
    (h : CoveredPersonAdjudicativeRole p c) : Section119CoveredRole p c := ⟨h⟩



theorem isDebtor_intro {p : Person} {pr : Proceeding}
    (hFiled : PetitionFiledUnderTitle11 pr) (hConcerns : PetitionConcernsPerson p pr) :
    IsDebtor p pr := ⟨hFiled, hConcerns⟩

theorem conductAfterFiling_intro {pr : Proceeding} {c : ComplaintText}
    (h : PetitionFilingDay pr < ConductDay c) : ConductAfterFiling pr c := h


theorem conductAfterFiling_ofDays {pr : Proceeding} {c : ComplaintText}
    {f d : Nat} (hf : PetitionFilingDay pr = f) (hd : ConductDay c = d) (h : f < d) :
    ConductAfterFiling pr c := by
  unfold ConductAfterFiling
  omega

theorem conductPrecedesFiling_intro {pr : Proceeding} {c : ComplaintText}
    (h : ConductDay c < PetitionFilingDay pr) : ConductPrecedesFiling pr c := h

theorem postFilingPosture_intro {p : Person} {pr : Proceeding} {c : ComplaintText}
    (hDebtor : IsDebtor p pr) (hAfter : ConductAfterFiling pr c) :
    PostFilingPosture p pr c := ⟨hDebtor, hAfter⟩

theorem contemplationPosture_intro {p : Person} {pr : Proceeding} {c : ComplaintText}
    (hFiled : PetitionFiledUnderTitle11 pr) (hBefore : ConductPrecedesFiling pr c) :
    ContemplationPosture p pr c := ⟨hFiled, hBefore⟩

theorem courtOfficerPosture_intro {p : Person} {pr : Proceeding}
    (hFiled : PetitionFiledUnderTitle11 pr)
    (hOfficer : CourtOfficerChargedWithCustody p pr) :
    CourtOfficerPosture p pr := ⟨hFiled, hOfficer⟩

theorem section154PartyInspectionDuty_intro {p : Person} {pr : Proceeding}
    (hPosture : CourtOfficerPosture p pr) (hDirected : CourtDirectedInspection pr) :
    Section154PartyInspectionDuty p pr := ⟨hPosture, hDirected⟩

theorem section154TrusteeInspectionDuty_intro {p : Person} {pr : Proceeding}
    (hPosture : CourtOfficerPosture p pr)
    (hRequested : UnitedStatesTrusteeSoughtInspection pr) :
    Section154TrusteeInspectionDuty p pr := ⟨hPosture, hRequested⟩

theorem section154ForfeitureGuard_intro {p : Person} {pr : Proceeding}
    (hDuty : Section154Duty p pr) (hRefused : ¬ InspectionOpportunityAfforded p pr) :
    Section154ForfeitureGuard p pr := ⟨hDuty, hRefused⟩


theorem section154OfficeTransition_endpoints (p : Person) (pr : Proceeding) :
    (section154OfficeTransition p pr).source = OfficeState.Held ∧
      (section154OfficeTransition p pr).target = OfficeState.Vacant :=
  ⟨rfl, rfl⟩

theorem section155Posture_intro {p : Person} {pr : Proceeding}
    (hPending : CaseOrReceivershipPending pr) (hParty : PartyInInterest p pr) :
    Section155Posture p pr := ⟨hPending, hParty⟩

theorem section156DismissalTrigger_intro {p : Person} {pr : Proceeding} {c : ComplaintText}
    (hPreparer : BankruptcyPetitionPreparer p c)
    (hDoc : DocumentForFilingPrepared p c)
    (hDismissed : CaseOrRelatedProceedingDismissed pr)
    (hCause : DismissalCausedByPreparerDisregard p pr) :
    Section156DismissalTrigger p pr c :=
  ⟨hPreparer, hDoc, hDismissed, hCause⟩



theorem section156CaseTransition_endpoints (p : Person) (pr : Proceeding) (c : ComplaintText) :
    (section156CaseTransition p pr c).source = CaseState.Pending ∧
      (section156CaseTransition p pr c).target = CaseState.Dismissed :=
  ⟨rfl, rfl⟩

theorem section157Posture_intro {p : Person} {pr : Proceeding}
    (hAct : Section157Act p pr) (hSetting : Section157Setting pr) :
    Section157Posture p pr := ⟨hAct, hSetting⟩

theorem section158DesignationProgram_intro {c : ComplaintText}
    (hDesignated : AttorneyGeneralDesignationMade c)
    (hUsa : UnitedStatesAttorneyDesignated c)
    (hFbi : FbiAgentDesignated c)
    (h3057 : Section3057ResponsibilityAssigned c) :
    Section158DesignationProgram c :=
  ⟨hDesignated, hUsa, hFbi, h3057⟩

theorem section158Referral_intro {pr : Proceeding} {c : ComplaintText}
    (hProgram : Section158DesignationProgram c)
    (hProcedures : ReferralProceduresEstablished c)
    (hReferred : CaseReferredUnderSection158 pr) :
    Section158Referral pr c :=
  ⟨hProgram, hProcedures, hReferred⟩



theorem section175aAssistanceRequest_intro {c : ComplaintText}
    (hRequester : Section175aRequester c)
    (hSupports : RequestSupportsSection175Enforcement c)
    (hEmergency : EmergencyInvolvingBiologicalWeapon c) :
    Section175aAssistanceRequest c :=
  ⟨hRequester, hSupports, hEmergency⟩

theorem punishableExceedingOneYear_intro {p : Person} {c : ComplaintText}
    (h : 12 < MaximumAuthorizedImprisonmentMonths p c) :
    PunishableExceedingOneYear p c := h



theorem punishableExceedingOneYear_ofMonths {p : Person} {c : ComplaintText}
    {m : Nat} (hm : MaximumAuthorizedImprisonmentMonths p c = m) (h : 12 < m) :
    PunishableExceedingOneYear p c := by
  unfold PunishableExceedingOneYear
  omega

theorem section175bProhibitionApplicable_intro {p : Person} {c : ComplaintText}
    (hRestricted : RestrictedPersonStatus p c)
    (hCommerce : ConductAffectedInterstateOrForeignCommerce c)
    (hNotAuthorized : ¬ DulyAuthorizedGovernmentActivity c) :
    Section175bProhibitionApplicable p c :=
  ⟨hRestricted, hCommerce, hNotAuthorized⟩

theorem section175bRegistrationCompliance_intro {p : Person} {c : ComplaintText}
    (h : RequiredRegistrationObtained p c) : Section175bRegistrationCompliance p c := ⟨h⟩

theorem section175bTransferCompliance_intro {p : Person} {c : ComplaintText}
    (h : TransfereeRegisteredAsRequired p c) : Section175bTransferCompliance p c := ⟨h⟩

theorem section175cProhibitionApplicable_intro {c : ComplaintText}
    (hJur : Section175cJurisdiction c)
    (hNotHhs : ¬ ConductUnderHealthSecretaryAuthority c) :
    Section175cProhibitionApplicable c :=
  ⟨hJur, hNotHhs⟩

theorem section175cBaseSentenceInRange_intro {p : Person} {c : ComplaintText}
    (hFine : ImposedFineDollars p c ≤ 2000000)
    (hYears : 25 ≤ ImposedImprisonmentYears p c) :
    Section175cBaseSentenceInRange p c := ⟨hFine, hYears⟩


theorem section175cBaseSentenceInRange_ofNumbers {p : Person} {c : ComplaintText}
    {fine years : Nat}
    (hf : ImposedFineDollars p c = fine) (hy : ImposedImprisonmentYears p c = years)
    (h1 : fine ≤ 2000000) (h2 : 25 ≤ years) :
    Section175cBaseSentenceInRange p c := by
  unfold Section175cBaseSentenceInRange
  omega

theorem section175cEnhancedSentenceInRange_intro {p : Person} {c : ComplaintText}
    (hFine : ImposedFineDollars p c ≤ 2000000)
    (hYears : 30 ≤ ImposedImprisonmentYears p c) :
    Section175cEnhancedSentenceInRange p c := ⟨hFine, hYears⟩

theorem lawfulSeizure_intro {s : Seizure}
    (hItem : SeizableItem s) (hAuth : SeizureAuthority s) : LawfulSeizure s :=
  ⟨hItem, hAuth⟩

theorem forfeitureSequenceProper_intro {s : Seizure}
    (h1 : SeizureDay s ≤ NoticeDay s)
    (h2 : NoticeDay s ≤ HearingDay s)
    (h3 : HearingDay s ≤ ForfeitureDay s) :
    ForfeitureSequenceProper s := ⟨h1, h2, h3⟩



theorem forfeitureSequenceProper_ofDays {s : Seizure} {sd nd hd fd : Nat}
    (hs : SeizureDay s = sd) (hn : NoticeDay s = nd)
    (hh : HearingDay s = hd) (hf : ForfeitureDay s = fd)
    (h1 : sd ≤ nd) (h2 : nd ≤ hd) (h3 : hd ≤ fd) :
    ForfeitureSequenceProper s := by
  refine ⟨?_, ?_, ?_⟩ <;> omega

theorem forfeitureEntitlement_intro {s : Seizure}
    (hNotice : NoticeToPotentialClaimantsGiven s)
    (hHearing : OpportunityForHearingAfforded s)
    (hBurden : GovernmentCarriedBurdenByPreponderance s)
    (hCustoms : CustomsForfeitureProceduresFollowed s)
    (hSeq : ForfeitureSequenceProper s) :
    ForfeitureEntitlement s :=
  ⟨hNotice, hHearing, hBurden, hCustoms, hSeq⟩

theorem section176cDefense_intro {s : Seizure}
    (hPeaceful : PeacefulPurposeShown s) (hReasonable : TypeAndQuantityReasonable s) :
    Section176cDefense s := ⟨hPeaceful, hReasonable⟩

theorem forfeitureOnUnjustifiedItemProper_intro {s : Seizure}
    (hGround : ItemLacksApparentPeacefulJustification s)
    (hEnt : ForfeitureEntitlement s)
    (hNoDefense : ¬ Section176cDefense s) :
    ForfeitureOnUnjustifiedItemProper s :=
  ⟨hGround, hEnt, hNoDefense⟩



theorem section176cDefense_defeatsForfeiture {s : Seizure}
    (hPeaceful : PeacefulPurposeShown s) (hReasonable : TypeAndQuantityReasonable s) :
    ¬ ForfeitureOnUnjustifiedItemProper s := by
  intro h
  exact h.noDefense ⟨hPeaceful, hReasonable⟩

theorem lawfulDisposition_intro {s : Seizure}
    (hEnt : ForfeitureEntitlement s) (hOrdered : AttorneyGeneralOrderedDisposition s) :
    LawfulDisposition s := ⟨hEnt, hOrdered⟩


theorem seizurePipeline_reachable {s : Seizure}
    (hSeize : LawfulSeizure s)
    (hNotice : NoticeToPotentialClaimantsGiven s)
    (hHearing : OpportunityForHearingAfforded s)
    (hEnt : ForfeitureEntitlement s)
    (hDisp : LawfulDisposition s) :
    SeizureReachable s SeizureState.Subject SeizureState.Destroyed :=
  .trans (.seize hSeize)
    (.trans (.notice hNotice)
      (.trans (.hearing hHearing)
        (.trans (.forfeit hEnt) (.destroy hDisp))))

theorem section177InjunctionAction_intro {c : ComplaintText}
    (hAction : UnitedStatesCommencedCivilAction c) (hGround : InjunctionGround c) :
    Section177InjunctionAction c := ⟨hAction, hGround⟩

theorem section177InjunctionOnQuantity_intro {c : ComplaintText}
    (hAction : UnitedStatesCommencedCivilAction c)
    (hGround : UnjustifiedTypeOrQuantityShown c)
    (hNoDefense : ¬ Section177Defense c) :
    Section177InjunctionOnQuantity c :=
  ⟨hAction, hGround, hNoDefense⟩

theorem section177Defense_intro {c : ComplaintText}
    (hPeaceful : EnjoinedConductPeacefulPurpose c)
    (hReasonable : EnjoinedItemTypeAndQuantityReasonable c) :
    Section177Defense c := ⟨hPeaceful, hReasonable⟩

end Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Procedure
