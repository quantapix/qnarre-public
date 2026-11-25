











import Proving.USC.T18.Ch11.EchoReslice.Ontology.Types
import Proving.USC.T18.Ch11.EchoReslice.Ontology.Predicates
import Proving.USC.T18.Ch11.EchoReslice.Ontology.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

open Proving.USC.Common (Person Entity ComplaintText Time)

namespace Proving.USC.T18.Ch11.EchoReslice.Ontology




theorem congressionalOfficialClass_intro {p : Person} {c : ComplaintText}
    (h : IsMemberOfCongress p c ∨ IsDelegateToCongress p c
         ∨ IsResidentCommissioner p c)
    : CongressionalOfficialClass p c :=
  match h with
  | .inl h => .memberOfCongress h
  | .inr (.inl h) => .delegate h
  | .inr (.inr h) => .residentCommissioner h


theorem governmentUnitClass_intro {g : GovernmentUnit} {c : ComplaintText}
    (h : IsTheUnitedStates g c ∨ IsDepartmentOfGovernment g c
         ∨ IsAgencyOfGovernment g c ∨ IsBranchOfGovernment g c
         ∨ IsDistrictOfColumbiaUnit g c)
    : GovernmentUnitClass g c :=
  match h with
  | .inl h => .unitedStates h
  | .inr (.inl h) => .department h
  | .inr (.inr (.inl h)) => .agency h
  | .inr (.inr (.inr (.inl h))) => .branch h
  | .inr (.inr (.inr (.inr h))) => .districtOfColumbia h


theorem federalRoleClass_intro {p : Person} {c : ComplaintText}
    (h : IsOfficerOfTheUnitedStates p c ∨ IsEmployeeOfTheUnitedStates p c
         ∨ ActsForOrOnBehalfOfTheUnitedStates p c)
    : FederalRoleClass p c :=
  match h with
  | .inl h => .officer h
  | .inr (.inl h) => .employee h
  | .inr (.inr h) => .actingForOrOnBehalf h


theorem federalFunctionaryOfficial_intro {p : Person} {g : GovernmentUnit}
    {f : OfficialFunction} {c : ComplaintText}
    (hRole : FederalRoleClass p c) (hUnit : GovernmentUnitClass g c)
    (hFn : IsOfficialFunction f c) (hIn : ActsInOfficialFunction p f c)
    (hAuth : ActsUnderOrByAuthorityOfGovernmentUnit p g c)
    : FederalFunctionaryOfficial p g f c :=
  ⟨hRole, hUnit, hFn, hIn, hAuth⟩


theorem publicOfficialClass_intro {p : Person} {c : ComplaintText}
    (h : CongressionalOfficialClass p c
         ∨ (∃ (g : GovernmentUnit) (f : OfficialFunction),
              FederalFunctionaryOfficial p g f c)
         ∨ IsJuror p c)
    : PublicOfficialClass p c :=
  match h with
  | .inl h => .congressional h
  | .inr (.inl ⟨g, f, hf⟩) => .functionary g f hf
  | .inr (.inr h) => .juror h





theorem congressionalOfficialClass_intro_after_qualifying {p : Person}
    {c : ComplaintText} (_hq : HasQualifiedForOffice p c)
    (h : IsMemberOfCongress p c ∨ IsDelegateToCongress p c
         ∨ IsResidentCommissioner p c)
    : CongressionalOfficialClass p c :=
  congressionalOfficialClass_intro h



theorem congressionalOfficialClass_intro_before_qualifying {p : Person}
    {c : ComplaintText} (_hq : ¬ HasQualifiedForOffice p c)
    (h : IsMemberOfCongress p c ∨ IsDelegateToCongress p c
         ∨ IsResidentCommissioner p c)
    : CongressionalOfficialClass p c :=
  congressionalOfficialClass_intro h




theorem selectionRouteClass_intro {s : SelectionEvent} {c : ComplaintText}
    (h : IsNominationEvent s c ∨ IsAppointmentEvent s c
         ∨ IsOfficialInformingOfProspectiveSelection s c)
    : SelectionRouteClass s c :=
  match h with
  | .inl h => .nominated h
  | .inr (.inl h) => .appointed h
  | .inr (.inr h) => .officiallyInformed h


theorem selectedToBePublicOfficial_intro {p : Person} {o : Office}
    {s : SelectionEvent} {c : ComplaintText}
    (hPost : IsPublicOfficialPost o c) (hNames : SelectionEventNamesPerson s p c)
    (hTargets : SelectionEventTargetsPost s o c) (hRoute : SelectionRouteClass s c)
    : SelectedToBePublicOfficial p o s c :=
  ⟨hPost, hNames, hTargets, hRoute⟩




theorem decisionOrActionClass_intro {a : DecisionOrAction} {c : ComplaintText}
    (h : IsDecision a c ∨ IsAction a c) : DecisionOrActionClass a c :=
  match h with
  | .inl h => .decision h
  | .inr h => .action h


theorem qualifyingMatterClass_intro {m : Matter} {c : ComplaintText}
    (h : IsQuestionMatter m c ∨ IsMatterProper m c ∨ IsCauseMatter m c
         ∨ IsSuitMatter m c ∨ IsProceedingMatter m c ∨ IsControversyMatter m c)
    : QualifyingMatterClass m c :=
  match h with
  | .inl h => .question h
  | .inr (.inl h) => .matter h
  | .inr (.inr (.inl h)) => .cause h
  | .inr (.inr (.inr (.inl h))) => .suit h
  | .inr (.inr (.inr (.inr (.inl h)))) => .proceeding h
  | .inr (.inr (.inr (.inr (.inr h)))) => .controversy h


theorem pendencyBeforeOfficialClass_intro {m : Matter} {p : Person}
    {c : ComplaintText}
    (h : MayAtAnyTimeBePendingBeforeOfficial m p c
         ∨ MayByLawBeBroughtBeforeOfficial m p c)
    : PendencyBeforeOfficialClass m p c :=
  match h with
  | .inl h => .mayBePending h
  | .inr h => .mayByLawBeBrought h


theorem officialCapacityClass_intro {p : Person} {c : ComplaintText}
    (h : ActsInOfficialCapacity p c ∨ ActsInPlaceOfTrustOrProfit p c)
    : OfficialCapacityClass p c :=
  match h with
  | .inl h => .officialCapacity h
  | .inr h => .placeOfTrustOrProfit h


theorem officialAct_intro {a : DecisionOrAction} {m : Matter} {p : Person}
    {c : ComplaintText}
    (hAct : DecisionOrActionClass a c) (hOn : DecisionOrActionOnMatter a m c)
    (hMatter : QualifyingMatterClass m c)
    (hPend : PendencyBeforeOfficialClass m p c)
    (hOfficial : PublicOfficialClass p c) (hCap : OfficialCapacityClass p c)
    : OfficialAct a m p c :=
  ⟨hAct, hOn, hMatter, hPend, hOfficial, hCap⟩




theorem tribunalBodyClass_intro {t : Tribunal} {c : ComplaintText}
    (h : IsAgencyBody t c ∨ IsCommissionBody t c ∨ IsOfficerBody t c)
    : TribunalBodyClass t c :=
  match h with
  | .inl h => .agency h
  | .inr (.inl h) => .commission h
  | .inr (.inr h) => .officer h


theorem tribunalAuthorizationClass_intro {t : Tribunal} {c : ComplaintText}
    (h : AuthorizedByLawsOfUnitedStatesToHearEvidence t c
         ∨ AuthorizedByLawsOfUnitedStatesToTakeTestimony t c)
    : TribunalAuthorizationClass t c :=
  match h with
  | .inl h => .hearEvidence h
  | .inr h => .takeTestimony h


theorem authorizedTribunalClass_intro {t : Tribunal} {c : ComplaintText}
    (h : IsCourt t c ∨ IsCommitteeOfEitherHouseOrBothHouses t c
         ∨ (TribunalBodyClass t c ∧ TribunalAuthorizationClass t c))
    : AuthorizedTribunalClass t c :=
  match h with
  | .inl h => .court h
  | .inr (.inl h) => .congressionalCommittee h
  | .inr (.inr ⟨hb, ha⟩) => .authorizedBody hb ha


theorem proceedingKindClass_intro {pr : Proceeding} {c : ComplaintText}
    (h : IsTrial pr c ∨ IsHearing pr c ∨ IsOtherProceeding pr c)
    : ProceedingKindClass pr c :=
  match h with
  | .inl h => .trial h
  | .inr (.inl h) => .hearing h
  | .inr (.inr h) => .otherProceeding h


theorem qualifyingProceeding_intro {pr : Proceeding} {t : Tribunal}
    {c : ComplaintText}
    (hKind : ProceedingKindClass pr c) (hBefore : ProceedingHeldBeforeTribunal pr t c)
    (hTrib : AuthorizedTribunalClass t c)
    : QualifyingProceeding pr t c :=
  ⟨hKind, hBefore, hTrib⟩


theorem testimonyModeClass_intro {tst : Testimony} {c : ComplaintText}
    (h : GivenUnderOath tst c ∨ GivenUnderAffirmation tst c)
    : TestimonyModeClass tst c :=
  match h with
  | .inl h => .oath h
  | .inr h => .affirmation h


theorem testimonyOfWitnessUnderOathOrAffirmation_intro {tst : Testimony}
    {p : Person} {pr : Proceeding} {t : Tribunal} {c : ComplaintText}
    (hTst : IsTestimonyOfWitness tst p c) (hMode : TestimonyModeClass tst c)
    (hWitness : IsWitnessUponProceeding p pr c)
    (hProc : QualifyingProceeding pr t c)
    : TestimonyOfWitnessUnderOathOrAffirmation tst p pr t c :=
  ⟨hTst, hMode, hWitness, hProc⟩


theorem witnessObjectClass_intro {p : Person} {pr : Proceeding} {t : Tribunal}
    {tst : Testimony} {c : ComplaintText}
    (h : TestimonyOfWitnessUnderOathOrAffirmation tst p pr t c
         ∨ (IsWitnessUponProceeding p pr c ∧ AbsentsSelfFromProceeding p pr c
            ∧ QualifyingProceeding pr t c))
    : WitnessObjectClass p pr t tst c :=
  match h with
  | .inl h => .testimony h
  | .inr ⟨hw, ha, hp⟩ => .absence hw ha hp




theorem officialOrFormerOrSelectedClass_intro {p : Person} {c : ComplaintText}
    (h : PublicOfficialClass p c ∨ IsFormerPublicOfficial p c
         ∨ (∃ (o : Office) (s : SelectionEvent),
              SelectedToBePublicOfficial p o s c))
    : OfficialOrFormerOrSelectedClass p c :=
  match h with
  | .inl h => .current h
  | .inr (.inl h) => .former h
  | .inr (.inr ⟨o, s, hs⟩) => .selected o s hs


theorem dutyOfOfficialClass_intro {d : Duty} {p : Person} {c : ComplaintText}
    (h : IsLawfulDutyOfOfficial d p c ∨ IsOfficialDutyOfOfficial d p c)
    : DutyOfOfficialClass d p c :=
  match h with
  | .inl h => .lawfulDuty h
  | .inr h => .officialDuty h


theorem valueDestinationClass_intro {p : Person} {e : Entity} {c : ComplaintText}
    (h : ActsInOfficialCapacity p c ∨ IsBeneficiaryEntity e c)
    : ValueDestinationClass p e c :=
  match h with
  | .inl h => .personally h
  | .inr h => .otherPersonOrEntity h


theorem officeKindClass_intro {o : Office} {c : ComplaintText}
    (h : IsOfficeOfHonor o c ∨ IsOfficeOfTrust o c ∨ IsOfficeOfProfit o c)
    : OfficeKindClass o c :=
  match h with
  | .inl h => .honor h
  | .inr (.inl h) => .trust h
  | .inr (.inr h) => .profit h


theorem officeOfHonorTrustOrProfitUnderUnitedStates_intro {o : Office}
    {c : ComplaintText}
    (hKind : OfficeKindClass o c) (hUS : IsUnderTheUnitedStates o c)
    : OfficeOfHonorTrustOrProfitUnderUnitedStates o c :=
  ⟨hKind, hUS⟩


theorem witnessPaymentSafeHarborClass_intro {v : ThingOfValue} {c : ComplaintText}
    (h : IsWitnessFeeProvidedByLaw v c ∨ IsReasonableCostOfTravelAndSubsistence v c
         ∨ IsReasonableValueOfTimeLostInAttendance v c
         ∨ IsReasonableFeeForPreparationOfExpertOpinion v c)
    : WitnessPaymentSafeHarborClass v c :=
  match h with
  | .inl h => .witnessFee h
  | .inr (.inl h) => .travelAndSubsistence h
  | .inr (.inr (.inl h)) => .timeLost h
  | .inr (.inr (.inr h)) => .expertFee h


theorem partyPaidWitnessExpense_intro {v : ThingOfValue} {payer : Person}
    {w : Person} {pr : Proceeding} {c : ComplaintText}
    (hPay : WitnessPaymentSafeHarborClass v c)
    (hPayer : IsPartyUponWhoseBehalfWitnessIsCalled payer w c)
    (hWitness : IsWitnessUponProceeding w pr c)
    : PartyPaidWitnessExpense v payer w pr c :=
  ⟨hPay, hPayer, hWitness⟩


theorem expertWitnessFee_intro {v : ThingOfValue} {p : Person} {c : ComplaintText}
    (hExpert : IsExpertWitness p c)
    (hFee : IsReasonableFeeForPreparationOfExpertOpinion v c)
    : ExpertWitnessFee v p c :=
  ⟨hExpert, hFee⟩


theorem valueNotProvidedByLaw_intro {v : ThingOfValue} {c : ComplaintText}
    (hValue : IsAnythingOfValue v c)
    (hNot : ¬ ProvidedByLawForProperDischargeOfOfficialDuty v c)
    : ValueNotProvidedByLaw v c :=
  ⟨hValue, hNot⟩


theorem officialActPerformedOrToBePerformed_intro {a : DecisionOrAction}
    {m : Matter} {p : Person} {t : Time} {c : ComplaintText}
    (hAct : OfficialAct a m p c) (hTiming : PerformedOrToBePerformedAt a t c)
    : OfficialActPerformedOrToBePerformed a m p t c :=
  ⟨hAct, hTiming⟩









theorem officialAct_dependsOn_publicOfficial {a : DecisionOrAction} {m : Matter}
    {p : Person} {c : ComplaintText} (h : OfficialAct a m p c)
    : PublicOfficialClass p c := h.official



theorem selectedToBePublicOfficial_dependsOn_publicOfficialPost {p : Person}
    {o : Office} {s : SelectionEvent} {c : ComplaintText}
    (h : SelectedToBePublicOfficial p o s c) : IsPublicOfficialPost o c := h.post

end Proving.USC.T18.Ch11.EchoReslice.Ontology
